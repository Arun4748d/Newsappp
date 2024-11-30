import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';


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

 final String image;

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
                                Container(
                                 height: 150,
                               width: double.infinity,
                                     decoration: BoxDecoration(
                                         color: Colors.grey.withOpacity(0.4),
                                               borderRadius: BorderRadius.circular(15),
                                                                                 ),
                                          child:  widget.image.isNotEmpty
                                                           ? ClipRRect(
                                                       borderRadius: BorderRadius.circular(15),
                                                              child: Image.network(
                                                                          widget .image,
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
                                (widget.author )
                                .length > 20 ? widget.author.substring(0, 20)  : widget.author,
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
                                           Text(
                                (widget.date )
                                .length > 20 ? widget.date.substring(0, 10,)  : widget.date,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              color: Colors.grey,
                             ),
                                 maxLines: 1,
                             ),
      
                                ],
                              ),
                            ),
    );
          }
}
