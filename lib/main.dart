import 'package:flutter/material.dart';
import 'package:newsappp/controller/bookmarkScreencontroller.dart';
import 'package:newsappp/controller/homeScreenController.dart';
import 'package:newsappp/controller/selectedScreencontroller.dart';


import 'package:newsappp/views/splashScreen/splashscreen.dart';

import 'package:provider/provider.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp( MultiProvider(
      providers: [
      ChangeNotifierProvider(create: (context) =>Bookmarkscreencontroller(),),
      ChangeNotifierProvider(create: (context) =>homeScreenController(),),
      ChangeNotifierProvider(create:(context) => Selectedscreencontroller(), )
        
      ],
    child: MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Splashscreen(),
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:newsappp/controller/bookmarkScreencontroller.dart';
// import 'package:newsappp/controller/homeScreenController.dart';
// import 'package:newsappp/views/searchScreen/searchedScreen.dart';
// import 'package:provider/provider.dart';

// class Search extends StatefulWidget {
//   const Search({super.key});

//   @override
//   State<Search> createState() => _SearchState();
// }

// class _SearchState extends State<Search> {
//   final TextEditingController searchController = TextEditingController();
//   bool isSearchClick = false;
//   String searchText = "";

//   @override
//   Widget build(BuildContext context) {
//     final techController = context.watch<homeScreenController>();

//     // Handle search query changes
//     void onSearchChanged(String value) {
//       setState(() {
//         searchText = value;
//       });

//       // Perform search when query is updated
//       if (searchText.isNotEmpty) {
//         techController.searchCategory(searchText);
//       }
//     }

//     return Scaffold(
//       appBar: AppBar(
//         title: isSearchClick
//             ? Container(
//                 height: 40,
//                 decoration: BoxDecoration(
//                   color: Colors.grey.shade400,
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: TextField(
//                   controller: searchController,
//                   onChanged: onSearchChanged,
//                   decoration: InputDecoration(
//                     contentPadding: const EdgeInsets.fromLTRB(16, 2, 16, 12),
//                     hintStyle: const TextStyle(
//                       color: Colors.black,
//                     ),
//                     border: InputBorder.none,
//                     hintText: "Search categories...",
//                   ),
//                 ),
//               )
//             : const Text("Search"),
//         actions: [
//           IconButton(
//             onPressed: () {
//               setState(() {
//                 isSearchClick = !isSearchClick;
//                 if (!isSearchClick) {
//                   searchController.clear();
//                 }
//               });
//             },
//             icon: Icon(isSearchClick ? Icons.close : Icons.search),
//           ),
//         ],
//         backgroundColor: Colors.white,
//       ),
//       body: techController.isloading
//           ? Center(child: CircularProgressIndicator())
//           : ListView.builder(
//               itemCount: techController.newsarticles.length,
//               itemBuilder: (context, index) {
//                 final article = techController.newsarticles[index];
//                 return ListTile(
//                   title: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       TextButton(
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => Searchedscreen(
//                                 content: article.content ?? "No Content",
//                                 date: article.publishedAt.toString(),
//                                 description: article.description ?? "No Description",
//                                 image: article.urlToImage ?? "",
//                                 onpress: () async {
//                                   await context
//                                       .read<Bookmarkscreencontroller>()
//                                       .addNewsData(article);
//                                   await context
//                                       .read<Bookmarkscreencontroller>()
//                                       .getAllNewsData();
//                                 },
//                                 title: article.title ?? "No Title",
//                                 IcCon: Icon(Icons.bookmark_outline),
//                                 Author: article.author ?? "No Author",
//                                 length: techController.newsarticles.length,
//                               ),
//                             ),
//                           );
//                         },
//                         child: Text(
//                           article.title ?? "No Title",
//                           style: const TextStyle(
//                             color: Colors.black,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//     );
//   }
// }
