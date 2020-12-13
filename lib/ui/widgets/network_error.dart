import 'package:flutter/material.dart';

class NetworkError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Oops..",
            style: TextStyle(
                fontSize: 24,
                color: Colors.grey),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Someting went wrong !\n check your internet connection.",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16, color: Color(0xfffbfbfbf)),
          ),
         
        ],
      ),
    );
  }
}