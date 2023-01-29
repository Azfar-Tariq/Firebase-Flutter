import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({
    super.key,
    required this.showLoginPage,
  });

  final VoidCallback showLoginPage;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // age controller
  final _ageController = TextEditingController();

  // confirm password controller
  final _confirmPasswordController = TextEditingController();

  // email controller
  final _emailController = TextEditingController();

  // first name controller
  final _firstNameController = TextEditingController();

  // last name controller
  final _lastNameController = TextEditingController();

  // hide/show passord
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  // password controller
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _ageController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future signUp() async {
    if (_firstNameController.text.isNotEmpty &&
        _lastNameController.text.isNotEmpty &&
        _ageController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _confirmPasswordController.text.isNotEmpty) {
      if (passwordConfirmed()) {
        // create user
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        // add user details
        addUserDetails(
          _firstNameController.text.trim(),
          _lastNameController.text.trim(),
          int.parse(_ageController.text.trim()),
          _emailController.text.trim(),
        );
      } else {
        Fluttertoast.showToast(msg: "Passwords don't match");
      }
    } else {
      Fluttertoast.showToast(msg: "Please enter all details");
    }
  }

  Future addUserDetails(
      String firstName, String lastName, int age, String email) async {
    await FirebaseFirestore.instance.collection('users').add({
      'first name': firstName,
      'last name': lastName,
      'age': age,
      'email': email,
    });
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmPasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.adb,
                    size: 80,
                  ),

                  const SizedBox(
                    height: 30,
                  ),

                  const Text(
                    "Hello There!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),

                  const SizedBox(
                    height: 40,
                  ),

                  // first name text field
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25.0,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(
                          12.0,
                        ),
                      ),
                      child: TextField(
                        textCapitalization: TextCapitalization.words,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        controller: _firstNameController,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(12.0),
                          border: InputBorder.none,
                          hintText: 'First Name',
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  // last name text field
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25.0,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(
                          12.0,
                        ),
                      ),
                      child: TextField(
                        textCapitalization: TextCapitalization.words,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        controller: _lastNameController,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(12.0),
                          border: InputBorder.none,
                          hintText: 'Last Name',
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  // age text field
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25.0,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(
                          12.0,
                        ),
                      ),
                      child: TextField(
                        textInputAction: TextInputAction.next,
                        controller: _ageController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(12.0),
                          border: InputBorder.none,
                          hintText: 'Age',
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  // email text field
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25.0,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(
                          12.0,
                        ),
                      ),
                      child: TextField(
                        textInputAction: TextInputAction.next,
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(12.0),
                          border: InputBorder.none,
                          hintText: 'Email',
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  // password field
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25.0,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(
                          12.0,
                        ),
                      ),
                      child: TextField(
                        textInputAction: TextInputAction.next,
                        controller: _passwordController,
                        obscureText: _obscurePassword,
                        decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                            child: Icon(
                              _obscurePassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                          contentPadding: const EdgeInsets.all(12.0),
                          border: InputBorder.none,
                          hintText: 'Password',
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  // confirm password field
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25.0,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(
                          12.0,
                        ),
                      ),
                      child: TextField(
                        textInputAction: TextInputAction.done,
                        controller: _confirmPasswordController,
                        obscureText: _obscureConfirmPassword,
                        decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _obscureConfirmPassword =
                                    !_obscureConfirmPassword;
                              });
                            },
                            child: Icon(
                              _obscureConfirmPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                          contentPadding: const EdgeInsets.all(12.0),
                          border: InputBorder.none,
                          hintText: 'Confirm Password',
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  // sign in button
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25.0,
                    ),
                    child: GestureDetector(
                      onTap: signUp,
                      child: Container(
                        padding: const EdgeInsets.all(
                          20.0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: const Center(
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  // sign up
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already a member',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: widget.showLoginPage,
                        child: Text(
                          ' Login Now',
                          style: TextStyle(
                            color: Colors.deepPurple[400],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
