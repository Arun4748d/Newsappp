import 'package:flutter/material.dart';

class latestnewswidget extends StatelessWidget {
 
  const latestnewswidget({super.key,
  required this.title,

  required this.image,

    required this.date,
    required this.author
    
  

  });
  final String title;

 final String? image;

 final String date;
 
 final String author;



  @override
  Widget build(BuildContext context) {
    return  Container(
                            width: 300,
                       padding: EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                        
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child:  Image.network(
                                          image??"",
                                          height: 150,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        )
                                     
                                ),
                             
                                Text(
                                  title,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                
                                SizedBox(height: 4),
                                Row(
                                  children: [
                                    Text(
                                      author,
                                    style: TextStyle(
                              fontSize: 15.4,
                              color: Colors.black.withOpacity(0.6),
                              fontWeight: FontWeight.w600,
                             ),

                                    ),
                                     Icon(
                                Icons.check_circle,
                         color: Colors.blue,
                            size: 20,
                            ),
                                  
                                    
                                  ],
                                ),
                                         Text(
                                      date,
                                     style: TextStyle(
                              fontSize: 13,
                              color: Colors.black.withOpacity(0.5),
                              fontWeight: FontWeight.w500,
                             ),),

                              ],
                            ),
                          );
          }
      
  }
