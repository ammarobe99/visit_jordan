import 'package:flutter/material.dart';
import 'package:visit_jordan/Screens/home.dart';
import 'package:visit_jordan/Screens/central.dart';
import 'package:visit_jordan/Screens/north.dart';
import 'package:visit_jordan/Screens/video.dart';



class tobTabPar extends StatefulWidget {
  const tobTabPar({super.key});

  @override
  State<tobTabPar> createState() => _tobTabParState();
}

class _tobTabParState extends State<tobTabPar>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
       PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Container(
          child: TabBar(
              indicator:
                  UnderlineTabIndicator(borderSide: BorderSide(width: 0)),
              controller: _tabController,
              tabs: <Widget>[
                Tab(
                  text: (" most popular places" ),
                ),
                Tab(
                  text: ("video"),
                ),
               
                
              ]),
        ),
      ),
      body: TabBarView(controller: _tabController, children: <Widget>[
        
        MyGestureDetector(),
        VideoPlayerWidget()
       
      ]),
    );
  }
}
