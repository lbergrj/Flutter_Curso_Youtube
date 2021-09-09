import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String>{
  final TextEditingController controller;

  CustomSearchDelegate(this.controller);



  //Retorna uma lista de widget
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: (){
          query = "";
        },
      ),
      IconButton(
        icon: Icon(Icons.done),
        onPressed: (){
          close(context, query);
          return Container();
        },
      ),
    ];
  }

  //Retorna somente um widget
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
        onPressed: (){
        close(context, "");
        },
      );
    }

  @override
  Widget buildResults(BuildContext context) {
    close(context, query);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> lista = List();
    if(query.isNotEmpty){
      lista= [
        "Gols", "Mister", "Bruno Henrique", "Jogos", "Titulos", "Gabi Gol",
        "Campeonato Carioca", "Campeonato Brasileiro", "Copa do Brasil",
        "Zico", "Maracana", "Artilheiro", "Rafinha", "Jerson", "Torcida",
        "Ingressos", "Diego", "Arrascaeta", "Arão", "Hino", "Rodrigo Caio",

      ].where(
          (texto) => texto.toLowerCase().startsWith(query.toLowerCase())
      ).toList();

      return ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, index){
          return ListTile(
            onTap: (){
              close(context,lista[index]);
            },
            title: Text(lista[index]),
          );
        },
      );
    }
    else {
      return Center(
        child: Text("Nenhum resultado para pesquisa"),
      );
    }

  }


}