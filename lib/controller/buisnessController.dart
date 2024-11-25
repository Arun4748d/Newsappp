
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:newsappp/models/Model.dart';

class Homescreencontroller with ChangeNotifier{

   List<Article> articles=[];
  Future<void> getnews() async {
    final url=Uri.parse("https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=c012d41fac2849f585a29c739cd8b3af");

    try{
      var response =await http.get(url);
         if(response.statusCode==200){
              //  log(response.body.toString());
          BuisnessModel resmodel=buisnessModelFromJson(response.body);
          articles=resmodel.articles??[];
           notifyListeners();
         }
      
    }catch(e){}
  }
}