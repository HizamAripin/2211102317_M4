import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profil Saya',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;
  final PageController pageController = PageController();

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        children: const [
          Center(child: Text('Nama: Hizam Aripin', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
          Center(child: Text('NIM: 2211102317', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
          Center(child: Text('Warna Favorit: Biru', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue))),
          Center(child: Text('Hobi: Sepak Bola, Futsal', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
          Center(child: Text('Asal Daerah: Brebes', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Nama'),
          BottomNavigationBarItem(icon: Icon(Icons.badge), label: 'NIM'),
          BottomNavigationBarItem(icon: Icon(Icons.color_lens), label: 'Warna Favorit'),
          BottomNavigationBarItem(icon: Icon(Icons.sports_soccer), label: 'Hobi'),
          BottomNavigationBarItem(icon: Icon(Icons.location_city), label: 'Asal Daerah'),
        ],
      ),
    );
  }
}
