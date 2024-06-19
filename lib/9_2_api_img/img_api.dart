import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/aip_text_provider.dart';
TextEditingController controller = TextEditingController();

class ImgApi extends StatelessWidget {
  const ImgApi({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ApiProvider>();
    final providerF = context.read<ApiProvider>();
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: controller,
        ),
        actions: [
          IconButton(
            onPressed: (){
              providerF.fetchData(controller.text);
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: provider.isLoading
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : GridView.builder(
        itemCount: provider.data['hits'].length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) => Card(

            child: Image.network(
                fit: BoxFit.cover,
                '${provider.data['hits'][index]['largeImageURL']}')),
      ),
    );
  }
}
