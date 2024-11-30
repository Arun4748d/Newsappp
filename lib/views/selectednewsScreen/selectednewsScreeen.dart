
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

import 'package:newsappp/controller/selectedScreencontroller.dart';
import 'package:newsappp/views/webview/webview.dart';
import 'package:provider/provider.dart';



class Selectednewsscreeen extends StatelessWidget {
  const Selectednewsscreeen({ Key? key,required this.image,required this.title,required this.description,required this.onpress, 
  required this.content,required this.author
    ,
  required this.onpress2,
  required this.url,
  }): super(key: key);


   final String image;
   final String title;
   final String description;
   final String content;
   final String author;
   final VoidCallback onpress;
    final String url;
    final VoidCallback onpress2;
   

  @override
  Widget build(BuildContext context) {
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
         leading: IconButton(
          icon: Icon(Icons.arrow_back, color:Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [

      Consumer<Selectedscreencontroller>(
            builder: (context, selectedProvider, child) {
              final isSelected = selectedProvider.isBookmarked(title);
              
        return IconButton(
                icon: Icon(
                  isSelected ? Icons.bookmark : Icons.bookmark_outline,
                  color: Colors.black,
                  size: 25,
                ),
                onPressed: () {
                  if (isSelected) {
                    onpress2(); // Remove data logic
                  } else {
                    onpress(); // Add data logic
                  }
                  selectedProvider.toggleBookmark(title);
                },
              );
            }
      ),
              SizedBox(width: 16,),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, ),
         
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child:
                //  Container(
                //   height: 250,
                 
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(15),
                //     image: DecorationImage(
                //       fit: BoxFit.fill,
                //       image: 
                //     NetworkImage(image??"nukl"))
                //   ),
                // ),
                
                 Container(
                                 height: 250,
                               width: double.infinity,
                                     decoration: BoxDecoration(
                                         color: Colors.grey.withOpacity(0.4),
                                               borderRadius: BorderRadius.circular(15),
                                                                                 ),
                                          child:  image.isNotEmpty
                                                           ? ClipRRect(
                                                       borderRadius: BorderRadius.circular(15),
                                                              child: Image.network(
                                                                          image,
                                                                 fit: BoxFit.fill,
                                                   errorBuilder: (context, error, stackTrace) =>  Center(
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
              ),
              
               
          Text(title,
          style: TextStyle(color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 18),),
          SizedBox(height: 16,),
          Row(
            children: [
              CircleAvatar(
                 radius: 23,
                 child: Text(author.isNotEmpty?author[0]. toUpperCase():"",
                 style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                 ),),
                backgroundColor: Colors.grey.shade400,
                
              ),
              SizedBox(width: 10,),
              Text(
                                (author )
                                .length > 20 ? author.substring(0, 20)  : author,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              color: Colors.grey,
                             ),
                                 maxLines: 1,
                             ),
                                       Icon(
                                  Icons.check_circle,
                           color: Colors.blue,
                              size: 20,
                              ),
            ],
          ),
              SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.favorite_outline, color: Colors.black,size: 24,),
                  onPressed: () {}, 
                ),
                IconButton(
                  icon: Icon(Icons.comment_outlined, color: Colors.black,size: 24,
                  ),
                  onPressed: () {}, 
                ),
                IconButton(
                  icon: Icon(Icons.share_outlined, color: Colors.black,size: 24,),
                  onPressed: () {
                    
                  }, 
                ),
               
              ],
            ),
                SizedBox(height: 12),
           Text(description,
           style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 15.5,
           ),
           ),
           SizedBox(height: 10,
           ),
          Text(content,
           style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 15.5,
           ),),
           TextButton(onPressed: () async {
           
                       Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WebViewScreen(url: url), // Pass article URL
      ),
    );
           }, child: Text("See more",
           style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
            fontSize: 16.7,
           ),)),
            
            ],
          ),
        ),
      ),
    );
  }
}


// CachedNetworkImage(
//   imageUrl: image,
//   placeholder: (context, url) => Center(child: CircularProgressIndicator()),
//   errorWidget: (context, url, error) => Icon(Icons.broken_image, size: 50, color: Colors.black.withOpacity(0.5)),
//   fit: BoxFit.cover,
// )
