import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:petween/model/db.dart';
import 'package:petween/mainpages/nyanggaebu/nyanggaebu.dart';

String _boughtproduct = null;
List<DropdownMenuItem<String>> dropboughtyear = [];
List<DropdownMenuItem<String>> dropboughtmonth = [];
List<DropdownMenuItem<String>> dropproductkind = [];



class ExpenseListPage extends StatefulWidget {
  @override
  _ExpenseListPageState createState() => new _ExpenseListPageState();
}

class _ExpenseListPageState extends State<ExpenseListPage> {


  void loadData() {
    dropproductkind = [];

    dropproductkind.add(DropdownMenuItem<String>(
      child: Text('사료'),
      value: "사료",
    ));
    dropproductkind.add(DropdownMenuItem<String>(
      child: Text('장난감'),
      value: "장난감",
    ));
    dropproductkind.add(DropdownMenuItem<String>(
      child: Text('캣타워'),
      value: "캣타워",
    ));
    dropproductkind.add(DropdownMenuItem<String>(
      child: Text('간식'),
      value: "간식",
    ));
    dropproductkind.add(DropdownMenuItem<String>(
      child: Text('스크래쳐'),
      value: "스크래쳐",
    ));
    dropproductkind.add(DropdownMenuItem<String>(
      child: Text('이동장'),
      value: "이동장",
    ));
    dropproductkind.add(DropdownMenuItem<String>(
      child: Text('모래'),
      value: "모래",
    ));
  }

  @override
  void initState() {


    loadData();
  }


  @override
  Widget build(BuildContext context) {

    return Stack(children: <Widget>[
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 50.0),
                child: Text('구입품 종류'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: DropdownButton(
                  value: _boughtproduct,
                  items: dropproductkind,
                  hint: Text('종류'),
                  onChanged: (value3) {
                    setState(() {
                      _boughtproduct = value3;
                    });
                  },
                ),
              ),
            ],
          ),
          Container(
            height: 1.5,
            color: Color(0xFFD8D8D8),
          ),
          Expanded(
            child: StreamBuilder(
                stream: Firestore.instance.collection('information').document(curUID)
                    .collection('nyanggaebu').where('isbought',isEqualTo: true).snapshots(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if(snapshot.data != null){
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (context, i) => _buildTile(context, snapshot.data.documents[i])
                      );

                  }else{
                    return Container(
                        child: Center(
                          child: Text("Loading.."),
                        ));
                  }
                }),
          ),
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            color: Color(0xFFFFDF7E),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    '총 지출액',
                    style: TextStyle(
                      color: Color(0xFFFF5A5A),
                    ),
                  ),
                  Text('10000 원'),
                ],
              ),
            ),
          ),
        ],
      ),
    ]);
  }
}

Widget _buildTile(BuildContext context, DocumentSnapshot data){
  final record = nyanggaebu.fromSnapshot(data);
  return Column(
    children: <Widget>[
    ListTile(
      title:Row(
        children: <Widget>[
          Text(record.productkind),
          Text(record.productname),
          Text(record.productprice),

        ],
      ),


    ),
    Divider(
      height: 10.0,
    ),],
  );

}