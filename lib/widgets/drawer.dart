import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/mystyles.dart';

class MyDrawer extends StatelessWidget{
  const MyDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          children: [
            const DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: Text("Nouman Karim", style: MyStyles.whiteHeadingText),
                accountEmail: Text("noumi92@hotmail.com", style: MyStyles.whiteRegularText),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/me.png"),
                )
            )
            ),
            const ListTile(
              leading: Icon(CupertinoIcons.home, color: Colors.white),
              title: Text("Home", style: MyStyles.whiteHeadingText,),
            ),
            const ListTile(
              leading: Icon(CupertinoIcons.profile_circled, color: Colors.white),
              title: Text("Profile", style: MyStyles.whiteHeadingText,),
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.clear_thick, color: Colors.white),
              title: const Text("Close", style: MyStyles.whiteHeadingText),
              onTap: () {Navigator.pop(context);},
            ),
          ],
        ),
      ),
    );
  }

}