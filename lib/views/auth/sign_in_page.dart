import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  // void signIn() async {
  //   // login user
  //   try {
  //     final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: emailController.text,
  //       password: passwordController.text,
  //     );

  //     User? user = credential.user;

  //     if (user != null) {
  //       await FirebaseFirestore.instance
  //           .collection('users')
  //           .doc('students.${studentIdController.text}')
  //           .get()
  //           .then((DocumentSnapshot documentSnapshot) {
  //         if (documentSnapshot.exists) {
  //           Navigator.pushReplacement(
  //             context,
  //             MaterialPageRoute(
  //               builder: (context) => const StudentMainPage(),
  //             ),
  //           );
  //         }
  //       });
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       print('No user found for that email.');
  //     } else if (e.code == 'wrong-password') {
  //       print('Wrong password provided for that user.');
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Login'),
              const SizedBox(height: 40),
              TextFormField(
                decoration: const InputDecoration(
                  prefix: Icon(Icons.email_outlined),
                  label: Text('Email'),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  prefix: Icon(Icons.lock),
                  label: Text('Password'),
                  suffix: Icon(Icons.remove_red_eye_outlined),
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Sign in'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
