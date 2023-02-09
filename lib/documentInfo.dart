import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jsk_app/zoomedFlowDiagram.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:glassmorphism/glassmorphism.dart';

class DocumentInfo extends StatefulWidget {
  String docName;
  DocumentInfo({super.key, required this.docName});

  @override
  State<DocumentInfo> createState() => _DocumentInfoState();
}

class _DocumentInfoState extends State<DocumentInfo> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello User!",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "List Of Documents",
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
        elevation: 0,
        toolbarHeight: 100,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {},
            ),
          )
        ],
      ),
      body: currentIndex == 0
          ? SingleChildScrollView(
              child: Container(
                color: Colors.blue,
                child: Stack(
                  children: [
                    Container(
                      child: Container(
                        height: 150,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.linear_scale_sharp,
                              size: 30,
                              color: Colors.blueGrey,
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: Container(
                        height: 500,
                        color: Colors.white,
                        width: double.infinity,
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("This Page is for List of Documents"),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                color: Colors.blue,
                child: Stack(
                  children: [
                    Container(
                      child: Container(
                        height: 150,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.linear_scale_sharp,
                              size: 30,
                              color: Colors.blueGrey,
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: Container(
                        height: 500,
                        color: Colors.white,
                        width: double.infinity,
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: GlassmorphicFlexContainer(
                                  borderRadius: 20,
                                  blur: 20,
                                  padding: EdgeInsets.all(40),
                                  alignment: Alignment.bottomCenter,
                                  border: 2,
                                  linearGradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color(0xff151515).withOpacity(0.2),
                                        Color(0xff151515).withOpacity(0.25),
                                      ],
                                      stops: [
                                        0.1,
                                        1,
                                      ]),
                                  borderGradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      const Color(0xFFffffff).withOpacity(0.5),
                                      Color((0xFFFFFFFF)).withOpacity(0.5),
                                    ],
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.all(20.0),
                                    alignment: Alignment.center,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  ZoomedFlow()),
                                        );
                                      },
                                      child: Image.asset(
                                        "assets/images/flow.jpeg",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.yellow,
        color: Colors.blue,
        items: const [
          FaIcon(
            FontAwesomeIcons.fileLines,
            size: 25,
          ),
          FaIcon(
            FontAwesomeIcons.stackOverflow,
            size: 25,
          ),
          FaIcon(
            FontAwesomeIcons.youtube,
            size: 25,
          ),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
          if (currentIndex == 2) {
            // var query = widget.docName.toString().replaceAll(" ", "+");
            var query = "Hello World";
            var url =
                Uri.parse("https://youtube.com/results?search_query=${query}");
            _launchUrl(url);
          }
        },
      ),
    );
  }
}

Future<void> _launchUrl(_url) async {
  if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) {
    throw 'Could not launch $_url';
  }
}
