import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linguafrica/screens/App%20Settings/Language_Selection.dart';
import 'package:linguafrica/screens/Adults/Cultural_Feed.dart';
import 'package:linguafrica/screens/Adults/Adult_Daily_Challenges.dart';
import 'package:linguafrica/screens/Auth/login_page.dart';

import 'choose_paid_package_screen.dart';

class AppSettingScreen extends StatefulWidget {
  const AppSettingScreen({super.key});

  @override
  State<AppSettingScreen> createState() => _AppSettingScreenState();
}

class _AppSettingScreenState extends State<AppSettingScreen> {
  bool _dailyReminders = true;
  bool _newLessons = false;
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFDF9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF735D01)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Settings',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 22,
            fontWeight: FontWeight.w800,
            color: const Color(0xFF735D01),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: CircleAvatar(
              radius: 18,
              backgroundImage: const AssetImage("assets/Parent Avatar.png"),
              backgroundColor: Colors.grey[200],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            const SizedBox(height: 24),
            _buildProfileCard(),
            const SizedBox(height: 24),
            _buildCurrentLoomCard(),
            const SizedBox(height: 32),
            _buildCategoryHeader(Icons.account_circle_outlined, 'Account'),
            _buildSettingItem(
              'Profile Information',
              'Update your photo, name, and bio',
              onTap: () {},
            ),
            _buildSettingItem(
              'Subscription Status',
              'Premium Yearly — Renews Oct 2025',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ChoosePaidPackageScreen(),));
              },
            ),
            const SizedBox(height: 32),
            _buildCategoryHeader(Icons.school_outlined, 'Learning'),
            _buildSettingItem(
              'Language Preferences',
              'Manage your active dialects',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LanguageSelection()),
                );
              },
            ),
            _buildSettingItem(
              'Daily Goals',
              'Current: 30mins / day',
              customTrailing: _buildDailyGoalsProgress(),
              onTap: () {},
            ),
            const SizedBox(height: 32),
            _buildCategoryHeader(Icons.notifications_none_outlined, 'Notifications'),
            _buildToggleItem(
              'Daily Reminders',
              'Stay on track with your streak',
              _dailyReminders,
              (val) => setState(() => _dailyReminders = val),
            ),
            _buildToggleItem(
              'New Lessons & Content',
              'Alerts for fresh modules',
              _newLessons,
              (val) => setState(() => _newLessons = val),
            ),
            const SizedBox(height: 32),
            _buildCategoryHeader(Icons.visibility_outlined, 'Appearance'),
            _buildVisualModeItem(),
            const SizedBox(height: 32),
            _buildCategoryHeader(Icons.help_outline, 'Support'),
            _buildSettingItem(
              'Help Center',
              '',
              trailingIcon: Icons.open_in_new,
              onTap: () {},
            ),
            _buildSettingItem(
              'Terms of Service',
              '',
              trailingIcon: Icons.open_in_new,
              onTap: () {},
            ),
            const SizedBox(height: 48),
            _buildLogoutButton(),
            const SizedBox(height: 24),
            Text(
              'VERSION 2.4.0 (CULTURAL LOOM EDITION)',
              style: GoogleFonts.beVietnamPro(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF49454E).withValues(alpha: 0.5),
                letterSpacing: 1.0,
              ),
            ),
            const SizedBox(height: 120),
          ],
        ),
      ),

    );
  }

  Widget _buildProfileCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: const AssetImage("assets/Parent Avatar.png"),
                backgroundColor: Colors.grey[200],
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    color: Color(0xFF735D01),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.edit, color: Colors.white, size: 16),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            'Marcus Aurelius',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: const Color(0xFF1D1B1E),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'marcus.a@odyssey.com',
            style: GoogleFonts.beVietnamPro(
              fontSize: 14,
              color: const Color(0xFF49454E),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFE3F2FD),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.verified_user_outlined, color: Color(0xFF1976D2), size: 14),
                const SizedBox(width: 8),
                Text(
                  'PREMIUM MEMBER',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    color: const Color(0xFF1976D2),
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCurrentLoomCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFFDF7E7),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'CURRENT LOOM',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 10,
              fontWeight: FontWeight.w800,
              color: const Color(0xFF49454E).withValues(alpha: 0.6),
              letterSpacing: 1.0,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Container(
                width: 32,
                height: 24,
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F5E9),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                'Portuguese',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF1D1B1E),
                ),
              ),
              const Spacer(),
              Text(
                'Level 14',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF007A33),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: 0.6,
              minHeight: 8,
              backgroundColor: Colors.white,
              color: const Color(0xFFE9C849),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryHeader(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF735D01).withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: const Color(0xFF735D01), size: 18),
          ),
          const SizedBox(width: 12),
          Text(
            title,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: const Color(0xFF1D1B1E),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingItem(String title, String subtitle, {VoidCallback? onTap, IconData? trailingIcon, Widget? customTrailing}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        onTap: onTap,
        title: Text(
          title,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF1D1B1E),
          ),
        ),
        subtitle: subtitle.isNotEmpty
            ? Text(
                subtitle,
                style: GoogleFonts.beVietnamPro(
                  fontSize: 12,
                  color: const Color(0xFF49454E),
                ),
              )
            : null,
        trailing: customTrailing ?? Icon(trailingIcon ?? Icons.chevron_right, color: const Color(0xFF49454E).withValues(alpha: 0.3), size: 20),
      ),
    );
  }

  Widget _buildToggleItem(String title, String subtitle, bool value, ValueChanged<bool> onChanged) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        title: Text(
          title,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF1D1B1E),
          ),
        ),
        subtitle: Text(
          subtitle,
          style: GoogleFonts.beVietnamPro(
            fontSize: 12,
            color: const Color(0xFF49454E),
          ),
        ),
        trailing: Switch.adaptive(
          value: value,
          onChanged: onChanged,
          activeColor: const Color(0xFF735D01),
        ),
      ),
    );
  }

  Widget _buildVisualModeItem() {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Visual Mode',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF1D1B1E),
                  ),
                ),
                Text(
                  'Currently using ${_isDarkMode ? "Dark" : "Light"} Mode',
                  style: GoogleFonts.beVietnamPro(
                    fontSize: 12,
                    color: const Color(0xFF49454E),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: const Color(0xFFFDF7E7),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                _buildModeTab('Light', !_isDarkMode),
                _buildModeTab('Dark', _isDarkMode),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildModeTab(String label, bool isSelected) {
    return GestureDetector(
      onTap: () => setState(() => _isDarkMode = label == 'Dark'),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          label,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: isSelected ? const Color(0xFF1D1B1E) : const Color(0xFF49454E),
          ),
        ),
      ),
    );
  }

  Widget _buildTag(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFFDF7E7),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: GoogleFonts.plusJakartaSans(
          fontSize: 10,
          fontWeight: FontWeight.w700,
          color: const Color(0xFF735D01),
        ),
      ),
    );
  }

  Widget _buildDailyGoalsProgress() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Container(
          width: 24,
          height: 4,
          margin: const EdgeInsets.only(left: 4),
          decoration: BoxDecoration(
            color: index < 3 ? const Color(0xFF007A33) : const Color(0xFFFDF7E7),
            borderRadius: BorderRadius.circular(2),
          ),
        );
      }),
    );
  }

  Widget _buildLogoutButton() {
    return GestureDetector(
      onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage())),
      child: Container(
        width: double.infinity,
        height: 64,
        decoration: BoxDecoration(
          color: const Color(0xFFFFEBEE),
          borderRadius: BorderRadius.circular(32),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.logout, color: Color(0xFFD32F2F), size: 20),
            const SizedBox(width: 12),
            Text(
              'Log Out',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: const Color(0xFFD32F2F),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNav(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const LanguageSelection())),
              child: _buildBottomNavItem(Icons.auto_awesome_mosaic_outlined, 'LOOM')),
          GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const CulturalFeed())),
              child: _buildBottomNavItem(Icons.menu_book_outlined, 'LESSONS')),
          GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AdultDailyChallenges())),
              child: _buildBottomNavItem(Icons.stars_rounded, 'PREMIUM')),
          _buildActiveBottomNavItem(Icons.settings, 'SETTINGS'),
        ],
      ),
    );
  }

  Widget _buildBottomNavItem(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.grey[400], size: 24),
        const SizedBox(height: 4),
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

  Widget _buildActiveBottomNavItem(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF735D01), Color(0xFFE9C849)],
        ),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 20),
          const SizedBox(width: 8),
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
