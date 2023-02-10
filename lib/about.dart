import 'package:flutter/material.dart';


class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  final String url = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTL26uY9-RLO9gMsg9uai-7UkF3Mr5uM7yPE_YOPHAtBY3xM1ypO3oekaWwtO1ZIO_Zk9I&usqp=CAU";

  final double _fontSize = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("About"),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(url),
                radius: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text(
                "Created with ",
                style: TextStyle(fontSize: _fontSize),
                ),
                Image.network("https://cdn-icons-png.flaticon.com/512/2883/2883911.png", width: 40, height: 40),
                Text(
                " By Muzaffar Hassan",
                style: TextStyle(fontSize: _fontSize),
                ),
              ],),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("If you like my App then do contact me at +92345443435 or email me at DummyDesign24@Gmail.com", style: TextStyle(fontSize: 17)),
              ),           
            ],
          ),
        ),
      );
  }
}
