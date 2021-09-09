import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:youtube/src/models/video.dart';

const cheveYoutupeApi = "AIzaSyB6cIuAsAA_IPX1qqcraqpFlxpkBb827PU";
const idCanal = "UCVHFbqXqoYvEWM1Ddxl0QDg";
const idFlaTv = "UCOa-WaNwQaoyFHLCDk7qKIw";
const idAdrenaline = "UCGH4Wx-WL10iB4ZAdewkuDw";
const urlBase = "https://www.googleapis.com/youtube/v3/";

class Api{

  Future<List<Video>> pesquisar(String pesquisa)async{
    http.Response response = await http.get(
      urlBase + "search"
          "?part=snippet"
          "&type=video"
          "&maxResults=30"
          "&order=date"
          "&key=$cheveYoutupeApi"
          "&channelId=$idFlaTv"
          "&q=$pesquisa"
    );

    if(response.statusCode==200){
      Map<String,dynamic> dadosJson = json.decode(response.body);
      List<Video> videos = dadosJson["items"].map<Video>(
          (map){
            return Video.fromJson(map);
          }
      ).toList();
      return videos;

      /*
      Outro método usando for
      for(var video in dadosJson["items"]){
        print ("Resultado: " + video.toString());
      }
       */


    }
    else{
      print("Erro na pesquisa");
    }
  }

}