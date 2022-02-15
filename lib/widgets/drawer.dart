import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/mystyles.dart';
import '';

class MyDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                      color: Colors.purple
                  ),
                margin: EdgeInsets.zero,
                accountName: Text("Nouman Karim", style: MyStyles.whiteHeadingText),
                accountEmail: Text("noumi92@hotmail.com", style: MyStyles.whiteRegularText),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/me.png"),
                )
            )
            ),
            ListTile(
              leading: Icon(CupertinoIcons.home, color: Colors.white),
              title: Text("Home", style: MyStyles.whiteHeadingText,),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.profile_circled, color: Colors.white),
              title: Text("Profile", style: MyStyles.whiteHeadingText,),
            ),
          ],
        ),
      ),
    );
  }

}