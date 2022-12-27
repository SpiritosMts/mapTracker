import 'package:map/Models/user.dart';
import 'package:map/Models/navigation_item.dart';
import 'package:map/Screens/login/login.dart';
import 'package:map/provider/navigation_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


import 'package:provider/provider.dart';

import '../page/deconnection_page.dart';

class NavigationDrawerWidget extends StatefulWidget {
  static final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  State<NavigationDrawerWidget> createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  Widget buildMenuItem(
      BuildContext context, {
        required NavigationItem item,
        required String text,
      }) {
    final provider = Provider.of<NavigationProvider>(context);
    final currentItem = provider.navigationItem;
    final isSelected = item == currentItem;

    final color = isSelected ? Colors.orangeAccent : Colors.white;

    return Material(
      color: Colors.transparent,
      child: ListTile(
        selected: isSelected,
        selectedTileColor: Colors.white24,
        title: Text(text, style: TextStyle(color: color, fontSize: 16)),
        onTap: () => selectItem(context, item),
      ),
    );
  }

  void selectItem(BuildContext context, NavigationItem item) {
    final provider = Provider.of<NavigationProvider>(context, listen: false);
    provider.setNavigationItem(item);
  }

  Widget buildHeader(
      BuildContext context, {
        required String urlImage,
        required String name,
        required String email,
      }) =>
      Material(
        color: Colors.transparent,
        child: InkWell(
          //onTap: () => selectItem(context, NavigationItem.header),
          child: Container(
            padding: NavigationDrawerWidget.padding.add(EdgeInsets.symmetric(vertical: 40)),
            child: Row(
              children: [
                CircleAvatar(
                    radius: 30, backgroundImage: NetworkImage(urlImage)),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      email,
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ],
                ),
                Spacer(),
                CircleAvatar(
                  radius: 24,
                  backgroundColor: Color.fromRGBO(30, 60, 168, 1),
                  child: Icon(Icons.add_comment_outlined, color: Colors.white),
                )
              ],
            ),
          ),
        ),
      );
  AppUser currUser = AppUser();

  @override
  void initState() {
    super.initState();
    /// get curr user from provider
    final provider = Provider.of<NavigationProviderUser>(context,listen: false);
    currUser = provider.user;
  }

  @override
  Widget build(BuildContext context) => Drawer(
        child: Container(
          color: Color.fromRGBO(50, 55, 205, 1),
          child: ListView(
            children: <Widget>[
              buildHeader(
                context,
                urlImage: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgSmojUgwjIB87c4Q0hLCAyl__oiTySWGWJUZtUNHlHjBALLzTsu_vMHYMaEwLts4QEoo&usqp=CAU',
                name: currUser.name,
                email: currUser.email!,
              ),
              Container(
                padding: NavigationDrawerWidget.padding,
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    buildMenuItem(
                      context,
                      item: NavigationItem.Acceuil,
                      text: 'Acceuil',
                    ),
                    const SizedBox(height: 24),
                    buildMenuItem(
                      context,
                      item: NavigationItem.Mes_depanneurs,
                      text: 'Historique',
                    ),
                    const SizedBox(height: 16),
                    buildMenuItem(
                      context,
                      item: NavigationItem.Mes_voitures,
                      text:currUser.isChan == 'false' ? 'Mes voitures ':'Mes camions',
                    ),
                    const SizedBox(height: 16),
                    buildMenuItem(
                      context,
                      item: NavigationItem.Mot_de_passe,
                      text: 'Mot_de_passe',
                    ),
                    const SizedBox(height: 16),
                    buildMenuItem(
                      context,
                      item: NavigationItem.Parametre,
                      text: 'Paramètres',
                    ),
                    const SizedBox(height: 24),
                    Divider(color: Colors.white70),
                    const SizedBox(height: 24),
                    buildMenuItem(
                      context,
                      item: NavigationItem.aide,
                      text: 'Aide',
                    ),
                    const SizedBox(height: 16),
                    Material(
                      color: Colors.transparent,
                      child: ListTile(
                        //selected: isSelected,
                        selectedTileColor: Colors.white24,
                        title: Text('Deconnection', style: TextStyle(color: Colors.white, fontSize: 16)),
                        onTap: () {
                          FirebaseAuth.instance.signOut();
                          Navigator.pushReplacement(
                              context, MaterialPageRoute(builder: (context) => LoginScreen()));
                        }
                      ),
                    ),
                    // buildMenuItem(
                    //   context,
                    //   item: NavigationItem.deconnection,
                    //   text: 'Deconnection',
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
