import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/repository/article_repo.dart';
import 'package:news_app/screens/article_screen.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:shimmer/shimmer.dart';

import '../widgets/shimmer_listView.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late Future<List<Article>> articles;

  @override
  void initState() {
    articles = ArticleRepo().getArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NEWS"),
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 32,
          color: AppColors.primaryTextColor,
        ),
        elevation: 0,
        backgroundColor: Color(0xffE9EEFA),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: FutureBuilder(
            future: articles,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return ShimmerListView();
              }

              if (snapshot.hasData) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 24, horizontal: 10),
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, i) {
                      return ListTile(
                        title: Text(
                          snapshot.data![i].title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryTextColor,
                          ),
                        ),
                        subtitle: Text(
                          "by | ${snapshot.data![i].author}",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: AppColors.secondaryTextColor,
                          ),
                        ),
                        trailing: Container(
                          width: 110,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: NetworkImage(snapshot.data![i].urlToImage),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ArticleScreen(
                                    article: snapshot.data![i]);
                              },
                            ),
                          );
                        },
                      );
                    },
                    itemCount: snapshot.data!.length,
                    separatorBuilder: (BuildContext context, int i) {
                      return SizedBox(
                        height: 24,
                      );
                    },
                  ),
                );
              }

              return SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
