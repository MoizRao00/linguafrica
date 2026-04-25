import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdultLessonAmharic extends StatelessWidget {
  const AdultLessonAmharic({super.key});

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
                      _buildUnitBadge(),
                      const SizedBox(height: 16),
                      _buildTitle(),
                      const SizedBox(height: 16),
                      _buildIntroText(),
                      const SizedBox(height: 32),
                      _buildStructuralLogicCard(),
                      const SizedBox(height: 40),
                      _buildSectionTitle('Reading & Construction'),
                      const SizedBox(height: 20),
                      _buildTranslationCard(),
                      const SizedBox(height: 40),
                      _buildEssentialThreadSection(),
                      const SizedBox(height: 40),
                      _buildGeezScriptImage(),
                      const SizedBox(height: 120), // Space for bottom nav
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Container(
      margin: const EdgeInsets.fromLTRB(24, 16, 24, 0),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 15,
            offset: const Offset(0, 8),
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
                  color: Color(0xFFF1E9DB),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.psychology_outlined, color: Color(0xFF705D00), size: 20),
              ),
              const SizedBox(width: 12),
              Text(
                'Linguafrican',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF705D00),
                ),
              ),
            ],
          ),
          const Icon(Icons.settings_outlined, color: Color(0xFF705D00), size: 22),
        ],
      ),
    );
  }

  Widget _buildUnitBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFD2E9FF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        'ADVANCED GRAMMAR – UNIT 4',
        style: GoogleFonts.plusJakartaSans(
          fontSize: 10,
          fontWeight: FontWeight.w800,
          color: const Color(0xFF005F8E),
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return RichText(
      text: TextSpan(
        style: GoogleFonts.plusJakartaSans(
          fontSize: 32,
          fontWeight: FontWeight.w800,
          color: const Color(0xFF1D1B1E),
          height: 1.1,
        ),
        children: const [
          TextSpan(text: 'The Amharic\nVerb: '),
          TextSpan(
            text: 'Perfective\nForm',
            style: TextStyle(color: Color(0xFF735D01), fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }

  Widget _buildIntroText() {
    return Text(
      'Understanding the root system of Ethiopian Semitic languages through the lens of the "Ge\'ez" script and tonal shifts.',
      style: GoogleFonts.beVietnamPro(
        fontSize: 15,
        color: const Color(0xFF49454E),
        height: 1.5,
      ),
    );
  }

  Widget _buildStructuralLogicCard() {
    return Container(
      padding: const EdgeInsets.all(28),
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
            children: [
              Container(width: 24, height: 3, color: const Color(0xFF735D01)),
              const SizedBox(width: 12),
              Text(
                'Structural Logic',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF1D1B1E),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            'Amharic verbs are built on a system of triconsonantal roots. Unlike English, where "walk" stays relatively consistent, the Amharic root (e.g., S-B-R for "break") weaves vowels between these consonants to indicate tense, aspect, and mood.',
            style: GoogleFonts.beVietnamPro(fontSize: 14, color: const Color(0xFF49454E), height: 1.6),
          ),
          const SizedBox(height: 20),
          RichText(
            text: TextSpan(
              style: GoogleFonts.beVietnamPro(fontSize: 14, color: const Color(0xFF49454E), height: 1.6),
              children: [
                const TextSpan(text: 'The Perfective aspect typically denotes a completed action. For the root '),
                TextSpan(
                  text: 'N-G-R',
                  style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w800, color: const Color(0xFF005F8E)),
                ),
                const TextSpan(text: ' [speak], the basic masculine singular form becomes '),
                TextSpan(
                  text: 'ተናገረ',
                  style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w800, color: const Color(0xFF735D01)),
                ),
                const TextSpan(text: ' (He spoke).'),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF8F2),
              borderRadius: BorderRadius.circular(16),
              border: const Border(left: BorderSide(color: Color(0xFF735D01), width: 4)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Key Rule',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    fontStyle: FontStyle.italic,
                    color: const Color(0xFF735D01),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'The second radical of the verb is always geminated (doubled in sound) in the perfective form for Type A verbs.',
                  style: GoogleFonts.beVietnamPro(
                    fontSize: 13,
                    color: const Color(0xFF49454E),
                    height: 1.4,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.plusJakartaSans(
        fontSize: 20,
        fontWeight: FontWeight.w800,
        color: const Color(0xFF1D1B1E),
      ),
    );
  }

  Widget _buildTranslationCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFF1E9DB).withOpacity(0.4),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'TRANSLATE TO AMHARIC',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 10,
              fontWeight: FontWeight.w800,
              color: const Color(0xFF735D01),
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '"The student wrote a\nletter."',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF1D1B1E),
                ),
              ),
              const Icon(Icons.auto_fix_high, color: Color(0xFF735D01), size: 20),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'Type the Ge\'ez script here...',
              style: GoogleFonts.beVietnamPro(
                fontSize: 14,
                color: Colors.grey[400],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEssentialThreadSection() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFF1E9DB).withOpacity(0.4),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Essential Thread',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF1D1B1E),
                ),
              ),
              const Icon(Icons.library_books_outlined, color: Color(0xFF735D01), size: 20),
            ],
          ),
          const SizedBox(height: 24),
          _buildWordItem('መጽሐፍ', 'METSAHEF - BOOK'),
          const SizedBox(height: 12),
          _buildWordItem('ደብዳቤ', 'DEBDABBE - LETTER'),
          const SizedBox(height: 12),
          _buildWordItem('ተማሪ', 'TEMARI - STUDENT'),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFFD1FADF).withOpacity(0.6),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.diamond_outlined, color: Color(0xFF006D35), size: 20),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pronunciation Tip',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          color: const Color(0xFF006D35),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'The \'T\' in \'metsahaf\' is ejective. Press your glottis closed and release the sound with a small burst of air.',
                        style: GoogleFonts.beVietnamPro(
                          fontSize: 13,
                          color: const Color(0xFF006D35),
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWordItem(String amharic, String meaning) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                amharic,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF1D1B1E),
                ),
              ),
              Text(
                meaning,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Color(0xFFF1E9DB),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.volume_up, color: Color(0xFF735D01), size: 18),
          ),
        ],
      ),
    );
  }

  Widget _buildGeezScriptImage() {
    return Container(
      height: 180,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        image: const DecorationImage(
          image: AssetImage("assets/Ethiopic manuscript.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'The Ge\'ez Script',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'One of the oldest writing systems in the world.',
                  style: GoogleFonts.beVietnamPro(
                    fontSize: 12,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNav() {
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
          _buildBottomNavItem(Icons.auto_awesome_mosaic_outlined, 'LOOM', false),
          _buildBottomNavItem(Icons.explore_outlined, 'EXPLORE', false),
          _buildBottomNavItem(Icons.book, 'LIBRARY', true),
          _buildBottomNavItem(Icons.fitness_center_outlined, 'PRACTICE', false),
          _buildBottomNavItem(Icons.person_outline, 'PROFILE', false),
        ],
      ),
    );
  }

  Widget _buildBottomNavItem(IconData icon, String label, bool isSelected) {
    if (isSelected) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFFF1E9DB),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: const Color(0xFF735D01), size: 24),
            Text(
              label,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 10,
                fontWeight: FontWeight.w800,
                color: const Color(0xFF735D01),
              ),
            ),
          ],
        ),
      );
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
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
}
