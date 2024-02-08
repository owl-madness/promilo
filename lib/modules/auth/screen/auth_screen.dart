import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:promilo_app/modules/auth/controller/auth_provider.dart';
import 'package:promilo_app/modules/nav/screen/bottom_navigation_screen.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'promilo',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: Consumer<AuthProvider>(
              builder: (context, value, child) => Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.always,
                child: Column(
                  children: [
                    Gap(35),
                    Text(
                      'Hi, Welcome Back!',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    Gap(35),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0, bottom: 8),
                          child: Text(
                            'Please sign in to continue',
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                        ),
                        TextFormField(
                          controller: _usernameController,
                          decoration: InputDecoration(
                              hintText: 'Enter Email or Mob No.',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15))),
                          validator: value.validateEmail,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (username) => value.textChanged(
                              username.trim(), _passwordController.text.trim()),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                                onPressed: null,
                                child: Text(
                                  'Sign in With OTP',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.blue),
                                )),
                          ],
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0, bottom: 8),
                          child: Text('Password',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black)),
                        ),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: value.passwordVisible,
                          decoration: InputDecoration(
                              hintText: 'Enter Password',
                              suffixIcon: IconButton(
                                  onPressed: () => value.visibilityChanged(),
                                  icon: Icon(value.passwordVisible
                                      ? Icons.visibility_off
                                      : Icons.visibility)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15))),
                          onChanged: (password) => value.textChanged(
                              password.trim(), _passwordController.text.trim()),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: false,
                                  onChanged: null,
                                ),
                                Text('Remember Me')
                              ],
                            ),
                            TextButton(
                                onPressed: null,
                                child: Text('Forgot password',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.blue))),
                          ],
                        )
                      ],
                    ),
                    Gap(14),
                    Container(
                      width: double.maxFinite,
                      height: 55,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: value.validated
                              ? Color.fromRGBO(30, 108, 216, 1)
                              : Colors.grey),
                      child: TextButton(
                        onPressed: value.validated
                            ? () => value.loginUser(
                                context,
                                _usernameController.text.trim(),
                                _passwordController.text.trim())
                            : null,
                        child: Text(
                          'Submit',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Gap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                            width: MediaQuery.sizeOf(context).width * 40 / 100,
                            child: Divider()),
                        Text('or'),
                        SizedBox(
                            width: MediaQuery.sizeOf(context).width * 40 / 100,
                            child: Divider()),
                      ],
                    ),
                    Gap(20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            'assets/icons/google.png',
                            height: 30,
                            width: 30,
                          ),
                          Image.asset(
                            'assets/icons/linkedin.png',
                            height: 30,
                            width: 30,
                          ),
                          Image.asset(
                            'assets/icons/facebook.png',
                            height: 30,
                            width: 30,
                          ),
                          Image.asset(
                            'assets/icons/instagram.png',
                            height: 30,
                            width: 30,
                          ),
                          Image.asset(
                            'assets/icons/whatsapp.png',
                            height: 30,
                            width: 30,
                          ),
                        ],
                      ),
                    ),
                    Gap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Business User?'),
                            TextButton(
                                onPressed: null,
                                style: ButtonStyle(
                                    padding: MaterialStatePropertyAll(
                                        EdgeInsets.zero)),
                                child: Text('Login Here',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.blue))),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('Don\'t have an account'),
                            TextButton(
                                onPressed: null,
                                style: ButtonStyle(
                                    padding: MaterialStatePropertyAll(
                                        EdgeInsets.zero)),
                                child: Text('Sign Up',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.blue))),
                          ],
                        ),
                      ],
                    ),
                    Gap(15),
                    RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(children: [
                          TextSpan(
                              text: 'By continuing, you agree to\nPromilo\'s ',
                              children: [
                                TextSpan(
                                    text: 'Terms of Use & Privacy Policy',
                                    style: TextStyle(color: Colors.black))
                              ],
                              style: TextStyle(color: Colors.black45)),
                        ])),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
