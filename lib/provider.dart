import 'package:flutter_practice/blocs/bloc.dart';
import 'package:flutter_practice/blocs/http2_bloc.dart';

import 'blocs/bloc_cache.dart';

class Provider {
  static T of<T extends Bloc>(Function instance) {
    switch (T) {
      case Http2Bloc:
        {
          return BlocCache.getBlocInstance("Http2Bloc", instance);
        }
    }
    return null;
  }

  static void dispose<T extends Bloc>() {
    switch (T) {
      case Http2Bloc:
        {
          BlocCache.dispose("Http2Bloc");
          break;
        }
    }
  }
}
