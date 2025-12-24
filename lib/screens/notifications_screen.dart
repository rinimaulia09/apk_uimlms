import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Generate dynamic dates for notifications
    final now = DateTime.now();

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
                    'Tugas "Laporan Praktikum Basis Data" berhasil dikumpulkan pada ${_formatDate(now.subtract(const Duration(hours: 2)))}',
                    _formatTimeAgo(2),
                    Icons.assignment_turned_in,
                    Colors.green,
                  ),
                  const SizedBox(height: 12),
                  _buildNotificationCard(
                    'Maintenance Sistem',
                    'Sistem akan dinonaktifkan untuk maintenance rutin pada ${_formatDate(now.add(const Duration(days: 1)))}, 00:00 - 04:00 WIB',
                    _formatTimeAgo(1),
                    Icons.build,
                    Colors.orange,
                  ),
                  const SizedBox(height: 12),
                  _buildNotificationCard(
                    'Pengumuman Akademik',
                    'Jadwal UAS semester ganjil telah diumumkan. Silakan cek jadwal di SIM Akademik',
                    _formatTimeAgo(2),
                    Icons.campaign,
                    Colors.blue,
                  ),
                  const SizedBox(height: 12),
                  _buildNotificationCard(
                    'Konfirmasi Absensi',
                    'Absensi mata kuliah Pemrograman Mobile telah dicatat untuk pertemuan hari ini',
                    _formatTimeAgo(3),
                    Icons.check_circle,
                    Colors.green,
                  ),
                  const SizedBox(height: 12),
                  _buildNotificationCard(
                    'Pengumuman CeLOE',
                    'Tutorial penggunaan fitur baru di CeLOE tersedia di halaman bantuan',
                    _formatTimeAgo(5),
                    Icons.info,
                    Colors.blue,
                  ),
                  const SizedBox(height: 12),
                  _buildNotificationCard(
                    'Batas Pengumpulan Tugas',
                    'Ingat! Batas pengumpulan tugas Pemrograman Mobile adalah besok pukul 23:59',
                    _formatTimeAgo(7),
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

  String _formatDate(DateTime date) {
    return '${date.day} ${_getMonthName(date.month)} ${date.year}, ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  }

  String _formatTimeAgo(int hours) {
    if (hours < 24) {
      return '$hours jam yang lalu';
    } else {
      int days = (hours / 24).floor();
      if (days == 1) {
        return '1 hari yang lalu';
      } else {
        return '$days hari yang lalu';
      }
    }
  }

  String _getMonthName(int month) {
    const months = [
      '',
      'Januari',
      'Februari',
      'Maret',
      'April',
      'Mei',
      'Juni',
      'Juli',
      'Agustus',
      'September',
      'Oktober',
      'November',
      'Desember',
    ];
    return months[month];
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
                color: iconColor.withValues(alpha: 0.1),
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
