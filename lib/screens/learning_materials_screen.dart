import 'package:flutter/material.dart';

class LearningMaterialsScreen extends StatelessWidget {
  final String materialTitle;
  final String courseName;

  const LearningMaterialsScreen({
    super.key,
    required this.materialTitle,
    required this.courseName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(materialTitle),
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
              // Material header
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
                        materialTitle,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        courseName,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Row(
                        children: [
                          Icon(Icons.access_time, size: 16, color: Colors.grey),
                          SizedBox(width: 4),
                          Text(
                            'Diperbarui: 15 Desember 2025',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Description section
              const Text(
                'Deskripsi Pembelajaran',
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
                    'Materi ini menjelaskan konsep dasar antarmuka pengguna dan prinsip-prinsip desain yang efektif. Anda akan mempelajari elemen-elemen desain antarmuka, hierarki visual, serta metode pengujian antarmuka pengguna. Materi disajikan dalam format teori dan studi kasus praktis.',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Attachments section
              const Text(
                'Lampiran',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),

              // PDF Files
              const Text(
                'Dokumen PDF',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              _buildAttachmentCard(
                'Pengantar UI Design.pdf',
                '1.2 MB • 24 halaman',
                Icons.picture_as_pdf,
                Colors.red,
                () {
                  // Handle PDF download/view
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Membuka dokumen PDF...'),
                      backgroundColor: Color(0xFF006D34),
                    ),
                  );
                },
              ),
              const SizedBox(height: 12),
              _buildAttachmentCard(
                'Prinsip Desain Antarmuka.pdf',
                '2.1 MB • 36 halaman',
                Icons.picture_as_pdf,
                Colors.red,
                () {
                  // Handle PDF download/view
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Membuka dokumen PDF...'),
                      backgroundColor: Color(0xFF006D34),
                    ),
                  );
                },
              ),
              const SizedBox(height: 24),

              // External Links
              const Text(
                'Tautan Eksternal',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              _buildAttachmentCard(
                'Referensi Desain Material',
                'material.io/design',
                Icons.link,
                Colors.blue,
                () {
                  // Handle external link
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Membuka tautan eksternal...'),
                      backgroundColor: Color(0xFF006D34),
                    ),
                  );
                },
              ),
              const SizedBox(height: 12),
              _buildAttachmentCard(
                'UI Patterns Collection',
                'uxarchive.com',
                Icons.link,
                Colors.blue,
                () {
                  // Handle external link
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Membuka tautan eksternal...'),
                      backgroundColor: Color(0xFF006D34),
                    ),
                  );
                },
              ),
              const SizedBox(height: 24),

              // Video Learning
              const Text(
                'Video Pembelajaran',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              _buildAttachmentCard(
                'Dasar-dasar UI Design',
                'Durasi: 15 menit',
                Icons.play_circle_fill,
                Colors.purple,
                () {
                  // Handle video play
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Memutar video pembelajaran...'),
                      backgroundColor: Color(0xFF006D34),
                    ),
                  );
                },
              ),
              const SizedBox(height: 12),
              _buildAttachmentCard(
                'Studi Kasus Desain Antarmuka',
                'Durasi: 22 menit',
                Icons.play_circle_fill,
                Colors.purple,
                () {
                  // Handle video play
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Memutar video pembelajaran...'),
                      backgroundColor: Color(0xFF006D34),
                    ),
                  );
                },
              ),
              const SizedBox(height: 24),

              // Zoom Meeting
              const Text(
                'Meeting Zoom (Sinkron)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              _buildAttachmentCard(
                'Diskusi Materi UI Design',
                'Jumat, 20 Desember 2025 • 14:00 WIB',
                Icons.videocam,
                Colors.green,
                () {
                  // Handle zoom meeting join
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Menghubungkan ke meeting Zoom...'),
                      backgroundColor: Color(0xFF006D34),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAttachmentCard(
    String title,
    String subtitle,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: color, size: 24),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}
