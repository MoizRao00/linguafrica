import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linguafrica/screens/Kids/kids_home_map.dart';
import 'package:linguafrica/screens/Kids/kids_quiz_screen.dart';

class KidsAchievements extends StatelessWidget {
  const KidsAchievements({super.key});

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
                      _buildHeader(),
                      const SizedBox(height: 32),
                      _buildRankCard(),
                      const SizedBox(height: 40),
                      _buildAchievementCard(
                        title: 'Explorer of Swahili',
                        subtitle: 'Unlocked basic greetings',
                        badgeText: 'LEVEL 1 COMPLETE',
                        badgeColor: const Color(0xFFE7F6EC),
                        badgeTextColor: const Color(0xFF007A33),
                        icon: Icons.landscape,
                        iconBgColor: const Color(0xFFADF1B8),
                        iconColor: const Color(0xFF007A33),
                      ),
                      const SizedBox(height: 20),
                      _buildAchievementCard(
                        title: 'Word Weaver',
                        subtitle: 'Mastered 50 unique nouns',
                        badgeText: 'RARE BADGE',
                        badgeColor: const Color(0xFFE0F2FE),
                        badgeTextColor: const Color(0xFF005F8E),
                        icon: Icons.menu_book,
                        iconBgColor: const Color(0xFFBAE6FD),
                        iconColor: const Color(0xFF005F8E),
                      ),
                      const SizedBox(height: 20),
                      _buildAchievementCard(
                        title: 'First Flight',
                        subtitle: 'Completed first lesson',
                        badgeText: 'NEWEST',
                        badgeColor: const Color(0xFFFEF9C3),
                        badgeTextColor: const Color(0xFF735D01),
                        icon: Icons.airplanemode_active,
                        iconBgColor: const Color(0xFFFEF08A),
                        iconColor: const Color(0xFF735D01),
                      ),
                      const SizedBox(height: 20),
                      _buildAchievementCard(
                        title: 'Polyglot Prince',
                        subtitle: 'Learn 3 different languages',
                        badgeText: '',
                        isLocked: true,
                        icon: Icons.lock_outline,
                        iconBgColor: const Color(0xFFF3F4F6),
                        iconColor: Colors.grey,
                      ),
                      const SizedBox(height: 20),
                      _buildAchievementCard(
                        title: 'Night Owl',
                        subtitle: 'Completed 5 midnight lessons',
                        badgeText: 'HIDDEN ACHIEVEMENT',
                        badgeColor: const Color(0xFFFEE2E2),
                        badgeTextColor: const Color(0xFFB91C1C),
                        icon: Icons.local_fire_department,
                        iconBgColor: const Color(0xFFFECACA),
                        iconColor: const Color(0xFFB91C1C),
                      ),
                      const SizedBox(height: 32),
                      _buildPatternOfProgressCard(),
                      const SizedBox(height: 32),
                      _buildAchievementCard(
                        title: 'Animal Ally',
                        subtitle: 'Named all savanna mammals',
                        badgeText: 'COLLECTED',
                        badgeColor: const Color(0xFFFEF9C3),
                        badgeTextColor: const Color(0xFF735D01),
                        icon: Icons.pets,
                        iconBgColor: const Color(0xFFFEF08A),
                        iconColor: const Color(0xFF735D01),
                      ),
                      const SizedBox(height: 120), // Padding for bottom nav
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: _buildBottomNav(context),
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

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'YOUR',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 42,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF735D01),
                  height: 1.0,
                ),
              ),
              Text(
                'TROPHIES',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 42,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF735D01),
                  height: 1.0,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "You're weaving an amazing story! Keep exploring to fill your collection.",
                style: GoogleFonts.beVietnamPro(
                  fontSize: 14,
                  color: const Color(0xFF49454E),
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 20),
        Stack(
          alignment: Alignment.center,
          children: [
            const Icon(Icons.bookmark, color: Color(0xFFF1E9DB), size: 100),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 3),
              ),
              child: const Icon(Icons.star, color: Colors.white, size: 32),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRankCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 30,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF735D01), Color(0xFFE9C849)],
                  ),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.stars, color: Colors.white, size: 48),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CURRENT RANK',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFF005F8E),
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Savanna\nScout',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFF1D1B1E),
                        height: 1.1,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Next: Language Lion',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF1D1B1E),
                ),
              ),
              Text(
                '75%',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF735D01),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Stack(
            children: [
              Container(
                height: 12,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFF1E9DB),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              FractionallySizedBox(
                widthFactor: 0.75,
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
          const SizedBox(height: 20),
          Text(
            'Only 250 more words to reach the pride!',
            style: GoogleFonts.beVietnamPro(
              fontSize: 12,
              color: const Color(0xFF49454E),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAchievementCard({
    required String title,
    required String subtitle,
    required String badgeText,
    Color? badgeColor,
    Color? badgeTextColor,
    required IconData icon,
    required Color iconBgColor,
    required Color iconColor,
    bool isLocked = false,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: iconBgColor,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 30),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: isLocked ? Colors.grey[400] : const Color(0xFF1D1B1E),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: GoogleFonts.beVietnamPro(
              fontSize: 12,
              color: isLocked ? Colors.grey[400] : const Color(0xFF49454E),
            ),
          ),
          if (badgeText.isNotEmpty) ...[
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: badgeColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                badgeText,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 9,
                  fontWeight: FontWeight.w800,
                  color: badgeTextColor,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildPatternOfProgressCard() {
    return Container(
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        image: const DecorationImage(
          image: AssetImage("assets/Kids Achievements.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'The Pattern of Progress',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Every word you learn weaves a stronger connection to the world.',
                  style: GoogleFonts.beVietnamPro(
                    fontSize: 12,
                    color: Colors.white.withOpacity(0.8),
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
