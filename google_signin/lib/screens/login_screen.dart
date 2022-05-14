import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:google_signin/models/models.dart';
import 'package:google_signin/screens/home_screen.dart';
// import 'package:google_signin/services/db.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future loginUser() async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;

      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser != null) {
        // Obtain the auth details from the request
        final GoogleSignInAuthentication? googleAuth =
            await googleUser?.authentication;

        // Create a new credential
        final AuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

        try {
          final UserCredential userCredential =
              await auth.signInWithCredential(credential);

          // Once signed in, return the UserCredential

          // return await FirebaseAuth.instance.signInWithCredential(credential);

          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        } on FirebaseAuthException catch (e) {
          if (e.code == 'account-exists-with-different-credential') {
            //handle error
            print('account exist with different credential');
          } else if (e.code == 'invalid-credential') {
            //handle error
            print('invalid credential');
          }
        } catch (e) {
          //handle error
          print('something else');
        }
      }
    } catch (e) {
      print("ErrorFound");
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: TextFormField(
                controller: emailController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: TextFormField(
                controller: passwordController,
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  loginUser();
                },
                child: const Text("Login"))
          ],
        ),
      )),
    );
  }
}
