import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_place/google_place.dart';
import 'package:kenalbandung/const/theme.dart';
import 'package:kenalbandung/views/wisata_view.dart';
import 'package:shimmer/shimmer.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getBanner();
  }

  void getBanner() async {
    list_banner = [];
    stringimage.forEach((element) async {
      list_banner!.add(element);
      print(element);
    });
  }

  List? list_banner;
  List stringimage = ['assets/banner1.png', 'assets/banner2.png'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 16, left: 16, right: 4),
                child: Text(
                  "Hi.. Teman",
                  style: blackTextStyle.copyWith(fontSize: 20),
                ),
              ),
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
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => WisataView(),
                          ),
                        );
                      },
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
              ),
              Container(
                margin: EdgeInsets.only(top: 16, left: 16, right: 4),
                child: Text(
                  "Recently New",
                  style: blackTextStyle.copyWith(fontSize: 20),
                ),
              ),
              list_banner == null
                  ? Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      enabled: true,
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        height: 140,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(12)),
                      ),
                    )
                  : list_banner!.length == 0
                      ? Container()
                      : Container(
                          margin: EdgeInsets.only(top: 12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12)),
                          child: CarouselSlider(
                            options: CarouselOptions(
                                autoPlay: true,
                                height: 140,
                                enlargeCenterPage: true,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    _current = index;
                                  });
                                }),
                            carouselController: _controller,
                            items: list_banner!
                                .map(
                                  (item) => Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage(item)),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    // child: Image.network(
                                    //   item.source!,
                                    // ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
            ],
          ),
        ),
      ),
    );
  }
}
