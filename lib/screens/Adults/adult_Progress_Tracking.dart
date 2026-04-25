import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdultProgressTracking extends StatelessWidget {
  const AdultProgressTracking({super.key});

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  _buildHeroSection(),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(child: _buildStatCard('14 Days', 'CURRENT STREAK', Icons.local_fire_department, const Color(0xFFD2E9FF), const Color(0xFF005F8E))),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(child: _buildStatCard('2,840 XP', 'WEEKLY GAIN', Icons.emoji_events_outlined, const Color(0xFF86EFAC).withOpacity(0.6), const Color(0xFF006D35))),
                    ],
                  ),
                  const SizedBox(height: 32),
                  _buildWeeklyActivity(),
                  const SizedBox(height: 24),
                  _buildSkillBalance(),
                  const SizedBox(height: 32),
                  Text(
                    'Recent Achievements',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF1D1B1E),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildAchievementCard(
                    'Sentence Architect',
                    'Constructed 50 perfect complex sentences in Swahili.',
                    'YESTERDAY',
                    Icons.architecture,
                    const Color(0xFFFEF9C3),
                  ),
                  const SizedBox(height: 12),
                  _buildAchievementCard(
                    'Vocabulary Roots',
                    'Explored the etymology of 100 Latin-derived Portuguese words.',
                    '4 DAYS AGO',
                    Icons.eco_outlined,
                    const Color(0xFFDCFCE7),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    'Milestones',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF1D1B1E),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildMilestoneItem('Pathfinder', Icons.map_outlined),
                      _buildMilestoneItem('Librarian', Icons.menu_book_outlined),
                      _buildMilestoneItem('Data Weaver', Icons.insights_outlined),
                    ],
                  ),
                  const SizedBox(height: 120),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTopBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
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
              const SizedBox(width: 12),
              Text(
                'Linguafrica',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF705D00),
                ),
              ),
            ],
          ),
          GestureDetector(
              onTap: (){},
              child: const Icon(Icons.settings_outlined, color: Color(0xFF705D00), size: 24)),
        ],
      ),
    );
  }
  Widget _buildHeroSection() {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: -10,
            top: 0,
            child: Image.asset("assets/Adult Progress Tracking icon.png")
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'CURRENT PROGRESS',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF735D01),
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Level 12\nWeaver',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF1D1B1E),
                  height: 1.1,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "You've mastered 428 Portuguese roots and 115 Swahili conversational patterns this month.",
                style: GoogleFonts.beVietnamPro(
                  fontSize: 14,
                  color: const Color(0xFF49454E),
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  _buildButton('View Full Map', isGradient: true),
                  const SizedBox(width: 12),
                  _buildButton('Daily Goals', isGradient: false),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String text, {required bool isGradient}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: isGradient ? null : const Color(0xFFF1E9DB),
        gradient: isGradient
            ? const LinearGradient(
                colors: [Color(0xFF735D01), Color(0xFFE9C849)],
              )
            : null,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        text,
        style: GoogleFonts.plusJakartaSans(
          fontSize: 13,
          fontWeight: FontWeight.w700,
          color: isGradient ? Colors.white : const Color(0xFF735D01),
        ),
      ),
    );
  }

  Widget _buildStatCard(String value, String label, IconData icon, Color bgColor, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Icon(icon, color: textColor, size: 28),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: textColor,
                ),
              ),
              Text(
                label,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                  color: textColor.withOpacity(0.7),
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWeeklyActivity() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFF1E9DB).withOpacity(0.4),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Weekly Activity',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF1D1B1E),
                    ),
                  ),
                  Text(
                    'Your learning intensity over the last 7 days',
                    style: GoogleFonts.beVietnamPro(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              Text(
                'May\n2024',
                textAlign: TextAlign.right,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF735D01),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _buildBar('MON', 0.4),
              _buildBar('TUE', 0.6),
              _buildBar('WED', 1.0, isHighlighted: true),
              _buildBar('THU', 0.5),
              _buildBar('FRI', 0.7),
              _buildBar('SAT', 0.2),
              _buildBar('SUN', 0.4),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBar(String label, double heightFactor, {bool isHighlighted = false}) {
    return Column(
      children: [
        Container(
          height: 100 * heightFactor,
          width: 28,
          decoration: BoxDecoration(
            color: isHighlighted ? const Color(0xFF735D01) : const Color(0xFFE9C849).withOpacity(0.4),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 9,
            fontWeight: FontWeight.w800,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildSkillBalance() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFF1E9DB).withOpacity(0.4),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Skill Balance',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: const Color(0xFF1D1B1E),
            ),
          ),
          const SizedBox(height: 24),
          _buildSkillRow('Reading', 0.85),
          const SizedBox(height: 16),
          _buildSkillRow('Listening', 0.62),
          const SizedBox(height: 16),
          _buildSkillRow('Speaking', 0.43),
          const SizedBox(height: 16),
          _buildSkillRow('Writing', 0.78),
        ],
      ),
    );
  }

  Widget _buildSkillRow(String skill, double progress) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              skill,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF49454E),
              ),
            ),
            Text(
              '${(progress * 100).toInt()}%',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 11,
                fontWeight: FontWeight.w800,
                color: const Color(0xFF1D1B1E),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Stack(
          children: [
            Container(
              height: 6,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            FractionallySizedBox(
              widthFactor: progress,
              child: Container(
                height: 6,
                decoration: BoxDecoration(
                  color: const Color(0xFF005F8E),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAchievementCard(String title, String desc, String time, IconData icon, Color iconBg) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: const Color(0xFF735D01), size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: const Color(0xFF1D1B1E),
                  ),
                ),
                Text(
                  desc,
                  style: GoogleFonts.beVietnamPro(
                    fontSize: 12,
                    color: Colors.grey[600],
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text(
            time,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 9,
              fontWeight: FontWeight.w800,
              color: Colors.grey[400],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMilestoneItem(String label, IconData icon) {
    return Container(
      width: 100,
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFF1E9DB).withOpacity(0.5),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [Color(0xFF735D01), Color(0xFFE9C849)]),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.white, size: 24),
          ),
          const SizedBox(height: 12),
          Text(
            label,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 11,
              fontWeight: FontWeight.w800,
              color: const Color(0xFF735D01),
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
  //         _buildBottomNavItem(Icons.book_outlined, 'LIBRARY', false),
  //         _buildBottomNavItem(Icons.insights, 'PROGRESS', true),
  //         _buildBottomNavItem(Icons.person_pin_outlined, 'PORTAL', false),
  //       ],
  //     ),
  //   );
  // }

  // Widget _buildBottomNavItem(IconData icon, String label, bool isSelected) {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       if (isSelected)
  //         Container(
  //           padding: const EdgeInsets.all(10),
  //           decoration: const BoxDecoration(
  //             gradient: LinearGradient(colors: [Color(0xFF735D01), Color(0xFFE9C849)]),
  //             shape: BoxShape.circle,
  //           ),
  //           child: Icon(icon, color: Colors.white, size: 24),
  //         )
  //       else
  //         Icon(icon, color: Colors.grey[400], size: 24),
  //       const SizedBox(height: 4),
  //       Text(
  //         label,
  //         style: GoogleFonts.plusJakartaSans(
  //           fontSize: 10,
  //           fontWeight: FontWeight.w700,
  //           color: isSelected ? const Color(0xFF705D00) : Colors.grey[400],
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
