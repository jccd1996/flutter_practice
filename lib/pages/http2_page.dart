import 'package:dio/dio.dart';
import 'package:dio_http2_adapter/dio_http2_adapter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/blocs/http2_bloc.dart';
import 'package:flutter_practice/pages/base_state.dart';

class Http2Page extends StatefulWidget {
  @override
  _Http2PageState createState() => _Http2PageState();
}

class _Http2PageState extends BaseState<Http2Page, Http2Bloc> {
  @override
  void initState() {
    super.initState();
    bloc.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Prueba'),
            RaisedButton(
              onPressed: () => getHttp(),
              child: Text('Prueba boton'),
            )
          ],
        ),
      ),
    );
  }

  void getHttp() async {
    var dio = Dio()
      ..options.baseUrl = "https://google.com"
      ..interceptors.add(LogInterceptor())
      ..httpClientAdapter = Http2Adapter(
        ConnectionManager(
          idleTimeout: 10000,
          // Ignore bad certificate
          onClientCreate: (_, config) => config.onBadCertificate = (_) => true,
        ),
      );

    Response<String> response;

    response = await dio.get("/?xx=6");
//    print(response.data.length);
//    print(response.redirects.length);
    print(response.data);
  }
}
