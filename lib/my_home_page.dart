import 'package:flutter/material.dart';
import 'package:web_view/web_page.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Web View'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: urlController,
                  decoration: InputDecoration(
                    hintText: 'Paste your link here',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    urlController.text.isNotEmpty
                        ? Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  WebPage(url: urlController.text),
                            ),
                          )
                        : null;
                  },
                  child: const Text('Go to the link'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
