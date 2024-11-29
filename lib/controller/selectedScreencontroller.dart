import 'package:flutter/material.dart';



class Selectedscreencontroller with ChangeNotifier {
  // Map to store the bookmark status for each article (using title as the key)
  Map<String, bool> _bookmarkedArticles = {};

  // Getter for checking if an article is bookmarked
  bool isBookmarked(String articleTitle) {
    return _bookmarkedArticles[articleTitle] ?? false;
  }

  // Toggle the bookmark state for an article
  void toggleBookmark(String articleTitle) {
    _bookmarkedArticles[articleTitle] = !(_bookmarkedArticles[articleTitle] ?? false);
    notifyListeners(); // Notify listeners when state changes
  }
}

