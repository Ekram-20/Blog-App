import 'package:blog_app/views/blogs.dart';
import 'package:blog_app/widgets/button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var showPassword = false;
  var isLogin = false;

  void loginUser() async {
    setState(() => isLogin = true);
    try {
      // login user using auth firebase
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      User? user = credential.user;

      // get the user from firestore
      if (user != null) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get()
            .then((DocumentSnapshot documentSnapshot) {
          if (documentSnapshot.exists) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const BlogsPage(),
              ),
            );
          }
        });
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    } finally {
      setState(() => isLogin = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    var passwordIcon = showPassword ? const Icon(Icons.visibility_rounded) : const Icon(Icons.visibility_off);

    return Scaffold(
      body: Form(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/hello.png'),
                const Text(
                  'Login',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 30),

                // fields
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined),
                    label: Text('Email'),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  obscureText: showPassword,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      label: const Text('Password'),
                      suffixIcon: IconButton(
                        onPressed: () => setState(() => showPassword = !showPassword),
                        icon: passwordIcon,
                      )),
                ),
                const SizedBox(height: 40),

                // sign in
                Button(
                  onPressed: loginUser,
                  text: 'Sign in',
                  isLoading: isLogin,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
