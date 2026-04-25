import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linguafrica/screens/Kids/parents_potal.dart';

class KidsLessonSwahili extends StatelessWidget {
  const KidsLessonSwahili({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFDF9),
      body: SafeArea(
        child: Column(
          children: [
            _buildTopHeader(context),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      _buildLessonHeader(),
                      const SizedBox(height: 12),
                      _buildProgressBar(),
                      const SizedBox(height: 32),
                      _buildImageCard(),
                      const SizedBox(height: 32),
                      _buildWordDetails(),
                      const SizedBox(height: 32),
                      _buildPronunciationCard(),
                      const SizedBox(height: 40),
                      _buildActionButtons(),
                      const SizedBox(height: 40),
                      _buildCategoryButtons(),
                      const SizedBox(height: 120), // Padding for bottom nav
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: _buildBottomNav(),
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

  Widget _buildLessonHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Lesson: Swahili Savannah',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 14,
            fontWeight: FontWeight.w800,
            color: const Color(0xFF735D01),
          ),
        ),
        Row(
          children:  [
            Icon(Icons.star, color: Color(0xFF735D01), size: 18),
            Icon(Icons.star, color: Color(0xFF735D01), size: 18),
            Icon(Icons.star_half, color: Color(0xFF735D01), size: 18),
            Icon(Icons.star_border, color: Color(0xFFEBE3D0), size: 18),
          ],
        ),
      ],
    );
  }

  Widget _buildProgressBar() {
    return Stack(
      children: [
        Container(
          height: 12,
          decoration: BoxDecoration(
            color: const Color(0xFFF1E9DB),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        FractionallySizedBox(
          widthFactor: 0.45,
          child: Container(
            height: 12,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF005F8E), Color(0xFF4FA8FF)],
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildImageCard() {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: double.infinity,
          height: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(48),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 30,
                offset: const Offset(0, 15),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(36),
              child: Container(
                color: const Color(0xFF1D1B1E), // Background slot for image
                child: Image.asset(
                  "assets/Lion.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: -20,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFF007A33),
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF007A33).withOpacity(0.3),
                  blurRadius: 15,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.volume_up, color: Colors.white, size: 20),
                const SizedBox(width: 8),
                Text(
                  'SIMBA',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildWordDetails() {
    return Column(
      children: [
        Text(
          'Lion',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 42,
            fontWeight: FontWeight.w800,
            color: const Color(0xFF1D1B1E),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'The king of the savannah.',
          style: GoogleFonts.beVietnamPro(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF49454E),
          ),
        ),
      ],
    );
  }

  Widget _buildPronunciationCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF8F2),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Color(0xFFD2E9FF),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.record_voice_over_rounded, color: Color(0xFF005F8E), size: 22),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'HOW TO SAY IT',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                  color: Colors.grey[600],
                  letterSpacing: 0.5,
                ),
              ),
              Text(
                'SEEM-bah',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF007A33),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 64,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF735D01), Color(0xFFE9C849)],
            ),
            borderRadius: BorderRadius.circular(32),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF735D01).withOpacity(0.3),
                blurRadius: 15,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.play_circle_filled, color: Colors.white, size: 28),
              const SizedBox(width: 12),
              Text(
                'Listen',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          height: 64,
          decoration: BoxDecoration(
            color: const Color(0xFFF1E9DB),
            borderRadius: BorderRadius.circular(32),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Next Word',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF735D01),
                ),
              ),
              const SizedBox(width: 12),
              const Icon(Icons.arrow_forward_rounded, color: Color(0xFF735D01), size: 24),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryButtons() {
    return Column(
      children: [
        _buildCategoryItem('ANIMAL FAMILY', Icons.pets_rounded),
        const SizedBox(height: 12),
        _buildCategoryItem('IN THE WILD', Icons.landscape_rounded),
      ],
    );
  }

  Widget _buildCategoryItem(String title, IconData icon) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFF1E9DB).withOpacity(0.5),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Icon(icon, color: const Color(0xFF735D01), size: 28),
          const SizedBox(height: 8),
          Text(
            title,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 11,
              fontWeight: FontWeight.w800,
              color: const Color(0xFF1D1B1E),
            ),
          ),
        ],
      ),
    );
  }

  // Widget _buildBottomNav() {
  //   return Container(
  //     margin: const EdgeInsets.fromLTRB(24, 0, 24, 24),
  //     height: 80,
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.circular(40),
  //       boxShadow: [
  //         BoxShadow(
  //           color: Colors.black.withOpacity(0.08),
  //           blurRadius: 20,
  //           offset: const Offset(0, 4),
  //         ),
  //       ],
  //     ),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceAround,
  //       children: [
  //         _buildBottomNavItem(Icons.auto_awesome_mosaic_outlined, 'LOOM', false),
  //         _buildBottomNavItem(Icons.fitness_center_outlined, 'PRACTICE', true),
  //         _buildBottomNavItem(Icons.explore_outlined, 'EXPLORE', false),
  //         _buildBottomNavItem(Icons.book_outlined, 'LIBRARY', false),
  //         _buildBottomNavItem(Icons.person_outline, 'PROFILE', false),
  //       ],
  //     ),
  //   );
  // }

  // Widget _buildBottomNavItem(IconData icon, String label, bool isSelected) {
  //   if (isSelected) {
  //     return Container(
  //       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  //       decoration: BoxDecoration(
  //         color: const Color(0xFFF1E9DB),
  //         borderRadius: BorderRadius.circular(20),
  //       ),
  //       child: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           Icon(icon, color: const Color(0xFF735D01), size: 24),
  //           Text(
  //             label,
  //             style: GoogleFonts.plusJakartaSans(
  //               fontSize: 10,
  //               fontWeight: FontWeight.w800,
  //               color: const Color(0xFF735D01),
  //             ),
  //           ),
  //         ],
  //       ),
  //     );
  //   }
  //   return Column(
  //     mainAxisSize: MainAxisSize.min,
  //     children: [
  //       Icon(icon, color: Colors.grey[400], size: 24),
  //       Text(
  //         label,
  //         style: GoogleFonts.plusJakartaSans(
  //           fontSize: 10,
  //           fontWeight: FontWeight.w700,
  //           color: Colors.grey[400],
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
