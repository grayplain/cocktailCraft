import 'package:booy/View/CockTailList.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    CockTailList(key: UniqueKey(), isFavorite: false),
    CockTailList(key: UniqueKey(), isFavorite: true),
    Text('バーテンダー'),
    Text('設定'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Flutter BottomNavigationBar'),
      // ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.circle),
            label: 'カクテル',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.circle),
            label: 'お気に入り',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.circle),
            label: 'バーテンダー',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.circle),
            label: '設定',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
