import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BelajarAppBar(),
    );
  }
}

class BelajarAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("Belajar Silver AppBar",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                      )),
                  background: Image(
                    image: AssetImage('assets/images/ms.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    labelColor: Colors.black87,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      new Tab(icon: new Icon(Icons.audiotrack), text: "Songs"),
                      new Tab(icon: new Icon(Icons.collections), text: "Gallery"),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: <Widget>[
              Songs(),
              Gallery(),
            ],
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
      color: Colors.white,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

class Songs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.audiotrack),
            title: Text("Tentang Rasa - Anji"),
          ),
          ListTile(
            leading: Icon(Icons.audiotrack),
            title: Text("Dia - Anji"),
          ),
          ListTile(
            leading: Icon(Icons.audiotrack),
            title: Text("Bidadari Tak Bersayap - Anji"),
          ),
          ListTile(
            leading: Icon(Icons.audiotrack),
            title: Text("Indonesia Berpesta - Anji"),
          ),
          ListTile(
            leading: Icon(Icons.audiotrack),
            title: Text("Sudah Jangan Bertengkar - Anji"),
          ),
          ListTile(
            leading: Icon(Icons.audiotrack),
            title: Text("Dengan Sebab Sederhana - Anji"),
          ),
          ListTile(
            leading: Icon(Icons.audiotrack),
            title: Text("Kekasih Terhebat - Anji"),
          ),
          ListTile(
            leading: Icon(Icons.audiotrack),
            title: Text("Berhenti Dikamu - Anji"),
          ),
          ListTile(
            leading: Icon(Icons.audiotrack),
            title: Text("Ternyata Cinta - Anji"),
          ),
          ListTile(
            leading: Icon(Icons.audiotrack),
            title: Text("Luar Biasa - Anji"),
          ),
        ],
      ),
    );
  }
}

class Gallery extends StatelessWidget {
  final List images = [
    "assets/images/tentangrasa.jpg",
    "assets/images/dia.jpg",
    "assets/images/bidadari.jpg",
    "assets/images/indonesia.jpg",
    "assets/images/sudah.jpg",
    "assets/images/Sederhana.jpg",
    "assets/images/kekasih.jpg",
    "assets/images/berhenti.jpg",
    "assets/images/ternyata.jpg",
    "assets/images/luar.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          if (index > 0) {
            return Padding(
              padding: const EdgeInsets.all(3.0),
              child: Image.asset(images[index % 15]),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image.asset(images[index]),
            );
          }
        },
      ),
    );
  }
}
