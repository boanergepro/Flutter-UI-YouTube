import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryIconTheme: IconThemeData(
          color: Colors.red
        ),
        primarySwatch: Colors.red,
        bottomAppBarColor: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  List<List> listVideos = [
    [
      "https://i.ytimg.com/vi/t7MbbHx4Y6o/maxresdefault.jpg",
      "COMO USAR YOTUBE MEPO PRO GAME",
      "PJ Mask Official",
      "1.6 K vistas",
      "Hace 1 semana",
      "assets/images/avatar-4.jpg"
    ],
    [
      "https://i.ytimg.com/vi/mpC-BibQeUI/maxresdefault.jpg",
      "SUPER CARRIER",
      "Smashdota",
      "94 K vistas",
      "Hace 24 meses",
      "assets/images/avatar-3.jpg"
    ],
    [
      "https://i.ytimg.com/vi/2PVHzuuN9Ww/maxresdefault.jpg",
      "Flutter Google Maps",
      "Raja Yogan",
      "473 vistas",
      "Hace 18 horas",
      "assets/images/avatar-1.jpg"
    ],
  ];
  static List<BottomNavigationBarItem> _itemsNavigationBar = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home, color: Colors.red),
      title: Text('Inicio', style: TextStyle(
        color: Colors.red,
        fontSize: 10,
      )),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.apps, color: Colors.grey.shade700),
      title: Text('Tendencias', style: TextStyle(
        color: Colors.grey.shade700,
        fontSize: 10,
      )),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.video_library , color: Colors.grey.shade700),
      title: Text('Suscripciones', style: TextStyle(
        color: Colors.grey.shade700,
        fontSize: 10,
      )),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.email, color: Colors.grey.shade700),
      title: Text('Recibidos', style: TextStyle(
        color: Colors.grey.shade700,
        fontSize: 10,
      )),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.folder, color: Colors.grey.shade700),
      title: Text('Biblioteca', style: TextStyle(
        color: Colors.grey.shade700,
        fontSize: 10,
      )),
    ),
  ];
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: Image.asset('assets/images/icon-youtube.png', height: 200, width: 100,),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.cast),
            color: Colors.grey.shade500,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.videocam),
            color: Colors.grey,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.grey,
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: ListView.builder(
          itemCount: listVideos.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 10,),
                  child: Image.network(listVideos[index][0]),
                ),
                ListTile(
                  leading: Hero(
                    tag: listVideos[index][5],
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(62.5),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(listVideos[index][5])
                        )
                      ),
                    ),
                  ),
                  title: Text(listVideos[index][1]),
                  subtitle: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(listVideos[index][2]),
                          Text(" - "),
                          Text(listVideos[index][3])
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(listVideos[index][4])
                        ],
                      )
                    ],
                  ),
                  trailing: Icon(Icons.more_vert),
                )
              ],
            );
          }
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: _itemsNavigationBar,
        onTap: onTabTapped        
      ),
    );
  }
}
