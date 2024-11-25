import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:newsappp/controller/bookmarkScreencontroller.dart';
import 'package:newsappp/controller/buisnessController.dart';
import 'package:newsappp/views/bookmarkScreen/bookmarkScre.dart';
import 'package:newsappp/views/homeScreen/homescreen.dart';
import 'package:newsappp/views/profileScreen/profileScreen.dart';
import 'package:newsappp/views/searchScreen/searchS.dart';
import 'package:provider/provider.dart';


class Bottomnavigationbar1 extends StatefulWidget {
  const Bottomnavigationbar1({super.key});

  @override
  State<Bottomnavigationbar1> createState() => _Bottomnavigationbar1State();
}

class _Bottomnavigationbar1State extends State<Bottomnavigationbar1> {
    @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
     await context.read<Bookmarkscreencontroller>().initDb();
    await  context.read<Homescreencontroller>().getnews();
    },);
    super.initState();
  }

  bool isScrollingDown = false;
  int selectedindex=0;
  List screens=[
      Homescreen(),
       Searchs(),
        Bookmarkscre(),
         Profilescreen(),
  ];
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
         
        key: _bottomNavigationKey,
        index: selectedindex,
            onTap: (value) {
          setState(() {
         
            selectedindex=value;
          }
          );
        },
      
         
        items: <Widget>[
      
          Icon(Icons.home_outlined, size: 30),
          Icon(Icons.search_outlined, size: 30),
          
          Icon(Icons.bookmark_outline, size: 30),
          CircleAvatar(
            backgroundColor: Colors.black,
            radius: 15,
        
          ),
        ],
        color: Colors.white,
        buttonBackgroundColor: const Color.fromARGB(255, 93, 57, 57).withOpacity(0.9),
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
          
        letIndexChange: (index) => true,
      ),
      body: screens[selectedindex]
    );
  }
}



