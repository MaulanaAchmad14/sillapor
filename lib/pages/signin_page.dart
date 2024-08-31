import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:importan_skripsi/home/main_page.dart';
import 'package:importan_skripsi/pages/signup_page.dart';
import 'package:importan_skripsi/theme.dart';

class SignInPages extends StatefulWidget {
  const SignInPages({super.key});

  @override
  State<SignInPages> createState() => _SignInPagesState();
}

class _SignInPagesState extends State<SignInPages> {
  bool isEmailValid = true;

  TextEditingController emailController = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          padding: const EdgeInsets.only(
            top: 70,
            left: 24,
            right: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sign In',
                style: titleTextStyle,
              ),
              Text(
                'Welcome to Importan',
                style: subTitleTextStyle,
              ),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/illustration_one.png',
                      width: 262,
                      height: 240,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email Address',
                    style: titleTextStyle,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: emailController,
                    onChanged: (value) {
                      print(value);
                      bool isValid = EmailValidator.validate(value);
                      print(isValid);
                      if (isValid) {
                        setState(() {
                          isEmailValid = true;
                        });
                      } else {
                        setState(() {
                          isEmailValid = false;
                        });
                      }
                    },
                    decoration: InputDecoration(
                      fillColor: const Color(0xffF1F0F5),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: BorderSide(
                          color: isEmailValid
                              ? const Color(0xff4141A4)
                              : const Color(0xffFD4F56),
                        ),
                      ),
                      hintText: '',
                    ),
                    style: TextStyle(
                      color: isEmailValid
                          ? const Color(0xff4141A4)
                          : const Color(0xffFD4F56),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Password',
                    style: titleTextStyle,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      fillColor: const Color(0xffF1F0F5),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: const BorderSide(
                          color: Color(0xff4141A4),
                        ),
                      ),
                      hintText: '',
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: 400,
                height: 50,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xff4141A4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(66),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainPage(),
                      ),
                    );
                  },
                  child: Text(
                    'Sign In',
                    style: buttonTextStyle,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  bottom: 80,
                ),
                child: Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpPage(),
                        ),
                      );
                    },
                    child: Text(
                      'Create New Account',
                      style: GoogleFonts.poppins(
                        color: const Color(0xffB3B5C4),
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
