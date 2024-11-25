import 'package:flutter/material.dart';
import 'package:newsappp/controller/applenewscontroller.dart';
import 'package:newsappp/controller/bookmarkScreencontroller.dart';
import 'package:newsappp/controller/buisnessController.dart';
import 'package:newsappp/controller/localnewsController.dart';
import 'package:newsappp/controller/techcontroller.dart';
import 'package:newsappp/views/globalwidget/globalnewswidget.dart';
import 'package:newsappp/views/webview/webview.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
 
      
      await context.read<Homescreencontroller>().getnews();
      await context.read<Techcontroller>().techget();

        await context.read<Applenewscontroller>().appleget();
         await context.read<Localnewscontroller>().localget();

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.dehaze),
          title: Text("NEWS Today",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),),
          actions: [
            Icon(
              Icons.notifications,
              size: 30,
            ),
            SizedBox(width: 20),
          ],
          bottom: TabBar(
            
            labelColor: Colors.black,
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            unselectedLabelColor: Colors.black,
            dividerHeight: 0,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Colors.black,
            // indicator: BoxDecoration(
            //   color: Colors.black,
            //   borderRadius: BorderRadius.circular(22),
               
            // ),
            tabs: [
            Tab(
              text: "Business",
            ),
            Tab(
              text: "Tech",
            ),
            
            Tab(
              text: "Mobile",
            ),
            Tab(
              text: "local",
            )
          ]),
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body:TabBarView(children: [

// buisness news
               ListView.separated(
                         itemBuilder: (context, index) {
                           final buisnessnews =
                context.watch<Homescreencontroller>().articles[index];
                           return GestureDetector(
                            onTap: () {
                                Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Webview(
              url:buisnessnews.url ?? '',
               )));
                            },
                             child: newswidget(
                               title: buisnessnews.title.toString(),
                                            description: buisnessnews.description.toString(),
                                             image:buisnessnews.urlToImage.toString(),
                                              date: buisnessnews.publishedAt.toString(), 
                                              InkWellbookmarked: () async { 
                                               await context.read<Bookmarkscreencontroller>().addNewsData(buisnessnews);
                                               await context.read<Bookmarkscreencontroller>().getAllNewsData();
                                               
                                               },  iccon:Icon(Icons.bookmark_outline),
                                            
                                               ),
                           );
                             },
                         itemCount: context.watch<Techcontroller>().techarticles.length,
                         separatorBuilder: (context, index) => SizedBox(),
                       ),



// tech news
       ListView.separated(
          itemBuilder: (context, index) {
            final technews =
                context.watch<Techcontroller>().techarticles[index];
            return newswidget(
              title: technews.title.toString(),
               description: technews.description.toString(),
                image: technews.urlToImage.toString(),
                 date: technews.publishedAt.toString(), 
                 InkWellbookmarked: () async { 
                  await context.read<Bookmarkscreencontroller>().addNewsData(technews);
                  await context.read<Bookmarkscreencontroller>().getAllNewsData();
                  },
                iccon:Icon(Icons.bookmark_outline),
               
                  );
              },
          itemCount: context.watch<Techcontroller>().techarticles.length,
          separatorBuilder: (context, index) => SizedBox(
           
          ),
        ),



// apple related news

              ListView.separated(
          itemBuilder: (context, index) {
            final applenews =
                context.watch<Applenewscontroller>().applenewsarticles[index];
            return newswidget(
              title:applenews.title.toString(),
               description:applenews.description.toString(),
                image: applenews.urlToImage.toString(),
                 date:applenews.publishedAt.toString(), 
                 InkWellbookmarked: () async { 
                  await context.read<Bookmarkscreencontroller>().addNewsData(applenews);
                  await context.read<Bookmarkscreencontroller>().getAllNewsData();
                  },
                  iccon:Icon(Icons.bookmark_outline),
               
                  );
              },
          itemCount: context.watch<Applenewscontroller>().applenewsarticles.length,
          separatorBuilder: (context, index) => SizedBox(
           
          ),
        ),

// local news

              ListView.separated(
          itemBuilder: (context, index) {
            final localnews =
                context.watch<Localnewscontroller>().localarticles[index];
            return newswidget(
              title: localnews.title.toString(),
               description: localnews.description.toString(),
                image: localnews.urlToImage.toString(),
                 date: localnews.publishedAt.toString(), 
                 InkWellbookmarked: () async { 
                  await context.read<Bookmarkscreencontroller>().addNewsData(localnews);
                  await context.read<Bookmarkscreencontroller>().getAllNewsData();
                  },
                   iccon:Icon(Icons.bookmark_outline),
               
                  );
              },
          itemCount: context.watch<Localnewscontroller>().localarticles.length,
          separatorBuilder: (context, index) => SizedBox(
           
          ),
        ),


        


        
        ]),
      ),
    );
  }
}




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