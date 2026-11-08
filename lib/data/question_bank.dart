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
    Question(
      text: 'Ibu kota negara Australia adalah...',
      options: ['Sydney', 'Melbourne', 'Canberra', 'Perth'],
      answerIndex: 2,
      explanation: 'Canberra adalah ibu kota Australia, bukan Sydney atau Melbourne yang lebih terkenal.',
    ),
    Question(
      text: 'Benua terluas di dunia adalah...',
      options: ['Afrika', 'Asia', 'Eropa', 'Amerika Utara'],
      answerIndex: 1,
      explanation: 'Asia memiliki wilayah terluas sekaligus jumlah penduduk terbanyak.',
    ),
    Question(
      text: 'Rumus kimia air adalah...',
      options: ['H2O', 'CO2', 'O2', 'NaCl'],
      answerIndex: 0,
      explanation: 'Satu molekul air terdiri dari dua atom hidrogen dan satu atom oksigen.',
    ),
    Question(
      text: 'Candi Borobudur terletak di provinsi...',
      options: ['Jawa Barat', 'Jawa Tengah', 'DI Yogyakarta', 'Jawa Timur'],
      answerIndex: 1,
      explanation: 'Borobudur berada di Kabupaten Magelang, Jawa Tengah.',
    ),
    Question(
      text: 'Alat musik tradisional angklung berasal dari daerah...',
      options: ['Jawa Barat', 'Bali', 'Sumatera Utara', 'Papua'],
      answerIndex: 0,
      explanation: 'Angklung berasal dari masyarakat Sunda di Jawa Barat dan diakui UNESCO.',
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
    Question(
      text: 'Berapa hasil dari 15 + 27 × 2?',
      options: ['84', '69', '72', '54'],
      answerIndex: 1,
      explanation: 'Perkalian dikerjakan lebih dulu: 27 × 2 = 54, lalu 15 + 54 = 69.',
    ),
    Question(
      text: 'Keliling persegi dengan panjang sisi 9 cm adalah...',
      options: ['18 cm', '27 cm', '36 cm', '81 cm'],
      answerIndex: 2,
      explanation: 'Keliling persegi = 4 × sisi = 4 × 9 = 36 cm.',
    ),
    Question(
      text: 'Bentuk desimal dari 3/4 adalah...',
      options: ['0,25', '0,5', '0,75', '0,34'],
      answerIndex: 2,
      explanation: '3 ÷ 4 = 0,75.',
    ),
    Question(
      text: 'Berapa hasil dari 1000 − 468?',
      options: ['532', '542', '632', '568'],
      answerIndex: 0,
      explanation: '1000 − 468 = 532.',
    ),
    Question(
      text: 'Luas lingkaran dengan jari-jari 7 cm (π = 22/7) adalah...',
      options: ['44 cm²', '154 cm²', '308 cm²', '49 cm²'],
      answerIndex: 1,
      explanation: 'Luas = π × r² = 22/7 × 7 × 7 = 154 cm².',
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
    Question(
      text: 'CPU adalah singkatan dari...',
      options: [
        'Central Processing Unit',
        'Computer Personal Unit',
        'Central Program Utility',
        'Core Processing Update',
      ],
      answerIndex: 0,
      explanation: 'CPU adalah otak komputer yang memproses instruksi program.',
    ),
    Question(
      text: 'Ekstensi file yang umum dipakai untuk gambar adalah...',
      options: ['.mp3', '.jpg', '.exe', '.docx'],
      answerIndex: 1,
      explanation: '.jpg (JPEG) adalah format gambar yang sangat umum; .mp3 untuk audio dan .exe untuk program.',
    ),
    Question(
      text: 'Sistem bilangan biner hanya menggunakan angka...',
      options: ['0 dan 1', '1 dan 2', '0 sampai 9', '0 dan 2'],
      answerIndex: 0,
      explanation: 'Komputer merepresentasikan data dalam bit yang bernilai 0 atau 1.',
    ),
    Question(
      text: 'Perangkat berikut yang termasuk perangkat input adalah...',
      options: ['Monitor', 'Printer', 'Keyboard', 'Speaker'],
      answerIndex: 2,
      explanation: 'Keyboard memasukkan data ke komputer, sedangkan monitor, printer, dan speaker adalah output.',
    ),
    Question(
      text: 'Memori sementara yang isinya hilang saat komputer dimatikan adalah...',
      options: ['ROM', 'RAM', 'SSD', 'Flashdisk'],
      answerIndex: 1,
      explanation: 'RAM bersifat volatile, datanya hilang ketika daya terputus.',
    ),
  ];

  const List<Question> scienceQuestions = [
    Question(
      text: 'Gas yang paling banyak terdapat di atmosfer bumi adalah...',
      options: ['Oksigen', 'Nitrogen', 'Karbon dioksida', 'Hidrogen'],
      answerIndex: 1,
      explanation: 'Atmosfer bumi terdiri dari sekitar 78% nitrogen dan 21% oksigen.',
    ),
    Question(
      text: 'Proses tumbuhan membuat makanan dengan bantuan cahaya matahari disebut...',
      options: ['Respirasi', 'Fotosintesis', 'Transpirasi', 'Fermentasi'],
      answerIndex: 1,
      explanation: 'Fotosintesis mengubah air dan karbon dioksida menjadi glukosa dan oksigen.',
    ),
    Question(
      text: 'Satuan gaya dalam Sistem Internasional (SI) adalah...',
      options: ['Joule', 'Watt', 'Newton', 'Pascal'],
      answerIndex: 2,
      explanation: 'Newton (N) adalah satuan gaya, diambil dari nama Isaac Newton.',
    ),
    Question(
      text: 'Organ tubuh yang memompa darah ke seluruh tubuh adalah...',
      options: ['Paru-paru', 'Hati', 'Ginjal', 'Jantung'],
      answerIndex: 3,
      explanation: 'Jantung memompa darah melalui pembuluh darah ke seluruh tubuh.',
    ),
    Question(
      text: 'Air membeku pada suhu... pada tekanan normal.',
      options: ['0°C', '10°C', '32°C', '100°C'],
      answerIndex: 0,
      explanation: 'Titik beku air adalah 0°C, sedangkan titik didihnya 100°C.',
    ),
    Question(
      text: 'Planet yang dijuluki planet merah adalah...',
      options: ['Venus', 'Mars', 'Merkurius', 'Jupiter'],
      answerIndex: 1,
      explanation: 'Mars tampak merah karena permukaannya kaya besi oksida (karat).',
    ),
    Question(
      text: 'Lambang unsur kimia untuk emas adalah...',
      options: ['Ag', 'Fe', 'Au', 'Gd'],
      answerIndex: 2,
      explanation: 'Au berasal dari bahasa Latin "aurum" yang berarti emas.',
    ),
    Question(
      text: 'Hewan yang berkembang biak dengan cara bertelur disebut...',
      options: ['Vivipar', 'Ovipar', 'Ovovivipar', 'Herbivora'],
      answerIndex: 1,
      explanation: 'Ovipar adalah hewan yang bertelur, contohnya ayam dan burung.',
    ),
    Question(
      text: 'Kecepatan cahaya di ruang hampa kira-kira...',
      options: ['300.000 km/detik', '3.000 km/detik', '30.000 km/detik', '3 juta km/detik'],
      answerIndex: 0,
      explanation: 'Cahaya merambat sekitar 300.000 km per detik di ruang hampa.',
    ),
    Question(
      text: 'Bagian sel yang berfungsi sebagai pusat pengendali adalah...',
      options: ['Mitokondria', 'Ribosom', 'Inti sel', 'Membran sel'],
      answerIndex: 2,
      explanation: 'Inti sel (nukleus) menyimpan DNA dan mengatur aktivitas sel.',
    ),
  ];

  const List<Question> indonesianQuestions = [
    Question(
      text: 'Kalimat yang terdiri dari subjek dan predikat disebut kalimat...',
      options: ['Majemuk', 'Sederhana', 'Tanya', 'Perintah'],
      answerIndex: 1,
      explanation: 'Kalimat sederhana minimal memiliki subjek dan predikat.',
    ),
    Question(
      text: 'Huruf kapital digunakan pada awal...',
      options: ['Setiap kata', 'Kalimat', 'Paragraf saja', 'Kata kerja'],
      answerIndex: 1,
      explanation: 'Huruf kapital dipakai di awal kalimat, nama orang, dan nama tempat.',
    ),
    Question(
      text: 'Lawan kata (antonim) dari "rajin" adalah...',
      options: ['Giat', 'Tekun', 'Malas', 'Ulet'],
      answerIndex: 2,
      explanation: 'Antonim adalah kata yang maknanya berlawanan; lawan rajin adalah malas.',
    ),
    Question(
      text: 'Persamaan kata (sinonim) dari "cantik" adalah...',
      options: ['Elok', 'Buruk', 'Jelek', 'Kusam'],
      answerIndex: 0,
      explanation: 'Sinonim adalah kata yang maknanya sama atau mirip, yaitu elok.',
    ),
    Question(
      text: 'Tanda baca yang dipakai di akhir kalimat tanya adalah...',
      options: ['Titik (.)', 'Koma (,)', 'Tanda seru (!)', 'Tanda tanya (?)'],
      answerIndex: 3,
      explanation: 'Kalimat tanya diakhiri dengan tanda tanya.',
    ),
    Question(
      text: 'Penulisan kata baku yang benar adalah...',
      options: ['Apotik', 'Apotek', 'Apoteck', 'Apothek'],
      answerIndex: 1,
      explanation: 'Bentuk baku menurut KBBI adalah "apotek".',
    ),
    Question(
      text: 'Majas yang membandingkan dua hal secara langsung memakai kata "seperti" disebut...',
      options: ['Metafora', 'Hiperbola', 'Simile', 'Personifikasi'],
      answerIndex: 2,
      explanation: 'Simile (perumpamaan) memakai kata pembanding seperti, bagai, atau laksana.',
    ),
    Question(
      text: 'Ide pokok sebuah paragraf biasanya terdapat pada...',
      options: ['Kalimat utama', 'Judul saja', 'Kalimat penjelas', 'Kata terakhir'],
      answerIndex: 0,
      explanation: 'Kalimat utama memuat gagasan pokok yang dijelaskan kalimat lainnya.',
    ),
    Question(
      text: 'Kata "membaca" berasal dari kata dasar "baca" dan mendapat imbuhan...',
      options: ['Prefiks me-', 'Sufiks -an', 'Konfiks ke-an', 'Infiks -el-'],
      answerIndex: 0,
      explanation: 'Awalan me- ditambahkan pada kata dasar "baca" menjadi "membaca".',
    ),
    Question(
      text: 'Puisi adalah karya sastra yang terikat oleh...',
      options: ['Rima dan irama', 'Dialog tokoh', 'Latar waktu saja', 'Alur cerita'],
      answerIndex: 0,
      explanation: 'Puisi umumnya memakai rima, irama, dan pilihan kata yang padat.',
    ),
  ];