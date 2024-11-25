import 'package:flutter/material.dart';


class newswidget extends StatelessWidget {
 
  const newswidget({super.key,
  required this.title,
  required this.description,
  required this.image,

    required this.date,
        required this.iccon,
     required  this.InkWellbookmarked,
  

  });
  final String title;
  final String description;
 final String? image;

 final String date;
  final Widget iccon;
  final VoidCallback? InkWellbookmarked;


  @override
  Widget build(BuildContext context) {
    return  Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: SizedBox(
                    height: 310, 
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
                         title,
                          maxLines: 2,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                         description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.grey[700], fontSize: 14),
                        ),
                       
                        Row(
                          children: [
                            Icon(Icons.favorite_border_outlined,size: 22,),
                            SizedBox(width: 15),
                            Icon(Icons.comment_outlined,size: 22,),
                            SizedBox(width: 15),
                            Icon(Icons.share_outlined,size: 22,),
                            Spacer(),
                           
                            InkWell(
                              onTap: 
                                // await context
                                //     .read<Bookmarkscreencontroller>()
                                //     .addNewsData();
                                // await context
                                //     .read<Bookmarkscreencontroller>()
                                //     .getAllNewsData();
                                 InkWellbookmarked,
                               child: iccon,
                             
                            )
                          ],
                        ),
                        SizedBox(height: 2,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                             Text(date,
                             style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                             ),),
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
