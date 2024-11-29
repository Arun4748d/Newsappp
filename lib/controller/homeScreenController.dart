



import 'package:flutter/foundation.dart';
import 'package:http/http.dart'as http;
import 'package:newsappp/models/Model.dart';

class homeScreenController with ChangeNotifier{
    bool isloading = false;
  List<String> NewsList = [
    "All",
    "Technology",
    "Business",
    "apple",
    "Health",
    "Sports",
    "Entertainment",
    "Tesla",
  ]; 

int selectedNewsIndex = 0;
List<Article> newsarticles=[];

  Future<void> Newsget() async {
     isloading = true;
     notifyListeners();
    final url =Uri.parse("https://newsapi.org/v2/everything?q=${NewsList[selectedNewsIndex]}=popularity&apiKey=0de4a111d1364dfaa78324e6ab7f4ad1");

    try{
      final response =await http.get(url);
      if(response.statusCode==200){
        // log(response.body.toString());
         BuisnessModel resmodel=buisnessModelFromJson(response.body);
       newsarticles=resmodel.articles??[];
        notifyListeners();
      }
  
    }catch(e){}
         isloading=false;
   notifyListeners();
    
    
  }

   Future<void> searchCategory(String category) async {
    isloading = true;
    notifyListeners();

    // Find the index of the category
    selectedNewsIndex = NewsList.indexOf(category);

    if (selectedNewsIndex != -1) {
      // If category found, fetch the news related to it
      await Newsget();
    } else {
      // If category doesn't exist, clear the articles
      newsarticles = [];
    }

    isloading = false;
    notifyListeners();
  }


  Future<void> onNewsSelection(int clickedIndex) async {
    if (selectedNewsIndex != clickedIndex) {
      selectedNewsIndex = clickedIndex;
      notifyListeners();
      await Newsget();
    }
  }


  
}