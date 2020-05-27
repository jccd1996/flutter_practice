import 'package:flutter/material.dart';
import 'package:flutter_practice/blocs/http2_bloc.dart';
import 'package:flutter_practice/pages/animation_page.dart';
import 'package:flutter_practice/pages/base_state.dart';
import 'package:flutter_practice/pages/bottom_nav_page.dart';
import 'package:flutter_practice/pages/carrousel_page.dart';
import 'package:flutter_practice/pages/drawer_page.dart';
import 'package:flutter_practice/pages/http2_page.dart';
import 'package:flutter_practice/pages/search_bar_page.dart';
import 'package:flutter_practice/pages/sliver_page.dart';
import 'package:flutter_practice/pages/tab_page.dart';
import 'package:flutter_practice/pages/test_page.dart';
import 'package:flutter_practice/pages/video_page.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends BaseState<MenuPage, Http2Bloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.title),
      ),
      body: ListView(
        children: <Widget>[
          ExpansionTile(
            title: Text(l10n.appStructureNavigation),
            children: <Widget>[
              _ButtonOptions(
                textButton: 'Bottom Nav',
                textSubtitle: l10n.example3PagesNav,
                icon: Icons.view_carousel,
                onTap: () {
                  navigateToPage(BottomNavPage());
                },
              ),
              _ButtonOptions(
                textButton: 'Tab Bar',
                textSubtitle: l10n.example3PagesTab,
                icon: Icons.code,
                onTap: () {
                  navigateToPage(TabPage());
                },
              ),
              _ButtonOptions(
                textButton: 'Drawer',
                textSubtitle: l10n.panelSlidesHorizontally,
                icon: Icons.arrow_forward_ios,
                onTap: () {
                  navigateToPage(DrawerPage());
                },
              ),
              _ButtonOptions(
                textButton: 'Sliver App Bar',
                textSubtitle: l10n.toolbarWithAnimation,
                icon: Icons.arrow_drop_down_circle,
                onTap: () {
                  navigateToPage(SliverPage());
                },
              ),
              _ButtonOptions(
                textButton: 'Search bar',
                textSubtitle: 'Buscador en la pagina',
                icon: Icons.search,
                onTap: () {
                  navigateToPage(SearchBarPage());
                },
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Animations'),
            children: <Widget>[
              _ButtonOptions(
                textButton: 'Transicion imagenes',
                textSubtitle: 'Con hero tag',
                icon: Icons.threesixty,
                onTap: () => navigateToPage(AnimationPage(
                  title: l10n.animationPage,
                )),
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Buttons'),
            children: <Widget>[
              _ButtonOptions(
                textButton: 'ButtonBar',
                textSubtitle: 'A horizontal arrangement of buttons.',
                icon: Icons.threesixty,
              ),
              _ButtonOptions(
                textButton: 'DropdownButton',
                textSubtitle: 'Shows the currently selected item',
                icon: Icons.threesixty,
              ),
              _ButtonOptions(
                textButton: 'FlatButton',
                textSubtitle:
                    'A flat button is a section printed on a Material Components',
                icon: Icons.threesixty,
              ),
              _ButtonOptions(
                textButton: 'FloatingActionButton',
                textSubtitle:
                    'A flat button is a section printed on a Material Components',
                icon: Icons.threesixty,
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Input and selections'),
            children: <Widget>[
              _ButtonOptions(
                textButton: 'Transicion imagenes',
                textSubtitle: 'Con hero tag',
                icon: Icons.threesixty,
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Dialogs, alerts and panels'),
            children: <Widget>[
              _ButtonOptions(
                textButton: 'Transicion imagenes',
                textSubtitle: 'Con hero tag',
                icon: Icons.threesixty,
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Pruebitas'),
            children: <Widget>[
              _ButtonOptions(
                textButton: 'Clase flutter privada',
                textSubtitle: 'pruebas',
                icon: Icons.threesixty,
                onTap: () {
                  navigateToPage(TestPage());
                },
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Layout'),
            children: <Widget>[
              _ButtonOptions(
                textButton: 'Carrusel de imagenes',
                textSubtitle: 'Carrusel',
                icon: Icons.calendar_view_day,
                onTap: () {
                  navigateToPage(CarrouselPage());
                },
              ),
            ],
          ),
          ExpansionTile(
            title: Text('API services'),
            children: <Widget>[
              _ButtonOptions(
                textButton: 'Test http',
                textSubtitle: 'http2 con streams',
                icon: Icons.wifi_tethering,
                onTap: () => navigateToPage(Http2Page()),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void navigateToPage(Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }
}

class _ButtonOptions extends StatelessWidget {
  final String textButton;
  final String textSubtitle;
  final IconData icon;
  final GestureTapCallback onTap;

  _ButtonOptions({
    this.textButton,
    this.textSubtitle,
    this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: ListTile(
        title: Text(textButton),
        leading: Icon(icon),
        subtitle: Text(textSubtitle),
        onTap: onTap,
      ),
    );
  }
}
