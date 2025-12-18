import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifikasi & Pengumuman'),
        backgroundColor: const Color(0xFF006D34), // UIM Green
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Notifikasi Terbaru',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  _buildNotificationCard(
                    'Konfirmasi Pengumpulan Tugas',
                    'Tugas "Laporan Praktikum Basis Data" berhasil dikumpulkan pada 15 Des 2025, 14:30',
                    '2 jam yang lalu',
                    Icons.assignment_turned_in,
                    Colors.green,
                  ),
                  const SizedBox(height: 12),
                  _buildNotificationCard(
                    'Maintenance Sistem',
                    'Sistem akan dinonaktifkan untuk maintenance rutin pada 20 Des 2025, 00:00 - 04:00 WIB',
                    '1 hari yang lalu',
                    Icons.build,
                    Colors.orange,
                  ),
                  const SizedBox(height: 12),
                  _buildNotificationCard(
                    'Pengumuman Akademik',
                    'Jadwal UAS semester ganjil telah diumumkan. Silakan cek jadwal di SIM Akademik',
                    '2 hari yang lalu',
                    Icons.campaign,
                    Colors.blue,
                  ),
                  const SizedBox(height: 12),
                  _buildNotificationCard(
                    'Konfirmasi Absensi',
                    'Absensi mata kuliah Pemrograman Mobile telah dicatat untuk pertemuan hari ini',
                    '3 hari yang lalu',
                    Icons.check_circle,
                    Colors.green,
                  ),
                  const SizedBox(height: 12),
                  _buildNotificationCard(
                    'Pengumuman CeLOE',
                    'Tutorial penggunaan fitur baru di CeLOE tersedia di halaman bantuan',
                    '5 hari yang lalu',
                    Icons.info,
                    Colors.blue,
                  ),
                  const SizedBox(height: 12),
                  _buildNotificationCard(
                    'Batas Pengumpulan Tugas',
                    'Ingat! Batas pengumpulan tugas Pemrograman Mobile adalah besok pukul 23:59',
                    '1 minggu yang lalu',
                    Icons.warning,
                    Colors.red,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationCard(
    String title,
    String content,
    String timestamp,
    IconData icon,
    Color iconColor,
  ) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: iconColor, size: 24),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    content,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    timestamp,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
