import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:newsappp/controller/bookmarkScreencontroller.dart';
import 'package:newsappp/controller/homeScreenController.dart';
import 'package:newsappp/controller/homeScreenController.dart';
import 'package:newsappp/views/homeScreen/newswidget.dart';
import 'package:provider/provider.dart';
import 'package:newsappp/controller/homeScreenController.dart';


class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
   
      await context.read<homeScreenController>().Newsget();
    });
  }

  @override
  Widget build(BuildContext context) {
    final techController = context.watch<homeScreenController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "NEWS Today",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        actions: const [
          Icon(Icons.notifications, size: 30),
          SizedBox(width: 20),
        ],
      ),
        backgroundColor: Colors.white,
      body:Column(
       
            children: [
             
                      SingleChildScrollView(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: List.generate(
                techController.NewsList.length,
                (index) => Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: InkWell(
                    onTap: () async {
                      await techController.onNewsSelection(index);

                      // Scroll the clicked container to the center
                      _scrollController.animateTo(
                        (index * 80.0) - (MediaQuery.of(context).size.width / 5) + 45,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      height: 45,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: techController.selectedNewsIndex == index
                            ? Colors.black
                            : Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        techController.NewsList[index].toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: techController.selectedNewsIndex == index
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
             
// Listview.separated
              
               Consumer<homeScreenController>(builder: (context, homeScreenController, child) => 
      homeScreenController.isloading?Center(
        child:
         SizedBox(
          width: 50,
          height: 50,
           child: LoadingIndicator(
               indicatorType: Indicator.lineScale, /// Required, The loading type of the widget
               colors: const [Colors.black],       /// Optional, The color collections
               strokeWidth: 2,                     /// Optional, The stroke of the line, only applicable to widget which contains line
               backgroundColor: Colors.white,      /// Optional, Background of the widget
               pathBackgroundColor: Colors.blue  
                /// Optional, the stroke backgroundColor
           ),
         ))
          :
              Expanded(
                child: homeScreenController.newsarticles.isEmpty
                    ?  Center(child: Text("No articles available"))
                    : ListView.separated(
                        itemBuilder: (context, index) {
                          final article = homeScreenController.newsarticles[index];
                          return
                            newswidget(
                              title: article.title ?? "No Title",
                              description: article.description ?? "No Description",
                              image: article.urlToImage ?? "",
                              date: article.publishedAt.toString(), 
                                InkWellbookmarked: () async { 
                      await context.read<Bookmarkscreencontroller>().addNewsData(article);
                      await context.read<Bookmarkscreencontroller>().getAllNewsData();
                       
                                 }, 
                                  iccon:   Icon(Icons.bookmark_outline), 
                                 content:article.content??"no content" ,
                                 author:article.author??"no author",
                                  url: article.url??"no url", 
                                  onpress2: () async {  
                                      await context.read<Bookmarkscreencontroller>().removeNewsData(
                                        article.title??"null"
                                      );
                                  }, 
                             
                            );
                        },
                          
                        itemCount: homeScreenController.newsarticles.length,
                        separatorBuilder: (context, index) => const SizedBox(
                        
                        ),
                      ),
              ),
               ),
            ],
          ),
   
      
    );
  }
}


// // tech news
//        ListView.separated(
//           itemBuilder: (context, index) {
//             final technews =
//                 context.watch<Techcontroller>().techarticles[index];
//             return newswidget(
//               title: technews.title.toString(),
//                description: technews.description.toString(),
//                 image: technews.urlToImage.toString(),
//                  date: technews.publishedAt.toString(), 
//                  InkWellbookmarked: () async { 
//                   await context.read<Bookmarkscreencontroller>().addNewsData(technews);
//                   await context.read<Bookmarkscreencontroller>().getAllNewsData();
//                   },
//                 iccon:Icon(Icons.bookmark_outline),
               
//                   );
//               },
//           itemCount: context.watch<Techcontroller>().techarticles.length,
//           separatorBuilder: (context, index) => SizedBox(
           
//           ),
//         ),



// // apple related news

//               ListView.separated(
//           itemBuilder: (context, index) {
//             final applenews =
//                 context.watch<Applenewscontroller>().applenewsarticles[index];
//             return newswidget(
//               title:applenews.title.toString(),
//                description:applenews.description.toString(),
//                 image: applenews.urlToImage.toString(),
//                  date:applenews.publishedAt.toString(), 
//                  InkWellbookmarked: () async { 
//                   await context.read<Bookmarkscreencontroller>().addNewsData(applenews);
//                   await context.read<Bookmarkscreencontroller>().getAllNewsData();
//                   },
//                   iccon:Icon(Icons.bookmark_outline),
               
//                   );
//               },
//           itemCount: context.watch<Applenewscontroller>().applenewsarticles.length,
//           separatorBuilder: (context, index) => SizedBox(
           
//           ),
//         ),

// // local news

//               ListView.separated(
//           itemBuilder: (context, index) {
//             final localnews =
//                 context.watch<Localnewscontroller>().localarticles[index];
//             return newswidget(
//               title: localnews.title.toString(),
//                description: localnews.description.toString(),
//                 image: localnews.urlToImage.toString(),
//                  date: localnews.publishedAt.toString(), 
//                  InkWellbookmarked: () async { 
//                   await context.read<Bookmarkscreencontroller>().addNewsData(localnews);
//                   await context.read<Bookmarkscreencontroller>().getAllNewsData();
//                   },
//                    iccon:Icon(Icons.bookmark_outline),
               
//                   );
//               },
//           itemCount: context.watch<Localnewscontroller>().localarticles.length,
//           separatorBuilder: (context, index) => SizedBox(
           
//           ),
//         ),


        


        
//       ),
//     );
//   }
// }




// ListView.separated(
//           itemBuilder: (context, index) {
//             final newsdata =
//                 context.watch<Homescreencontroller>().articles[index];
//             return 
//               },
//           itemCount: context.watch<Homescreencontroller>().articles.length,
//           separatorBuilder: (context, index) => SizedBox(
           
//           ),
//         ),


  // ListView.separated(
  //         itemBuilder: (context, index) {
  //           final technewsdata =
  //               context.watch<Techcontroller>().techarticles[index];
  //           return Column(
  //             children: [
  //               Padding(
  //                 padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
  //                 child: SizedBox(
  //                   height: 310, // Adjusted height
  //                   child: Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       Container(
  //                         height: 180,
  //                         width: double.infinity,
  //                         decoration: BoxDecoration(
  //                           borderRadius: BorderRadius.circular(15),
  //                           image: DecorationImage(
  //                             fit: BoxFit.fill,
  //                             image: NetworkImage(technewsdata.urlToImage.toString()),
  //                           ),
  //                         ),
  //                       ),
  //                       Text(
  //                        technewsdata.title.toString(),
  //                         maxLines: 2,
  //                         style: TextStyle(
  //                           fontWeight: FontWeight.bold,
  //                           fontSize: 16,
  //                         ),
  //                       ),
  //                       Text(
  //                        technewsdata.description.toString(),
  //                         maxLines: 2,
  //                         overflow: TextOverflow.ellipsis,
  //                         style: TextStyle(color: Colors.grey[700], fontSize: 14),
  //                       ),
                       
  //                       Row(
  //                         children: [
  //                           Icon(Icons.favorite_border_outlined,size: 22,),
  //                           SizedBox(width: 15),
  //                           Icon(Icons.comment_outlined,size: 22,),
  //                           SizedBox(width: 15),
  //                           Icon(Icons.share_outlined,size: 22,),
  //                           Spacer(),
                           
  //                           InkWell(
  //                             onTap: () async {
  //                               await context
  //                                   .read<Bookmarkscreencontroller>()
  //                                   .addNewsData(technewsdata);
  //                               await context
  //                                   .read<Bookmarkscreencontroller>()
  //                                   .getAllNewsData();
  //                             },
  //                             child: Icon(Icons.bookmark_outline),
  //                           )
  //                         ],
  //                       ),
  //                       SizedBox(height: 2,),
  //                       Row(
  //                         mainAxisAlignment: MainAxisAlignment.end,
  //                         children: [
  //                            Text(technewsdata.publishedAt.toString(),
  //                            style: TextStyle(
  //                             fontSize: 12,
  //                             color: Colors.black,
  //                             fontWeight: FontWeight.w500,
  //                            ),),
  //                         ],
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           );
  //         },
  //         itemCount: context.watch<Techcontroller>().techarticles.length,
  //         separatorBuilder: (context, index) => SizedBox(
           
  //         ),
  //       ),