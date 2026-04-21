import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ParentsPortal extends StatefulWidget {
  const ParentsPortal({super.key});

  @override
  State<ParentsPortal> createState() => _ParentsPortalState();
}

class _ParentsPortalState extends State<ParentsPortal> {
  int _selectedIndex = 3;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFDF9), // Lighter background
      extendBody: true,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1536),
            child: Column(
              children: [
                // Top Bar (Separated)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF8F2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.04),
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
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: const Color(0xFFEBE3D0), width: 1.5),
                              image: const DecorationImage(
                                image: AssetImage("assets/Parent Avatar.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Text(
                            'Portal',
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 26,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF705D00),
                              letterSpacing: -0.5,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: const Color(0xFF705D00),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF705D00).withValues(alpha: 0.2),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: const Icon(Icons.menu, color: Colors.white, size: 24),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Hero Section
                        Padding(
                          padding: const EdgeInsets.fromLTRB(32, 48, 32, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  style: GoogleFonts.plusJakartaSans(
                                    fontSize: 48,
                                    fontWeight: FontWeight.w800,
                                    height: 1.1,
                                    letterSpacing: -1,
                                  ),
                                  children: [
                                    const TextSpan(
                                      text: "Leo's\n",
                                      style: TextStyle(color: Color(0xFF211B0D)),
                                    ),
                                    const TextSpan(
                                      text: "Linguistic\n",
                                      style: TextStyle(color: Color(0xFF705D00)),
                                    ),
                                    const TextSpan(
                                      text: "Odyssey",
                                      style: TextStyle(color: Color(0xFF705D00)),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 16),
                              RichText(
                                text: TextSpan(
                                  style: GoogleFonts.beVietnamPro(
                                    fontSize: 16,
                                    color: const Color(0xFF49454E),
                                    height: 1.5,
                                  ),
                                  children: [
                                    const TextSpan(text: 'Tracking progress across '),
                                    TextSpan(
                                      text: '11 woven languages.',
                                      style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF0077B6)),
                                    ),
                                    const TextSpan(text: ' Leo is currently exploring the roots of Portuguese and Swahili.'),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),
                              _buildGradientButton('Share Progress', Icons.share),
                            ],
                          ),
                        ),

                        const SizedBox(height: 40),

                        // Time Spent Card
                        _buildTimeSpentCard(),

                        // Daily Limits Card
                        _buildDailyLimitsCard(),

                        // Lessons Completed Card
                        _buildLessonsCompletedCard(),

                        // Vocabulary Mastered Card
                        _buildVocabularyMasteredCard(),

                        // Active Threads Section
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 32.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Active Threads',
                                style: GoogleFonts.plusJakartaSans(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                  color: const Color(0xFF1D1B1E),
                                ),
                              ),
                              const SizedBox(height: 20),
                              _buildThreadCard(
                                  'Portuguese', 0.7, 'Expert', '324 Words', const Color(0xFF705D00), "assets/Brazil Flag.png"),
                              _buildThreadCard(
                                  'Swahili', 0.45, 'Intermediate', '156 Words', const Color(0xFF007A33), "assets/Kenya Flag.png"),
                              _buildThreadCard(
                                  'French', 0.25, 'Beginner', '82 Words', const Color(0xFF0055A4), "assets/France Flag.png"),
                              const SizedBox(height: 12),
                              _buildAddThreadButton(),
                            ],
                          ),
                        ),
                        const SizedBox(height: 128), // Space for bottom nav based on Figma padding
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemSelected: _onItemTapped,
      ),
    );
  }

  Widget _buildGradientButton(String text, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF735D01), Color(0xFFE9C849)],
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 18),
          const SizedBox(width: 8),
          Text(
            text,
            style: GoogleFonts.plusJakartaSans(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeSpentCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Time Spent',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    'Weekly Learning Immersion',
                    style: GoogleFonts.beVietnamPro(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '12.4h',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      color: const Color(0xFF705D00),
                    ),
                  ),
                  Text(
                    '+1.2% VS LAST WEEK',
                    style: GoogleFonts.beVietnamPro(fontSize: 10, color: Colors.green, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 32),
          // Bar Chart Placeholder
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _buildBar(0.4),
              _buildBar(0.6),
              _buildBar(0.3),
              _buildBar(1.0, isHighlighted: true),
              _buildBar(0.5),
              _buildBar(0.7),
              _buildBar(0.4),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN']
                .map((d) => Text(d, style: GoogleFonts.beVietnamPro(fontSize: 10, color: Colors.grey)))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildBar(double heightFactor, {bool isHighlighted = false}) {
    return Container(
      width: 32,
      height: 100 * heightFactor,
      decoration: BoxDecoration(
        color: isHighlighted ? const Color(0xFF705D00) : const Color(0xFFF1E9DB),
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }

  Widget _buildDailyLimitsCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF1E4),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.timer_outlined, color: Color(0xFF705D00)),
              const SizedBox(width: 8),
              Text(
                'Daily Limits',
                style: GoogleFonts.plusJakartaSans(fontSize: 18, fontWeight: FontWeight.w800),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildLimitRow('LEARNING WINDOW', '45 Minutes', icon: Icons.edit),
          const SizedBox(height: 12),
          _buildLimitRow('WEEKEND BONUS', '+20 Minutes', isToggle: true),
          const SizedBox(height: 16),
          Text(
            'Limits help maintain a healthy cognitive balance for young weavers.',
            style: GoogleFonts.beVietnamPro(fontSize: 12, fontStyle: FontStyle.italic, color: Colors.grey[700]),
          ),
        ],
      ),
    );
  }

  Widget _buildLimitRow(String title, String value, {IconData? icon, bool isToggle = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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
              Text(title, style: GoogleFonts.plusJakartaSans(fontSize: 10, fontWeight: FontWeight.w900, color: Colors.grey)),
              Text(value, style: GoogleFonts.beVietnamPro(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
          if (isToggle)
            Switch(value: true, onChanged: (_) {}, activeThumbColor: Colors.green)
          else if (icon != null)
            Icon(icon, size: 18, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildLessonsCompletedCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFF1E9DB).withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        children: [
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                const SizedBox(
                  width: 100,
                  height: 100,
                  child: CircularProgressIndicator(
                    value: 0.75,
                    strokeWidth: 10,
                    color: Color(0xFF0077B6),
                    backgroundColor: Colors.white,
                  ),
                ),
                Text(
                  '75%',
                  style: GoogleFonts.plusJakartaSans(fontSize: 20, fontWeight: FontWeight.w900),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Lessons Completed',
            style: GoogleFonts.plusJakartaSans(fontSize: 18, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 8),
          Text(
            "Leo has finished 42 out of 56 threads in the 'Cultural Beginnings' loom.",
            textAlign: TextAlign.center,
            style: GoogleFonts.beVietnamPro(fontSize: 14, color: Colors.grey[700]),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTag('Portuguese 12', Colors.blue[100]!),
              const SizedBox(width: 8),
              _buildTag('Swahili 8', Colors.green[100]!),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTag(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
      child: Text(text, style: GoogleFonts.beVietnamPro(fontSize: 12, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildVocabularyMasteredCard() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: const Color(0xFF005F8E),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Stack(
        children: [
          // Background SVG Icon (Thread Wave)
          Positioned(
            left: 70,
            top: -27,
            child: Opacity(
              opacity: 01,
              child: SvgPicture.asset(
                'assets/SVG.svg',
                width: 300,
                fit: BoxFit.contain,
                colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Vocabulary Mastered',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    letterSpacing: -0.5,
                  ),
                ),
                Text(
                  'Growing a forest of new words.',
                  style: GoogleFonts.beVietnamPro(
                    fontSize: 16,
                    color: Colors.white.withValues(alpha: 0.7),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      '842',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 64,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        letterSpacing: -2,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'Words',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.white.withValues(alpha: 0.9),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                // Overlapping Language Circles
                SizedBox(
                  height: 44,
                  child: Row(
                    children: [
                      _buildOverlappingCircle('PT', const Color(0xFFFFD966)),
                      _buildOverlappingCircle('SW', const Color(0xFF86EFAC)),
                      _buildOverlappingCircle('FR', const Color(0xFFE5D5B3)),
                      _buildOverlappingCircle('+8', Colors.white),
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

  Widget _buildOverlappingCircle(String text, Color color) {
    return Align(
      widthFactor: 0.55,
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xFF005F8E), width: 4),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 13,
            fontWeight: FontWeight.w800,
            color: const Color(0xFF211B0D),
          ),
        ),
      ),
    );
  }


  Widget _buildThreadCard(
      String name, double progress, String level, String words, Color color, String flagPath) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.07),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(flagPath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Text(
                name,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF1D1B1E),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: const Color(0xFFF1E9DB).withValues(alpha: 0.5),
              color: color,
              minHeight: 10,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                level,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF705D00),
                ),
              ),
              Text(
                words,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF1D1B1E),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAddThreadButton() {
    return CustomPaint(
      painter: DashedBorderPainter(color: const Color(0xFFD2C7B1), strokeWidth: 2, gap: 6),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: Column(
          children: [
            const Icon(Icons.add_circle_outline, color: Color(0xFFB1A795), size: 40),
            const SizedBox(height: 8),
            Text(
              'Add New Language',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: const Color(0xFFB1A795),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DashedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double gap;

  DashedBorderPainter({
    this.color = const Color(0xFFD9D9D9),
    this.strokeWidth = 2,
    this.gap = 5,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final RRect rrect = RRect.fromLTRBR(
      0,
      0,
      size.width,
      size.height,
      const Radius.circular(40),
    );

    final Path path = Path()..addRRect(rrect);

    final Path dashedPath = Path();
    for (final PathMetric metric in path.computeMetrics()) {
      double distance = 0.0;
      while (distance < metric.length) {
        dashedPath.addPath(
          metric.extractPath(distance, distance + gap),
          Offset.zero,
        );
        distance += gap * 2;
      }
    }
    canvas.drawPath(dashedPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 80,
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 20,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(0, Icons.auto_awesome_mosaic_outlined, 'LOOM'),
            _buildNavItem(1, Icons.book_outlined, 'LIBRARY'),
            _buildNavItem(2, Icons.bar_chart_outlined, 'PROGRESS'),
            _buildNavItem(3, Icons.person_pin_outlined, 'PORTAL'),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    final bool isSelected = selectedIndex == index;
    final Color activeColor = const Color(0xFF705D00);

    return InkWell(
      onTap: () => onItemSelected(index),
      borderRadius: BorderRadius.circular(40),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: EdgeInsets.all(isSelected ? 8 : 0),
              decoration: BoxDecoration(
                color: isSelected ? activeColor : Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: isSelected ? Colors.white : Colors.grey,
                size: 24,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 8,
                fontWeight: FontWeight.w900,
                color: isSelected ? activeColor : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
