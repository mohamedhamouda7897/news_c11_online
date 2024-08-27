import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:news_c11_online/bloc/states.dart';
import 'package:news_c11_online/models/NewsDataResponse.dart';
import 'package:news_c11_online/models/SourcesResponse.dart';
import 'package:news_c11_online/utils/constants.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitState());

  static HomeCubit get(context) => BlocProvider.of(context);
  int selectedTabIndex = 0;
  SourcesResponse? sourcesResponse;
  NewsDataResponse? newsDataResponse;

  changeSource(int value) {
    selectedTabIndex = value;
    emit(HomeChangeSource());
  }

  Future<void> getSources(String id) async {
    try {
      emit(HomeGetSourcesLoadingState());
      Uri url = Uri.https("newsapi.org", "/v2/top-headlines/sources",
          {"apiKey": Constants.apiKey, "category": id});
      http.Response response = await http.get(url);

      var json = jsonDecode(response.body);

      sourcesResponse = SourcesResponse.fromJson(json);
      emit(HomeGetSourcesSuccessState());
      getNewsData(sourcesResponse?.sources?[selectedTabIndex].id ?? "");
    } catch (e) {
      emit(HomeGetSourcesErrorState());
    }
  }

  Future<void> getNewsData(String sourceID) async {
    try {
      emit(HomeGetNewsDataLoadingState());

      Uri url = Uri.https(
        Constants.baseUrl,
        "/v2/everything",
        {
          "sources": sourceID,
        },
      );
      http.Response response = await http.get(url, headers: {
        // "x-api-key": Constants.apiKey,
      });

      var json = jsonDecode(response.body);

      if (response.statusCode != 200) {
        emit(HomeGetNewsDataErrorState());
        return;
      }
      newsDataResponse = NewsDataResponse.fromJson(json);
      emit(HomeGetNewsDataSuccessState());
    } catch (e) {
      emit(HomeGetNewsDataErrorState());
    }
  }
}
