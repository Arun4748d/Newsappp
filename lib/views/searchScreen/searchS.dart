
import 'package:flutter/material.dart';
import 'package:newsappp/controller/applenewscontroller.dart';

import 'package:newsappp/controller/techcontroller.dart';
import 'package:newsappp/views/globalwidget/globalnewsLatest.dart';
import 'package:provider/provider.dart';

class Searchs extends StatefulWidget {
  const Searchs({super.key});

  @override
  State<Searchs> createState() => _SearchsState();
}

class _SearchsState extends State<Searchs> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // Fetch the news articles once the widget is rendered
      await context.read<Techcontroller>().techget();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final techController = context.watch<Techcontroller>();
    final techArticles = techController.techarticles;

    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search",
              hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
              suffixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body:  SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   
                //  Popular tags
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 21,),
                    child: Row(
                      children: [
                        Text(
                          "Popular Tags",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                        Spacer(),
                        Text(
                          "View All",
                          style: TextStyle(
                            color: Color.fromARGB(255, 93, 57, 57),
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                // Tags
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 21,),
                     child: Column(
                                     children: [
                                       SizedBox(height: 10,),
                                       Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.all(4),
                        
                           child: Text("#FridayMorning",
                           style: TextStyle(
                            fontSize: 13,
                              fontWeight: FontWeight.w400,
                           ),),
                          decoration: BoxDecoration(
                                 color:Colors.grey.withOpacity(0.2),
                                 borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                          Container(
                          padding: EdgeInsets.all(4),
                        
                           child: Text("#CollegeColorsDay",
                           style: TextStyle(
                            fontSize: 13,
                              fontWeight: FontWeight.w400,
                           ),),
                          decoration: BoxDecoration(
                                 color:Colors.grey.withOpacity(0.2),
                                 borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                          Container(
                          padding: EdgeInsets.all(4),
                        
                           child: Text("#instagramDown",
                           style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                           ),
                           ),
                          decoration: BoxDecoration(
                                 color:Colors.grey.withOpacity(0.2),
                                 borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ],
                                       ),
                                       SizedBox(height: 7,),
                      Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      
                      children: [
                        Container(
                          padding: EdgeInsets.all(4),
                        
                           child: Text("#FridayFeeling",
                           style: TextStyle(
                            fontSize: 13,
                              fontWeight: FontWeight.w400,
                           ),),
                          decoration: BoxDecoration(
                                 color:Colors.grey.withOpacity(0.2),
                                 borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        SizedBox(width: 7,),
                          Container(
                          padding: EdgeInsets.all(4),
                        
                           child: Text("#ThursdayVibes",
                           style: TextStyle(
                            fontSize: 13,
                              fontWeight: FontWeight.w400,
                           ),),
                          decoration: BoxDecoration(
                                 color:Colors.grey.withOpacity(0.2),
                                 borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        SizedBox(width: 7,),
                          Container(
                          padding: EdgeInsets.all(4),
                        
                           child: Text("#DigitalCurrency",
                           style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                           ),
                           ),
                          decoration: BoxDecoration(
                                 color:Colors.grey.withOpacity(0.2),
                                 borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ],
                                       ),
                      SizedBox(height: 7,),
                      Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      
                      children: [
                        Container(
                          padding: EdgeInsets.all(4),
                        
                           child: Text("#Bitcoin",
                           style: TextStyle(
                            fontSize: 13,
                              fontWeight: FontWeight.w400,
                           ),),
                          decoration: BoxDecoration(
                                 color:Colors.grey.withOpacity(0.2),
                                 borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        SizedBox(width: 7,),
                          Container(
                          padding: EdgeInsets.all(4),
                        
                           child: Text("#CryptoCurrency",
                           style: TextStyle(
                            fontSize: 13,
                              fontWeight: FontWeight.w400,
                           ),),
                          decoration: BoxDecoration(
                                 color:Colors.grey.withOpacity(0.2),
                                 borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        SizedBox(width: 7,),
                          Container(
                          padding: EdgeInsets.all(4),
                        
                           child: Text("#KnifeTalk",
                           style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                           ),
                           ),
                          decoration: BoxDecoration(
                                 color:Colors.grey.withOpacity(0.2),
                                 borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ],
                                       ),
                                       SizedBox(height: 10,),
                                     
                       ],
                                   ),
                   ),
                     Divider(),
                  SizedBox(height: 5),
              
   // Latest News Section
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 21),
                    child: Row(
                      children: [
                        Text(
                          "Latest News",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                        Spacer(),
                        Text(
                          "View All",
                          style: TextStyle(
                            color: Color.fromARGB(255, 93, 57, 57),
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
              
              
                  SizedBox(height: 10),
         // Listview Seperated card
                  SizedBox(
                    height: 250,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: techArticles.length,
                      separatorBuilder: (context, index) => SizedBox(width: 8),
                      itemBuilder: (context, index) {
                        final article = techArticles[index];
                        return latestnewswidget(title: article.title??"",
                         image: article.urlToImage??"",
                          date: article.publishedAt.toString(), 
                          author: article.author??"");
                      },
                    ),
                  ),
                   Divider(),
               
   // recomendation topic
                 Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 21,),
                    child: Row(
                      children: [
                        Text(
                          "Recomendation Topic",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                        Spacer(),
                        Text(
                          "View All",
                          style: TextStyle(
                            color: Color.fromARGB(255, 93, 57, 57),
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder:(context, index) {
                  final mobilenews=context.read<Applenewscontroller>().applenewsarticles;
                   return   Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                            children: [
                              Container(
                                height: 120,
                                width: double.infinity,
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                              
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          mobilenews[index].title??"",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 10),
                       
                            Text(
                              mobilenews[index].author??"no author",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                        
                      
                      ],
                    ),
                                    ),
                                    const SizedBox(width: 10),
                                    Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                           borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        fit: BoxFit.cover,                      
                        image: 
                      NetworkImage(context.read<Applenewscontroller>().applenewsarticles[index].urlToImage??"no image")),
                    ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                  );
                 }, separatorBuilder: (context, index) => SizedBox(), itemCount:context.read<Applenewscontroller>().applenewsarticles.length )
                
                 
                ],
              ),
            ),

    );
  }
}
