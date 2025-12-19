import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  final String quizTitle;
  final String courseName;
  
  const QuizScreen({
    super.key,
    required this.quizTitle,
    required this.courseName,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> with TickerProviderStateMixin {
  late AnimationController _timerController;
  int _currentQuestionIndex = 0;
  int _timeLeft = 1800; // 30 minutes in seconds
  bool _isQuizFinished = false;
  double _score = 0.0;
  bool _isSubmitted = false;
  
  // Sample quiz data
  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'Apa prinsip utama dalam desain antarmuka pengguna?',
      'options': [
        'Warna cerah',
        'Kemudahan penggunaan',
        'Animasi berlebihan',
        'Font yang rumit',
      ],
      'correctAnswer': 1,
    },
    {
      'question': 'Apa fungsi dari hierarki visual dalam desain UI?',
      'options': [
        'Membuat desain lebih rumit',
        'Menyusun elemen berdasarkan tingkat kepentingan',
        'Mengurangi jumlah elemen',
        'Menambahkan lebih banyak warna',
      ],
      'correctAnswer': 1,
    },
    {
      'question': 'Apa yang dimaksud dengan affordance dalam desain UI?',
      'options': [
        'Kemampuan objek untuk memberi petunjuk cara penggunaannya',
        'Penggunaan warna kontras',
        'Pengaturan ukuran font',
        'Penempatan elemen secara acak',
      ],
      'correctAnswer': 0,
    },
    {
      'question': 'Apa tujuan dari prototyping dalam proses desain?',
      'options': [
        'Meningkatkan biaya proyek',
        'Menguji ide sebelum implementasi penuh',
        'Membuat dokumentasi desain',
        'Menunda proses pengembangan',
      ],
      'correctAnswer': 1,
    },
    {
      'question': 'Apa yang menjadi fokus utama dalam desain responsif?',
      'options': [
        'Warna yang digunakan',
        'Konsistensi di berbagai ukuran layar',
        'Jumlah animasi',
        'Kompleksitas navigasi',
      ],
      'correctAnswer': 1,
    },
  ];
  
  // Store user answers
  List<int?> _userAnswers = List.filled(5, null);

  @override
  void initState() {
    super.initState();
    _timerController = AnimationController(
      duration: Duration(seconds: _timeLeft),
      vsync: this,
    );
    
    // Start the timer
    _startTimer();
  }

  @override
  void dispose() {
    _timerController.dispose();
    super.dispose();
  }

  void _startTimer() {
    _timerController.forward();
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  void _navigateToQuestion(int index) {
    if (!_isSubmitted) {
      setState(() {
        _currentQuestionIndex = index;
      });
    }
  }

  void _selectAnswer(int optionIndex) {
    if (!_isSubmitted) {
      setState(() {
        _userAnswers[_currentQuestionIndex] = optionIndex;
      });
    }
  }

  void _submitQuiz() {
    if (_isSubmitted) return;
    
    // Calculate score
    int correctAnswers = 0;
    for (int i = 0; i < _questions.length; i++) {
      if (_userAnswers[i] == _questions[i]['correctAnswer']) {
        correctAnswers++;
      }
    }
    
    setState(() {
      _score = (correctAnswers / _questions.length) * 100;
      _isSubmitted = true;
      _isQuizFinished = true;
    });
    
    // Stop the timer
    _timerController.stop();
  }

  void _reviewAnswers() {
    setState(() {
      _isQuizFinished = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_isSubmitted) {
          return true;
        }
        
        return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Keluar dari Kuis'),
            content: const Text('Apakah Anda yakin ingin keluar? Jawaban Anda tidak akan disimpan.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('Batal'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Keluar'),
              ),
            ],
          ),
        )) ?? false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.quizTitle),
          backgroundColor: const Color(0xFF006D34), // UIM Green
          foregroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              if (_isSubmitted) {
                Navigator.pop(context);
              } else {
                // Show confirmation dialog
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Keluar dari Kuis'),
                    content: const Text('Apakah Anda yakin ingin keluar? Jawaban Anda tidak akan disimpan.'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Batal'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
                        child: const Text('Keluar'),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
          actions: [
            if (!_isQuizFinished)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const Icon(Icons.timer, color: Colors.white),
                    const SizedBox(width: 4),
                    Text(
                      _formatTime(_timeLeft),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
        body: _isQuizFinished
            ? _buildResultScreen()
            : _buildQuizScreen(),
      ),
    );
  }

  Widget _buildQuizScreen() {
    return Column(
      children: [
        // Progress indicator
        LinearProgressIndicator(
          value: (_currentQuestionIndex + 1) / _questions.length,
          backgroundColor: Colors.grey[300],
          valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF006D34)),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Question counter
                  Text(
                    'Soal ${_currentQuestionIndex + 1} dari ${_questions.length}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF006D34),
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // Question text
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        _questions[_currentQuestionIndex]['question'],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  
                  // Options
                  Column(
                    children: List.generate(
                      _questions[_currentQuestionIndex]['options'].length,
                      (index) => _buildOption(
                        index,
                        _questions[_currentQuestionIndex]['options'][index],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        
        // Navigation and submit button
        Container(
          padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: Colors.grey)),
          ),
          child: Column(
            children: [
              // Question navigation dots
              SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _questions.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => _navigateToQuestion(index),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: _userAnswers[index] != null
                              ? const Color(0xFF006D34)
                              : Colors.grey[300],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            '${index + 1}',
                            style: TextStyle(
                              color: _userAnswers[index] != null
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              
              // Navigation buttons
              Row(
                children: [
                  if (_currentQuestionIndex > 0)
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _currentQuestionIndex--;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[300],
                          padding: const EdgeInsets.all(16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Sebelumnya',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  if (_currentQuestionIndex > 0)
                    const SizedBox(width: 12),
                  if (_currentQuestionIndex < _questions.length - 1)
                    Expanded(
                      flex: 2,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _currentQuestionIndex++;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF006D34),
                          padding: const EdgeInsets.all(16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Selanjutnya',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  if (_currentQuestionIndex == _questions.length - 1)
                    Expanded(
                      flex: 2,
                      child: ElevatedButton(
                        onPressed: _userAnswers.every((answer) => answer != null)
                            ? _submitQuiz
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _userAnswers.every((answer) => answer != null)
                              ? const Color(0xFF006D34)
                              : Colors.grey,
                          padding: const EdgeInsets.all(16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Kumpulkan',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildOption(int index, String option) {
    bool isSelected = _userAnswers[_currentQuestionIndex] == index;
    
    return Card(
      elevation: 1,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: isSelected ? const Color(0xFF006D34) : Colors.transparent,
          width: 2,
        ),
      ),
      child: InkWell(
        onTap: () => _selectAnswer(index),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: isSelected ? const Color(0xFF006D34) : Colors.grey[300],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    String.fromCharCode(65 + index), // A, B, C, D
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  option,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
                  ),
                ),
              ),
              if (isSelected)
                const Icon(
                  Icons.check,
                  color: Color(0xFF006D34),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildResultScreen() {
    bool isPassed = _score >= 70;
    
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Result header
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Icon(
                      isPassed ? Icons.check_circle : Icons.cancel,
                      size: 64,
                      color: isPassed ? Colors.green : Colors.red,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      isPassed ? 'Selamat! Anda Lulus' : 'Tidak Lulus',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: isPassed ? Colors.green : Colors.red,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Nilai Akhir: ${_score.toStringAsFixed(1)}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            
            // Quiz statistics
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
                    const Text(
                      'Statistik Kuis',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildStatisticRow('Total Soal', '${_questions.length}'),
                    _buildStatisticRow('Jawaban Benar', 
                      '${_userAnswers.where((answer) => answer != null && _questions[_userAnswers.indexOf(answer)]['correctAnswer'] == answer).length}'),
                    _buildStatisticRow('Waktu Pengerjaan', _formatTime(1800 - _timeLeft)),
                    _buildStatisticRow('Status', 
                      isPassed ? 'Lulus' : 'Tidak Lulus',
                      isHighlighted: true,
                      isPositive: isPassed),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            
            // Review section
            const Text(
              'Review Jawaban',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            
            // Questions review
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _questions.length,
              itemBuilder: (context, index) {
                bool isCorrect = _userAnswers[index] == _questions[index]['correctAnswer'];
                
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.only(bottom: 12),
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
                                color: isCorrect ? Colors.green : Colors.red,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                'Soal ${index + 1}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Icon(
                              isCorrect ? Icons.check : Icons.close,
                              color: isCorrect ? Colors.green : Colors.red,
                            ),
                            const Spacer(),
                            Text(
                              isCorrect ? 'Benar' : 'Salah',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: isCorrect ? Colors.green : Colors.red,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          _questions[index]['question'],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Jawaban Anda: ${_userAnswers[index] != null ? String.fromCharCode(65 + _userAnswers[index]!) : 'Tidak dijawab'}',
                          style: TextStyle(
                            color: isCorrect ? Colors.green : Colors.red,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Jawaban Benar: ${String.fromCharCode(65 + _questions[index]['correctAnswer'])}',
                          style: const TextStyle(
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            
            const SizedBox(height: 24),
            
            // Action buttons
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF006D34),
                  padding: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Kembali ke Mata Kuliah',
                  style: TextStyle(
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
    );
  }

  Widget _buildStatisticRow(String label, String value, {bool isHighlighted = false, bool isPositive = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isHighlighted ? FontWeight.bold : FontWeight.normal,
              color: isHighlighted 
                ? (isPositive ? Colors.green : Colors.red) 
                : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}