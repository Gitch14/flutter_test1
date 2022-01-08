import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final String imagePath;
  DetailsScreen({@required this.imagePath});

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(widget.imagePath), fit: BoxFit.cover),
        ),
      ),
    );
  }


}
