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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Selectednewsscreeen(
                              image: image,
                               title: title,
                                description: description, 
                              content:content??"null",
                               author: author??"null",
                                onpress: InkWellbookmarked,
                               url:url.isNotEmpty ? url : "No URL available", 
                               onpress2: onpress2,  ),));
                          },
                          child: Container(
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
                     
                          
                               Text(date??"null",
                             style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                             ),),
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
