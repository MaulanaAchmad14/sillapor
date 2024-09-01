import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:importan_skripsi/pages/signup_page.dart';
import 'package:importan_skripsi/services/auth.dart';
import 'package:importan_skripsi/theme.dart';
import 'package:importan_skripsi/widgets/primary_button.dart';
import 'package:importan_skripsi/widgets/text_input.dart';

class SignInPages extends StatefulWidget {
  const SignInPages({super.key});

  @override
  State<SignInPages> createState() => _SignInPagesState();
}

class _SignInPagesState extends State<SignInPages> {
  TextEditingController emailText = TextEditingController();
  TextEditingController passwordText = TextEditingController();
  final key = GlobalKey<FormState>();

  void login() async {
    try {
      if (key.currentState?.validate() ?? false) {
        await AuthService.login(email: emailText.text, password: passwordText.text);
        if (mounted) Navigator.pushNamed(context, '/home');
      }
    } catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  void dispose() {
    emailText.dispose();
    passwordText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Text('Sign In', style: titleTextStyle),
            Text('Welcome to Importan', style: subTitleTextStyle),
            const SizedBox(height: 40),
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
            const SizedBox(height: 20),
            Form(
              key: key,
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Email Address', style: titleTextStyle.copyWith(fontSize: 14)),
                    const SizedBox(height: 8),
                    InputText(controller: emailText, validator: (value) => EmailValidator.validate(value!) ? null : 'Email tidak valid'),
                    const SizedBox(height: 10),
                    Text('Password', style: titleTextStyle.copyWith(fontSize: 14)),
                    const SizedBox(height: 8),
                    InputText(controller: passwordText, validator: (value) => value!.length > 8 ? null : 'Password minimal 8 karakter', obscure: true),
                    const SizedBox(height: 40),
                    PrimaryButton(label: "Sign In", onPressed: () => login()),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
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
          ],
        ),
      ),
    );
  }
}
