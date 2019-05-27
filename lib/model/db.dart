import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';

String userUID;
String userEmail;
FirebaseUser user;
File image;

List<String> kindCat = ['노르웨이숲고양이','데본렉스','라가머핀','리팜','랙돌','러시안블루','맹크스고양이','메인쿤','발리네즈','버만','버마즈','봄베이','시베리아고양이','샴고양이','셀커크렉스','소말리','스코티시폴드','스핑크스','싱갸퓨라','아메리칸밤테일'];

class db {
  String userName;
  String email;
  String birthyear;
  String birthmonth;
  String birthday;
  String meetyear;
  String meetmonth;
  String meetday;
  String gender;
  String kind;
  String uid;
  String nickname;
  String petname;
  String informationID;
  String currentTime;
  String isCommand;
  String url;
  final DocumentReference reference;

  db.fromMap(Map<String, dynamic> map, String docID, {this.reference})
      : assert(map['petname'] != null),
        assert(map['nickname'] != null),
        birthday = map['birthday'],
        birthmonth = map['birthmonth'],
        birthyear = map['birthyear'],
        meetyear = map['meetyear'],
        meetmonth = map['meetmonth'],
        meetday = map['meetday'],
        gender = map['gender'],
        kind = map['kind'],
        nickname = map['nickname'],
        petname = map['petname'],
        uid = map['uid'],
        informationID = map['informationID'],
        currentTime = map['currentTime'],
        isCommand = map['isCommand'],
        url = map['url'];
  db.fromSnapshot(DocumentSnapshot snapshot)
      :this.fromMap(snapshot.data, snapshot.documentID, reference: snapshot.reference);

  @override
  String toString() => "db<$userName:$email:$gender:$kind:$nickname:$petname:$uid:$informationID:$currentTime:$isCommand:$url>";

}