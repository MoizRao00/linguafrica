import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linguafrica/screens/Adults/Adult_Dashboard.dart';
import 'package:linguafrica/screens/Adults/Cultural_Feed.dart';
import 'package:linguafrica/screens/Adults/adults_library_favrouites.dart';
import 'package:linguafrica/screens/Adults/Adult_Daily_Challenges.dart';
import 'package:linguafrica/screens/App%20Settings/app_setting_screen.dart';

class LanguageSelection extends StatelessWidget {
  const LanguageSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFDF9),
      body: SafeArea(
        child: Column(
          children: [
            _buildTopBar(),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 32),
                      _buildHeroSection(),
                      const SizedBox(height: 40),
                      _buildLanguageCard(
                        language: 'Arabic',
                        desc: 'From the Hijazi roots to Maghreb & the Levant’s poetic variations.',
                        progress: 0.35,
                        color: const Color(0xFF005F8E),
                        level: 'Beginner',
                        icon: Icons.auto_stories_outlined,
                        isCurrentlySelected: true,
                        context: context,
                      ),
                      const SizedBox(height: 20),
                      _buildLanguageCard(
                        language: 'Swahili',
                        desc: 'The great Bantu trade language of the Swahili Coast.',
                        progress: 0.6,
                        color: const Color(0xFF007A33),
                        level: 'Weaver',
                        icon: Icons.account_balance_outlined,
                        context: context,
                      ),
                      const SizedBox(height: 20),
                      _buildLanguageCard(
                        language: 'Yoruba',
                        desc: 'Tonal beauty from the Nigerian heartland.',
                        progress: 0.2,
                        color: const Color(0xFF005F8E),
                        level: 'Initiate',
                        icon: Icons.airplanemode_active_outlined,
                        context: context,
                      ),
                      const SizedBox(height: 20),
                      _buildLanguageCard(
                        language: 'Zulu',
                        desc: 'The rhythmic clicks of the Southern Kingdom.',
                        progress: 0.05,
                        color: const Color(0xFF735D01),
                        level: 'Novice',
                        icon: Icons.location_on_outlined,
                        context: context,
                      ),
                      const SizedBox(height: 20),
                      _buildLanguageCard(
                        language: 'Amharic',
                        desc: 'Ancient Semitic script & tonal majesty.',
                        progress: 0.8,
                        color: const Color(0xFF735D01),
                        level: 'Advanced Weaver',
                        icon: Icons.grass_outlined,
                        cardBgColor: const Color(0xFFF1E9DB).withOpacity(0.5),
                        context: context,
                      ),
                      const SizedBox(height: 20),
                      _buildLanguageCard(
                        language: 'Hausa',
                        desc: 'Chadic rhythm across West and Central Africa.',
                        progress: 0.45,
                        color: const Color(0xFF005F8E),
                        level: 'Intermediate',
                        icon: Icons.grid_view_outlined,
                        cardBgColor: const Color(0xFFF0F7FF),
                        extraInfo: '08 Modules Left',
                        context: context,
                      ),
                      const SizedBox(height: 20),
                      _buildLanguageCard(
                        language: 'Igbo',
                        desc: 'Tonal nuances of South Eastern Nigeria.',
                        progress: 0.1,
                        color: const Color(0xFF735D01),
                        level: 'Start',
                        icon: Icons.architecture_outlined,
                        context: context,
                      ),
                      const SizedBox(height: 20),
                      _buildLanguageCard(
                        language: 'Oromo',
                        desc: 'Cushitic roots across East Africa.',
                        progress: 0.15,
                        color: const Color(0xFF007A33),
                        level: 'Start',
                        icon: Icons.landscape_outlined,
                        context: context,
                      ),
                      const SizedBox(height: 20),
                      _buildLanguageCard(
                        language: 'Fulani',
                        desc: 'The nomadic thread across 20+ countries.',
                        progress: 0.08,
                        color: const Color(0xFF005F8E),
                        level: 'Start',
                        icon: Icons.anchor_outlined,
                        context: context,
                      ),
                      const SizedBox(height: 20),
                      _buildLanguageCard(
                        language: 'Portuguese',
                        desc: 'The Lusophone thread across Africa.',
                        progress: 0.64,
                        color: const Color(0xFF007A33),
                        level: 'Intermediate',
                        icon: Icons.anchor_outlined,
                        cardBgColor: const Color(0xFFF1E9DB).withOpacity(0.5),
                        context: context,
                      ),
                      const SizedBox(height: 40),
                      _buildWhyThreadsSection(),
                      const SizedBox(height: 120),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(context),
    );
  }

  Widget _buildTopBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.menu, color: Color(0xFF705D00), size: 28),
          Text(
            'Linguafrica',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: const Color(0xFF705D00),
            ),
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFFFFD700), width: 1.5),
              image: const DecorationImage(
                image: AssetImage("assets/Parent Avatar.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'TALES • MEMORY • HISTORY • ROOTS',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 10,
            fontWeight: FontWeight.w800,
            color: const Color(0xFF007A33),
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 12),
        RichText(
          text: TextSpan(
            style: GoogleFonts.plusJakartaSans(
              fontSize: 36,
              fontWeight: FontWeight.w800,
              color: const Color(0xFF1D1B1E),
              height: 1.0,
            ),
            children: const [
              TextSpan(text: 'CHOOSE YOUR\n'),
              TextSpan(
                text: 'THREAD',
                style: TextStyle(color: Color(0xFF735D01), fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'In our ethnograpy, we don\'t just pick authors and poetry. From the shores of the Saharan to the vibrant streets of Lagos, your journey is intertwined and woven.',
          style: GoogleFonts.beVietnamPro(
            fontSize: 14,
            color: const Color(0xFF49454E),
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildLanguageCard({
    required String language,
    required String desc,
    required double progress,
    required Color color,
    required String level,
    required IconData icon,
    bool isCurrentlySelected = false,
    Color? cardBgColor,
    String? extraInfo,
    required BuildContext context,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AdultDashboard()),
        );
      },
      child: Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: cardBgColor ?? Colors.white,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        children: [
          if (isCurrentlySelected)
            Positioned(
              right: 0,
              top: 0,
              child: Opacity(
                opacity: 0.05,
                child: Icon(icon, size: 80, color: Colors.black),
              ),
            ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(icon, color: color, size: 24),
                  if (isCurrentlySelected)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: color.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'ACTIVE SELECTION',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 8,
                          fontWeight: FontWeight.w800,
                          color: color,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                language,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF1D1B1E),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                desc,
                style: GoogleFonts.beVietnamPro(
                  fontSize: 12,
                  color: const Color(0xFF49454E),
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    level,
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 10,
                      fontWeight: FontWeight.w800,
                      color: Colors.grey[600],
                    ),
                  ),
                  if (extraInfo != null)
                    Text(
                      extraInfo,
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: color,
                      ),
                    )
                  else
                    Text(
                      'Beginner',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                        color: Colors.grey[400],
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 8),
              Stack(
                children: [
                  Container(
                    height: 6,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF1E9DB),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  FractionallySizedBox(
                    widthFactor: progress,
                    child: Container(
                      height: 6,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      ),
    );
  }

  Widget _buildWhyThreadsSection() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 30,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
            child: Image.asset(
              "assets/African marketplace texture.png", // Corrected path
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Why these threads?',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: const Color(0xFF1D1B1E),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Linguafrica curates languages not just because they are ancient, but because they are living threads of a very long narrative of history.',
                  style: GoogleFonts.beVietnamPro(
                    fontSize: 14,
                    color: const Color(0xFF49454E),
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 32),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF735D01), Color(0xFFE9C849)],
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text(
                      'READ THE FULL ODYSSEY',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNav(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(24, 0, 24, 24),
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildActiveNavItem(Icons.auto_awesome_mosaic_outlined),
          GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AdultsLibraryFavourites())),
              child: _buildNavItem(Icons.book_outlined)),
          GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AdultDailyChallenges())),
              child: _buildNavItem(Icons.fitness_center_outlined)),
          GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const CulturalFeed())),
              child: _buildNavItem(Icons.feed_outlined)),
          GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AppSettingScreen())),
              child: _buildNavItem(Icons.settings_outlined)),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon) {
    return Icon(icon, color: Colors.grey[400], size: 24);
  }

  Widget _buildActiveNavItem(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        color: Color(0xFFF1E9DB),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: const Color(0xFF735D01), size: 24),
    );
  }
}
