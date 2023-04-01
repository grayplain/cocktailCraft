//http ライブラリを import する
import 'package:http/http.dart' as http;
//json ライブラリを import する
import 'dart:convert';

//https://us-central1-ai-product-27245.cloudfunctions.net/api/timestamp に get でリクエストして、レスポンスを受け取る
// レスポンスは、{"timestamp":1680351256026} のような JSON 形式で返ってくる
// この JSON 形式のデータを Map に変換する
// Map に変換したデータから、timestamp の値を取り出す
// 取り出した timestamp の値を、DateTime に変換する
// DateTime に変換したデータを、String に変換する
// String に変換したデータを、return する

class TimestampAPI {
  Future<String> getTimestamp() async {
    //https://us-central1-ai-product-27245.cloudfunctions.net/api/timestamp に get でリクエストして、レスポンスを受け取る
    final response = await http.get(Uri.parse(
        'https://us-central1-ai-product-27245.cloudfunctions.net/api/timestamp'));

    //レスポンスは、{"timestamp":1680351256026} のような JSON 形式で返ってくる
    //この JSON 形式のデータを Map に変換する
    final Map<String, dynamic> map = json.decode(response.body);

    //Map に変換したデータから、timestamp の値を取り出す
    final int timestamp = map['timestamp'];

    //取り出した timestamp の値を、DateTime に変換する
    final DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);

    //DateTime に変換したデータを、String に変換する
    final String timestampString = dateTime.toString();

    //String に変換したデータを、return する
    return timestampString;
  }
}
