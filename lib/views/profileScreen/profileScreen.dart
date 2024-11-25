import 'package:flutter/material.dart';

class Profilescreen extends StatelessWidget {
  const Profilescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SettingsScreen(),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          
        ),),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
    


          InkWell(
            onTap: () {
              
            },
            child: ListTile(
               leading: Icon(Icons.person,  color: Colors.black),
            title: Text(
              "Profile",
              style: const TextStyle(fontSize: 16),
            ),
            trailing: const Icon(Icons.chevron_right, color: Colors.grey),
            ),
          ),

               ListTile(
             leading: Icon(Icons.wallet,  color: Colors.black),
          title: Text(
             "My Wallet",
            style: const TextStyle(fontSize: 16),
          ),
          trailing: const Icon(Icons.chevron_right, color: Colors.grey),
          ),

               ListTile(
             leading: Icon(Icons.article,  color: Colors.black),
          title: Text(
           "My Post",
            style: const TextStyle(fontSize: 16),
          ),
          trailing: const Icon(Icons.chevron_right, color: Colors.black),
          ),

               ListTile(
             leading: Icon(Icons.rocket_launch,  color: Colors.black),
          title: Text(
           "Boost Your Post",
            style: const TextStyle(fontSize: 16),
          ),
          trailing: const Icon(Icons.chevron_right, color: Colors.grey),
          ),

             ListTile(
             leading: Icon(Icons.notifications,  color: Colors.black),
          title: Text(
            "Notifications",
            style: const TextStyle(fontSize: 16),
          ),
          trailing: const Icon(Icons.chevron_right, color: Colors.grey),
          ),

             ListTile(
             leading: Icon(Icons.library_books,  color: Colors.black),
          title: Text(
             "Terms and Conditions",
            style: const TextStyle(fontSize: 16),
          ),
          trailing: const Icon(Icons.chevron_right, color: Colors.grey),
          ),

             ListTile(
             leading: Icon(Icons.info_outline,  color: Colors.black),
          title: Text(
           "About",
            style: const TextStyle(fontSize: 16),
          ),
          trailing: const Icon(Icons.chevron_right, color: Colors.grey),
          ),

             ListTile(
             leading: Icon(Icons.star_outline,  color: Colors.black),
          title: Text(
           "Watch Ads & Earn",
            style: const TextStyle(fontSize: 16),
          ),
          trailing: const Icon(Icons.chevron_right, color: Colors.grey),
          ),

             ListTile(
             leading: Icon(Icons.share,  color: Colors.black),
          title: Text(
             "Refer and Earn",
            style: const TextStyle(fontSize: 16),
          ),
          trailing: const Icon(Icons.chevron_right, color: Colors.grey),
          ),

             InkWell(
              onTap: () {
                
              },
               child: ListTile(
               leading: Icon(Icons.logout,  color: Colors.black),
                         title: Text(
                           "Log Out",
                           style: const TextStyle(fontSize: 16),
                         ),
                         trailing: const Icon(Icons.chevron_right, color: Colors.grey),
                         ),
             ),


        ],
      )
    );
     
  }


  }
  