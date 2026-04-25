import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linguafrica/screens/App%20Settings/Language_Selection.dart';
import 'package:linguafrica/screens/Adults/Adult_Daily_Challenges.dart';
import 'package:linguafrica/screens/Adults/Adult_Dashboard.dart';

class CulturalFeed extends StatelessWidget {
  const CulturalFeed({super.key});

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
                  _buildHeader(),
                  const SizedBox(height: 32),
                  _buildFeatureCard(),
                  const SizedBox(height: 24),
                  _buildDidYouKnowCard(),
                  const SizedBox(height: 24),
                  _buildVideoCard(),
                  const SizedBox(height: 24),
                  _buildArtAndCraftCard(),
                  const SizedBox(height: 24),
                  _buildShareYourLoomCard(),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.menu, color: Color(0xFF735D01), size: 28),
          Text(
            'Linguafrica',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: const Color(0xFF735D01),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'OUR HERITAGE',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 12,
            fontWeight: FontWeight.w800,
            color: const Color(0xFF005F8E),
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'CULTURAL\nLOOM',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 42,
            fontWeight: FontWeight.w800,
            color: const Color(0xFF1D1B1E),
            height: 1.0,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          "A curated weave of stories, rhythms, and traditions from across Africa and the Lusophone world.",
          style: GoogleFonts.beVietnamPro(
            fontSize: 14,
            color: const Color(0xFF49454E),
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildFeatureCard() {
    return Container(
      height: 240,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        image: const DecorationImage(
          image: AssetImage("assets/the golden echo.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
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
                  'The Golden Echo:\nA Journey through Luanda\'s Semba Roots',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Icon(Icons.access_time, color: Colors.white70, size: 14),
                    const SizedBox(width: 4),
                    Text(
                      '12 min read',
                      style: GoogleFonts.beVietnamPro(
                        fontSize: 11,
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Icon(Icons.person_outline, color: Colors.white70, size: 14),
                    const SizedBox(width: 4),
                    Text(
                      'By Amara Diop',
                      style: GoogleFonts.beVietnamPro(
                        fontSize: 11,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDidYouKnowCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFF1E9DB),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -20,
            bottom: -20,
            child: Opacity(
              opacity: 0.1,
              child: Image.asset(
                "assets/the golden echo.png",
                width: 150,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.lightbulb_outline, color: Color(0xFF735D01), size: 28),
              const SizedBox(height: 16),
              Text(
                'Did you know?',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF1D1B1E),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'The word \'Zebra\' has origins in Portuguese ("Zebra"), originally referring to a wild ass in the Iberian Peninsula.',
                style: GoogleFonts.beVietnamPro(
                  fontSize: 14,
                  color: const Color(0xFF49454E),
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'ETYMOLOGY SERIES',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF735D01),
                      letterSpacing: 1.0,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.share_outlined, size: 18, color: Color(0xFF49454E)),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildVideoCard() {
    return Container(
      height: 380,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        image: const DecorationImage(
          image: AssetImage("assets/girl.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.play_arrow, color: Colors.white, size: 40),
            ),
          ),
          Positioned(
            bottom: 24,
            left: 24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Colloquial Kimbundu',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Daily Phrases & Slang',
                  style: GoogleFonts.beVietnamPro(
                    fontSize: 12,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildArtAndCraftCard() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFFEF9C3).withOpacity(0.3),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ART & CRAFT',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    color: const Color(0xFF007A33),
                    letterSpacing: 1.0,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'The Geometry of\nBogolanfini',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: const Color(0xFF1D1B1E),
                    height: 1.1,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Discover how Malian mud cloth tells stories of identity and community through cryptic patterns.',
                  style: GoogleFonts.beVietnamPro(
                    fontSize: 14,
                    color: const Color(0xFF49454E),
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF735D01),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    'View Gallery',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: const BorderRadius.vertical(bottom: Radius.circular(32)),
            clipBehavior: Clip.antiAlias,
            child: Image.asset(
              "assets/african texture.png",
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
              semanticLabel: 'African geometric fabric pattern',
              errorBuilder: (context, error, stackTrace) => Container(
                height: 200,
                width: double.infinity,
                color: const Color(0xFFF1E9DB),
                child: const Icon(Icons.image_not_supported, color: Colors.grey),
              ),
              cacheHeight: 400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShareYourLoomCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        gradient: const LinearGradient(
          colors: [Color(0xFF735D01), Color(0xFFE9C849)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Share Your\nLoom',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 32,
              fontWeight: FontWeight.w800,
              color: Colors.white,
              height: 1.0,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Join 20k others contributing stories from their local regions. Our heritage is our curriculum.',
            style: GoogleFonts.beVietnamPro(
              fontSize: 14,
              color: Colors.white.withOpacity(0.9),
              height: 1.5,
            ),
          ),
          const SizedBox(height: 32),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.cloud_upload_outlined, color: Color(0xFF735D01), size: 20),
                      const SizedBox(width: 8),
                      Text(
                        'Upload Content',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                          color: const Color(0xFF735D01),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white.withOpacity(0.5), width: 1.5),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Text(
                  'Learn More',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          Row(
            children: [
              Align(
                widthFactor: 0.7,
                child: _buildMiniAvatar("assets/Parent Avatar.png"),
              ),
              Align(
                widthFactor: 0.7,
                child: _buildMiniAvatar("assets/Parent Avatar.png"),
              ),
              _buildMiniAvatar("assets/Parent Avatar.png"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMiniAvatar(String asset) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
        image: DecorationImage(image: AssetImage(asset), fit: BoxFit.cover),
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
  //             child: _buildNavItem(Icons.auto_awesome_mosaic_outlined, 'LEARN', false)),
  //         _buildActiveNavItem(Icons.feed, 'FEED'),
  //         GestureDetector(
  //             onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AdultDailyChallenges())),
  //             child: _buildNavItem(Icons.lightbulb_outline, 'CHALLENGES', false)),
  //         GestureDetector(
  //             onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AdultDashboard())),
  //             child: _buildNavItem(Icons.emoji_events_outlined, 'BADGES', false)),
  //       ],
  //     ),
  //   );
  // }

  // Widget _buildNavItem(IconData icon, String label, bool isActive) {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       Icon(icon, color: Colors.grey[400], size: 24),
  //       const SizedBox(height: 4),
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

//   Widget _buildActiveNavItem(IconData icon, String label) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       decoration: BoxDecoration(
//         gradient: const LinearGradient(
//           colors: [Color(0xFF735D01), Color(0xFFE9C849)],
//         ),
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Icon(icon, color: Colors.white, size: 24),
//           Text(
//             label,
//             style: GoogleFonts.plusJakartaSans(
//               fontSize: 10,
//               fontWeight: FontWeight.w800,
//               color: Colors.white,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
}
