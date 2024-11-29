import 'package:flutter/material.dart';


import 'package:newsappp/views/selectednewsScreen/selectednewsScreeen.dart';


class latestnewswidget extends StatefulWidget {
 
  const latestnewswidget({super.key,
  required this.title,

  required this.image,

    required this.date,
    required this.author,
     required this.description,
      required this.content,
       required this.onpress,
       required this.url,
       required this.onpress2,
   
    
  

  });
  final String title;

 final String? image;

 final String date;
 
 final String author;
  final String description;
   final String content;
    final VoidCallback onpress;
    final String url;
    final VoidCallback onpress2;



  @override
  State<latestnewswidget> createState() => _latestnewswidgetState();
}

class _latestnewswidgetState extends State<latestnewswidget> {
  
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () {
         Navigator.push(context, MaterialPageRoute(builder: (context) => Selectednewsscreeen(
                              image: widget.image, title: widget.title,
                               description: widget.description, 
                              content:widget.content??"null",
                               author: widget.author??"null",
                                onpress: widget.onpress, 
                                   url:widget.url,
                                    onpress2: widget.onpress2,
                                ),));

      },
      child: Container(
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
                                            widget.image??"",
                                            height: 150,
                                            width: double.infinity,
                                            fit: BoxFit.cover,
                                          )
                                       
                                  ),
                               
                                  Text(
                                    widget.title,
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
                                        widget.author,
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
                                        widget.date,
                                       style: TextStyle(
                                fontSize: 13,
                                color: Colors.black.withOpacity(0.5),
                                fontWeight: FontWeight.w500,
                               ),),
      
                                ],
                              ),
                            ),
    );
          }
}
