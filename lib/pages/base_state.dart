import 'package:flutter/material.dart';
import 'package:flutter_practice/blocs/bloc.dart';
import 'package:flutter_practice/utils/localizations.dart';

abstract class BaseState<T extends StatefulWidget, K extends Bloc>
    extends State<T> {
  AppLocalizations l10n;
  K bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    l10n = AppLocalizations.of(context);
  }

  @override
  void initState() {
    super.initState();
  }
}
