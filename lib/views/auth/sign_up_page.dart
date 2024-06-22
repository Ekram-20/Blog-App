import 'package:blog_app/views/auth/sign_in_page.dart';
import 'package:blog_app/views/blogs.dart';
import 'package:blog_app/widgets/button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var emailController = TextEditingController();
  var userNameController = TextEditingController();
  var passwordController = TextEditingController();
  var showPassword = false;
  var isSignUp = false;

  void signUpUser() async {
    setState(() => isSignUp = true);
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      User? user = credential.user;

      if (user != null) {
        // save the user in firestore by his uid
        FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'user_type': 'user', // not admin
          'email': emailController.text,
          'username': userNameController,
          'password': passwordController.text,
        });

        // log to the app
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const BlogsPage(),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    } finally {
      setState(() => isSignUp = false);
    }
  }

  void pickImage() async {}

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
                const Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 30),

                // profile image
                const CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/images/profile.webp'),
                ),
                TextButton(
                  onPressed: pickImage,
                  child: const Text("Add Image"),
                ),

                const SizedBox(height: 10),

                // fields
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined),
                    label: Text('Email'),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: userNameController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    label: Text('Username'),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: passwordController,
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
                  onPressed: signUpUser,
                  text: 'Sign Up',
                  isLoading: isSignUp,
                ),

                // // go to sign up page
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignInPage(),
                      ),
                    );
                  },
                  child: const Text("Do you have an account, Sign in here"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
