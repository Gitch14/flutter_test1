import 'dart:convert';
import 'package:chobidesh/networks/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'details_screen.dart';

class HomeScreeen extends StatefulWidget {
  @override
  _HomeScreeenState createState() => _HomeScreeenState();
}

class _HomeScreeenState extends State<HomeScreeen> {
  List images;

  @override
  void initState() {

    _loadImages();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return images == null
        ? Center(
            child: CircularProgressIndicator(),
          )

        : Container(

      constraints: BoxConstraints(minWidth: 100, maxWidth: 700),
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: StaggeredGridView.countBuilder(
              crossAxisCount: 4,
              itemCount: images.length,
              itemBuilder: (BuildContext context, int index) => InkWell(
                onTap: () {
                  _nextScreen(images[index]['urls']['regular']);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),

                  child: Image.network(
                    images[index]['urls']['regular'],
                    fit: BoxFit.cover,
                    width: 50.0,
                    height: 50.0,

                  ),
                ),
              ),
              staggeredTileBuilder: (int i) =>
                  StaggeredTile.count(2, i.isEven ? 2 : 3),
              mainAxisSpacing: 100.0,
              crossAxisSpacing: 20.0,
            ),
          );
  }

  _loadImages() async {
    var response = await Api().getData();
    setState(() {
      images = jsonDecode(response.body);

    });
  }

  
  _nextScreen(String imagePath) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsScreen(imagePath:imagePath)
      ),
    );
  }
}
