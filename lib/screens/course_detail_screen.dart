import 'package:flutter/material.dart';
import 'package:apk_uimlms/screens/learning_materials_screen.dart';
import 'package:apk_uimlms/screens/assignment_screen.dart';
import 'package:apk_uimlms/screens/quiz_screen.dart';

class CourseDetailScreen extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(courseName),
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
                        courseName,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '$courseCode • $instructor',
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
                    'Mata kuliah ini membahas konsep dasar desain antarmuka pengguna (User Interface Design) dengan pendekatan praktis dalam pengembangan aplikasi mobile dan web. Mahasiswa akan mempelajari prinsip-prinsip desain yang efektif, interaksi pengguna, dan metode pengujian antarmuka.',
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
                itemCount: 5,
                itemBuilder: (context, index) {
                  return _buildMeetingCard(context, index + 1);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMeetingCard(BuildContext context, int meetingNumber) {
    String title = '';
    String description = '';

    switch (meetingNumber) {
      case 1:
        title = 'Pengantar User Interface Design';
        description =
            'Konsep dasar UI Design dan prinsip-prinsip desain antarmuka';
        break;
      case 2:
        title = 'Konsep UI Design';
        description = 'Elemen-elemen desain antarmuka dan hierarki visual';
        break;
      case 3:
        title = 'Interaction Design';
        description = 'Prinsip desain interaksi dan pengalaman pengguna';
        break;
      case 4:
        title = 'UID Testing';
        description = 'Metode pengujian dan evaluasi desain antarmuka';
        break;
      case 5:
        title = 'Assessment';
        description = 'Evaluasi akhir dan presentasi proyek';
        break;
      default:
        title = 'Pertemuan $meetingNumber';
        description = 'Deskripsi pertemuan';
    }

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
                _buildMaterialItem(
                  context,
                  'Pengantar UI Design',
                  'Slide Pertemuan $meetingNumber.pdf',
                  Icons.picture_as_pdf,
                  Colors.red,
                ),
                const SizedBox(height: 8),
                _buildMaterialItem(
                  context,
                  'Referensi Desain Antarmuka',
                  'Referensi Tambahan',
                  Icons.link,
                  Colors.blue,
                ),
                const SizedBox(height: 16),

                const Text(
                  'Tugas',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                _buildAssignmentItem(
                  context,
                  'Tugas $meetingNumber: Latihan Desain',
                  'Deadline: 30 Des 2025',
                ),
                const SizedBox(height: 16),

                const Text(
                  'Kuis',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                _buildQuizItem(
                  context,
                  'Kuis $meetingNumber: Konsep Dasar',
                  '10 soal • 30 menit',
                ),
              ],
            ),
          ),
        ],
      ),
    );
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
                courseName: courseName,
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
                courseName: courseName,
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
                  QuizScreen(quizTitle: title, courseName: courseName),
            ),
          );
        },
      ),
    );
  }
}
