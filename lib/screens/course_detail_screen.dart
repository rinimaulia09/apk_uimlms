import 'package:flutter/material.dart';
import 'package:apk_uimlms/screens/learning_materials_screen.dart';
import 'package:apk_uimlms/screens/assignment_screen.dart';
import 'package:apk_uimlms/screens/quiz_screen.dart';

class CourseDetailScreen extends StatefulWidget {
  final String courseName;
  final String courseCode;
  final String instructor;

  const CourseDetailScreen({
    super.key,
    required this.courseName,
    required this.courseCode,
    required this.instructor,
  });

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  List<Map<String, dynamic>>? _meetings;

  @override
  void initState() {
    super.initState();
    _meetings = _getMeetingsForCourse(widget.courseName);
  }

  List<Map<String, dynamic>> _getMeetingsForCourse(String courseName) {
    // Define course-specific meetings
    switch (courseName) {
      case 'Pemrograman Mobile':
        return [
          {
            'title': 'Pengantar Pemrograman Mobile',
            'description':
                'Konsep dasar pengembangan aplikasi mobile dan perbedaan platform',
            'materials': [
              {
                'title': 'Slide Pengantar',
                'file': 'Pengantar_Pemrograman_Mobile.pdf',
                'icon': Icons.picture_as_pdf,
                'color': Colors.red,
              },
              {
                'title': 'Referensi Flutter',
                'file': 'Referensi_Dart_dan_Flutter',
                'icon': Icons.link,
                'color': Colors.blue,
              },
            ],
            'assignments': [
              {'title': 'Tugas 1: Instalasi Flutter', 'deadline': '5 Jan 2026'},
            ],
            'quizzes': [
              {
                'title': 'Kuis 1: Konsep Dasar Mobile',
                'details': '10 soal • 20 menit',
              },
            ],
          },
          {
            'title': 'Dasar-Dasar Flutter',
            'description': 'Widget dasar, state management, dan lifecycle',
            'materials': [
              {
                'title': 'Slide Dasar Flutter',
                'file': 'Dasar_Dasar_Flutter.pdf',
                'icon': Icons.picture_as_pdf,
                'color': Colors.red,
              },
              {
                'title': 'Contoh Kode',
                'file': 'Contoh_Widget_Basic',
                'icon': Icons.code,
                'color': Colors.green,
              },
            ],
            'assignments': [
              {
                'title': 'Tugas 2: Membuat UI Sederhana',
                'deadline': '12 Jan 2026',
              },
            ],
            'quizzes': [
              {
                'title': 'Kuis 2: Widget Dasar',
                'details': '15 soal • 25 menit',
              },
            ],
          },
          {
            'title': 'State Management',
            'description': 'Provider, Riverpod, dan BLoC pattern',
            'materials': [
              {
                'title': 'Slide State Management',
                'file': 'State_Management.pdf',
                'icon': Icons.picture_as_pdf,
                'color': Colors.red,
              },
              {
                'title': 'Referensi Provider',
                'file': 'Referensi_Provider',
                'icon': Icons.link,
                'color': Colors.blue,
              },
            ],
            'assignments': [
              {
                'title': 'Tugas 3: Implementasi State Management',
                'deadline': '19 Jan 2026',
              },
            ],
            'quizzes': [
              {
                'title': 'Kuis 3: State Management',
                'details': '12 soal • 30 menit',
              },
            ],
          },
          {
            'title': 'Navigasi dan Routing',
            'description': 'Navigasi antar halaman dan passing data',
            'materials': [
              {
                'title': 'Slide Navigasi',
                'file': 'Navigasi_dan_Routing.pdf',
                'icon': Icons.picture_as_pdf,
                'color': Colors.red,
              },
              {
                'title': 'Contoh Navigasi',
                'file': 'Contoh_Navigasi',
                'icon': Icons.code,
                'color': Colors.green,
              },
            ],
            'assignments': [
              {
                'title': 'Tugas 4: Implementasi Navigasi',
                'deadline': '26 Jan 2026',
              },
            ],
            'quizzes': [
              {'title': 'Kuis 4: Navigasi', 'details': '10 soal • 25 menit'},
            ],
          },
          {
            'title': 'API Integration',
            'description': 'HTTP requests, REST API, dan data handling',
            'materials': [
              {
                'title': 'Slide API Integration',
                'file': 'API_Integration.pdf',
                'icon': Icons.picture_as_pdf,
                'color': Colors.red,
              },
              {
                'title': 'Referensi HTTP',
                'file': 'Referensi_HTTP',
                'icon': Icons.link,
                'color': Colors.blue,
              },
            ],
            'assignments': [
              {'title': 'Tugas 5: Implementasi API', 'deadline': '2 Feb 2026'},
            ],
            'quizzes': [
              {
                'title': 'Kuis 5: API Integration',
                'details': '15 soal • 35 menit',
              },
            ],
          },
        ];
      case 'Basis Data':
        return [
          {
            'title': 'Pengantar Basis Data',
            'description': 'Konsep dasar basis data dan model data',
            'materials': [
              {
                'title': 'Slide Pengantar',
                'file': 'Pengantar_Basis_Data.pdf',
                'icon': Icons.picture_as_pdf,
                'color': Colors.red,
              },
              {
                'title': 'Referensi ERD',
                'file': 'Referensi_ERD',
                'icon': Icons.link,
                'color': Colors.blue,
              },
            ],
            'assignments': [
              {'title': 'Tugas 1: Desain ERD', 'deadline': '6 Jan 2026'},
            ],
            'quizzes': [
              {
                'title': 'Kuis 1: Konsep Dasar',
                'details': '10 soal • 20 menit',
              },
            ],
          },
          {
            'title': 'SQL Dasar',
            'description': 'Query SELECT, INSERT, UPDATE, DELETE',
            'materials': [
              {
                'title': 'Slide SQL Dasar',
                'file': 'SQL_Dasar.pdf',
                'icon': Icons.picture_as_pdf,
                'color': Colors.red,
              },
              {
                'title': 'Contoh Query',
                'file': 'Contoh_Query_Basic',
                'icon': Icons.code,
                'color': Colors.green,
              },
            ],
            'assignments': [
              {'title': 'Tugas 2: Query SQL', 'deadline': '13 Jan 2026'},
            ],
            'quizzes': [
              {'title': 'Kuis 2: SQL Dasar', 'details': '15 soal • 25 menit'},
            ],
          },
          {
            'title': 'Relational Database',
            'description': 'Relasi antar tabel dan normalisasi',
            'materials': [
              {
                'title': 'Slide Relational DB',
                'file': 'Relational_Database.pdf',
                'icon': Icons.picture_as_pdf,
                'color': Colors.red,
              },
              {
                'title': 'Contoh Relasi',
                'file': 'Contoh_Relasi',
                'icon': Icons.code,
                'color': Colors.green,
              },
            ],
            'assignments': [
              {
                'title': 'Tugas 3: Implementasi Relasi',
                'deadline': '20 Jan 2026',
              },
            ],
            'quizzes': [
              {
                'title': 'Kuis 3: Relational DB',
                'details': '12 soal • 30 menit',
              },
            ],
          },
          {
            'title': 'Advanced SQL',
            'description': 'JOIN, Subquery, dan Function',
            'materials': [
              {
                'title': 'Slide Advanced SQL',
                'file': 'Advanced_SQL.pdf',
                'icon': Icons.picture_as_pdf,
                'color': Colors.red,
              },
              {
                'title': 'Contoh Query',
                'file': 'Contoh_Query_Advanced',
                'icon': Icons.code,
                'color': Colors.green,
              },
            ],
            'assignments': [
              {'title': 'Tugas 4: Query Kompleks', 'deadline': '27 Jan 2026'},
            ],
            'quizzes': [
              {
                'title': 'Kuis 4: Advanced SQL',
                'details': '15 soal • 35 menit',
              },
            ],
          },
          {
            'title': 'Database Design',
            'description': 'Optimasi dan desain skema database',
            'materials': [
              {
                'title': 'Slide Database Design',
                'file': 'Database_Design.pdf',
                'icon': Icons.picture_as_pdf,
                'color': Colors.red,
              },
              {
                'title': 'Best Practices',
                'file': 'Best_Practices',
                'icon': Icons.link,
                'color': Colors.blue,
              },
            ],
            'assignments': [
              {'title': 'Tugas 5: Desain Database', 'deadline': '3 Feb 2026'},
            ],
            'quizzes': [
              {
                'title': 'Kuis 5: Database Design',
                'details': '10 soal • 30 menit',
              },
            ],
          },
        ];
      case 'Jaringan Komputer':
        return [
          {
            'title': 'Pengantar Jaringan Komputer',
            'description': 'Model OSI, TCP/IP, dan dasar komunikasi jaringan',
            'materials': [
              {
                'title': 'Slide Pengantar',
                'file': 'Pengantar_Jaringan.pdf',
                'icon': Icons.picture_as_pdf,
                'color': Colors.red,
              },
              {
                'title': 'Model OSI',
                'file': 'Model_OSI',
                'icon': Icons.link,
                'color': Colors.blue,
              },
            ],
            'assignments': [
              {'title': 'Tugas 1: Analisis Protokol', 'deadline': '7 Jan 2026'},
            ],
            'quizzes': [
              {
                'title': 'Kuis 1: Konsep Dasar',
                'details': '10 soal • 20 menit',
              },
            ],
          },
          {
            'title': 'Layer Physical & Data Link',
            'description': 'Ethernet, MAC Address, dan switching',
            'materials': [
              {
                'title': 'Slide Layer Physical',
                'file': 'Layer_Physical.pdf',
                'icon': Icons.picture_as_pdf,
                'color': Colors.red,
              },
              {
                'title': 'Contoh Konfigurasi',
                'file': 'Contoh_Switching',
                'icon': Icons.code,
                'color': Colors.green,
              },
            ],
            'assignments': [
              {
                'title': 'Tugas 2: Konfigurasi Switch',
                'deadline': '14 Jan 2026',
              },
            ],
            'quizzes': [
              {'title': 'Kuis 2: Layer 1 & 2', 'details': '15 soal • 25 menit'},
            ],
          },
          {
            'title': 'Layer Network & Transport',
            'description': 'IP Addressing, Routing, TCP/UDP',
            'materials': [
              {
                'title': 'Slide Layer Network',
                'file': 'Layer_Network.pdf',
                'icon': Icons.picture_as_pdf,
                'color': Colors.red,
              },
              {
                'title': 'Contoh Routing',
                'file': 'Contoh_Routing',
                'icon': Icons.code,
                'color': Colors.green,
              },
            ],
            'assignments': [
              {
                'title': 'Tugas 3: Konfigurasi Router',
                'deadline': '21 Jan 2026',
              },
            ],
            'quizzes': [
              {'title': 'Kuis 3: Layer 3 & 4', 'details': '12 soal • 30 menit'},
            ],
          },
          {
            'title': 'Aplikasi Jaringan',
            'description': 'HTTP, DNS, DHCP, dan layanan jaringan',
            'materials': [
              {
                'title': 'Slide Aplikasi Jaringan',
                'file': 'Aplikasi_Jaringan.pdf',
                'icon': Icons.picture_as_pdf,
                'color': Colors.red,
              },
              {
                'title': 'Contoh Konfigurasi',
                'file': 'Contoh_DNS_DHCP',
                'icon': Icons.code,
                'color': Colors.green,
              },
            ],
            'assignments': [
              {
                'title': 'Tugas 4: Konfigurasi Layanan',
                'deadline': '28 Jan 2026',
              },
            ],
            'quizzes': [
              {
                'title': 'Kuis 4: Aplikasi Jaringan',
                'details': '15 soal • 35 menit',
              },
            ],
          },
          {
            'title': 'Keamanan Jaringan',
            'description': 'Firewall, VPN, dan enkripsi',
            'materials': [
              {
                'title': 'Slide Keamanan',
                'file': 'Keamanan_Jaringan.pdf',
                'icon': Icons.picture_as_pdf,
                'color': Colors.red,
              },
              {
                'title': 'Best Practices',
                'file': 'Best_Practices_Security',
                'icon': Icons.shield,
                'color': Colors.orange,
              },
            ],
            'assignments': [
              {
                'title': 'Tugas 5: Implementasi Keamanan',
                'deadline': '4 Feb 2026',
              },
            ],
            'quizzes': [
              {
                'title': 'Kuis 5: Keamanan Jaringan',
                'details': '10 soal • 30 menit',
              },
            ],
          },
        ];
      default:
        // Default meetings for any other course
        return [
          {
            'title': 'Pertemuan 1: Pengantar',
            'description': 'Pengenalan materi dan tujuan pembelajaran',
            'materials': [
              {
                'title': 'Slide Pengantar',
                'file': 'Pengantar_Mata_Kuliah.pdf',
                'icon': Icons.picture_as_pdf,
                'color': Colors.red,
              },
            ],
            'assignments': [
              {'title': 'Tugas 1: Pengenalan', 'deadline': '5 Jan 2026'},
            ],
            'quizzes': [
              {'title': 'Kuis 1: Pengantar', 'details': '10 soal • 20 menit'},
            ],
          },
          {
            'title': 'Pertemuan 2: Konsep Dasar',
            'description': 'Konsep-konsep dasar dalam mata kuliah',
            'materials': [
              {
                'title': 'Slide Konsep Dasar',
                'file': 'Konsep_Dasar.pdf',
                'icon': Icons.picture_as_pdf,
                'color': Colors.red,
              },
            ],
            'assignments': [
              {'title': 'Tugas 2: Latihan Dasar', 'deadline': '12 Jan 2026'},
            ],
            'quizzes': [
              {
                'title': 'Kuis 2: Konsep Dasar',
                'details': '10 soal • 20 menit',
              },
            ],
          },
          {
            'title': 'Pertemuan 3: Implementasi',
            'description': 'Penerapan konsep dalam praktik',
            'materials': [
              {
                'title': 'Slide Implementasi',
                'file': 'Implementasi.pdf',
                'icon': Icons.picture_as_pdf,
                'color': Colors.red,
              },
            ],
            'assignments': [
              {'title': 'Tugas 3: Implementasi', 'deadline': '19 Jan 2026'},
            ],
            'quizzes': [
              {
                'title': 'Kuis 3: Implementasi',
                'details': '10 soal • 20 menit',
              },
            ],
          },
          {
            'title': 'Pertemuan 4: Evaluasi',
            'description': 'Evaluasi dan review materi',
            'materials': [
              {
                'title': 'Slide Review',
                'file': 'Review_Materi.pdf',
                'icon': Icons.picture_as_pdf,
                'color': Colors.red,
              },
            ],
            'assignments': [
              {'title': 'Tugas 4: Evaluasi', 'deadline': '26 Jan 2026'},
            ],
            'quizzes': [
              {'title': 'Kuis 4: Evaluasi', 'details': '10 soal • 20 menit'},
            ],
          },
          {
            'title': 'Pertemuan 5: Penutup',
            'description': 'Ringkasan dan penutupan mata kuliah',
            'materials': [
              {
                'title': 'Slide Penutup',
                'file': 'Penutup_Mata_Kuliah.pdf',
                'icon': Icons.picture_as_pdf,
                'color': Colors.red,
              },
            ],
            'assignments': [
              {'title': 'Tugas 5: Final Project', 'deadline': '2 Feb 2026'},
            ],
            'quizzes': [
              {'title': 'Kuis 5: Final', 'details': '20 soal • 45 menit'},
            ],
          },
        ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.courseName),
        backgroundColor: const Color(0xFF006D34), // UIM Green
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Course header
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.courseName,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${widget.courseCode} • ${widget.instructor}',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const LinearProgressIndicator(
                        value: 0.75,
                        backgroundColor: Colors.grey,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Color(0xFF006D34),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        '75% Completed',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Course description
              const Text(
                'Deskripsi Mata Kuliah',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    _getCourseDescription(widget.courseName),
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Meetings section
              const Text(
                'Daftar Pertemuan',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),

              // Meeting list
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _meetings?.length ?? 0,
                itemBuilder: (context, index) {
                  final meeting = _meetings![index];
                  return _buildMeetingCard(context, index + 1, meeting);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMeetingCard(
    BuildContext context,
    int meetingNumber,
    Map<String, dynamic> meeting,
  ) {
    String title = meeting['title'] ?? 'Pertemuan $meetingNumber';
    String description = meeting['description'] ?? 'Deskripsi pertemuan';
    List materials = meeting['materials'] ?? [];
    List assignments = meeting['assignments'] ?? [];
    List quizzes = meeting['quizzes'] ?? [];

    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ExpansionTile(
        title: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          description,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Materi',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: materials.length,
                  itemBuilder: (context, index) {
                    final material = materials[index];
                    return _buildMaterialItem(
                      context,
                      material['title'],
                      material['file'],
                      material['icon'],
                      material['color'],
                    );
                  },
                ),
                const SizedBox(height: 16),

                const Text(
                  'Tugas',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: assignments.length,
                  itemBuilder: (context, index) {
                    final assignment = assignments[index];
                    return _buildAssignmentItem(
                      context,
                      assignment['title'],
                      assignment['deadline'],
                    );
                  },
                ),
                const SizedBox(height: 16),

                const Text(
                  'Kuis',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: quizzes.length,
                  itemBuilder: (context, index) {
                    final quiz = quizzes[index];
                    return _buildQuizItem(
                      context,
                      quiz['title'],
                      quiz['details'],
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getCourseDescription(String courseName) {
    switch (courseName) {
      case 'Pemrograman Mobile':
        return 'Mata kuliah ini membahas konsep dasar pengembangan aplikasi mobile menggunakan framework Flutter. Mahasiswa akan mempelajari dasar-dasar Flutter, state management, navigasi, integrasi API, dan best practices dalam pengembangan aplikasi mobile.';
      case 'Basis Data':
        return 'Mata kuliah ini membahas konsep dasar sistem basis data, model data relasional, SQL, dan desain database. Mahasiswa akan mempelajari cara merancang, mengimplementasikan, dan mengelola basis data yang efisien dan aman.';
      case 'Jaringan Komputer':
        return 'Mata kuliah ini membahas konsep dasar jaringan komputer, model OSI, protokol TCP/IP, dan infrastruktur jaringan. Mahasiswa akan mempelajari cara merancang, mengkonfigurasi, dan mengamankan jaringan komputer.';
      default:
        return 'Mata kuliah ini membahas konsep-konsep dasar dalam bidang studi yang relevan. Mahasiswa akan mempelajari teori dan praktik yang diperlukan untuk memahami dan menerapkan pengetahuan dalam konteks nyata.';
    }
  }

  Widget _buildMaterialItem(
    BuildContext context,
    String materialTitle,
    String title,
    IconData icon,
    Color color,
  ) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Icon(icon, color: color),
        ),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          // Navigate to learning materials screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LearningMaterialsScreen(
                materialTitle: materialTitle,
                courseName: widget.courseName,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildAssignmentItem(
    BuildContext context,
    String title,
    String deadline,
  ) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: Color(0xFF006D34),
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          child: const Icon(Icons.assignment, color: Colors.white),
        ),
        title: Text(title),
        subtitle: Text(deadline, style: const TextStyle(color: Colors.red)),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          // Navigate to assignment screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AssignmentScreen(
                assignmentTitle: title,
                courseName: widget.courseName,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildQuizItem(BuildContext context, String title, String details) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          child: const Icon(Icons.quiz, color: Colors.white),
        ),
        title: Text(title),
        subtitle: Text(details),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          // Navigate to quiz screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  QuizScreen(quizTitle: title, courseName: widget.courseName),
            ),
          );
        },
      ),
    );
  }
}
