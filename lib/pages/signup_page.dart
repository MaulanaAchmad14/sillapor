import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:importan_skripsi/pages/signin_page.dart';
import 'package:importan_skripsi/services/create.dart';
import 'package:importan_skripsi/theme.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isEmailValid = true;
  bool isUploaded = false;

  final Create _create = Create();

  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController fullName = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  void dispose() {
    fullName.dispose();
    emailController.dispose();
    phone.dispose();
    password.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget uploadedImages() {
      return Center(
        child: InkWell(
          onTap: () {
            setState(() {
              isUploaded = !isUploaded;
            });
          },
          child: Column(
            children: [
              Image.asset(
                'assets/upload_pic.png',
                width: 120,
                height: 120,
              ),
            ],
          ),
        ),
      );
    }

    Widget showedImages() {
      return Center(
        child: InkWell(
          onTap: () {
            setState(() {
              isUploaded = !isUploaded;
            });
          },
          child: Column(
            children: [
              Image.asset(
                'assets/show_image.png',
                width: 120,
                height: 120,
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 70,
            left: 24,
            right: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sign Up',
                style: titleTextStyle,
              ),
              Text(
                'Create Account',
                style: subTitleTextStyle,
              ),
              const SizedBox(
                height: 40,
              ),
              isUploaded ? showedImages() : uploadedImages(),
              // Center(
              //   child: Column(
              //     children: [
              //       Image.asset(
              //         'assets/upload_pic.png',
              //         width: 120,
              //         height: 120,
              //       )
              //     ],
              //   ),
              // ),
              const SizedBox(
                height: 50,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Full Name',
                    style: titleTextStyle,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: fullName,
                    decoration: InputDecoration(
                      fillColor: const Color(0xffF1F0F5),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: BorderSide.none,
                      ),
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
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Phone',
                    style: titleTextStyle,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: phone,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                      fillColor: const Color(0xffF1F0F5),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: BorderSide.none,
                      ),
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
                        borderSide: BorderSide.none,
                      ),
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
                      color:
                          isEmailValid ? const Color(0xff4141A4) : const Color(0xffFD4F56),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
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
                    controller: password,
                    decoration: InputDecoration(
                      fillColor: const Color(0xffF1F0F5),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: BorderSide.none,
                      ),
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
                height: 50,
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
                  onPressed: () async {
                    if (_validateInput()) {
                      final String fullNameValue = fullName.text.toUpperCase();

                      final int phoneValue = int.tryParse(phone.text) ?? 0;

                      final String emailValue = emailController.text;
                      final String passwordValue = password.text;

                      await _create.addUser(
                          fullName: fullNameValue,
                          phone: phoneValue,
                          emailAddress: emailValue,
                          Password: passwordValue);

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const SignInPages()),
                      );
                    }
                  },
                  child: Text(
                    'Sign Up',
                    style: buttonTextStyle,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignInPages(),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 70.0),
                    child: Text(
                      'Back to Sign In',
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

  bool _validateInput() {
    if (fullName.text.isEmpty ||
        phone.text.isEmpty ||
        emailController.text.isEmpty ||
        password.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Mohon isi semua inputan.'),
        ),
      );
      return false;
    }
    return true;
  }
}
