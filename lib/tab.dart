import 'package:flutter/material.dart';
import 'package:petween/mainpages/home.dart';
import 'package:petween/setting/setting.dart';
import 'package:petween/mainpages/addboard.dart';
import 'package:petween/mainpages/nyanggaebu/nyanggaebu.dart';
import 'package:petween/mainpages/nyangsta.dart';
import 'package:petween/mainpages/qna.dart';



GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();
enum TabItem { info, event, home, yasick, schedule }

class TabHelper {
  static Widget item({int index}) {
    switch (index) {
      case 0:
        return AddBoardPage();
      case 1:
        return  NyangStaPage();
      case 2:
        return  HomePage();
      case 3:
        return  NyangGaeBuPage();
      case 4:
        return  QNAPage();
    }

    return SettingPage();
  }

  static String description(TabItem tabItem) {
    switch (tabItem) {
      case TabItem.home:
        return '추가';
      case TabItem.info:
        return '냥스타';
      case TabItem.event:
        return '홈';
      case TabItem.yasick:
        return '냥계부';
      case TabItem.schedule:
        return 'Q&A';
    }

    return '';
  }

  static Icon icon(TabItem tabItem, bool isActive) {
    double _iconSize = 35;

    switch (tabItem) {
      case TabItem.home:
        return Icon(Icons.add_circle_outline);
      case TabItem.info:
        return Icon(Icons.camera_enhance);
      case TabItem.event:
        return Icon(Icons.home);
      case TabItem.yasick:
        return Icon(Icons.calendar_today);
      case TabItem.schedule:
        return Icon(Icons.chat_bubble_outline);
    }
    return Icon(Icons.add_circle_outline);
  }
}

class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int _selectedTab = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor:Color(0xFFFFDF7E)),
        child:BottomNavigationBar(
        currentIndex: _selectedTab,
        type: BottomNavigationBarType.fixed,
        items: [
          _buildItem(tabItem: TabItem.home),
          _buildItem(tabItem: TabItem.info),
          _buildItem(tabItem: TabItem.event),
          _buildItem(tabItem: TabItem.yasick),
          _buildItem(tabItem: TabItem.schedule),
        ],
        fixedColor: Color(0xFFFF5A5A),
        onTap: (index) {
          setState(() {
            _selectedTab = index;
          });
        },
      ),),
      body: TabHelper.item(index: _selectedTab),
    );
  }

  BottomNavigationBarItem _buildItem({TabItem tabItem}) {
    String text = TabHelper.description(tabItem);

    return BottomNavigationBarItem(
        icon: TabHelper.icon(tabItem, false),
        activeIcon: TabHelper.icon(tabItem, true),
        title: Text(text));
  }
}
