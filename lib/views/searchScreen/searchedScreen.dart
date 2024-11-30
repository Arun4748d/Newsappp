

import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
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
      backgroundColor: Colors.white,
      body: Consumer<homeScreenController>(
        builder: (context, controller, child) {
          if (controller.isloading) {
            return const Center(child:  SizedBox(
          width: 50,
          height: 50,
           child: LoadingIndicator(
               indicatorType: Indicator.lineScale, /// Required, The loading type of the widget
               colors: const [Colors.black],       /// Optional, The color collections
               strokeWidth: 2,                     /// Optional, The stroke of the line, only applicable to widget which contains line
                   /// Optional, Background of the widget
               pathBackgroundColor: Colors.blue  
                /// Optional, the stroke backgroundColor
           ),
         ),);
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
                  leading:
                  //  article.urlToImage != null
                  //     ? Image.network(
                  //         article.urlToImage!,
                  //         width: 80,
                  //         height: 100,
                  //         fit: BoxFit.cover,
                  //       )
                  //     : Container(
                  //       height:80 ,
                  //       width: 80,
                  //       color: Colors.grey.shade300,
                  //       child: Center(
                  //         child: Icon(Icons.image_not_supported),
                  //       ),
                  //     ),
                  Container(
  height: 90,
  width: 80,
  decoration: BoxDecoration(
    color: Colors.grey.withOpacity(0.4),
    borderRadius: BorderRadius.circular(15),
  ),
  child: (article.urlToImage != null && article.urlToImage!.isNotEmpty)
      ? ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.network(
            article.urlToImage!,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Center(
              child: Icon(
                Icons.broken_image,
                size: 50,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return const Center(
                child:  SizedBox(
          width: 50,
          height: 50,
           child: LoadingIndicator(
               indicatorType: Indicator.ballRotateChase, /// Required, The loading type of the widget
               colors: const [Colors.black],       /// Optional, The color collections
               strokeWidth: 2,                     /// Optional, The stroke of the line, only applicable to widget which contains line
                   /// Optional, Background of the widget
               pathBackgroundColor: Colors.blue  
                /// Optional, the stroke backgroundColor
           ),
         ),
              );
            },
          ),
        )
      : Center(
          child: Icon(
            Icons.image_not_supported,
            size: 50,
            color: Colors.black.withOpacity(0.5),
          ),
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

