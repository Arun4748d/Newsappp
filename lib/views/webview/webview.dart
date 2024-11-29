import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  final String url;

  const WebViewScreen({Key? key, required this.url}) : super(key: key);

  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late final WebViewController _controller;
  bool isloading = false;

  @override
  void initState() {
    super.initState();
    // Create WebViewController with WebView initialization
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted) // Enable JavaScript
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            print("Page loading: $url");
          },
          onPageFinished: (url) {
            print("Page loaded: $url");
          },
          onNavigationRequest: (NavigationRequest request) {
            // Handle link navigation
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url)); // Load the URL
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text(
          "NEWS Today",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body:
      WebViewWidget(controller: _controller),// Embed WebView
    );
  }
}




// import 'package:flutter/material.dart';
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
//   List<String> filteredItems = [];

//   @override
//   Widget build(BuildContext context) {
//     // Fetch NewsList from the Provider
//     final newsList = context.watch<homeScreenController>().NewsList;

//     // Initialize filteredItems if not yet set
//     if (filteredItems.isEmpty) {
//       filteredItems = List.from(newsList);
//     }

//     // Search filter logic
//     void onSearchChanged(String value) {
//       setState(() {
//         searchText = value;
//         if (searchText.isEmpty) {
//           filteredItems .clear();
//         } else {
//           filteredItems = newsList
//               .where((news) =>
//                   news.toLowerCase().contains(searchText.toLowerCase()))
//               .toList();
//         }
//       });
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
//                     hintText: "Search...",
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
//                   filteredItems = List.from(newsList); // Reset filtered list
//                 }
//               });
//             },
//             icon: Icon(isSearchClick ? Icons.close : Icons.search),
//           ),
//         ],
//         backgroundColor: Colors.white,
//       ),
//       body: ListView.builder(
//         itemCount: filteredItems.length,
//         itemBuilder: (context, index) {
//           final selectedItem = filteredItems[index];
//           return ListTile(
//             title: Text(
//               selectedItem,
//               style: TextStyle(
//                 color: Colors.black,
//               ),
//             ),
//             onTap: () {
//               // Navigate to details screen on item tap
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => Searchedscreen(searchQuery: selectedItem),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
