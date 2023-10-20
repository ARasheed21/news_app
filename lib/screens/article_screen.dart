import 'package:flutter/material.dart';
import 'package:news_app/utils/app_colors.dart';

import '../models/article_model.dart';

class ArticleScreen extends StatelessWidget {

  final Article article;
   ArticleScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Image.network(
                article.urlToImage,
                width: 430,
                height: 316,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 290,
                left: 0,
                right: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.symmetric(vertical: 24,horizontal: 32),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article.title,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryTextColor,
                        ),
                      ),
                      SizedBox(height: 16,),
                      Row(
                        children: [
                          CircleAvatar(
                            radius:12,
                            backgroundColor: Color(0xffE9EEFA),
                            child: Icon(Icons.person_rounded,color: Colors.black54,size: 15,),
                          ),
                          SizedBox(width: 10,),
                          Text(
                            "${article.author} . ${article.getDate()}",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: AppColors.secondaryTextColor
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16,),
                      Text(
                        article.content,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}
