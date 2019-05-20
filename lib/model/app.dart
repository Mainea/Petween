import 'package:flutter/material.dart';
import 'package:petween/login/pre_login.dart';
import 'package:petween/login/login.dart';
import 'package:petween/pet_create_and_show//profile_create.dart';
import 'package:petween/setting/setting.dart';
import 'package:petween/login/signin.dart';
import 'package:petween/mainpages/home.dart';
import 'package:petween/tab.dart';
import 'package:petween/mainpages/addboard.dart';
import 'package:petween/mainpages/nyanggaebu.dart';
import 'package:petween/mainpages/nyangsta.dart';
import 'package:petween/mainpages/qna.dart';
import 'package:petween/pet_create_and_show/addpet.dart';
import 'package:petween/pet_create_and_show/profile_edit.dart';
class PetweenApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shrine',
      home: PreloginPage(),
      //initialRoute: '/login',
      // onGenerateRoute: _getRoute,
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => LoginPage(),
        '/catchoice': (BuildContext context) => ProfileCreatePage(),
        '/setting': (BuildContext context) => SettingPage(),
        '/signin' : (BuildContext context) => SignInPage(),
        '/addpet' : (BuildContext context) => AddPetPage(),
        '/home' : (BuildContext context) => HomePage(),
        '/tab' : (BuildContext context) => TabPage(),
        '/addboard' : (BuildContext context) => AddBoardPage(),
        '/nyanggaebu' : (BuildContext context) => NyangGaeBuPage(),
        '/qna' : (BuildContext context) => QNAPage(),
        '/nyangsta' : (BuildContext context) => NyangStaPage(),
        '/edit' : (BuildContext context) => ProfileEditPage(),
      },
    );
  }
}
