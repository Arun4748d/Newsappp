
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

import 'package:newsappp/views/selectednewsScreen/selectednewsScreeen.dart';



class newswidget extends StatelessWidget {
 
  const newswidget({super.key,
  required this.title,
  required this.description,
  required this.image,

    required this.date,
        this.iccon,
        this.content,
        this.author,
    required this.InkWellbookmarked,
    required this.url,
    required this.onpress2,
   

    //  required Future<Null> Function() bookmarkCallback,
  

  });
  final String title;
  final String description;
 final String image;

 final String date;
  final Widget? iccon;
  final String ?content;
  final String? author;
  final VoidCallback InkWellbookmarked;
  final String url;
    final VoidCallback onpress2;
  
       

  @override
  Widget build(BuildContext context) {
    return  Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: SizedBox(
                    height: 292,
                    child: GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Selectednewsscreeen(
                              image: image, title: title, description: description, 
                              content:content??"null", author: author??"null", onpress: InkWellbookmarked, 
                              url: url, 
                              onpress2: onpress2, 
                              
                               ),
                               )
                               );
                          },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         Container(
                                 height: 180,
                               width: double.infinity,
                                     decoration: BoxDecoration(
                                         color: Colors.grey.withOpacity(0.4),
                                               borderRadius: BorderRadius.circular(15),
                                                                                 ),
                                          child: image != null && image.isNotEmpty
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
      : SizedBox(),
),
                          Text(
                           title,maxLines: 2,
                           
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                                Text(
                           description,maxLines: 2,
                           overflow: TextOverflow.ellipsis,
                           
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Row(
                           
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                       
                              Text(
                                (date )
                                .length > 20 ? date.substring(0, 10,)  : date,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              color: Colors.grey,
                             ),
                                 maxLines: 1,
                             ),
                                
                             
                         
                            ],
                          ),
                       
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
      
  }
