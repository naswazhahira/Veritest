import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/gradient_background.dart';
import '../widgets/primary_button.dart';
import '../routes/app_routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    final error = context
        .read<AuthProvider>()
        .login(email: _email.text, password: _password.text);
    if (error != null) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(error)));
    }
    // Jika berhasil, AuthGate otomatis menampilkan MainShell.
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final logoSize = (size.shortestSide * 0.3).clamp(90.0, 160.0);

    return Scaffold(
      body: GradientBackground(
        maxWidth: 460,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset('assets/images/logo.png',
                    width: logoSize, height: logoSize),
                const SizedBox(height: 12),
                const Text('Selamat datang',
                    style:
                    TextStyle(fontSize: 28, fontWeight: FontWeight.w700)),
                const SizedBox(height: 4),
                const Text('Masuk untuk mulai bermain kuis'),
                const SizedBox(height: 28),
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
                  textInputAction: TextInputAction.done,
                  onSubmitted: _submit,
                  validator: (v) => (v == null || v.isEmpty)
                      ? 'Kata sandi tidak boleh kosong'
                      : null,
                ),
                const SizedBox(height: 6),
                SizedBox(
                  width: double.infinity,
                  child: PrimaryButton(
                    label: 'Masuk',
                    icon: Icons.login_rounded,
                    onPressed: _submit,
                  ),
                ),
                const SizedBox(height: 12),
                TextButton(
                  onPressed: () => Navigator.of(context).pushNamed(AppRoutes.register),
                  child: const Text('Belum punya akun? Daftar'),
                ),
                const SizedBox(height: 4),
                const Text('Coba cepat: demo@kuis.com / 123456',
                    style: TextStyle(fontSize: 12)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}