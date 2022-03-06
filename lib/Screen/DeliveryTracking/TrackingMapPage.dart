// ignore_for_file: prefer_const_declarations, prefer_const_constructors
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class LiveTrackingPage extends StatefulWidget {
  const LiveTrackingPage({Key? key}) : super(key: key);

  @override
  State<LiveTrackingPage> createState() => _LiveTrackingPageState();
}

class _LiveTrackingPageState extends State<LiveTrackingPage> {
  static final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(28.7041, 77.1025),
    zoom: 14.4746,
  );
    static final CameraPosition _kLake = const CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  final Completer<GoogleMapController> _controller = Completer();

Location location = new Location();
  Set<Marker> _markers = Set<Marker>();
bool _serviceEnabled=false;
late PermissionStatus _permissionGranted;
late LocationData _locationData;
  late LatLng latlong;

@override
  void initState() {
    // TODO: implement initState

    //getCurrentLatLang();
    getCurrentLocation();
    super.initState();
  }


Future getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission != PermissionStatus.granted) {
      LocationPermission permission = await Geolocator.requestPermission();
      if (permission != PermissionStatus.granted) getLocation();
      return;
    }
    getLocation();
  }

  getLocation() async {
    Position position = await Geolocator.getCurrentPosition();
    print("@geoLocation");
    setState(() {
      latlong = new LatLng(position.latitude, position.longitude);
      print(latlong);
    });
  }


init() async {

  _serviceEnabled = await location.serviceEnabled();
if (!_serviceEnabled) {
  _serviceEnabled = await location.requestService();
  if (!_serviceEnabled) {
    return;
  }
}

_permissionGranted = await location.hasPermission();
if (_permissionGranted == PermissionStatus.denied) {
  _permissionGranted = await location.requestPermission();
  if (_permissionGranted != PermissionStatus.granted) {
    return;
  }
}

_locationData = await location.getLocation();


}



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: (){
        _goToTheLocation();
      },
      child: Icon(Icons.location_searching_outlined,color: Colors.blue,),
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            markers:_markers ,
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),

          DraggableScrollableSheet(
            initialChildSize: 0.30,
            minChildSize: 0.15,
            maxChildSize: 0.74,
            builder: (BuildContext context, ScrollController scrollController) {
              return SingleChildScrollView(
                controller: scrollController,
                child: CustomScrollViewContent(),
              );
            },
          ),
        ],
      ),
    );
  }

 Future<void> _goToTheLocation() async {
    final GoogleMapController controller = await _controller.future;
    _markers.add(Marker(markerId: MarkerId("CurrentLoc"),
    position: latlong,
    icon: BitmapDescriptor.defaultMarker,
    ));
   
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      bearing: 192.8334901395799,
      target: latlong,
      tilt: 59.440717697143555,
      zoom: 19.151926040649414)));
       setState(() {
      
    });
  }

}


class CustomScrollViewContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(24),topRight: Radius.circular(24),)),
      margin: const EdgeInsets.all(0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
        ),
        child: CustomInnerContent(),
      ),
    );
  }
}

class CustomInnerContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 12),
        Container( height: 5,width: 30,
        decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(16)), ),
        const SizedBox(height: 16),
        Container(
          child: InkWell(
            child: ListTile(
              leading: Icon(Icons.list_alt_rounded),
              title: Text("Order Confirmed"),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Container(
          child: InkWell(
            child: ListTile(
              leading: Icon(Icons.list_alt_rounded),
              title: Text("Driver assigned"),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Container(
          child: InkWell(
            child: ListTile(
              leading: Icon(Icons.location_on_outlined),
              title: Text("Driver at Store"),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Container(
          child: InkWell(
            child: ListTile(
              leading: Icon(Icons.list_alt_rounded),
              title: Text("Order Picked Up"),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Container(
          child: InkWell(
            child: ListTile(
              leading: Icon(Icons.list_alt_rounded),
              title: Text("Driver at Delivery Location"),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Container(
          child: InkWell(
            child: ListTile(
              leading: Icon(Icons.thumb_up_alt_outlined),
              title: Text("Order Delivered"),
              subtitle: Text("Your Order has been delivered"),
            ),
          ),
        ),
        const SizedBox(height: 16),
        GFButton(
        color: Colors.amber,
        onPressed: (){},
        text: "Rate The Order",
        )
      ],
    );
  }
}
