import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:importan_skripsi/models/user_model.dart';
import 'package:importan_skripsi/pages/signin_page.dart';
import 'package:importan_skripsi/services/auth.dart';
import 'package:importan_skripsi/theme.dart';
import 'package:importan_skripsi/widgets/primary_button.dart';
import 'package:importan_skripsi/widgets/text_input.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isEmailValid = true;
  bool isUploaded = false;
  File? photo;

  final nameText = TextEditingController();
  final phoneText = TextEditingController();
  final emailText = TextEditingController();
  final passwordText = TextEditingController();

  final key = GlobalKey<FormState>();

  @override
  void dispose() {
    nameText.dispose();
    phoneText.dispose();
    emailText.dispose();
    passwordText.dispose();

    super.dispose();
  }

  void signUp() async {
    try {
      if (photo == null && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Photo cannot be empty')));
        return;
      }

      if (key.currentState?.validate() ?? false) {
        final user = UserModel(name: nameText.text, phone: phoneText.text);
        await AuthService.register(email: emailText.text, password: passwordText.text, image: photo!, user: user);
        if (mounted) Navigator.pushNamed(context, '/home');
      }
    } catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget uploadedImages() {
      return Center(
        child: InkWell(
          onTap: () async {
            final picker = ImagePicker();
            final file = await picker.pickImage(source: ImageSource.gallery);
            if (file != null) {
              photo = File(file.path);
              setState(() {});
            }
          },
          child: Column(
            children: [
              if (photo == null) ...[
                Image.asset('assets/upload_pic.png', width: 120, height: 120),
              ] else ...[
                ClipRRect(borderRadius: BorderRadius.circular(100), child: Image.file(photo!, width: 120, height: 120, fit: BoxFit.cover)),
              ]
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
              Image.asset('assets/show_image.png', width: 120, height: 120),
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
          child: Form(
            key: key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Sign Up', style: titleTextStyle),
                Text('Create Account', style: subTitleTextStyle),
                const SizedBox(height: 40),
                isUploaded ? showedImages() : uploadedImages(),
                const SizedBox(height: 50),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Full Name', style: titleTextStyle.copyWith(fontSize: 14)),
                    const SizedBox(height: 8),
                    InputText(controller: nameText, validator: (value) => value!.length < 8 ? 'Nama lengkap minmal 8 karakter' : null),
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Phone', style: titleTextStyle.copyWith(fontSize: 14)),
                    const SizedBox(height: 8),
                    InputText(controller: phoneText, validator: (value) => value!.length < 12 ? 'Nomor Telepon minimal 12 karakter' : null, formatter: [FilteringTextInputFormatter.digitsOnly]),
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Email', style: titleTextStyle.copyWith(fontSize: 14)),
                    const SizedBox(height: 8),
                    InputText(controller: emailText, validator: (value) => EmailValidator.validate(value!) ? null : 'Email tidak valid'),
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Password', style: titleTextStyle.copyWith(fontSize: 14)),
                    const SizedBox(height: 8),
                    InputText(controller: passwordText, validator: (value) => value!.length > 8 ? null : 'Password minimal 8 karakter', obscure: true),
                  ],
                ),
                const SizedBox(height: 50),
                PrimaryButton(label: "Sign Up", onPressed: signUp),
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
      ),
    );
  }
}
