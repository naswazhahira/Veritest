import 'package:flutter/foundation.dart';

import '../models/app_user.dart';

/// Autentikasi lokal (dummy, tanpa database). Data hilang saat app ditutup.
class AuthProvider extends ChangeNotifier {
  final List<AppUser> _users = [
    const AppUser(
      name: 'Demo User',
      email: 'demo@kuis.com',
      password: '123456',
    ),
  ];
  AppUser? _current;

  bool get isLoggedIn => _current != null;
  AppUser get user => _current!;

  /// Mengembalikan pesan error, atau null jika berhasil.
  String? register({
    required String name,
    required String email,
    required String password,
  }) {
    final e = email.trim().toLowerCase();
    if (_users.any((u) => u.email == e)) return 'Email sudah terdaftar';
    final newUser = AppUser(name: name.trim(), email: e, password: password);
    _users.add(newUser);
    _current = newUser; // otomatis login setelah daftar
    notifyListeners();
    return null;
  }

  /// Mengembalikan pesan error, atau null jika berhasil.
  String? login({required String email, required String password}) {
    final e = email.trim().toLowerCase();
    final matches = _users.where((u) => u.email == e && u.password == password);
    if (matches.isEmpty) return 'Email atau kata sandi salah';
    _current = matches.first;
    notifyListeners();
    return null;
  }

  /// Mengubah nama, dan kata sandi jika [newPassword] diisi.
  /// Mengembalikan pesan error, atau null jika berhasil.
  String? updateProfile({
    required String name,
    String? currentPassword,
    String? newPassword,
  }) {
    final old = _current!;
    final changingPassword = newPassword != null && newPassword.isNotEmpty;
    if (changingPassword && currentPassword != old.password) {
      return 'Kata sandi saat ini salah';
    }
    final updated = AppUser(
      name: name.trim(),
      email: old.email,
      password: changingPassword ? newPassword : old.password,
    );
    final i = _users.indexWhere((u) => u.email == old.email);
    _users[i] = updated;
    _current = updated;
    notifyListeners();
    return null;
  }

  void logout() {
    _current = null;
    notifyListeners();
  }
}