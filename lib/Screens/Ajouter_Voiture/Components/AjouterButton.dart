import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:map/Screens/Home/Home.dart';

class Ajouter extends StatefulWidget {
  const Ajouter({Key? key}) : super(key: key);

  @override
  State<Ajouter> createState() => _AjouterState();
}

class _AjouterState extends State<Ajouter> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: RaisedButton(
        onPressed: () => {
          Fluttertoast.showToast(
              msg: "Ajout Avec Succes",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.blue,
              textColor: Colors.white,
              fontSize: 16.0),
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MainPage()))
        },
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
        textColor: Colors.white,
        padding: const EdgeInsets.all(0),
        child: Container(
          alignment: Alignment.center,
          height: 50.0,
          width: size.width * 0.5,
          decoration: new BoxDecoration(
            borderRadius: BorderRadius.circular(80.0),
            color: Colors.black,
          ),
          padding: const EdgeInsets.all(0),
          child: Text(
            "Ajouter",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
