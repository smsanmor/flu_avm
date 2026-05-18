import 'package:flu_avm/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class ChartaScreen extends StatefulWidget {
  const ChartaScreen({super.key});

  @override
  State<ChartaScreen> createState() => _ChartaScreenState();
}

class _ChartaScreenState extends State<ChartaScreen> {

void _initiareCircleAnnotations(MapboxMap mapboxMap) {

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mapas'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [

          MapWidget(
            key: ValueKey('main_mapa'),
            cameraOptions: CameraOptions(
              center: Point(
                coordinates: Position( -122.467895, 37.800126)
              ),
              zoom: 14.5,
            ),
            styleUri: MapboxStyles.MAPBOX_STREETS,
            onMapCreated: _initiareCircleAnnotations,
          ),

        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: EdgeInsets.all(12),
            child: ComplereForm()
          ),
        )
        ],
      ),
    );
  }
}