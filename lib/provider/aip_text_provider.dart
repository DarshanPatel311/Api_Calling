import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';

import '../api_service.dart';

class ApiProvider extends ChangeNotifier {

  Map data = {};
  bool isLoading = true;

  Future<void> fetchData(String category) async {
    isLoading = true;
    notifyListeners();
    String? json = await ApiService().apiCalling(category);
    if (json != null){
      data = jsonDecode(json);
      log('--- Fetched Data --');
    } else {
      log('--- Null Data ---');
    }
    isLoading = false;
    notifyListeners();
  }


  HomeProvider(){
    fetchData('nature');
  }
}