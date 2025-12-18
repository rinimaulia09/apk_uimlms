import 'package:flutter/material.dart';

class MyClassesScreen extends StatelessWidget {
  const MyClassesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kelas Saya'),
        backgroundColor: const Color(0xFF006D34), // UIM Green
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Mata Kuliah yang Diambil',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  _buildClassCard(
                    context,
                    'Pemrograman Mobile',
                    'TI-3A / Ahmad Zain, M.Kom',
                    'Semester 3',
                    75,
                  ),
                  const SizedBox(height: 12),
                  _buildClassCard(
                    context,
                    'Basis Data',
                    'TI-2B / Budi Santoso, M.Kom',
                    'Semester 2',
                    60,
                  ),
                  const SizedBox(height: 12),
                  _buildClassCard(
                    context,
                    'Jaringan Komputer',
                    'TI-4A / Citra Dewi, M.T',
                    'Semester 4',
                    90,
                  ),
                  const SizedBox(height: 12),
                  _buildClassCard(
                    context,
                    'Algoritma dan Struktur Data',
                    'TI-1A / Dedi Kurniawan, M.Kom',
                    'Semester 1',
                    45,
                  ),
                  const SizedBox(height: 12),
                  _buildClassCard(
                    context,
                    'Sistem Operasi',
                    'TI-3B / Eka Putri, M.T',
                    'Semester 3',
                    30,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildClassCard(
    BuildContext context,
    String courseName,
    String classInfo,
    String semester,
    int progress,
  ) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {
          // Navigate to class detail page
          // For now, show a simple snackbar
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Navigasi ke detail kelas: $courseName'),
              backgroundColor: const Color(0xFF006D34),
            ),
          );
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                courseName,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                classInfo,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 4),
              Text(
                semester,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: LinearProgressIndicator(
                      value: progress / 100,
                      backgroundColor: Colors.grey[300],
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Color(0xFF006D34), // UIM Green
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '$progress%',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
