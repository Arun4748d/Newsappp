import 'package:flutter/material.dart';
import 'package:newsappp/controller/bookmarkScreencontroller.dart';

import 'package:newsappp/views/globalwidget/globalnewswidget.dart';
import 'package:provider/provider.dart';



class Bookmarkscre extends StatefulWidget {
  const Bookmarkscre({super.key});

  @override
  State<Bookmarkscre> createState() => _BookmarkscreState();
}

class _BookmarkscreState extends State<Bookmarkscre> {
  bool isLoading = true; // Loading state to indicate data fetching

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await context.read<Bookmarkscreencontroller>().initDb(); 
      await context.read<Bookmarkscreencontroller>().getAllNewsData();
      setState(() {
        isLoading = false; 
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final savedNews = context.watch<Bookmarkscreencontroller>().savednews;



    if (savedNews.isEmpty) {
      return const Center(
        child: Text(
          "No saved news!",
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title:  Text("Bookmarks"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body:    ListView.separated(
          itemBuilder: (context, index) {
            return newswidget(
              title:context.watch<Bookmarkscreencontroller>().savednews[index]["title"]??"",
               description: context.watch<Bookmarkscreencontroller>().savednews[index]["description"]??"",
                image:context.watch<Bookmarkscreencontroller>().savednews[index]["image"]??"",
                 date:"", 
                 InkWellbookmarked: () async { 
                  await context.read<Bookmarkscreencontroller>().removeNewsData(
                   ( context.watch<Bookmarkscreencontroller>().savednews[index]["title"]??"").trim(),
                    
                  );
                  
                  
                  
                  }, 
                   iccon:Icon(Icons.delete,color: Colors.red,),
               
                  );
              },
          itemCount: context.watch<Bookmarkscreencontroller>().savednews.length,
          separatorBuilder: (context, index) => SizedBox(),
        ),

    );
  }
}



// context.watch<Bookmarkscreencontroller>().savednews[index]["image"]??""
    // context.watch<Bookmarkscreencontroller>().savednews[index]["title"]??""
//  context.watch<Bookmarkscreencontroller>().savednews[index]["description"]??""
// context.watch<Bookmarkscreencontroller>().savednews.length