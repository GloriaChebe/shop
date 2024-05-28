

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'), 
        centerTitle: true, 
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 40),
            const CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('assets/images/personIcon.jpg'),
            ),
            const SizedBox(height: 20),
            itemProfile('Username ', 'Gloria', CupertinoIcons.person),
            const SizedBox(height: 10),
            itemProfile('Phone', '0745881266', CupertinoIcons.phone),
            const SizedBox(height: 10),
            itemProfile(
                'Address', '116, kericho', CupertinoIcons.location),
            const SizedBox(height: 10),
            itemProfile(
                'Email', 'gloriachebet024@gmail.com', CupertinoIcons.mail),

            const SizedBox(
              height: 20,
            ),
            SizedBox(
             // width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(20),
                    backgroundColor:  Colors.blueGrey ,
                    
                  ),
                  child: const Text( 'Edit Profile',style: TextStyle(color: Colors.black),)
                  ),

            )
          ],
        ),
      ),
    );
  }
}


itemProfile(String title, String subtitle, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                offset: Offset(0, 4),
                color: Colors.blueGrey,
                spreadRadius: 2,
                blurRadius: 6)
          ]),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
       
        tileColor: Colors.white,
      ),
    );
  }
