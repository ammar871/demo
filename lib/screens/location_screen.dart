import 'package:demo/providers/locations_providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart'as UrlLauncher;
import '../constans.dart';

class LocationScreen extends StatefulWidget {
  static String id = "LocationScreen";

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  LocationsProviders locationProviders;
  LatLng latLng;

  initData() async {
    if (locationProviders == null) {
      locationProviders = Provider.of(context);
      locationProviders.loading = true;
      locationProviders.getLocations();
    }
  }

  @override
  Widget build(BuildContext context) {
    GoogleMapController _controller;

    initData();
    return Scaffold(
      //End AppBar
      body: locationProviders.loading
          ? Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Center(
                child: SpinKitRing(
                  color: KColorecart,
                  size: 30,
                  duration: Duration(milliseconds: 700),
                  lineWidth: 5,
                ),
              ),
            )
          : ListView.builder(
              itemCount: locationProviders.locations.length,
              itemBuilder: (context, index) {
                return Theme(
                  data: Theme.of(context).copyWith(
                      accentColor: Colors.white,
                      unselectedWidgetColor: Colors.white..withOpacity(0.8)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 5.0, right: 5.0, top: 5, bottom: 5),
                    child: ExpansionTile(
                      tilePadding: EdgeInsets.only(left: 8, right: 8),
                      title: InkWell(
                        onTap: () {},
                        child:
                            (locationProviders.locations[index].name == null ||
                                    locationProviders.locations[index].block ==
                                        null)
                                ? Text("")
                                : Text(
                                    Provider.of<LocationsProviders>(context,
                                                listen: true)
                                            .locations[index]
                                            .name +
                                        Provider.of<LocationsProviders>(context,
                                                listen: true)
                                            .locations[index]
                                            .block +
                                        "",
                                    style: TextStyle(color: Colors.white),
                                  ),
                      ),

                      backgroundColor: KColoreblue,
                      collapsedBackgroundColor: KColoreblue,
                      children: [
                        Container(
                          color: Colors.white,
                          height: 220,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  height: 220,
                                  width: 210,
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: GoogleMap(
                                      onMapCreated:mapCreated ,

                                      initialCameraPosition: CameraPosition(
                                        target: new LatLng(
                                            double.parse(locationProviders
                                                .locations[index].latitude),
                                            double.parse(locationProviders
                                                .locations[index].longitude)),
                                        zoom: 14,
                                      ),
                                      markers: Set<Marker>.of(
                                        getMarkers(
                                            new LatLng(
                                                double.parse(locationProviders
                                                    .locations[index].latitude),
                                                double.parse(locationProviders
                                                    .locations[index]
                                                    .longitude)),
                                            (locationProviders.locations[index]
                                                            .name ==
                                                        null ||
                                                    locationProviders
                                                            .locations[index]
                                                            .block ==
                                                        null)
                                                ? ""
                                                : Provider.of<LocationsProviders>(
                                                            context,
                                                            listen: true)
                                                        .locations[index]
                                                        .name +
                                                    Provider.of<LocationsProviders>(
                                                            context,
                                                            listen: true)
                                                        .locations[index]
                                                        .block +
                                                    ""),
                                      ),
                                    ),
                                  )),


                              SizedBox(
                                width: 4,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(

                                      children: [
                                        InkWell(
                                            onTap: (){
                                              setState(() {
                                                openMap(  double.parse(locationProviders
                                                    .locations[index].latitude),
                                                    double.parse(locationProviders
                                                        .locations[index]
                                                        .longitude)) ;
                                              });

                                            },
                                            child: Icon(Icons.location_on,color: KColorecart,)),
                                        SizedBox(
                                          width: 2,
                                        ),
                                        locationProviders.locations[index].block ==
                                            null
                                            ? Text("")
                                            : Text(
                                          Provider.of<LocationsProviders>(context,
                                              listen: true)
                                              .locations[index]
                                              .block +
                                              "",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),

                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Row(

                                      children: [
                                        InkWell(
                                            onTap: (){

                                              setState(() {
                                                callPhone(locationProviders.locations[0].phone);
                                              });

                                            }

                                            ,child: Icon(Icons.call,color: KColorecart,)),
                                        SizedBox(
                                          width: 2,
                                        ),

                                        locationProviders.locations[index].phone ==
                                            null
                                            ? Text("")
                                            : Text(
                                          Provider.of<LocationsProviders>(context,
                                              listen: true)
                                              .locations[index]
                                              .phone +
                                              "",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),

                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),

                            ],
                          ),
                        )
                      ],
                      // children: _buildList(Provider.of<HomeProviders>(
                      //         context,
                      //         listen: true)
                      //     .categories[index]),
                    ),
                  ),
                );
              },
            ),
    );
  }

  List<Marker> getMarkers(LatLng latLng, String title) {
    List<Marker> _markers = <Marker>[
      Marker(
          markerId: MarkerId('SomeId'),
          position: LatLng(38.123, 35.123),
          infoWindow: InfoWindow(title: title))
    ];
    return _markers;
  }

  void mapCreated(controller, ) {
    setState(() {
      _controller=controller;

    });

  }

  GoogleMapController _controller;

  movetoBoston(LatLng latLng) {
    _controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: latLng, zoom: 14.0, bearing: 45.0, tilt: 45.0),
    ));
  }
  static Future<void> openMap(double latitude, double longitude) async {
    String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await UrlLauncher.canLaunch(googleUrl)) {
      await UrlLauncher.launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }
  void callPhone(String phone) {
    UrlLauncher.launch('tel:+${phone}');


  }
}
