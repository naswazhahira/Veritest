  import '../models/question.dart';

/// Data dummy lokal (tanpa database).
const List<Question> flutterQuestions = [
  Question(
    text: 'Bahasa pemrograman apa yang digunakan untuk membuat aplikasi Flutter?',
    options: ['Kotlin', 'Dart', 'Swift', 'JavaScript'],
    answerIndex: 1,
    explanation: 'Flutter menggunakan bahasa Dart yang dikembangkan oleh Google.',
  ),
  Question(
    text: 'Widget mana yang tampilannya tidak berubah selama aplikasi berjalan?',
    options: ['StatefulWidget', 'InheritedWidget', 'StatelessWidget', 'AnimatedWidget'],
    answerIndex: 2,
    explanation: 'StatelessWidget bersifat immutable, tidak memiliki state internal.',
  ),
  Question(
    text: 'Method apa yang dipanggil agar UI pada StatefulWidget diperbarui?',
    options: ['build()', 'setState()', 'initState()', 'dispose()'],
    answerIndex: 1,
    explanation: 'setState() memberi tahu framework bahwa state berubah dan perlu build ulang.',
  ),
  Question(
    text: 'File apa yang dipakai untuk mendaftarkan dependency, asset, dan font?',
    options: ['main.dart', 'build.gradle', 'pubspec.yaml', 'analysis_options.yaml'],
    answerIndex: 2,
    explanation: 'pubspec.yaml adalah file konfigurasi utama proyek Flutter.',
  ),
  Question(
    text: 'Widget apa yang menyusun anak-anaknya secara vertikal?',
    options: ['Row', 'Stack', 'Column', 'Wrap'],
    answerIndex: 2,
    explanation: 'Column menyusun children dari atas ke bawah, Row dari kiri ke kanan.',
  ),
  Question(
    text: 'Apa fungsi fitur Hot Reload?',
    options: [
      'Menghapus cache aplikasi',
      'Menerapkan perubahan kode tanpa memulai ulang aplikasi',
      'Meng-compile aplikasi ke rilis',
      'Membuat proyek baru',
    ],
    answerIndex: 1,
    explanation: 'Hot Reload menyuntikkan kode baru ke Dart VM sehingga state tetap terjaga.',
  ),
  Question(
    text: 'Apa yang dilakukan Navigator.push()?',
    options: [
      'Menutup aplikasi',
      'Menghapus semua halaman',
      'Menambahkan halaman baru di atas tumpukan (stack) halaman',
      'Mengganti tema aplikasi',
    ],
    answerIndex: 2,
    explanation: 'Navigator mengelola stack route; push menambah, pop mengeluarkan route teratas.',
  ),
  Question(
    text: 'Widget apa yang menyediakan struktur dasar halaman seperti AppBar dan body?',
    options: ['Container', 'Scaffold', 'Padding', 'SizedBox'],
    answerIndex: 1,
    explanation: 'Scaffold adalah kerangka halaman Material Design.',
  ),
  Question(
    text: 'Keyword Dart mana yang dipakai untuk konstanta compile-time?',
    options: ['final', 'var', 'static', 'const'],
    answerIndex: 3,
    explanation: 'const nilainya sudah diketahui saat kompilasi, sedangkan final ditetapkan sekali saat runtime.',
  ),
  Question(
    text: 'Manakah yang termasuk package state management untuk Flutter?',
    options: ['Dio', 'Provider', 'Lottie', 'Sqflite'],
    answerIndex: 1,
    explanation: 'Provider memakai ChangeNotifier agar state dapat dibagikan ke banyak widget.',
  ),
];

  const List<Question> generalQuestions = [
    Question(
      text: 'Planet terbesar di tata surya adalah...',
      options: ['Saturnus', 'Jupiter', 'Neptunus', 'Bumi'],
      answerIndex: 1,
      explanation: 'Jupiter adalah planet terbesar, massanya lebih dari dua kali massa seluruh planet lain digabung.',
    ),
    Question(
      text: 'Siapa proklamator kemerdekaan Indonesia bersama Soekarno?',
      options: ['Sutan Sjahrir', 'Mohammad Hatta', 'Ki Hajar Dewantara', 'Tan Malaka'],
      answerIndex: 1,
      explanation: 'Soekarno dan Mohammad Hatta memproklamasikan kemerdekaan pada 17 Agustus 1945.',
    ),
    Question(
      text: 'Samudra terluas di dunia adalah...',
      options: ['Atlantik', 'Hindia', 'Arktik', 'Pasifik'],
      answerIndex: 3,
      explanation: 'Samudra Pasifik menutupi sekitar sepertiga permukaan bumi.',
    ),
    Question(
      text: 'Gunung tertinggi di dunia dari permukaan laut adalah...',
      options: ['K2', 'Kilimanjaro', 'Everest', 'Fuji'],
      answerIndex: 2,
      explanation: 'Gunung Everest setinggi sekitar 8.849 meter di atas permukaan laut.',
    ),
    Question(
      text: 'Hewan mamalia terbesar di dunia adalah...',
      options: ['Gajah afrika', 'Hiu paus', 'Paus biru', 'Jerapah'],
      answerIndex: 2,
      explanation: 'Paus biru adalah hewan terbesar yang pernah hidup di bumi.',
    ),
  ];

  const List<Question> mathQuestions = [
    Question(
      text: 'Berapa hasil dari 12 × 8?',
      options: ['86', '96', '104', '108'],
      answerIndex: 1,
      explanation: '12 × 8 = 96.',
    ),
    Question(
      text: 'Akar kuadrat dari 144 adalah...',
      options: ['10', '11', '12', '14'],
      answerIndex: 2,
      explanation: '12 × 12 = 144, jadi akarnya 12.',
    ),
    Question(
      text: '25% dari 80 adalah...',
      options: ['15', '20', '25', '30'],
      answerIndex: 1,
      explanation: '25% = 1/4, dan 80 ÷ 4 = 20.',
    ),
    Question(
      text: 'Jumlah seluruh sudut dalam sebuah segitiga adalah...',
      options: ['90°', '180°', '270°', '360°'],
      answerIndex: 1,
      explanation: 'Jumlah sudut dalam segitiga selalu 180°.',
    ),
    Question(
      text: 'Berapa hasil dari 7² + 3?',
      options: ['17', '49', '52', '56'],
      answerIndex: 2,
      explanation: '7² = 49, lalu 49 + 3 = 52.',
    ),
  ];

  const List<Question> techQuestions = [
    Question(
      text: 'HTML adalah singkatan dari...',
      options: [
        'HyperText Markup Language',
        'High Text Machine Language',
        'HyperTool Multi Language',
        'Home Text Markup Level',
      ],
      answerIndex: 0,
      explanation: 'HTML adalah bahasa markup untuk menyusun struktur halaman web.',
    ),
    Question(
      text: 'Sistem operasi smartphone buatan Google adalah...',
      options: ['iOS', 'Android', 'Windows Phone', 'HarmonyOS'],
      answerIndex: 1,
      explanation: 'Android dikembangkan dan dikelola oleh Google.',
    ),
    Question(
      text: 'Protokol yang mengamankan koneksi ke situs web adalah...',
      options: ['FTP', 'HTTP', 'HTTPS', 'SMTP'],
      answerIndex: 2,
      explanation: 'HTTPS mengenkripsi data antara browser dan server.',
    ),
    Question(
      text: 'Penyimpanan yang tidak memiliki bagian bergerak adalah...',
      options: ['HDD', 'SSD', 'Disket', 'CD-ROM'],
      answerIndex: 1,
      explanation: 'SSD memakai memori flash, sedangkan HDD punya piringan yang berputar.',
    ),
    Question(
      text: 'Git digunakan untuk...',
      options: [
        'Mendesain UI',
        'Melacak perubahan kode',
        'Mengompres gambar',
        'Menjalankan database',
      ],
      answerIndex: 1,
      explanation: 'Git adalah version control system untuk mencatat riwayat perubahan kode.',
    ),
  ];