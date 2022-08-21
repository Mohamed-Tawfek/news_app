import 'package:flutter/material.dart';
import 'package:news_app/bloc/news_cubit.dart';
import 'package:news_app/models/news_model.dart';

import '../../modules/webview_screen.dart';

Widget buildNewsItem(context,
    {required String? newsDate,
    required String? newsImageUrl,
    required String? newsTitle,
    required String? newsUrl}) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => WebViewScreen(
                    initialUrl: newsUrl,
                  )));
    },
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: newsImageUrl == null
                  ? Image.asset(
                      'assets/images/image_not_found.png',
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    )
                  : Image.network(
                      newsImageUrl,
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    newsTitle!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: NewsCubit.isDark == true
                            ? Colors.white
                            : Colors.black),
                  ),
                  const Spacer(),
                  Text(
                    newsDate!.substring(0, 10),
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}

Widget buildUiScreen({required NewsModel? model}) {
  return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => buildNewsItem(context,
          newsDate: model!.news[index].publishedAt,
          newsImageUrl: model.news[index].urlToImage,
          newsTitle: model.news[index].title,
          newsUrl: model.news[index].url),
      separatorBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 1,
              color: NewsCubit.isDark == true
                  ? const Color(0xFF253341)
                  : Colors.grey,
            ),
          ),
      itemCount: model!.news.length);
}
