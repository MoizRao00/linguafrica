import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linguafrica/screens/Kids/kids_home_map.dart';
import 'package:linguafrica/screens/Kids/Kids_Achievements.dart';
import 'package:linguafrica/screens/Kids/parents_potal.dart';

class KidsQuizScreen extends StatefulWidget {
  const KidsQuizScreen({super.key});

  @override
  State<KidsQuizScreen> createState() => _KidsQuizScreenState();
}

class _KidsQuizScreenState extends State<KidsQuizScreen> {
  int _currentQuestion = 4;
  final int _totalQuestions = 10;
  final double _progress = 0.4;
  int? _selectedAnswerIndex = 1; // Simba selected by default in the image

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFDF9),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // Top Navigation Bar
            _buildTopHeader(context),
            Expanded(
              child: Stack(
                children: [
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 16),
                          _buildHeader(),
                          const SizedBox(height: 12),
                          _buildProgressBar(),
                          const SizedBox(height: 40),
                          _buildQuestionTitle(),
                          const SizedBox(height: 24),
                          _buildAudioButton(),
                          const SizedBox(height: 40),
                          _buildOptionCard(
                            index: 0,
                            imagePath: 'assets/Zebra.png',
                            label: 'Punda milia',
                          ),
                          const SizedBox(height: 20),
                          _buildOptionCard(
                            index: 1,
                            imagePath: 'assets/Lion.png',
                            label: 'Simba',
                            isSelected: true,
                          ),
                          const SizedBox(height: 20),
                          _buildOptionCard(
                            index: 2,
                            imagePath: 'assets/Elephant.png',
                            label: 'Tembo',
                          ),
                          const SizedBox(height: 140), // Space for bottom nav and floating button
                        ],
                      ),
                    ),
                  ),
                  // Help Floating Button
                  Positioned(
                    right: 24,
                    bottom: 120,
                    child: Container(
                      width: 48,
                      height: 48,
                      decoration: const BoxDecoration(
                        color: Color(0xFF006D35),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.help_outline, color: Colors.white, size: 28),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildTopHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // User Avatar
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10)
              ],
              image: const DecorationImage(
                image: AssetImage('assets/Parent Avatar.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Logo/Name
          Text(
            "Linguafrican",
            style: GoogleFonts.plusJakartaSans(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: const Color(0xFF705D00),
            ),
          ),
          // Parental Portal Pill
          GestureDetector(
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => ParentsPortal())),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFCAE6FF),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  const Icon(Icons.child_care, size: 16, color: Color(0xFF004B70)),
                  const SizedBox(width: 6),
                  Text(
                    "Parental\nPortal",
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF004B70),
                      height: 1.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Settings
          IconButton(
            icon: const Icon(Icons.settings_outlined, color: Color(0xFF705D00)),
            onPressed: () => Navigator.pushNamed(context, '/settings'),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Lion Hunt!',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: const Color(0xFF735D01),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Question $_currentQuestion',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF1D1B1E),
              ),
            ),
            Text(
              'of $_totalQuestions',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Row(
            children: [
              const Icon(Icons.star, color: Color(0xFFFFD700), size: 22),
              const Icon(Icons.star, color: Color(0xFFFFD700), size: 22),
              Icon(Icons.star_border, color: const Color(0xFFEBE3D0), size: 22),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProgressBar() {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Container(
          height: 14,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFFF1E9DB),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              alignment: Alignment.centerLeft,
              children: [
                Container(
                  height: 14,
                  width: constraints.maxWidth * _progress,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF735D01), Color(0xFFE9C849)],
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Positioned(
                  left: (constraints.maxWidth * _progress) - 8,
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xFF735D01), width: 2),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _buildQuestionTitle() {
    return Column(
      children: [
        Text(
          'Which animal',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 28,
            fontWeight: FontWeight.w800,
            color: const Color(0xFF1D1B1E),
          ),
        ),
        Text(
          'says...',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 28,
            fontWeight: FontWeight.w800,
            color: const Color(0xFF1D1B1E),
          ),
        ),
      ],
    );
  }

  Widget _buildAudioButton() {
    return Column(
      children: [
        Container(
          width: 90,
          height: 90,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF735D01), Color(0xFFE9C849)],
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF735D01).withOpacity(0.3),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: const Icon(
            Icons.volume_up_rounded,
            color: Colors.white,
            size: 36,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFE9C849), width: 2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            'SIMBA',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 10,
              fontWeight: FontWeight.w800,
              color: const Color(0xFF735D01),
              letterSpacing: 1,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOptionCard({
    required int index,
    required String imagePath,
    required String label,
    bool isSelected = false,
  }) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(32),
            border: Border.all(
              color: isSelected ? const Color(0xFFFFD700) : Colors.transparent,
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 15,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: const Color(0xFF1D1B1E), // Dark background slot
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.asset(
                    imagePath,
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover, // Cover to fill rounded slot
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                label,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: isSelected ? const Color(0xFF735D01) : const Color(0xFF1D1B1E),
                ),
              ),
            ],
          ),
        ),
        if (isSelected)
          Positioned(
            right: -6,
            top: -6,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Color(0xFF86EFAC),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check,
                color: Colors.white,
                size: 18,
              ),
            ),
          ),
      ],
    );
  }
}
