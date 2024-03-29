import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jsk_app/zoomedFlowDiagram.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:glassmorphism/glassmorphism.dart';

List<String> documentsList = [];

class DocumentInfo extends StatefulWidget {
  String cName;
  String docName;
  DocumentInfo({super.key, required this.cName, required this.docName});

  @override
  State<DocumentInfo> createState() => _DocumentInfoState();
}

class _DocumentInfoState extends State<DocumentInfo> {
  String? name = '';
  @override
  void initState() {
    getName();
    getDocuments(widget.cName, widget.docName);
    super.initState();
  }

  Future<void> getName() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('username');
    });
  }

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello ${name}!",
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
          Container(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Apply"),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(37, 98, 193, 1),
                    ),
                  )
                ],
              ),
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
                          child: ListView.builder(
                            itemCount: documentsList.length,
                            itemBuilder: (context, position) {
                              return Card(
                                elevation: 5,
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Text(
                                    documentsList[position],
                                    style: TextStyle(fontSize: 22.0),
                                  ),
                                ),
                              );
                            },
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
            var query = widget.docName.toString().replaceAll(" ", "+");
            var url =
                Uri.parse("https://youtube.com/results?search_query=${query}");
            _launchUrl(url);
          }
        },
      ),
    );
  }

  Future<void> getDocuments(String cName, String docData) async {
    DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection(cName).doc(docData).get();
    var snapData = snapshot.data().toString();

    final data = snapData.substring(12, snapData.length - 1);
    setState(() {
      documentsList = data.split(";");
    });
  }

  Future<void> _launchUrl(_url) async {
    if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $_url';
    }
  }
}
