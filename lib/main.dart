import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_porsche_car/style.dart';
import 'package:flutter_porsche_car/data/porsche_data.dart';
import 'package:flutter_porsche_car/ui/detail_car.dart';
import 'package:flutter_porsche_car/ui/author.dart';
import 'style.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_porsche_car/models/porsche_car_model_type.dart';
import 'constants.dart';

void main () {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Porsche Car',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.light(),
        fontFamily: 'Poppins'
      ),
      color: primaryColor,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home', style: appBarTextStyle),
          centerTitle: true,
          backgroundColor: primaryColor,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.info),
              color: whiteColor,
              splashColor: primaryColor,
              highlightColor: primaryColor,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AuthorScreen();
                }));
              },
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                ClipPath(
                  clipper: MyClipper(),
                  child: Container(
                    padding: EdgeInsets.all(12.0),
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Colors.red,
                          primaryColor
                        ],
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Expanded(
                          child: Stack(
                            children: <Widget>[
                              Image.asset("assets/images/porsche-logo.png",
                                width: MediaQuery.of(context).size.width * 0.35,
                                fit: BoxFit.fitWidth,
                                alignment: Alignment.topCenter,
                              ),
                              Positioned(
                                top: 20,
                                left: 150,
                                child: Text("Porsche Car", style: subHeadingTextStyle),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                ModelDropDown(),
                Container(
                  height: MediaQuery.of(context).size.height * 0.65,
                  child:  ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: porsceCarList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        elevation: 5,
                        margin: EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Center(child: Image.network(porsceCarList[index].image)),
                            Center(child: Text(porsceCarList[index].name, style: cardTitleTextStyle)),
                            SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Icon(Icons.local_gas_station, color: primaryColor),
                                    SizedBox(height: 8.0),
                                    Text(porsceCarList[index].fuel, style: cardSubTitleTextStyle)
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Icon(Icons.airline_seat_recline_extra, color: primaryColor),
                                    SizedBox(height: 8.0),
                                    Text("${porsceCarList[index].seats.toInt()} persons", style: cardSubTitleTextStyle)
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Icon(Icons.av_timer, color: primaryColor),
                                    SizedBox(height: 8.0),
                                    Text("${porsceCarList[index].topSpeed.toInt()} km/h", style: cardSubTitleTextStyle)
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                              child: RaisedButton(
                                color: primaryColor,
                                splashColor: whiteColor,
                                child: Text('Detail', style: TextStyle(color: whiteColor, fontSize: 16.0)),
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                                    return DetailCarScreen(car: porsceCarList[index]);
                                  }));
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0)
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  )
                ),
              ],
            ),
          ),
        )
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class ModelDropDown extends StatefulWidget {
  @override
  _ModelDropDownState createState() => _ModelDropDownState();
}

class _ModelDropDownState extends State<ModelDropDown> {

  String dropdownValue = '718';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: Color(0xFFE5E5E5),
        ),
      ),
      child: Row(
        children: <Widget>[
          SizedBox(width: 20),
          Expanded(
            child: DropdownButton(
              isExpanded: true,
              underline: SizedBox(),
              value: dropdownValue.toString(),
              items: [
                '718',
                '911',
                'Cayenne',
                'Macan',
                'Panamera'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  this.dropdownValue = value;
                  fetchData(2);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

Future<PorscheCarModelType> fetchData(int id_model) async {
  final response = await http.get('${PORSCHE_API}/car/all/model/type?id=${id_model}');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return PorscheCarModelType.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }

}