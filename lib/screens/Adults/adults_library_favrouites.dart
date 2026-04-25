import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linguafrica/screens/App%20Settings/Language_Selection.dart';
import 'package:linguafrica/screens/Adults/Cultural_Feed.dart';
import 'package:linguafrica/screens/Adults/Adult_Daily_Challenges.dart';
import 'package:linguafrica/screens/Adults/Adult_Dashboard.dart';
import 'package:linguafrica/screens/App%20Settings/app_setting_screen.dart';

class AdultsLibraryFavourites extends StatelessWidget {
  const AdultsLibraryFavourites({super.key});

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
                  const SizedBox(height: 32),
                  _buildHeader(),
                  const SizedBox(height: 40),
                  _buildFavoritesSection(),
                  const SizedBox(height: 32),
                  _buildDownloadedSection(),
                  const SizedBox(height: 32),
                  _buildRecentSection(),
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
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
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
                width: 32,
                height: 32,
                decoration: const BoxDecoration(
                  color: Color(0xFF2D3142),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.auto_awesome_mosaic, color: Colors.white, size: 18),
              ),
              const SizedBox(width: 12),
              Text(
                'The Linguistic\nOdyssey',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF705D00),
                  height: 1.1,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AppSettingScreen())),
            child: const Icon(Icons.settings_outlined, color: Color(0xFF705D00), size: 24),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'PORTUGUESE COURSE',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 12,
            fontWeight: FontWeight.w800,
            color: const Color(0xFF005F8E),
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Library',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 40,
            fontWeight: FontWeight.w800,
            color: const Color(0xFF1D1B1E),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'A curated collection of your linguistic journey. Revisit the grammar threads and vocabulary weaves that matter most to you.',
          style: GoogleFonts.beVietnamPro(
            fontSize: 14,
            color: const Color(0xFF49454E),
            height: 1.5,
          ),
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            _buildActionButton('Search Archive', null, const Color(0xFFF1E9DB)),
            const SizedBox(width: 12),
            _buildActionButton('New List', Icons.add, null, isGradient: true),
          ],
        ),
      ],
    );
  }

  Widget _buildActionButton(String text, IconData? icon, Color? bgColor, {bool isGradient = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: isGradient ? null : bgColor,
        gradient: isGradient
            ? const LinearGradient(
                colors: [Color(0xFF735D01), Color(0xFFE9C849)],
              )
            : null,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          if (icon != null) ...[
            Icon(icon, color: Colors.white, size: 20),
            const SizedBox(width: 8),
          ],
          Text(
            text,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: isGradient ? Colors.white : const Color(0xFF705D00),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFavoritesSection() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(Icons.star, color: Color(0xFF705D00), size: 20),
                const SizedBox(width: 8),
                Text(
                  'Favorites',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: const Color(0xFF1D1B1E),
                  ),
                ),
              ],
            ),
            Text(
              'View All',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF705D00),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        _buildFavoriteCard(
          type: 'Audio Lesson',
          duration: '4m 20s',
          title: 'Subjunctive Mood in Rio',
          description: 'Mastering \'Que\' and \'Se\' in conversational Carioca Portuguese.',
          footerText: 'Saved 3 days ago',
          icon: Icons.music_note,
          isAudio: true,
        ),
        const SizedBox(height: 16),
        _buildFavoriteCard(
          type: 'Vocabulary',
          duration: '45 Words',
          title: 'Market Day Essentials',
          description: 'Key phrases for navigating the feira and bargaining for fresh fruit.',
          footerText: null,
          icon: Icons.menu_book,
          isAudio: false,
        ),
      ],
    );
  }

  Widget _buildFavoriteCard({
    required String type,
    required String duration,
    required String title,
    required String description,
    String? footerText,
    required IconData icon,
    bool isAudio = false,
  })
  {
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
              Text(
                '$type • $duration',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF007A33),
                ),
              ),
              Icon(icon, color: const Color(0xFF005F8E), size: 18),
            ],
          ),
          const SizedBox(height: 12),
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
              height: 1.4,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (isAudio)
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [Color(0xFF735D01), Color(0xFFE9C849)]),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.play_arrow, color: Colors.white, size: 20),
                )
              else
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1E9DB),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.menu_book_outlined, color: Color(0xFF705D00), size: 20),
                ),
              if (footerText != null)
                Text(
                  footerText,
                  style: GoogleFonts.beVietnamPro(
                    fontSize: 11,
                    color: Colors.grey[500],
                  ),
                )
              else
                Row(
                  children: [
                    Image.asset('assets/Brazil Flag.png', width: 20),
                    const SizedBox(width: 4),
                    Image.asset('assets/France Flag.png', width: 20),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDownloadedSection() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF1E6).withOpacity(0.5),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.download_for_offline, color: Color(0xFF1D1B1E), size: 20),
              const SizedBox(width: 8),
              Text(
                'Downloaded',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF1D1B1E),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildDownloadedItem('Grammar: Past Imperfect', '2.4 MB • Text Guide', Icons.description_outlined),
          const SizedBox(height: 16),
          _buildDownloadedItem('Accent Training Vol. 1', '10.8 MB • Audio Pack', Icons.campaign_outlined),
          const SizedBox(height: 16),
          _buildDownloadedItem('Cultural Idioms (PDF)', '1.1 MB • Document', Icons.menu_book_outlined),
          const SizedBox(height: 24),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 14),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFF705D00).withOpacity(0.3)),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: Text(
                'Manage Storage',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF705D00),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDownloadedItem(String title, String subtitle, IconData icon) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: const Color(0xFF705D00), size: 20),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF1D1B1E),
                ),
              ),
              Text(
                subtitle,
                style: GoogleFonts.beVietnamPro(
                  fontSize: 11,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
        const Icon(Icons.check_circle, color: Color(0xFF86EFAC), size: 20),
      ],
    );
  }

  Widget _buildRecentSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.history, color: Color(0xFF1D1B1E), size: 20),
            const SizedBox(width: 8),
            Text(
              'Recent',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: const Color(0xFF1D1B1E),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Container(
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
              _buildRecentItem(
                'Portuguese Future Tense',
                'Grammar Rule • Last read 3 hours ago',
                const Color(0xFFFEF9C3),
                Icons.grid_view_rounded,
              ),
              const Divider(height: 1, indent: 80, endIndent: 24),
              _buildRecentItem(
                'Common Coffee Shop Verbs',
                'Vocabulary Audio • Last played yesterday',
                const Color(0xFFD0EAFF),
                Icons.mic_none_outlined,
              ),
              const Divider(height: 1, indent: 80, endIndent: 24),
              _buildRecentItem(
                'Idiomatic Expressions in Lisbon',
                'Cultural Thread • Last read 2 days ago',
                const Color(0xFFDCFCE7),
                Icons.chat_bubble_outline_rounded,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRecentItem(String title, String subtitle, Color iconBg, IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: const Color(0xFF705D00), size: 24),
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
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF1D1B1E),
                  ),
                ),
                Text(
                  subtitle,
                  style: GoogleFonts.beVietnamPro(
                    fontSize: 12,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.more_vert, color: Colors.grey, size: 20),
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
  //             child: _buildBottomNavItem(Icons.auto_awesome_mosaic_outlined, 'LOOM', false)),
  //         _buildBottomNavItem(Icons.book, 'LIBRARY', true),
  //         GestureDetector(
  //             onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AdultDailyChallenges())),
  //             child: _buildBottomNavItem(Icons.insights, 'PROGRESS', false)),
  //         GestureDetector(
  //             onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AppSettingScreen())),
  //             child: _buildBottomNavItem(Icons.person_pin_outlined, 'PORTAL', false)),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildBottomNavItem(IconData icon, String label, bool isSelected) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (isSelected)
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [Color(0xFF735D01), Color(0xFFE9C849)]),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.white, size: 24),
          )
        else
          Icon(icon, color: Colors.grey[400], size: 24),
        const SizedBox(height: 4),
        Text(
          label,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 10,
            fontWeight: FontWeight.w700,
            color: isSelected ? const Color(0xFF705D00) : Colors.grey[400],
          ),
        ),
      ],
    );
  }
}
