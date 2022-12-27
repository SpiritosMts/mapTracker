import 'package:flutter/material.dart';
import 'package:map/Models/navigation_item.dart';
import 'package:map/page/Acceuil.dart';
import 'package:map/page/Mes_depanneurs_page.dart';
import 'package:map/page/Mes_voitures_page.dart';
import 'package:map/page/Mot_de_passe_page.dart';
import 'package:map/page/Parametre_page.dart';
import 'package:map/page/aide_page.dart';
import 'package:map/page/deconnection_page.dart';
import 'package:map/page/header_page.dart';
import 'package:map/provider/navigation_provider.dart';
import 'package:provider/provider.dart';




class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => buildPages();

  Widget buildPages() {
    final provider = Provider.of<NavigationProvider>(context);
    final navigationItem = provider.navigationItem;
    //final navigationItem = NavigationItem.Acceuil;

    switch (navigationItem) {
      case NavigationItem.header:
        return HeaderPage();
      case NavigationItem.Acceuil:
        return AcceuilPage();
      case NavigationItem.Mes_depanneurs:
        return Mes_depanneursPage();
      case NavigationItem.Mes_voitures:
        return Mes_voituresPage();
      case NavigationItem.Mot_de_passe:
        return Mot_de_passePage();
      case NavigationItem.Parametre:
        return ParametrePage();
      case NavigationItem.aide:
        return aidePage();
      case NavigationItem.deconnection:
        return DeconnectionPage();
    }
  }
}
