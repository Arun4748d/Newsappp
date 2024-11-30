
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:newsappp/controller/bookmarkScreencontroller.dart';
import 'package:newsappp/controller/homeScreenController.dart';
import 'package:newsappp/views/selectednewsScreen/selectednewsScreeen.dart';
import 'package:newsappp/views/searchScreen/latestnewswidget.dart';
import 'package:newsappp/views/searchScreen/searchedScreen.dart';
import 'package:provider/provider.dart';

class Searchs extends StatefulWidget {
  const Searchs({super.key});

  @override
  State<Searchs> createState() => _SearchsState();
}

class _SearchsState extends State<Searchs> {

    final TextEditingController searchController = TextEditingController();
  bool isSearchClick = false;
  String searchText = "";
  List<String> filteredItems = [];
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // Fetch the news articles once the widget is rendered
      await context.read<homeScreenController>().Newsget();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final techController = context.watch<homeScreenController>();
    // final techArticles = techController.newsarticles;
       final allArticles = techController.newsarticles;
      

      // Filter for latest news (excluding Sports - index 5)
  final latestNews = techController.selectedNewsIndex != 5 ? allArticles : [];

  final newsList = context.watch<homeScreenController>().NewsList;

    if (filteredItems.isEmpty) {
      filteredItems = List.from(newsList);
    }

    // Search filter logic
    void onSearchChanged(String value) {
      setState(() {
        searchText = value;
        if (searchText.isEmpty) {
          filteredItems.clear(); // Clear filtered items when search text is empty
        } else {
          filteredItems = newsList
              .where((news) =>
                  news.toLowerCase().contains(searchText.toLowerCase()))
              .toList();
        }
           });
    }

    return Scaffold(
      appBar: AppBar(
         title: isSearchClick
            ? Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  controller: searchController,
                  onChanged: onSearchChanged,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(16, 2, 16, 12),
                    hintStyle: const TextStyle(
                      color: Colors.black,
                    ),
                    border: InputBorder.none,
                    hintText: "Search...",
                  ),
                ),
              )
            : const Text("Search"),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isSearchClick = !isSearchClick;
                if (!isSearchClick) {
                  searchController.clear();
                  searchText = "";
                  filteredItems=List.from(newsList);  // Reset filtered list
                }
              });
            },
            icon: Icon(isSearchClick ? Icons.close : Icons.search),
          ),
        ],
       
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body:  searchText.isNotEmpty
          ? ListView.builder(
        itemCount: filteredItems.length,
        itemBuilder: (context, index) {
          final selectedItem = filteredItems[index];
          return ListTile(
            title: Text(
              selectedItem,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onTap: () {
              // Navigate to details screen on item tap
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Searchedscreen(searchQuery: selectedItem),
                ),
              );
            },
          );
        },
      )
          :
             Consumer<homeScreenController>(builder: (context, SearchScreenController, child) => 
      SearchScreenController.isloading?Center(
        child:
         SizedBox(
          width: 50,
          height: 50,
           child: LoadingIndicator(
               indicatorType: Indicator.lineScale, /// Required, The loading type of the widget
               colors: const [Colors.black],       /// Optional, The color collections
               strokeWidth: 2,                     /// Optional, The stroke of the line, only applicable to widget which contains line
               backgroundColor: Colors.white,      /// Optional, Background of the widget
               pathBackgroundColor: Colors.blue  
                /// Optional, the stroke backgroundColor
           ),
         ),
         )
          :
          SingleChildScrollView(
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
                        itemCount: latestNews.length,
                        separatorBuilder: (context, index) => SizedBox(width: 8),
                        itemBuilder: (context, index) {
                         final article = latestNews[index];
                          return latestnewswidget(title: article.title??"",
                           image: article.urlToImage??"",
                            date: article.publishedAt.toString(), 
                            author: article.author??"",
                             description: context.watch<homeScreenController>().newsarticles[index].description??"null",
                              content: context.watch<homeScreenController>().newsarticles[index].content??"null",
                               onpress: () async {
                                  await context.read<Bookmarkscreencontroller>().addNewsData(article);
                        await context.read<Bookmarkscreencontroller>().getAllNewsData();
                         
                               }, url: article.url,
                                onpress2: () async { 
                                   await context.read<Bookmarkscreencontroller>().removeNewsData(article.title);
                                },);
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
                    final mobilenews=context.read<homeScreenController>().newsarticles;
                   
                     return   Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
              GestureDetector(
           onTap: () {
             print("GestureDetector tapped");
             Navigator.push(
               context,
               MaterialPageRoute(
          builder: (context) => Selectednewsscreeen(
            image: mobilenews[index].urlToImage ?? "null",
            title: mobilenews[index].title ?? "null",
            description: mobilenews[index].description ?? "null",
            onpress: () async {
                        await context.read<Bookmarkscreencontroller>().addNewsData(mobilenews[index]);
                        await context.read<Bookmarkscreencontroller>().getAllNewsData();
            },
            content: mobilenews[index].content ?? "null",
            author: mobilenews[index].author ?? "null",
            url: mobilenews[index].url ?? "null", 
            onpress2: () async {
                await context.read<Bookmarkscreencontroller>().removeNewsData(mobilenews[index].title??"null");
              },
          ),
               ),
             );
           },
            child: Container(
                                    height: 100,
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
                           
                                Row(
                                  children: [
                                    
                                   Text(
                                  (mobilenews[index].author ?? "no author")
                                  .length > 20 ? mobilenews[index].author!.substring(0, 20)  : mobilenews[index].author??"",
                                style: TextStyle(
                                  fontSize: 15,
                                color: Colors.grey,
                               ),
                                   maxLines: 1,
                               ),
         
                                    Icon(
                                    Icons.check_circle,
                             color: Colors.blue,
                                size: 16,
                                ),
                                  ],
                                ),
                                    
                            
                          
                          ],
                        ),
                                        ),
                                        const SizedBox(width: 10),
                                        Container(
           height: 100,
           width: 100,
           decoration: BoxDecoration(
             color: Colors.grey.withOpacity(0.4),
             borderRadius: BorderRadius.circular(15),
           ),
           child: (mobilenews[index].urlToImage != null && mobilenews[index].urlToImage!.isNotEmpty)
               ? ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              mobilenews[index].urlToImage!,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Center(
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
         
                                   
                                      ],
                                    ),
                                  ),
          ),
                              ],
                            ),
                    );
                   }, separatorBuilder: (context, index) => SizedBox(), itemCount:context.read<homeScreenController>().newsarticles.length )
                  
                   
                  ],
                ),
              ),
       ),

    );
  }
}
