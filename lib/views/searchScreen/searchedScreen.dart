

import 'package:flutter/material.dart';
import 'package:newsappp/controller/bookmarkScreencontroller.dart';
import 'package:newsappp/controller/homeScreenController.dart';
import 'package:newsappp/views/selectednewsScreen/selectednewsScreeen.dart';
import 'package:provider/provider.dart';

class Searchedscreen extends StatelessWidget {
  final String searchQuery;

  const Searchedscreen({super.key, required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    final techController = context.read<homeScreenController>();

    // Trigger API call to fetch news for the selected query
    WidgetsBinding.instance.addPostFrameCallback((_) {
      techController.searchCategory(searchQuery);
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("News about \"$searchQuery\""),
        backgroundColor: Colors.white,
      ),
      body: Consumer<homeScreenController>(
        builder: (context, controller, child) {
          if (controller.isloading) {
            return const Center(child: CircularProgressIndicator());
          } else if (controller.newsarticles.isEmpty) {
            return const Center(
              child: Text("No news articles found."),
            );
          } else {
            return ListView.builder(
              itemCount: controller.newsarticles.length,
              itemBuilder: (context, index) {
                final article = controller.newsarticles[index];
                return ListTile(
                  leading: article.urlToImage != null
                      ? Image.network(
                          article.urlToImage!,
                          width: 80,
                          height: 100,
                          fit: BoxFit.cover,
                        )
                      : Container(
                        height:80 ,
                        width: 80,
                        color: Colors.grey.shade300,
                        child: Center(
                          child: Icon(Icons.image_not_supported),
                        ),
                      ),
                  title: Text(
                    article.title ?? "No Title",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    article.description ?? "No Description",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () {
                       print("GestureDetector tapped");
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Selectednewsscreeen(
          image: article.urlToImage ?? "null",
          title: article.title ?? "null",
          description: article.description ?? "null",
          onpress: () async {
                      await context.read<Bookmarkscreencontroller>().addNewsData(article);
                      await context.read<Bookmarkscreencontroller>().getAllNewsData();
          },
          content: article.content ?? "null",
          author: article.author ?? "null",
          url: article.url ?? "null",
           onpress2: () async { 
               await context.read<Bookmarkscreencontroller>().removeNewsData(
                                        article.title??"null"
                                      );
            },
        ),
      ),
    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}

