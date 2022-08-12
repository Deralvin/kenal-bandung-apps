import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class DetailViewWisataBelanja extends StatefulWidget {
  DetailViewWisataBelanja(
      {Key? key, required this.longitude, required this.latitude})
      : super(key: key);
  final double longitude;
  final double latitude;
  @override
  State<DetailViewWisataBelanja> createState() =>
      _DetailViewWisataBelanjaState();
}

class _DetailViewWisataBelanjaState extends State<DetailViewWisataBelanja> {
  Completer<GoogleMapController> _controller = Completer();
  Position? myCurrentLocation;
  CameraPosition? _kGooglePlex;
  List<Marker> _markers = [];
  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;

    myCurrentLocation = await Geolocator.getCurrentPosition();
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(
                myCurrentLocation!.latitude, myCurrentLocation!.longitude),
            zoom: 18),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.latitude);
    requestLoc();
    camera_place();
    addMarkerPlace();
    addCurrentLocation();
  }

  void requestLoc() async {
    LocationPermission permission = await Geolocator.requestPermission();
  }

  void addCurrentLocation() async {
    myCurrentLocation = await Geolocator.getCurrentPosition();
    print("this is my addcurrent ${myCurrentLocation!.latitude}");
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId('my_loc'),
          position:
              LatLng(myCurrentLocation!.latitude, myCurrentLocation!.longitude),
          infoWindow: InfoWindow(title: 'The title of the marker'),
        ),
      );
    });
  }

  void addMarkerPlace() async {
    _markers.add(Marker(
        markerId: MarkerId('SomeId'),
        position: LatLng(widget.latitude, widget.longitude),
        infoWindow: InfoWindow(title: 'The title of the marker')));
  }

  void camera_place() async {
    CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(widget.latitude, widget.longitude),
      zoom: 14.4746,
    );
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kGooglePlex));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.latitude, widget.longitude),
          zoom: 14.4746,
        ),
        markers: Set<Marker>.of(_markers),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: _goToTheLake,
          label: Text('My Loc'),
          icon: Icon(Icons.person_pin_circle_rounded)),
    );
  }
}
