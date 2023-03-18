// @dart=2.9
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recyclo/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:recyclo/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;

  // string for displaying the error Message
  String errorMessage;


  // our form key
  final _formKey = GlobalKey<FormState>();
  // editing Controller
  final firstNameEditingController = new TextEditingController();
  final secondNameEditingController = new TextEditingController();
  final userNameEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final confirmPasswordEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    //first name field
    final firstNameField = TextFormField(
        autofocus: false,
        controller: firstNameEditingController,
        keyboardType: TextInputType.name,
        style: TextStyle(
            color: Colors.black87
        ),
        validator: (value) {
          RegExp regex = new RegExp(r'^.{3,}$');
          if (value.isEmpty) {
            return ("First Name cannot be Empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid name(Min. 3 Character)");
          }
          return null;
        },
        onSaved: (value) {
          firstNameEditingController.text = value;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          fillColor: Colors.black87,
          prefixIcon: Icon(Icons.account_circle, color: Colors.redAccent),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "first name",
          hintStyle: TextStyle(fontSize: 14.0, color: Colors.black87),
          enabledBorder:OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black87, width: 2.0),
            borderRadius: BorderRadius.circular(25.0),
          ),
        ));

    //second name field
    final secondNameField = TextFormField(
        autofocus: false,
        controller: secondNameEditingController,
        keyboardType: TextInputType.name,
        style: TextStyle(
            color: Colors.black87
        ),
        validator: (value) {
          if (value.isEmpty) {
            return ("Second Name cannot be Empty");
          }
          return null;
        },
        onSaved: (value) {
          secondNameEditingController.text = value;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          fillColor: Colors.black87,
          prefixIcon: Icon(Icons.account_circle, color: Colors.greenAccent),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "second name",
          hintStyle: TextStyle(fontSize: 14.0, color: Colors.black87),
          enabledBorder:OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black87, width: 2.0),
            borderRadius: BorderRadius.circular(25.0),
          ),
        ));

    final userNameField = TextFormField(
        autofocus: false,
        controller: userNameEditingController,
        keyboardType: TextInputType.name,
      style: TextStyle(
          color: Colors.black87
      ),
        validator: (value) {
          RegExp regex = new RegExp(r'^.{3,}$');
          if (value.isEmpty) {
            return ("User Name cannot be Empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid name(Min. 3 Character)");
          }
          return null;
        },
        onSaved: (value) {
          userNameEditingController.text = value;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          fillColor: Colors.black87,
          prefixIcon: Icon(Icons.account_circle, color: Colors.black87),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "username",
          hintStyle: TextStyle(fontSize: 14.0, color: Colors.black87),
          enabledBorder:OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black87, width: 2.0),
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
    );

    //email field
    final emailField = TextFormField(
        autofocus: false,
        controller: emailEditingController,
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(
            color: Colors.black87
        ),
        validator: (value) {
          if (value.isEmpty) {
            return ("Please Enter Your Email");
          }
          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please Enter a valid email");
          }
          return null;
        },
        onSaved: (value) {
          emailEditingController.text = value;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          fillColor: Colors.black87,
          prefixIcon: Icon(Icons.mail, color: Colors.lightBlueAccent),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "email",
          hintStyle: TextStyle(fontSize: 14.0, color: Colors.black87),
          enabledBorder:OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black87, width: 2.0),
            borderRadius: BorderRadius.circular(25.0),
          ),
        ));

    //password field
    final passwordField = TextFormField(
        style: TextStyle(
            color: Colors.black87
        ),
        autofocus: false,
        controller: passwordEditingController,
        obscureText: true,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{6,}$');
          if (value.isEmpty) {
            return ("Password is required for login");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Password(Min. 6 Character)");
          }
        },
        onSaved: (value) {
          passwordEditingController.text = value;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          fillColor: Colors.black87,
          prefixIcon: Icon(Icons.vpn_key, color: Colors.black87),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "password",
          hintStyle: TextStyle(fontSize: 14.0, color: Colors.black87),
          enabledBorder:OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black87, width: 2.0),
            borderRadius: BorderRadius.circular(25.0),
          ),
        ));

    //confirm password field
    final confirmPasswordField = TextFormField(
        style: TextStyle(
            color: Colors.black87
        ),
        autofocus: false,
        controller: confirmPasswordEditingController,
        obscureText: true,
        validator: (value) {
          if (confirmPasswordEditingController.text !=
              passwordEditingController.text) {
            return "Password don't match";
          }
          return null;
        },
        onSaved: (value) {
          confirmPasswordEditingController.text = value;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          fillColor: Colors.black87,
          prefixIcon: Icon(Icons.vpn_key, color: Colors.amber),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "confirm password",
          hintStyle: TextStyle(fontSize: 14.0, color: Colors.black87),
          enabledBorder:OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black87, width: 2.0),
            borderRadius: BorderRadius.circular(25.0),
          ),
        ));

    //signup button
    final signUpButton = Material(
      elevation: 5,
      color: Colors.teal,
      borderRadius: BorderRadius.circular(36),
      child: MaterialButton(
          padding: const EdgeInsets.all(12.0),
          onPressed: () {
            signUp(emailEditingController.text, passwordEditingController.text);
          },
          child: Text(
            "sign up",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 17, color: Colors.black87, fontWeight: FontWeight.bold),
          )),
    );
    return Stack( // <-- STACK AS THE SCAFFOLD PARENT
        children: [
    Container(
    decoration: BoxDecoration(
    image: DecorationImage(
        image: AssetImage("assets/home.png"), // <-- BACKGROUND IMAGE
    fit: BoxFit.fill,
    ),
    ),
    ),
    Scaffold(
    backgroundColor: Colors.transparent, // <-- SCAFFOLD WITH TRANSPARENT BG
    appBar: AppBar(
      centerTitle: true,
      title: const Text("be a recyclo", style: TextStyle(color: Colors.black87, fontSize: 25, fontFamily: 'Roboto',),),
    backgroundColor: Colors.transparent, // <-- APPBAR WITH TRANSPARENT BG
    elevation: 0,
    leading: IconButton(
    icon: Icon(Icons.arrow_back, color: Colors.white70),
    onPressed: () {
    // passing this to our root
    Navigator.of(context).pop();
    },
    ),
    ),
    body: Center(
    child: SingleChildScrollView(
    child: Container(
      color: Colors.transparent,
    width: 350,
    child: Padding(
    padding: const EdgeInsets.all(36.0),
    child: Form(
    key: _formKey,
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: <Widget>[
    SizedBox(
    height: 120,
    child: Image.asset(
    "assets/logo.png",
    fit: BoxFit.contain,
    )),
    SizedBox(height: 60),
    firstNameField,
    SizedBox(height: 5),
    secondNameField,
      SizedBox(height: 5),
      userNameField,
    SizedBox(height: 5),
    emailField,
    SizedBox(height: 5),
    passwordField,
    SizedBox(height: 5),
    confirmPasswordField,
    SizedBox(height: 5),
    signUpButton,
    SizedBox(height: 10),
    ],
    ),
    ),
    ),
    ),
    ),
    ),
    ),
    ]
    );

  }
  void signUp(String email, String password) async {
    if (_formKey.currentState.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore()})
            .catchError((e) {
          Fluttertoast.showToast(msg: e.message);
        });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";
            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage);
        print(error.code);
      }
    }
  }
  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user.email;
    userModel.uid = user.uid;
    userModel.firstName = firstNameEditingController.text;
    userModel.secondName = secondNameEditingController.text;
    userModel.userName = userNameEditingController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => HomeScreen()),
            (route) => false);
  }
}