import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_place/google_place.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  void getMoreLocation() async {
    var googlePlace = GooglePlace("AIzaSyDiuACHZjw1U6HEj-w6CpuC5SKH5dHD3i8");

    var result =
        await googlePlace.search.getTextSearch("restaurants in Sydney");

    print(result!.status);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMoreLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 16, left: 16, right: 4),
                      height: 150,
                      child: Container(
                        margin: EdgeInsets.only(top: 10, left: 16, right: 4),
                        child: Text("Cafe & Resto"),
                      ),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/cafe_banner.png"),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(23),
                        color: Color(0xffDEAA87),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 16, left: 4, right: 16),
                      height: 150,
                      child: Container(
                        margin: EdgeInsets.only(top: 10, left: 16, right: 4),
                        child: Text("Mall & Disttro"),
                      ),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/mall_banner.png"),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(23),
                        color: Color(0xff71B5B5),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 16, right: 16, top: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        height: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(23),
                            color: Colors.red),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        height: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(23),
                            color: Colors.red),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        height: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(23),
                            color: Colors.red),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
