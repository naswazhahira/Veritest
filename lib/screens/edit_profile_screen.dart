import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';
import '../providers/quiz_provider.dart';
import '../utils/avatars.dart';
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
  int? _avatar;

  @override
  void initState() {
    super.initState();
    final user = context.read<AuthProvider>().user;
    _name = TextEditingController(text: user.name);
    _avatar = user.avatarIndex;
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
      avatarIndex: _avatar,
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
      ..showSnackBar(
          const SnackBar(content: Text('Profil berhasil diperbarui')));
  }

  Widget _avatarImage(int i, double size) {
    return ClipOval(
      child: SizedBox(
        width: size,
        height: size,
        child: Transform.scale(
          scale: 1.35,
          child: Image.asset(
            avatarAssets[i],
            width: size,
            height: size,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(
              width: size,
              height: size,
              color: Colors.grey.shade700,
              child: const Icon(Icons.broken_image_rounded,
                  color: Colors.white70),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _pickAvatar() async {
    final primary = Theme.of(context).colorScheme.primary;

    final picked = await showDialog<int>(
      context: context,
      builder: (ctx) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Pilih avatar',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
              const SizedBox(height: 16),
              GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 14,
                crossAxisSpacing: 14,
                children: List.generate(avatarAssets.length, (i) {
                  final selected = _avatar == i;
                  return GestureDetector(
                    onTap: () => Navigator.of(ctx).pop(i),
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: selected ? primary : Colors.transparent,
                          width: 3,
                        ),
                      ),
                      child: LayoutBuilder(
                        builder: (_, c) => _avatarImage(i, c.maxWidth),
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(),
                child: const Text('Batal'),
              ),
            ],
          ),
        ),
      ),
    );

    if (picked != null) setState(() => _avatar = picked);
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
                GestureDetector(
                  onTap: _pickAvatar,
                  child: Stack(
                    children: [
                      UserAvatar(
                        name: _name.text.isEmpty ? user.name : _name.text,
                        radius: 44,
                        avatarIndex: _avatar,
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.edit_rounded,
                              size: 16, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Text(user.email),
                const SizedBox(height: 24),

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