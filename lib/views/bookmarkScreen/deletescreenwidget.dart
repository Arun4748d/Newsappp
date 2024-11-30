import 'package:flutter/material.dart';

import 'package:newsappp/views/selectednewsScreen/selectednewsScreeen.dart';



class Deletescreenwidget extends StatelessWidget {
 
  const Deletescreenwidget({super.key,
  required this.title,
  required this.description,
  required this.image,

     this.date,
        this.iccon,
     required   this.content,
     required   this.author,
    required this.InkWellbookmarked,
    required this.url,
    required this.onpress2,

    //  required Future<Null> Function() bookmarkCallback,
  

  });
  final String title;
  final String? description;
 final String image;

 final String ?date;
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Selectednewsscreeen(
                              image: image,
                               title: title,
                                description: description??"null", 
                              content:content??"null",
                               author: author??"null",
                                onpress: InkWellbookmarked,
                               url:url.isNotEmpty ? url : "No URL available", 
                               onpress2: onpress2,  ),));
                          },
                          child: 
                          // Container(
                          //   height: 180,
                          //   width: double.infinity,
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(15),
                          //     image: DecorationImage(
                          //       fit: BoxFit.fill,
                          //       image: NetworkImage(image),
                          //     ),
                          //   ),
                          // ),
                            
                 Container(
                                 height: 180,
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
                            child: CircularProgressIndicator(),
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
                        Text(
                         title,
                         
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),  
                        Row(
                          children: [                       
                                
                               Spacer(),
                           
                            InkWell(
                              onTap: 
                                 InkWellbookmarked,
                               child: iccon,
                             
                            )
                          ],
                        ),
                     
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
      
  }
