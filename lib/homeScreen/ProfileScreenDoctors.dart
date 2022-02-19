import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:salamtak_university_project/Api/databaseApi.dart';
import 'package:salamtak_university_project/Api/auth.dart';
import 'package:salamtak_university_project/model/User.dart';
import 'package:salamtak_university_project/utilities/SalamtakHomeBar.dart';
import 'package:salamtak_university_project/utilities/SalamtakSettingsButtons.dart';

class ProfileScreenDoctors extends StatelessWidget {
  const ProfileScreenDoctors({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserDataF userData = UserDataF(
        uid: "wadwadawd",
        fullName: "rashed ",
        address: "dwdwa wd a dwa",
        age: 26);
    return Scaffold(
      appBar: SalamtakHomeBar(
        height: MediaQuery.of(context).size.height * 0.45,
        color: 0xff000000,
      ),
      backgroundColor: Color(0xff23293f),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: Card(
                  elevation: 25,
                  color: Color(0xff2e323e),
                  borderOnForeground: true,
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.account_circle_outlined,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                "Name",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.date_range_rounded,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "25",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.home_outlined,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                "address",
                                softWrap: true,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 7,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Card(
                  elevation: 10,
                  color: Color(0xff2e323e),
                  borderOnForeground: true,
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            "BPM Rate",
                            style: TextStyle(color: Colors.white,fontSize: 25),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Center(
                                child: Text(
                              "87",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 90,
                              ),
                            )),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Card(
                  elevation: 10,
                  color: Color(0xff2e323e),
                  borderOnForeground: true,
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            "Body temperature",
                            style: TextStyle(color: Colors.white,fontSize: 25),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Center(
                                child: Text(
                              "34 °C",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 90,
                              ),
                            )),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
