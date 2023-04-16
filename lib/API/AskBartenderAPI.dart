//http ライブラリを import する
import 'package:http/http.dart' as http;
//json ライブラリを import する
import 'dart:convert';

class AskBartenderAPI {
  Future<String> askBartender(String question) async {
    //https://us-central1-ai-product-27245.cloudfunctions.net/api/ask_bartender に post でリクエストして、レスポンスを受け取る
    final response = await http.post(
        Uri.parse(
            'https://us-central1-ai-product-27245.cloudfunctions.net/api/ask_bertender'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'prompt': question,
        }));

    return response.body;
  }
}