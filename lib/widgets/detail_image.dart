import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailImage extends StatelessWidget {
  final String image;

  DetailImage({Key key, this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Hero(
            tag: 'imageHero',
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(34),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )),
    );
  }
}
