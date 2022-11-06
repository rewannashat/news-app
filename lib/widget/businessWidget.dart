import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../module/webView_Screen.dart';
import '../style/custom_text.dart';

Widget Business({
  required double w,
  required double h,
  required Map<String, dynamic> artical,
  required BuildContext ctx,
}) {
  // print(artical);

  return InkWell(
    onTap: (){
      Navigator.push(ctx, MaterialPageRoute(builder: (ctx) => WebViw(artical['url'])));
    },
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            width: w,
            height: h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                  image: NetworkImage(
                    artical['urlToImage'] == null
                        ? 'https://media.cnn.com/api/v1/images/stellar/prod/220317144737-01-weekly-news-quiz-031722-artemis.jpg?c=16x9&q=w_800,c_fill'
                        : artical['urlToImage'],
                  ),
                  fit: BoxFit.cover),
            ),
          ),
        ),
        SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Container(
            height: h,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  txt: artical["title"] == null ? 'title' : artical["title"],
                  overflow: TextOverflow.ellipsis,
                  fontSize: Theme.of(ctx).textTheme.bodyText1!.fontSize,
                  color: Theme.of(ctx).textTheme.bodyText1!.color,
                  maxLine: 4,
                ),
                SizedBox(
                  height: 5,
                ),
                CustomText(
                  txt: artical["publishedAt"] == null
                      ? '2022-10-20T22:00:54Z'
                      : artical["publishedAt"],
                  fontSize: 10.0,
                  color: Colors.grey,
                  maxLine: 1,
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}
