import 'package:flutter/material.dart';
import 'package:flutter_porsche_car/models/porsche_car_model.dart';
import 'package:flutter_porsche_car/style.dart';
import 'package:toast/toast.dart';

class DetailCarScreen extends StatelessWidget {

  final PorscheCarModel car;

  DetailCarScreen({@required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(car.name, style: appBarTextStyle),
        centerTitle: true,
        backgroundColor: primaryColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: whiteColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          FavoriteButton()
        ],
      ),
      body: CarContent(car: this.car),
    );
  }
}

class FavoriteButton extends StatefulWidget {

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon:  Icon(
        isFavorited ? Icons.favorite : Icons.favorite_border,
        color: whiteColor,
      ),
      onPressed: () {
        setState(() {
          isFavorited = !isFavorited;

          if(isFavorited) {
            showToast("Favorited", context);
          } else {
            showToast("UnFavorited", context);
          }
        });
      },
    );
  }
}

void showToast(String msg, BuildContext context) {
  Toast.show(msg, context, duration: 3, gravity: Toast.BOTTOM, backgroundColor: primaryColor, textColor: whiteColor);
}

class CarContent extends StatelessWidget {
  final PorscheCarModel car;
  String color;
  CarContent({@required this.car});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(car.image)),
                  SizedBox(height: 8.0),
                  Text(
                      car.name,
                      textAlign: TextAlign.center,
                      style: headingTextStyle
                  ),
                  SizedBox(height: 8.0),
                  Divider(
                    height: 8.0,
                    color: primaryColor,
                    thickness: 5.0,
                  ),
                  SizedBox(height: 8.0),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(car.model, style: detailCarBoldTextStyle),
                      SizedBox(height: 8.0),
                      Text('Model', style: detailCarTextStyle)
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(car.type, style: detailCarBoldTextStyle),
                      SizedBox(height: 8.0),
                      Text('Type', style: detailCarTextStyle)
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text("${car.seats.toInt()} Persons", style: detailCarBoldTextStyle),
                      SizedBox(height: 8.0),
                      Text('Seats', style: detailCarTextStyle)
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
                height: 32.0,
                child: Divider(
                  color: Colors.black,
                  height: 20,
                  thickness: 2,
                  indent: 70,
                  endIndent: 70,
            )),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text("${car.powerKW.toInt()} kw", style: detailCarBoldTextStyle),
                      SizedBox(height: 8.0),
                      Text('Power (kw)', style: detailCarTextStyle)
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text("${car.powerHP.toInt()} hp", style: detailCarBoldTextStyle),
                      SizedBox(height: 8.0),
                      Text('Power (hp)', style: detailCarTextStyle)
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text("${car.topSpeed.toInt()} km/h", style: detailCarBoldTextStyle),
                      SizedBox(height: 8.0),
                      Text('Top Speed', style: detailCarTextStyle)
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
                height: 32.0,
                child: Divider(
                  color: Colors.black,
                  height: 20,
                  thickness: 2,
                  indent: 70,
                  endIndent: 70,
                )),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text("${car.bodyDesign}", style: detailCarBoldTextStyle),
                      SizedBox(height: 8.0),
                      Text('Body Design', style: detailCarTextStyle)
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text("${car.fuel}", style: detailCarBoldTextStyle),
                      SizedBox(height: 8.0),
                      Text('Fuel', style: detailCarTextStyle)
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text("${car.transmission}", style: detailCarBoldTextStyle),
                      SizedBox(height: 8.0),
                      Text('Transmission', style: detailCarTextStyle)
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
                height: 32.0,
                child: Divider(
                  color: Colors.black,
                  height: 20,
                  thickness: 2,
                  indent: 70,
                  endIndent: 70,
                )),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text("${car.acceleration} s", style: detailCarBoldTextStyle),
                      SizedBox(height: 8.0),
                      Text('Acceleration 0 - 100 km', style: detailCarTextStyle)
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
                height: 32.0,
                child: Divider(
                  color: Colors.black,
                  height: 20,
                  thickness: 2,
                  indent: 70,
                  endIndent: 70,
                )),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Text(car.color.join(', '),
                          overflow: TextOverflow.ellipsis,
                          style: detailCarBoldTextStyle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text('Available Color', style: detailCarTextStyle)
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.0),
          ],
        ),
      ),
    );
  }
}
