import 'package:flutter/material.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jadwal & Pengumuman'),
        backgroundColor: const Color(0xFF006D34), // UIM Green
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // UAS Schedule section
            const Text(
              'Jadwal UAS',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.red.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(Icons.schedule, color: Colors.red),
                        ),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Text(
                            'Jadwal UAS Semester Ganjil 2025/2026',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    _buildScheduleItem(
                      'Pemrograman Mobile',
                      '15 Januari 2026',
                      '08:00 - 10:00',
                      'Aula Utama',
                    ),
                    const SizedBox(height: 8),
                    _buildScheduleItem(
                      'Basis Data',
                      '16 Januari 2026',
                      '10:30 - 12:30',
                      'Lab Komputer 3',
                    ),
                    const SizedBox(height: 8),
                    _buildScheduleItem(
                      'Jaringan Komputer',
                      '17 Januari 2026',
                      '13:00 - 15:00',
                      'Lab Jaringan',
                    ),
                    const SizedBox(height: 8),
                    _buildScheduleItem(
                      'Algoritma & Struktur Data',
                      '18 Januari 2026',
                      '08:00 - 10:00',
                      'Ruang 301',
                    ),
                    const SizedBox(height: 8),
                    _buildScheduleItem(
                      'Sistem Operasi',
                      '19 Januari 2026',
                      '10:30 - 12:30',
                      'Ruang 302',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScheduleItem(
    String subject,
    String date,
    String time,
    String location,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.withValues(alpha: 0.3)),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(subject, style: const TextStyle(fontWeight: FontWeight.w500)),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(Icons.calendar_today, size: 14, color: Colors.grey),
              const SizedBox(width: 4),
              Text(
                date,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(width: 12),
              const Icon(Icons.access_time, size: 14, color: Colors.grey),
              const SizedBox(width: 4),
              Text(
                time,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(Icons.location_on, size: 14, color: Colors.grey),
              const SizedBox(width: 4),
              Text(
                location,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
