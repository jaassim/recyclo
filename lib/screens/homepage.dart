import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:recyclo/models/user_model.dart';

void main() {
  runApp(const HomeScreen());
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const HomeScreenPage();
  }
}

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreenPage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TextButton(onPressed: () {
            setState(() {
              const HomeScreen();
            });
          },
            child: Text('recyclo', style: GoogleFonts.ubuntu(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold),),),
          backgroundColor: Colors.teal,
        ),
        bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
    child: Container(
      color: Colors.teal,
    height: 70,
    child: Row(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
    IconButton(
    iconSize: 30.0,
    padding: const EdgeInsets.only(left: 25.0),
    icon: const Icon(Icons.home),
    onPressed: () {
    setState(() {
    const HomeScreen();
    });
    },
    ),
      IconButton(
        iconSize: 30.0,
        padding: const EdgeInsets.only(left: 5.0),
        icon: const Icon(Icons.search),
        onPressed: () {
          setState(() {

          });
        },
      ),
    IconButton(
    iconSize: 30.0,
    padding: const EdgeInsets.only(right: 5.0),
    icon: const Icon(Icons.add),
    onPressed: (){
    setState(() {
    });
    },
    ),
    IconButton(
    iconSize: 30.0,
    padding: const EdgeInsets.only(left: 5.0),
    icon: const Icon(Icons.notifications),
    onPressed: () {
    setState(() {

    });
    },
    ),
    IconButton(
    iconSize: 30.0,
    padding: const EdgeInsets.only(right: 25.0),
    icon: const Icon(Icons.person),
    onPressed: () {
    setState(() {

    });
    },
    )
    ],
    ),
    ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text("hello!",textAlign: TextAlign.center, style: GoogleFonts.ubuntu(fontSize: 25,color: Colors.black54,),),

            ],
          ),
        ),
    );
  }
}
