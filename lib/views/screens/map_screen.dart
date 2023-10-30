import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

var loadingItem = Lottie.asset(
  'assets/lotties/loadingPaw.json',
);

bool isLoading = true;

late Timer timer;

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    timer = Timer.periodic(const Duration(seconds: 4), (Timer t) {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    });
    return isLoading
        ? loadingItem
        : Stack(
            children: [
              const Center(
                child: Text("Map Screen"),
              ),
              Positioned(
                bottom: 0,
                child: Lottie.asset(
                  'assets/lotties/bottomCat.json',
                  height: 120,
                  width: 120,
                  repeat: false,
                ),
              ),
            ],
          );
  }
}
