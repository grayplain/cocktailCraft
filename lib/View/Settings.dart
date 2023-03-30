//必要なライブラリを import する
import 'package:flutter/material.dart';

/*各種設定内容を表示する画面
  各設定項目は、ListView で表示する
  各項目の一覧
  1. アプリのバージョン情報
  2. ライセンス情報
  3. プライバシーポリシー
  4. お気に入りを全て削除する
*/

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

//_SettingState クラスを定義する
class _SettingsState extends State<Settings> {
  //各項目の一覧を表示する ListView を作成する
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('設定'),
      ),
      body: ListView(
        children: [
          //アプリのバージョン情報を表示する
          ListTile(
            title: Text('アプリのバージョン情報' + '1.0.0'),
          ),
          //ライセンス情報を表示する
          ListTile(
            title: Text('ライセンス情報'),
            onTap: () {
              //ライセンス情報を表示する画面に遷移する
              Navigator.pushNamed(context, '/license');
            },
          ),
          //プライバシーポリシーを表示する
          ListTile(
            title: Text('プライバシーポリシー'),
            onTap: () {
              //プライバシーポリシーを表示する画面に遷移する
              Navigator.pushNamed(context, '/privacy');
            },
          ),
          //お気に入りを全て削除する
          ListTile(
            title: Text('お気に入りを全て削除する'),
            onTap: () {
              //お気に入りを全て削除する画面に遷移する
              Navigator.pushNamed(context, '/delete');
            },
          ),
        ],
      ),
    );
  }
}
