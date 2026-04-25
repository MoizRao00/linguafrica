import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linguafrica/screens/App%20Settings/Language_Selection.dart';
import 'package:linguafrica/screens/Adults/Cultural_Feed.dart';
import 'package:linguafrica/screens/Adults/Adult_Dashboard.dart';
import 'package:linguafrica/screens/App%20Settings/app_setting_screen.dart';

class AdultDailyChallenges extends StatelessWidget {
  const AdultDailyChallenges({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  _buildHeroCard(),
                  const SizedBox(height: 32),
                  _buildChallengeCard(
                    category: 'VOCALS',
                    title: 'Speak 5 Phrases',
                    description: 'Master the rhythm of Swahili by perfecting 5 essential greetings in the voice lab.',
                    icon: Icons.mic_none_outlined,
                    iconColor: const Color(0xFF007A33),
                    xp: '+15 XP',
                    actionLabel: 'Start',
                    isCompleted: false,
                  ),
                  const SizedBox(height: 20),
                  _buildChallengeCard(
                    category: 'CONTEXT',
                    title: 'Translate a Tweet',
                    description: 'Real-world practice. Decipher a trending tweet from Lagos using your Yoruba skills.',
                    icon: Icons.translate_outlined,
                    iconColor: const Color(0xFF005F8E),
                    xp: '',
                    actionLabel: 'Review',
                    isCompleted: true,
                  ),
                  const SizedBox(height: 20),
                  _buildChallengeCard(
                    category: 'FLASH',
                    title: '5-Min Rapid Fire',
                    description: 'Test your reflexes. 20 Zulu nouns in 300 seconds. Ready to move fast?',
                    icon: Icons.bolt_outlined,
                    iconColor: const Color(0xFF735D01),
                    xp: '5x',
                    actionLabel: 'Start',
                    isCompleted: false,
                    showTimer: true,
                  ),
                  const SizedBox(height: 32),
                  _buildWeeklyGrandChallenge(),
                  const SizedBox(height: 32),
                  _buildLeaderboardSnippet(),
                  const SizedBox(height: 120), // Padding for bottom nav
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTopBar(BuildContext context) {
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
          GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AppSettingScreen())),
            child: Container(
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
          ),
        ],
      ),
    );
  }

  Widget _buildHeroCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF735D01), Color(0xFFE9C849)],
        ),
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF735D01).withOpacity(0.3),
            blurRadius: 30,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'CURRENT STREAK: 12 DAYS',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 12,
              fontWeight: FontWeight.w800,
              color: Colors.white.withOpacity(0.8),
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'DAILY\nCHALLENGES',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 36,
              fontWeight: FontWeight.w800,
              color: Colors.white,
              height: 1.0,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Today's Goal: 3/5 Completed",
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              Text(
                "60%",
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
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
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              FractionallySizedBox(
                widthFactor: 0.6,
                child: Container(
                  height: 12,
                  decoration: BoxDecoration(
                    color: Colors.white,
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

  Widget _buildChallengeCard({
    required String category,
    required String title,
    required String description,
    required IconData icon,
    required Color iconColor,
    required String xp,
    required String actionLabel,
    required bool isCompleted,
    bool showTimer = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(24),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, color: iconColor, size: 28),
              Text(
                category,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                  color: Colors.grey[400],
                  letterSpacing: 1.0,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFF1D1B1E),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      description,
                      style: GoogleFonts.beVietnamPro(
                        fontSize: 13,
                        color: const Color(0xFF49454E),
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              if (showTimer) ...[
                const SizedBox(width: 12),
                _buildCircularTimer(),
              ]
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (isCompleted)
                Row(
                  children: [
                    const Icon(Icons.check_circle, color: Color(0xFF007A33), size: 18),
                    const SizedBox(width: 6),
                    Text(
                      'DONE',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFF007A33),
                      ),
                    ),
                  ],
                )
              else if (xp.isNotEmpty)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1E9DB),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    xp,
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF735D01),
                    ),
                  ),
                )
              else
                const SizedBox(),
              Text(
                actionLabel,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: isCompleted ? const Color(0xFF1D1B1E) : const Color(0xFF735D01),
                  decoration: isCompleted ? null : null,
                ),
              ),
              if (!isCompleted)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF735D01), Color(0xFFE9C849)],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Start',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCircularTimer() {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 60,
          height: 60,
          child: CircularProgressIndicator(
            value: 0.15,
            strokeWidth: 4,
            backgroundColor: const Color(0xFFF1E9DB),
            valueColor: AlwaysStoppedAnimation<Color>(const Color(0xFF735D01).withOpacity(0.2)),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: const Color(0xFFFFEBEE),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            'FLASH',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 8,
              fontWeight: FontWeight.w900,
              color: Colors.red[400],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildWeeklyGrandChallenge() {
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
              "assets/Market Scene.png",
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              children: [
                Text(
                  'Weekly Grand\nChallenge: The\nMarketplace',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: const Color(0xFF1D1B1E),
                    height: 1.1,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Embark on a virtual walk-through of Addis Ababa market. Use your Amharic to negotiate prices for these local gems.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.beVietnamPro(
                    fontSize: 14,
                    color: const Color(0xFF49454E),
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.stars, color: Color(0xFF735D01), size: 20),
                    const SizedBox(width: 8),
                    Text(
                      '500 Bonus XP',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF49454E),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.access_time, color: Color(0xFF005F8E), size: 20),
                    const SizedBox(width: 8),
                    Text(
                      '2 Days Left',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF49454E),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF005F8E),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text(
                      'Go Narrative',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
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

  Widget _buildLeaderboardSnippet() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFF1E9DB).withOpacity(0.3),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFF1D1B1E), width: 3),
                  image: const DecorationImage(
                    image: AssetImage("assets/Parent Avatar.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Color(0xFF007A33),
                  shape: BoxShape.circle,
                ),
                child: Text(
                  '#4',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 8,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "You're catching up!",
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: const Color(0xFF1D1B1E),
                  ),
                ),
                Text(
                  'Complete 2 more challenges to pass Sarah in the Platinum League.',
                  style: GoogleFonts.beVietnamPro(
                    fontSize: 12,
                    color: const Color(0xFF49454E),
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      'View Leaderboard',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFF735D01),
                      ),
                    ),
                    const Icon(Icons.arrow_forward, color: Color(0xFF735D01), size: 14),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget _buildBottomNav(BuildContext context) {
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
  //         GestureDetector(
  //             onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const LanguageSelection())),
  //             child: _buildNavItem(Icons.psychology_outlined, 'LEARN', false)),
  //         GestureDetector(
  //             onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const CulturalFeed())),
  //             child: _buildNavItem(Icons.feed_outlined, 'FEED', false)),
  //         _buildActiveNavItem(Icons.emoji_events, 'CHALLENGES'),
  //         GestureDetector(
  //             onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AdultDashboard())),
  //             child: _buildNavItem(Icons.badge_outlined, 'BADGES', false)),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildNavItem(IconData icon, String label, bool isActive) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.grey[400], size: 24),
        Text(
          label,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 10,
            fontWeight: FontWeight.w700,
            color: Colors.grey[400],
          ),
        ),
      ],
    );
  }

  Widget _buildActiveNavItem(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF735D01), Color(0xFFE9C849)],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 24),
          Text(
            label,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 10,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
