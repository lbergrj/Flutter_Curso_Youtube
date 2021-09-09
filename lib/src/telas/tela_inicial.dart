import 'package:flutter/material.dart';
import 'package:youtube/src/telas/biblioteca.dart';
import 'package:youtube/src/telas/em_alta.dart';
import 'package:youtube/src/telas/inscricao.dart';
import 'package:youtube/widgets/custom_serch_delegate.dart';

import 'inicio.dart';

class Interface extends StatefulWidget {
  @override
  _InterfaceState createState() => _InterfaceState();
}

class _InterfaceState extends State<Interface> {
  int _indiceAtual = 0;
  String _resultado = "";
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<Widget> telas = [

      Inicio(_resultado),
      EmAlta(),
      Inscricao(),
      Biblioteca(),
    ];
    return Scaffold(
      appBar: AppBar(

        iconTheme: IconThemeData(
          color: Colors.grey,
        ),
        backgroundColor: Colors.white,
        title: Row (
          children: <Widget>[
            Image.asset("lib/images/mengo2.png",
              width: 100,
              height: 25,
            ),
            Text("  Mengão Tube",
              style: TextStyle(
                fontSize: 20,
                color: Colors.red,
              ),
            ),
          ],
        ),
        actions: <Widget>[

          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              //TextEditingController controller = TextEditingController();
               String res = await showSearch(context: context,
                   delegate: CustomSearchDelegate(controller));
               setState(() {
                 _resultado = res;
               });
               print ("Resultado $res");
              },
          ),


          /*
          IconButton(
              icon: Icon(Icons.videocam),
              onPressed: (){},
          ),

          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: (){},
          ),
           */
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[_indiceAtual],

      ),
      bottomNavigationBar: BottomNavigationBar (
        currentIndex: _indiceAtual,
        onTap: (indice){
            setState(() {
              _indiceAtual = indice;
            });
        },
        //type: BottomNavigationBarType.shifting,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.red,
            title: Text("Início"),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text("Em alta"),
            backgroundColor: Colors.orange,
            icon: Icon(Icons.whatshot),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            title: Text("Inscrição"),
            icon: Icon(Icons.subscriptions),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.green,
            title: Text("Biblioteca"),
            icon: Icon(Icons.folder),
          ),
        ],
      ),

    );
  }
}

