import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visit_jordan/Screens/convertCurrency_screen.dart';
import 'package:visit_jordan/Screens/home.dart';

import 'package:visit_jordan/Screens/login_screen.dart';

import 'package:visit_jordan/Screens/wetharsecreen.dart';

import 'package:visit_jordan/testguides.dart';
import 'package:visit_jordan/widgets/drawer.dart';

import 'chat/chat_screen.dart';
import 'home-components/tobtabbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          child: DefaultTextStyle(
            style: GoogleFonts.dangrek(
                textStyle: Theme.of(context).textTheme.displayMedium,
                fontSize: 32),
            child: Text("Visit Jordan"),
          ),
        ),
        actions: [
        
        ],
       
      ),
      body: TabBarView(controller: _tabController, children: <Widget>[
        
        tobTabPar(),
        ChatScreen(),
        wethar_secreen(),
        
        convertCurrency()
      ]),
      bottomNavigationBar: Container(
        child: TabBar(
            indicator: UnderlineTabIndicator(borderSide: BorderSide(width: 0)),
            controller: _tabController,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.other_houses),
                text: "Home",
              ),
              Tab(
                icon: Icon(Icons.chat),
                text: "Chating room",
              ),
              Tab(
                icon: Icon(Icons.sunny),
                text: "wethar",
              ),
              Tab(
                icon: Icon(
                  Icons.currency_exchange,
                ),
                text: "Currency",
              )
            ]),
      ),
    );
  }
}
