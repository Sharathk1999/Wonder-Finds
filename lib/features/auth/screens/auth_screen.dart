import 'package:flutter/material.dart';
import 'package:wonder_finds/common/widgets/custom_button.dart';
import 'package:wonder_finds/common/widgets/custom_textfield.dart';

enum Auth {
  signIn,
  signUp,
}

class AuthScreen extends StatefulWidget {
  static const String routeName = "/auth-screen";
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signUp;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text(
                  "Welcome",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Quicksand",
                  ),
                ),
                //! create account tile
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.blueGrey,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    color: _auth == Auth.signUp
                        ? Colors.blueGrey[100]
                        : Colors.white,
                  ),
                  child: ListTile(
                    tileColor: _auth == Auth.signUp
                        ? Colors.blueGrey[300]
                        : Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    title: const Text(
                      "Create Account",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "Quicksand",
                      ),
                    ),
                    leading: Radio(
                      activeColor: Colors.blueGrey[800],
                      value: Auth.signUp,
                      groupValue: _auth,
                      onChanged: (val) {
                        setState(() {
                          _auth = val!;
                        });
                      },
                    ),
                  ),
                ),
                if (_auth == Auth.signUp)
                  Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(
                      top: 10,
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: Colors.blueGrey,
                        ),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blueGrey.withAlpha(30)),
                    child: Form(
                      key: _signUpFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextField(
                              controller: _nameController, hintText: "Name"),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                              controller: _emailController, hintText: "Email"),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                              controller: _passwordController,
                              hintText: "Password"),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomButton(
                            btnName: "Sign Up",
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ),

                //! sign in tile
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.blueGrey,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    color: _auth == Auth.signIn
                        ? Colors.blueGrey[100]
                        : Colors.white,
                  ),
                  child: ListTile(
                    title: const Text(
                      "Sign In",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "Quicksand",
                      ),
                    ),
                    leading: Radio(
                      activeColor: Colors.blueGrey[800],
                      value: Auth.signIn,
                      groupValue: _auth,
                      onChanged: (val) {
                        setState(() {
                          _auth = val!;
                        });
                      },
                    ),
                  ),
                ),
                if (_auth == Auth.signIn)
                  Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(
                      top: 10,
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: Colors.blueGrey,
                        ),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blueGrey.withAlpha(30)),
                    child: Form(
                      key: _signInFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextField(
                              controller: _emailController, hintText: "Email"),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                              controller: _passwordController,
                              hintText: "Password"),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomButton(
                            btnName: "Sign In",
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
