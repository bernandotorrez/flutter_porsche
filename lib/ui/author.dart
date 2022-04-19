import 'package:flutter/material.dart';
import 'package:flutter_porsche_car/style.dart';

class AuthorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Author', style: appBarTextStyle),
        centerTitle: true,
        backgroundColor: primaryColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: whiteColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ProfileContent(),
    );
  }
}

class ProfileContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 50.0,
            backgroundColor: Colors.red,
            backgroundImage: AssetImage("assets/images/me.jpg"),
          ),
          Text("Bernand D H", style: headingTextStyle),
          Text("FLUTTER DEVELOPER", style: cardTitleTextStyle),
          SizedBox(
            width: 200.0,
            height: 20.0,
            child: Divider(
              height: 5.0,
              thickness: 2,
              color: primaryColor,
            ),
          ),
          Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  color: primaryColor,
                ),
                title: Text("0896-8761-0639", style: profileContentTextStyle),
              ),
          ),
          Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: ListTile(
                leading: Icon(
                  Icons.email,
                  color: primaryColor,
                ),
                title: Text("mail.bernand@gmail.com", style: profileContentTextStyle ),
              )
          )
        ],
      ),
    );
  }
}
