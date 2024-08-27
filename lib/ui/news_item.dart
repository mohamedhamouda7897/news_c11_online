import 'package:flutter/material.dart';
import 'package:news_c11_online/models/NewsDataResponse.dart';

class NewsItem extends StatelessWidget {
  Articles article;

  NewsItem({required this.article, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(18)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image.network(
                article.urlToImage ?? "",
                height: 240,
              )),
          Text(
            article.source?.name ?? "",
            style: TextStyle(fontSize: 12, color: Colors.black54),
          ),
          Text(
            article.title ?? "",
            style: TextStyle(fontSize: 22, color: Colors.black),
          ),
          Text(
            article.description ?? "",
            maxLines: 3,
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          Text(
            article.publishedAt?.substring(0, 10) ?? "",
            textAlign: TextAlign.end,
          )
        ],
      ),
    );
  }
}
