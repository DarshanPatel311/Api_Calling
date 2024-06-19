import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/aip_text_provider.dart';

class ApiText extends StatelessWidget {
  const ApiText({super.key});

  @override
  Widget build(BuildContext context) {
    ApiProvider ProviderTrue=Provider.of<ApiProvider>(context);
    ApiProvider ProviderFalse=Provider.of<ApiProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(),
      body:  ProviderTrue.isLoading
          ? const Center(
        child: CircularProgressIndicator(),
      )
          :Column(

        children: [
          ...List.generate(ProviderTrue.data['hits'].length, (index) => Container(
            height: 90,
            width: double.infinity,
            child: Column(
              children: [
                Text('${ProviderTrue.data['hits'][index]['type']}',style: TextStyle(
                  fontSize: 20,
                ),)
              ],
            ),
          ))
        ],
      )

    );
  }
}
