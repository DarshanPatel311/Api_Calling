import 'package:api_data/provider/aip_text_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '9_1_api_text/view/Text_screen.dart';
import '9_2_api_img/img_api.dart';





void main(){


  runApp(ChangeNotifierProvider(
      create: (context) => ApiProvider(),
      child: const MyApp()));
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ApiText(),
    );
  }
}
