import 'package:flutter/foundation.dart';
import 'package:http/http.dart'as http;
import 'package:newsappp/models/Model.dart';

class Applenewscontroller with ChangeNotifier{


List<Article> applenewsarticles=[];
  Future<void> appleget() async {

    final url =Uri.parse("https://newsapi.org/v2/everything?q=apple&from=2024-11-24&to=2024-11-24&sortBy=popularity&apiKey=c012d41fac2849f585a29c739cd8b3af");
    

    try{
      var response =await http.get(url);
      if(response.statusCode==200){
        // log(response.body.toString());
         BuisnessModel resmodel=buisnessModelFromJson(response.body);
       applenewsarticles=resmodel.articles??[];
        notifyListeners();
      }
  
    }catch(e){}
  }
}