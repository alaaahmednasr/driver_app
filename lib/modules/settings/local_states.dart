
import 'package:flutter/cupertino.dart';

abstract class LocalStates{}

class InitialLocalState extends LocalStates {}

class ChangeLocalState extends LocalStates {

  final Locale locale;
  
  ChangeLocalState (this.locale);
}
