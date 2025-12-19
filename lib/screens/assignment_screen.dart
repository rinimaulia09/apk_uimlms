import 'package:flutter/material.dart';

class AssignmentScreen extends StatefulWidget {
  final String assignmentTitle;
  final String courseName;

  const AssignmentScreen({
    super.key,
    required this.assignmentTitle,
    required this.courseName,
  });

  @override
  State<AssignmentScreen> createState() => _AssignmentScreenState();
}

class _AssignmentScreenState extends State<AssignmentScreen> {
  bool _isSubmitted = false;
  String _submissionStatus = 'Belum Dikumpulkan';
  String _gradingStatus = 'Belum Dinilai';
  List<String> _uploadedFiles = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.assignmentTitle),
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
              // Assignment header
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
                        widget.assignmentTitle,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.courseName,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Icon(
                            _isSubmitted ? Icons.check_circle : Icons.pending,
                            color: _isSubmitted ? Colors.green : Colors.orange,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            _submissionStatus,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: _isSubmitted
                                  ? Colors.green
                                  : Colors.orange,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Assignment description
              const Text(
                'Deskripsi Tugas',
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
                    'Buatlah sebuah desain antarmuka pengguna untuk aplikasi mobile sesuai dengan prinsip-prinsip yang telah dipelajari. Desain harus mencakup minimal 5 halaman dengan interaksi yang jelas. Lampirkan file desain dalam format PDF atau ZIP.',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Deadline information
              const Text(
                'Informasi Tenggat Waktu',
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.access_time, color: Colors.red),
                          SizedBox(width: 8),
                          Text(
                            'Tenggat Waktu',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        '25 Desember 2025, 23:59 WIB',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                      const SizedBox(height: 12),
                      LinearProgressIndicator(
                        value: 0.7,
                        backgroundColor: Colors.grey[300],
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          Colors.red,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Sisa waktu: 5 hari 3 jam',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Uploaded files section
              const Text(
                'File yang Diunggah',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              if (_uploadedFiles.isEmpty)
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.upload_file,
                          size: 48,
                          color: Colors.grey,
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Belum ada file yang diunggah',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                )
              else
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: _uploadedFiles.map((fileName) {
                        return _buildFileItem(fileName);
                      }).toList(),
                    ),
                  ),
                ),
              const SizedBox(height: 24),

              // Grading status
              const Text(
                'Status Penilaian',
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Status:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: _gradingStatus == 'Sudah Dinilai'
                              ? Colors.green
                              : Colors.orange,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          _gradingStatus,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Actions
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    _showFilePickerDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF006D34),
                    padding: const EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  icon: const Icon(Icons.upload, color: Colors.white),
                  label: const Text(
                    'Unggah File',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isSubmitted
                      ? null
                      : () {
                          _submitAssignment(context);
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isSubmitted
                        ? Colors.grey
                        : const Color(0xFF006D34),
                    padding: const EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    _isSubmitted
                        ? 'Tugas Sudah Dikumpulkan'
                        : 'Kumpulkan Tugas',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFileItem(String fileName) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            const Icon(Icons.insert_drive_file, color: Colors.blue),
            const SizedBox(width: 12),
            Expanded(
              child: Text(fileName, style: const TextStyle(fontSize: 16)),
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                setState(() {
                  _uploadedFiles.remove(fileName);
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showFilePickerDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Unggah File'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.description, color: Colors.blue),
                title: const Text('Tugas_UI_Design.pdf'),
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    _uploadedFiles.add('Tugas_UI_Design.pdf');
                  });
                },
              ),
              ListTile(
                leading: const Icon(Icons.archive, color: Colors.orange),
                title: const Text('Desain_Aplikasi.zip'),
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    _uploadedFiles.add('Desain_Aplikasi.zip');
                  });
                },
              ),
              ListTile(
                leading: const Icon(Icons.add, color: Color(0xFF006D34)),
                title: const Text('Pilih dari Perangkat'),
                onTap: () {
                  Navigator.pop(context);
                  // In a real app, this would open the file picker
                  setState(() {
                    _uploadedFiles.add('Tugas_Mobile_App.pdf');
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _submitAssignment(BuildContext context) {
    if (_uploadedFiles.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Harap unggah file tugas terlebih dahulu'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Konfirmasi Pengumpulan'),
          content: const Text(
            'Apakah Anda yakin ingin mengumpulkan tugas ini? Pastikan file sudah benar.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  _isSubmitted = true;
                  _submissionStatus = 'Sudah Dikumpulkan';
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Tugas berhasil dikumpulkan!'),
                    backgroundColor: Color(0xFF006D34),
                  ),
                );
              },
              child: const Text(
                'Kumpulkan',
                style: TextStyle(color: Color(0xFF006D34)),
              ),
            ),
          ],
        );
      },
    );
  }
}
