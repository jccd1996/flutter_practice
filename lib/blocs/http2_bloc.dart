import 'package:flutter_practice/blocs/bloc.dart';
import 'package:flutter_practice/models/user_response.dart';
import 'package:flutter_practice/repository/user_repository.dart';
import 'package:rxdart/rxdart.dart';

class Http2Bloc extends Bloc{
  final UserRepository _repository = UserRepository();
  final BehaviorSubject<UserResponse> _subject =
  BehaviorSubject<UserResponse>();

  getUser() async {
    UserResponse response = await _repository.getUser();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<UserResponse> get subject => _subject;
}

final bloc = Http2Bloc();
