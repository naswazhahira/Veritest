import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';
import '../providers/quiz_provider.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/gradient_background.dart';
import '../widgets/primary_button.dart';
import '../widgets/user_avatar.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _name;
  final _current = TextEditingController();
  final _new = TextEditingController();

  @override
  void initState() {
    super.initState();
    _name = TextEditingController(text: context.read<AuthProvider>().user.name);
  }

  @override
  void dispose() {
    _name.dispose();
    _current.dispose();
    _new.dispose();
    super.dispose();
  }

  void _save() {
    if (!_formKey.currentState!.validate()) return;
    final auth = context.read<AuthProvider>();
    final email = auth.user.email;

    final error = auth.updateProfile(
      name: _name.text,
      currentPassword: _current.text,
      newPassword: _new.text,
    );
    if (error != null) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(error)));
      return;
    }
    context.read<QuizProvider>().renameUser(email, _name.text.trim());
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(const SnackBar(content: Text('Profil berhasil diperbarui')));
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<AuthProvider>().user;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profil'),
        backgroundColor: Colors.transparent,
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
                UserAvatar(name: _name.text.isEmpty ? user.name : _name.text, radius: 44),
                const SizedBox(height: 10),
                Text(user.email),
                const SizedBox(height: 24),
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
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10, top: 6),
                    child: Text('Ganti kata sandi (opsional)',
                        style: TextStyle(fontWeight: FontWeight.w600)),
                  ),
                ),
                AuthTextField(
                  controller: _current,
                  label: 'Kata sandi saat ini',
                  icon: Icons.lock_outline_rounded,
                  obscure: true,
                  validator: (v) => (_new.text.isNotEmpty && (v ?? '').isEmpty)
                      ? 'Isi kata sandi saat ini'
                      : null,
                ),
                AuthTextField(
                  controller: _new,
                  label: 'Kata sandi baru',
                  icon: Icons.lock_rounded,
                  obscure: true,
                  textInputAction: TextInputAction.done,
                  onSubmitted: _save,
                  validator: (v) => (v != null && v.isNotEmpty && v.length < 6)
                      ? 'Kata sandi minimal 6 karakter'
                      : null,
                ),
                const SizedBox(height: 6),
                SizedBox(
                  width: double.infinity,
                  child: PrimaryButton(
                    label: 'Simpan Perubahan',
                    icon: Icons.check_rounded,
                    onPressed: _save,
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