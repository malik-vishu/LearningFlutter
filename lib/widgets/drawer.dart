import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.blue,
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                  accountName: Text("Vishu"),
                  accountEmail: Text("vishuxx@gmail.com"), //fake id
                  //currentAccountPicture: CircleAvatar(backgroundImage: NetworkImage(url),),
                )),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.white,
              ),
              title: Text("Home",
                  style: TextStyle(
                    color: Colors.white,
                  )),
            ),
            ListTile(
              leading: Icon(
                Icons.mail,
                color: Colors.white,
              ),
              title: Text("vishuxxx@gmail.com",
                  style: TextStyle(
                    color: Colors.white,
                  )), //fake id
            ),
            ListTile(
              leading: Icon(
                Icons.numbers,
                color: Colors.white,
              ),
              title: Text("3254254252",
                  style: TextStyle(
                    color: Colors.white,
                  )), //fake number
            )
          ],
        ),
      ),
    );
  }
}
