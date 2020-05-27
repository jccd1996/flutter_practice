import 'package:flutter/material.dart';
import 'package:flutter_practice/pages/image_animation.dart';
import 'package:flutter_practice/widgets/detail_image.dart';
import 'package:flutter_practice/widgets/favorite_button.dart';

class AnimationPage extends StatefulWidget {
  AnimationPage({
    Key key,
    this.title,
  }) : super(key: key);
  final String title;

  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  Color color = Color(0xFFfe6a04);
  String imagePath = 'images/oficina.jpg';

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(25),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Sofka 2',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                  ),
                ),
                Text(
                  'Medellín - Colombia',
                  style: TextStyle(color: Colors.grey[500]),
                ),
                Text(
                  'Cra. 30A # 10D-52, Oficina 201',
                  style: TextStyle(color: Colors.grey[500]),
                )
              ],
            ),
          ),
          FavoriteWidget()
        ],
      ),
    );

    Widget buttonSection = Container(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildButtonColumn(
            color,
            Icons.call,
            'LLAMAR',
            () {},
          ),
          _buildButtonColumn(
            color,
            Icons.save,
            'GUARDAR',
            () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ImageAnimation()));
            },
          ),
          _buildButtonColumn(
            color,
            Icons.share,
            'COMPARTIR',
            () {},
          ),
        ],
      ),
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
        softWrap: true,
      ),
    );

    Widget image = Image.asset(
      imagePath,
      width: 400,
      height: 200,
      fit: BoxFit.cover,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('We make IT simple'),
        backgroundColor: color,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            GestureDetector(
              child: Hero(
                child: image,
                tag: 'imageHero',
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return DetailImage(
                    image: imagePath,
                  );
                }));
              },
            ),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }

  Column _buildButtonColumn(
      Color color, IconData icon, String label, Function function) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(icon),
          color: color,
          onPressed: function,
        ),
        Container(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
