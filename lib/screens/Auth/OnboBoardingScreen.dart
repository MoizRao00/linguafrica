import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:linguafrica/screens/Auth/login_page.dart';
import 'package:linguafrica/screens/Auth/signup_page.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F2),
      body: Stack(
        children: [
          Positioned(
            top: -100,
            left: -100,
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  center: Alignment.center, // Center of the circle
                  radius: 0.7,
                  colors: [
                    const Color(0xFFFFF3D8).withOpacity(0.9),
                    const Color(0xFFFFF3D8).withOpacity(0.0),
                  ],
                  stops: const [
                    0.2,
                    1.0,
                  ], // Starts fading after 20% of the radius
                ),
              ),
            ),
          ),

          SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(24, 160, 24, 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    // SVG background / watermark
                    Positioned(
                      top: -90,
                      right: 30,
                      child: SvgPicture.asset(
                        'assets/SVG.svg',
                        width: 250,
                        height: 250,
                      ),
                    ),
                    // Text Heading
                    Column(
                      children: [
                        const Text(
                          "Linguafrica",
                          style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight(700),
                            color: Color(0xFF211B0D),
                            fontFamily: "PlusJakartaSans",
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          child: Text(
                            "Begin your Linguistic Odyssey. Weave your story through the threads of global language and heritage.",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF52452A),
                              fontWeight: FontWeight(400),
                              fontFamily: "Be Vietnam Pro",
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Container(
                  width: 342,
                  height: 307.4,
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(32),
                    // border: Border.all(
                    //   width: 1,
                    //   color: Colors.black.withOpacity(0.1),
                    // ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: SvgPicture.asset(
                          'assets/Icon.svg',
                          width: 160,
                          height: 160,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(32),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 127,
                              height: 24,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: const Color(0xFFCAE6FF),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Text(
                                "FOR EXPLORERS",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF004B70),
                                  fontWeight: FontWeight(700),
                                  fontFamily: "Be Vietnam Pro",
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              "The Modern Study",
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight(600),
                                fontFamily: "PlusJakartaSans",
                                color: Color(0xFF211B0D),
                                letterSpacing: -.4,
                              ),
                            ),
                            const SizedBox(height: 12),
                            const Text(
                              "Sophisticated, deep-dive learning for those seeking professional mastery and cultural nuance.",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight(400),
                                color: Color(0xFF52452A),
                                fontFamily: "PlusJakartaSans",
                                height: 1.4,
                              ),
                            ),
                            const Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  "Preview Curriculum",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight(700),
                                    color: Color(0xFF705D00),
                                    fontFamily: "PlusJakartaSans",
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Icon(
                                  Icons.arrow_forward_outlined,
                                  color: Color(0xFF705D00),
                                  size: 24,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Card: FOR KIDS
                Container(
                  width: 342,
                  height: 307.4,
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8F5E9),
                    borderRadius: BorderRadius.circular(32),
                    border: Border.all(
                      width: 1,
                      color: Colors.black.withOpacity(0.05),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      // Decorative background icon
                      Positioned(
                        bottom: 70,
                        right: 20,
                        child: SvgPicture.asset(
                          'assets/IconKids.svg',
                          width: 120,
                          height: 120,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(32),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 80,
                              height: 24,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: const Color(0xFF006E1C),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Text(
                                "FOR KIDS",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight(700),
                                  fontFamily: "Be Vietnam Pro",
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              "Sun-Drenched Garden",
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight(600),
                                fontFamily: "PlusJakartaSans",
                                color: Color(0xFF211B0D),
                                letterSpacing: -.4,
                              ),
                            ),
                            const SizedBox(height: 12),
                            const Text(
                              "Playful, tactile lessons filled with music, color, and storytelling.",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight(400),
                                color: Color(0xFF52452A),
                                fontFamily: "PlusJakartaSans",
                                height: 1.4,
                              ),
                            ),
                            const Spacer(),
                            // Avatar Stack Section
                            SizedBox(
                              height: 48,
                              width: 100,
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [ // First Avatar
                                  Container(
                                    width: 44,
                                    height: 44,
                                    decoration: BoxDecoration(
                                      color: Colors.teal.shade200,
                                      shape: BoxShape.circle,
                                      border: Border.all(color: const Color(0xFFE8F5E9), width: 3),
                                    ),
                                  ),
                                  // Second Avatar
                                  Positioned(
                                    left: 24,
                                    child: Container(
                                      width: 44,
                                      height: 44,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF211B0D),
                                        shape: BoxShape.circle,
                                        border: Border.all(color: const Color(0xFFE8F5E9), width: 3),
                                      ),
                                    ),
                                  ),
                                  // "+12k" Badge
                                  Positioned(
                                    left: 48,
                                    child: Container(
                                      width: 44,
                                      height: 44,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFFFD54F),
                                        shape: BoxShape.circle,
                                        border: Border.all(color: const Color(0xFFE8F5E9), width: 3),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "+12k",
                                          style: TextStyle(
                                            color: Color(0xFF52452A),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13,
                                          ),
                                        ),
                                      ),
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
                ),
                const FeatureTile(
                  icon: Icons.translate,
                  title: "Real-World Fluency",
                  description: "Learn dialect and idioms directly from native storytellers.",
                ),
                const FeatureTile(
                  icon: Icons.auto_awesome,
                  title: "Woven Progress",
                  description: "See your learning journey as a beautiful growing tapestry.",
                ),


                const SizedBox(height: 30),
                // Updated Get Started Button
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignupPage()),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 64,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF8D7A1F), Color(0xFFEDC967)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(32),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF705D00).withOpacity(0.2),
                          blurRadius: 15,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        "Get Started",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "PlusJakartaSans",
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                // Updated Log In text
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage(),)
                      );
                    },
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          color: Color(0xFF52452A),
                          fontSize: 16,
                          fontFamily: "Be Vietnam Pro",
                        ),
                        children: [
                          TextSpan(text: "Already weaving with us? "),
                          TextSpan(
                            text: "Log In",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF705D00),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
          // Bottom Segmented Line
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 8,
              child: Row(
                children: [
                  Expanded(child: Container(color: const Color(0xFFEBE3D0))),
                  Expanded(child: Container(color: const Color(0xFFCAE6FF))),
                  Expanded(child: Container(color: const Color(0xFFAED581))),
                  Expanded(child: Container(color: const Color(0xFFDCCEA1))),
                  Expanded(child: Container(color: const Color(0xFF7CB6D5))),
                  Expanded(child: Container(color: const Color(0xFF8BB97D))),
                  Expanded(child: Container(color: const Color(0xFFE6D5A9))),
                  Expanded(child: Container(color: const Color(0xFFCAE6FF))),
                  Expanded(child: Container(color: const Color(0xFFAED581))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class FeatureTile extends StatelessWidget {
  final IconData icon;
  final String title, description;

  const FeatureTile({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      // 1. Consolidated outer padding for better spacing between tiles
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      child: Container(
        // 2. Internal padding so content doesn't touch the background edges
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          // 3. Added BorderRadius to match your card design
          color: const Color(0xFFF8F2B2).withOpacity(0.2),
          borderRadius: BorderRadius.circular(300.0),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Icon Section
            Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: Color(0xFFEBE3D0),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: const Color(0xFF52452A), size: 28),
            ),
            const SizedBox(width: 16),
            // Text Section
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Be Vietnam Pro",
                      color: Color(0xFF211B0D),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF52452A),
                      fontFamily: "Be Vietnam Pro",
                      height: 1.3, // 5. Better line height for readability
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Implementation:
