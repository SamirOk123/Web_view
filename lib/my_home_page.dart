import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:web_view/inapp_webview.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final urlController = TextEditingController();
  final ChromeSafariBrowser browser = MyChromeSafariBrowser();

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        urlController.text.isNotEmpty
                            ? Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      InappWebPage(url: urlController.text),
                                ),
                              )
                            : null;
                      },
                      child: const Text('Inapp Webview'),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        urlController.text.isNotEmpty
                            ? await browser.open(
                                url: Uri.parse(urlController.text),
                                options: ChromeSafariBrowserClassOptions(
                                  android: AndroidChromeCustomTabsOptions(
                                      shareState:
                                          CustomTabsShareState.SHARE_STATE_OFF),
                                  ios: IOSSafariOptions(
                                      barCollapsingEnabled: true),
                                ),
                              )
                            : null;
                      },
                      child: const Text('Chrome Safari'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyChromeSafariBrowser extends ChromeSafariBrowser {
  @override
  void onOpened() {
    print("ChromeSafari browser opened");
  }

  @override
  void onCompletedInitialLoad() {
    print("ChromeSafari browser initial load completed");
  }

  @override
  void onClosed() {
    print("ChromeSafari browser closed");
  }
}
