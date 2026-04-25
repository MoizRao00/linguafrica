import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linguafrica/screens/Kids/Kids_Achievements.dart';
import 'package:linguafrica/screens/Kids/Kids_Lesson_Swahili.dart';
import 'package:linguafrica/screens/Kids/kids_quiz_screen.dart';
import 'package:linguafrica/screens/Kids/parents_potal.dart';

class KidsHomeMap extends StatefulWidget {
  const KidsHomeMap({super.key});

  @override
  State<KidsHomeMap> createState() => _KidsHomeMapState();
}

class _KidsHomeMapState extends State<KidsHomeMap> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEF9F3),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          _buildLoomTab(context),
          const KidsQuizScreen(),
          const KidsLessonSwahili(),
          const KidsAchievements(),
        ],
      ),
      bottomNavigationBar: _buildBottomNav(context),
    );
  }

  Widget _buildLoomTab(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          // Scrollable Map Content
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(height: 180), // Space for top header and progress bar
                SizedBox(
                  height: 1400, // Total height of the path
                  width: double.infinity,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      // Wavy Dashed Path
                      CustomPaint(
                        size: const Size(double.infinity, 1300),
                        painter: MapPathPainter(),
                      ),

                      // Nodes
                      _buildNode(
                        top: 20,
                        alignment: 0, // Center
                        title: 'ARABIC',
                        icon: Icons.public,
                        isCompleted: true,
                      ),

                      _buildNode(
                        top: 250,
                        alignment: 0.6, // Right
                        title: 'HAUSA',
                        icon: Icons.explore,
                        isCurrent: true,
                      ),

                      _buildNode(
                        top: 500,
                        alignment: 0.5, // Slightly right
                        title: 'ZULU',
                        isLocked: true,
                      ),

                      _buildNode(
                        top: 750,
                        alignment: -0.2, // Left
                        title: 'YORUBA',
                        isLocked: true,
                      ),

                      _buildNode(
                        top: 1000,
                        alignment: 0.7, // Right
                        title: 'AMHARIC',
                        isLocked: true,
                      ),

                      // Bottom Section: The Grand Tapestry
                      Positioned(
                        bottom: 50,
                        child: _buildGrandTapestry(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),

          // Top Header & Progress Bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              color: const Color(0xFFFEF9F3).withOpacity(0.9),
              child: Column(
                children: [
                  _buildTopHeader(context),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: _buildExpeditionProgress(),
                  ),
                ],
              ),
            ),
          ),
        ],
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

  Widget _buildBottomNav(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.transparent,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(color: Colors.white.withOpacity(0.5)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildNavItem(Icons.auto_awesome_mosaic, 'LOOM', 0),
                        _buildNavItem(Icons.question_answer, 'QUIZS', 1),
                        _buildNavItem(Icons.fitness_center_outlined, 'PRACTICE', 2),
                        _buildNavItem(Icons.bookmark_add, 'ACHIEVEMENTS', 3),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final bool isActive = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isActive)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFF1E9DB),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: const Color(0xFF735D01), size: 22),
            )
          else
            Icon(icon, color: Colors.grey[400], size: 22),
          const SizedBox(height: 2),
          Text(
            label,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 8,
              fontWeight: FontWeight.w800,
              color: isActive ? const Color(0xFF735D01) : Colors.grey[400],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExpeditionProgress() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Expedition Progress',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF735D01),
                ),
              ),
              Text(
                '4 / 11 Threads',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF007A33),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Stack(
            children: [
              Container(
                height: 12,
                decoration: BoxDecoration(
                  color: const Color(0xFFF1E9DB),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              FractionallySizedBox(
                widthFactor: 0.36,
                child: Container(
                  height: 12,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF735D01), Color(0xFFE9C849)],
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNode({
    required double top,
    required double alignment,
    required String title,
    IconData? icon,
    bool isCompleted = false,
    bool isCurrent = false,
    bool isLocked = false,
  }) {
    return Positioned(
      top: top,
      left: 0,
      right: 0,
      child: Align(
        alignment: Alignment(alignment, 0),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                // Glow/Halo
                if (isCurrent)
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFE9C849).withOpacity(0.5),
                          blurRadius: 30,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                  ),
                if (isCompleted)
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green.withOpacity(0.3),
                          blurRadius: 20,
                        ),
                      ],
                    ),
                  ),

                // Main Node Card
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: isLocked
                        ? const Color(0xFFF5EEDA)
                        : (isCurrent ? Colors.transparent : Colors.white),
                    gradient: isCurrent
                        ? const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xFF735D01), Color(0xFFE9C849)],
                          )
                        : null,
                    border: isCompleted
                        ? Border.all(color: Colors.green, width: 2)
                        : Border.all(color: Colors.white, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        isLocked ? Icons.lock_outline : (icon ?? Icons.language),
                        color: isLocked
                            ? Colors.grey[400]
                            : (isCurrent ? Colors.white : const Color(0xFF735D01)),
                        size: 30,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        title,
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 8,
                          fontWeight: FontWeight.w900,
                          color: isLocked
                              ? Colors.grey[400]
                              : (isCurrent ? Colors.white : const Color(0xFF735D01)),
                        ),
                      ),
                    ],
                  ),
                ),

                // Badge
                if (isCurrent)
                  Positioned(
                    bottom: -10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 5)
                        ],
                      ),
                      child: Text(
                        'CURRENT QUEST',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 7,
                          fontWeight: FontWeight.w900,
                          color: const Color(0xFF735D01),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGrandTapestry() {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 4),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 20),
                ],
              ),
              child: ClipOval(
                child: Image.asset(
                  "assets/kids onboarding cartoons.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          'THE GRAND TAPESTRY',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 18,
            fontWeight: FontWeight.w900,
            color: const Color(0xFF735D01),
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Complete all threads to unlock the\nMaster Weaver\'s secret!',
          textAlign: TextAlign.center,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF52452A),
          ),
        ),
      ],
    );
  }
}

class MapPathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF735D01).withOpacity(0.4)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path();
    path.moveTo(size.width / 2, 80);

    path.cubicTo(
      size.width / 2 - 100, 200,
      size.width / 2 + 200, 400,
      size.width / 2 + 50, 600,
    );

    path.cubicTo(
      size.width / 2 - 150, 800,
      size.width / 2 + 250, 1000,
      size.width / 2, 1250,
    );

    final dashPath = Path();
    const dashWidth = 8.0;
    const dashSpace = 8.0;
    double distance = 0.0;

    for (final pathMetric in path.computeMetrics()) {
      while (distance < pathMetric.length) {
        dashPath.addPath(
          pathMetric.extractPath(distance, distance + dashWidth),
          Offset.zero,
        );
        distance += dashWidth + dashSpace;
      }
    }

    canvas.drawPath(dashPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
