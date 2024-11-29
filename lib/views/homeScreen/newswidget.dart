import 'package:flutter/material.dart';

import 'package:newsappp/views/selectednewsScreen/selectednewsScreeen.dart';



class newswidget extends StatelessWidget {
 
  const newswidget({super.key,
  required this.title,
  required this.description,
  required this.image,

     this.date,
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
 final String? image;

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
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(image??"null"),
                              ),
                            ),
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
                       
                            
                                 Text(date??"null",
                               style: TextStyle(
                                
                                fontSize: 12,
                                color: Colors.black.withOpacity(0.6),
                                fontWeight: FontWeight.bold,
                               ),),
                                
                             
                         
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
