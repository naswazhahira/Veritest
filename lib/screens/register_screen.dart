import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/gradient_background.dart';
import '../widgets/primary_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirm = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _password.dispose();
    _confirm.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    final error = context.read<AuthProvider>().register(
      name: _name.text,
      email: _email.text,
      password: _password.text,
    );
    if (error != null) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(error)));
    } else {
      // Tutup halaman daftar; AuthGate di belakangnya sudah beralih ke MainShell.
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final logoSize = (size.shortestSide * 0.3).clamp(90.0, 160.0);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: GradientBackground(
        maxWidth: 460,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset('assets/images/Logo_Veritest.png',
                    width: logoSize, height: logoSize),
                const SizedBox(height: 28),
                const Text('Buat akun',
                    style:
                    TextStyle(fontSize: 28, fontWeight: FontWeight.w700)),
                const SizedBox(height: 4),
                const Text('Daftar gratis dan mulai main kuis'),
                const SizedBox(height: 28),
                AuthTextField(
                  controller: _name,
                  label: 'Nama lengkap',
                  icon: Icons.person_rounded,
                  validator: (v) {
                    final t = v?.trim() ?? '';
                    if (t.isEmpty) return 'Nama tidak boleh kosong';
                    if (t.length < 2) return 'Nama minimal 2 karakter';
                    return null;
                  },
                ),
                AuthTextField(
                  controller: _email,
                  label: 'Email',
                  icon: Icons.email_rounded,
                  keyboardType: TextInputType.emailAddress,
                  validator: (v) {
                    final t = v?.trim() ?? '';
                    if (t.isEmpty) return 'Email tidak boleh kosong';
                    if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(t)) {
                      return 'Format email tidak valid';
                    }
                    return null;
                  },
                ),
                AuthTextField(
                  controller: _password,
                  label: 'Kata sandi',
                  icon: Icons.lock_rounded,
                  obscure: true,
                  validator: (v) => (v == null || v.length < 6)
                      ? 'Kata sandi minimal 6 karakter'
                      : null,
                ),
                AuthTextField(
                  controller: _confirm,
                  label: 'Ulangi kata sandi',
                  icon: Icons.lock_outline_rounded,
                  obscure: true,
                  textInputAction: TextInputAction.done,
                  onSubmitted: _submit,
                  validator: (v) =>
                  v != _password.text ? 'Kata sandi tidak sama' : null,
                ),
                const SizedBox(height: 6),
                SizedBox(
                  width: double.infinity,
                  child: PrimaryButton(
                    label: 'Daftar',
                    onPressed: _submit,
                  ),
                ),
                const SizedBox(height: 12),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text.rich(
                    const TextSpan(
                      text: 'Sudah punya akun? ',
                      children: [
                        TextSpan(
                          text: 'Masuk',
                          style: TextStyle(
                            color: Color(0xFF89AEFF),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // TextButton(
                //   onPressed: () => Navigator.of(context).pop(),
                //   child: const Text('Sudah punya akun? Masuk'),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}