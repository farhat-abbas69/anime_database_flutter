import 'package:flutter/material.dart';

class ShowRow extends StatelessWidget {
  ShowRow({
    required this.img,
    this.color = Colors.pinkAccent
  });
  String img;
  Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 350,
              height: 150,
              // color: Colors.orangeAccent.shade200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: color,
                boxShadow: [
                  BoxShadow(color: Colors.white, spreadRadius: 1),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("New Episode"),
                    Text("Blue Lock"),
                    Text("S1 Ep22"),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: -20,
            child: Image.asset(
              img,
              width: 220,
              height: 180,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}