



import 'package:flutter/foundation.dart';
import 'package:http/http.dart'as http;
import 'package:newsappp/models/Model.dart';

class Techcontroller with ChangeNotifier{


List<Article> techarticles=[];
  Future<void> techget() async {

    final url =Uri.parse("https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=c012d41fac2849f585a29c739cd8b3af");

    try{
      var response =await http.get(url);
      if(response.statusCode==200){
        // log(response.body.toString());
         BuisnessModel resmodel=buisnessModelFromJson(response.body);
       techarticles=resmodel.articles??[];
        notifyListeners();
      }
  
    }catch(e){}
  }
}