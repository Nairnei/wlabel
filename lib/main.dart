import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Wlabel extends StatefulWidget {

  String name = "WLabel";
  String iconUrl = "";
  ThemeData? theme = ThemeData.light();
  MaterialColor? baseColor = Colors.blue;


  Wlabel({Key? key, required this.name, required this.iconUrl, this.theme, this.baseColor}) : super(key: key);

  @override
  State<Wlabel> createState() => _Wlabel();
}

class _Wlabel extends State<Wlabel> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      title: widget.name,
      theme: widget.theme,
      home:  MyHomePage(title: widget.name, url: widget.iconUrl),
    );
  }
}

class MyHomePage extends StatefulWidget {

  final String title;
  final String url;

  const MyHomePage({Key? key, required this.title, required this.url}) : super(key: key);



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            widget.url.isNotEmpty ?
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              height:  MediaQuery.of(context).size.width / 2,
              child: CachedNetworkImage(
                imageUrl: widget.url,
                fit: BoxFit.scaleDown,
              ),
            ) : const SizedBox.shrink(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.title, style: const TextStyle(color: Colors.teal),
              ),
            ),
          ],
        ),
      ),
    );
  }


}
