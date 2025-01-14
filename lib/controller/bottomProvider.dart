import 'package:flutter/material.dart';

class Bottomprovider extends ChangeNotifier {
int currentindex=0;
void onChange(int index){
  currentindex=index;
  notifyListeners();
}
}