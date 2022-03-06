// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sanjaymart/Screen/Basket/MyBasketPage.dart';
import 'package:sanjaymart/Screen/Home/Home.dart';
import 'package:sanjaymart/Screen/MyOders/MyListPage.dart';
import 'package:sanjaymart/Screen/Search/SearchPage.dart';

import 'Categories/CategoryPage.dart';


class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<LandingPage> {
  
  int _selectedIndex = 0;
  bool isLoading = true;
  
  final List<Widget> _widgetOption = [
    HomePage(),
    CategoriesPage(),
    SearchPage(),
    MyOrders(),
    MyBasket()
  ];

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {

    

    setState(() {
      isLoading = false;
    });
  
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : _widgetOption.elementAt(_selectedIndex),
      bottomNavigationBar: bottomNav(),
      // bottomNavigationBar: bottomNav(),
    );
  }

  Widget bottomNav() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon:ImageIcon(
               AssetImage("./assets/home.png"),
               ),
          label: "Home",
        ),
        BottomNavigationBarItem(
            icon: ImageIcon(
               AssetImage("./assets/category.png"),
               ), label: "Categories"),
        BottomNavigationBarItem(
          icon: ImageIcon(
               AssetImage("./assets/search.png"),
               ),
          label: "Search",
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
               AssetImage("./assets/mylist.png"),
               ),
          label: "My List",
        ),
         BottomNavigationBarItem(
          icon: ImageIcon(
               AssetImage("./assets/cart.png"),
               ),
          label: "Basket",
        ),
       
      ],
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.green.shade200,
    
      currentIndex: _selectedIndex,
      iconSize: 30,
      onTap: _onItemTapped,
      elevation: 5,
    );
  }
}