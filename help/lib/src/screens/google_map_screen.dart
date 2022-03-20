import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:help/src/blocs/application_bloc.dart';
import 'package:provider/provider.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);

  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  @override
  Widget build(BuildContext context) {
    final applicationBloc = Provider.of<ApplicationBloc>(context);

    return Scaffold(
      appBar: AppBar(
          title: const Text('Dude delivery'),
          actions: <Widget>[

    ]),
      body: (applicationBloc.currentLocation == null)
        ? Center(
          child: CircularProgressIndicator(),
      )
      : ListView(
        children: [
          TextField(
            decoration: InputDecoration(hintText: "Поиск места"),
          ),
          Container(
            height: 500.0,
            child: GoogleMap(
              mapType: MapType.normal,
              myLocationButtonEnabled: true,
              initialCameraPosition:
              CameraPosition(target: LatLng(applicationBloc.currentLocation!.latitude, applicationBloc.currentLocation!.longitude),
              zoom: 14),
            ),
          )
        ],
      ),
    );
  }
}
