import 'dart:convert';
import 'package:http/http.dart' as http;

class AnimeData {

  Future getAnimeData(String s) async {

    http.Response response = await http.get(Uri.parse(s));
    var data = response.body;

    if(response.statusCode == 200){

      return jsonDecode(data);
    }
    else{
      print('Error');
      return('fail hogya');
    }
  }
}