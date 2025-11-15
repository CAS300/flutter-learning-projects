import 'package:flutter/material.dart';

class ColorDisplay extends StatelessWidget {
  const ColorDisplay({
    super.key,
    required this.selectedColor,
    required this.isCircular,
    required this.withOpacity,
  });

  final Color selectedColor;
  final bool isCircular;
  final Color withOpacity;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    debugPrint(deviceSize.toString());
    
    final containerSize = deviceSize.shortestSide * 0.6;
    debugPrint(containerSize.toString());
    return Container(
      width: containerSize,
      height: containerSize,
      decoration: BoxDecoration(
        color: selectedColor,
        borderRadius: BorderRadius.circular(isCircular ? containerSize / 2 : 10),
        boxShadow: [
          BoxShadow(
            color: withOpacity,
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
    );
  }
}
