import 'package:flutter/material.dart';
import 'package:linguafrica/screens/Auth/forgetPassword_page.dart';
import 'package:linguafrica/screens/Auth/signup_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F2),
      body: Column(
        children: [
          // Header Section (Separate Container)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 60, bottom: 20, left: 40),
            color: const Color(0xFFFFF8F2),
            alignment: Alignment.centerLeft,
            child: const Text(
              "Linguafrica",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Color(0xFF78350F),
                fontFamily: "PlusJakartaSans",
                letterSpacing: -1,
              ),
            ),
          ),
          
          // Main Body Section (Separate Background)
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFFFEF9E7), // Different background for the body
              ),
              child: Stack(
                children: [
                  // Background Glow specific to this section
                  Positioned(
                    top: -100,
                    left: -100,
                    child: Container(
                      width: 400,
                      height: 400,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [
                            const Color(0xFFFFF3D8).withOpacity(0.9),
                            const Color(0xFFFFF3D8).withOpacity(0.0),
                          ],
                        ),
                      ),
                    ),
                  ),
                  
                  // Scrollable Content
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: Column(
                        children: [
                          const SizedBox(height: 30),
                          
                          // Main Login Card
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(44),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.04),
                                  blurRadius: 32,
                                  offset: const Offset(0, 16),
                                ),
                              ],
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: IntrinsicHeight(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  // Left Dark Accent Bar
                                  Container(
                                    width: 14,
                                    color: const Color(0xFF705D00),
                                  ),
                                  // Content
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(28, 50, 28, 40),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Welcome back",
                                            style: TextStyle(
                                              fontSize: 32,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xFF211B0D),
                                              fontFamily: "PlusJakartaSans",
                                              letterSpacing: -1.2,
                                            ),
                                          ),
                                          const SizedBox(height: 12),
                                          const Text(
                                            "Step back into the linguistic odyssey.",
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Color(0xFF52452A),
                                              fontFamily: "Be Vietnam Pro",
                                              height: 1.3,
                                            ),
                                          ),
                                          const SizedBox(height: 44),

                                          // Email Field
                                          const Text(
                                            "Email Address",
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF52452A),
                                              fontFamily: "Be Vietnam Pro",
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          TextField(
                                            decoration: InputDecoration(
                                              hintText: "you@culture.com",
                                              hintStyle: const TextStyle(color: Color(0xFFA59B85)),
                                              filled: true,
                                              fillColor: const Color(0xFFFAF7F2),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(6),
                                                borderSide: BorderSide.none,
                                              ),
                                              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
                                            ),
                                          ),
                                          const SizedBox(height: 24),

                                          // Password Field
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text(
                                                "Password",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFF52452A),
                                                  fontFamily: "Be Vietnam Pro",
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => const ForgetPasswordPage()),
                                                  );
                                                },
                                                child: const Text(
                                                  "Forgot Password?",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Color(0xFF0077B6),
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: "Be Vietnam Pro",
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          TextField(
                                            obscureText: true,
                                            decoration: InputDecoration(
                                              hintText: "••••••••",
                                              hintStyle: const TextStyle(color: Color(0xFFA59B85), fontSize: 14),
                                              filled: true,
                                              fillColor: const Color(0xFFFAF7F2),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(6),
                                                borderSide: BorderSide.none,
                                              ),
                                              suffixIcon: const Padding(
                                                padding: EdgeInsets.only(right: 12),
                                                child: Icon(Icons.visibility_outlined, color: Color(0xFFC4B8A0)),
                                              ),
                                              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
                                            ),
                                          ),
                                          const SizedBox(height: 44),

                                          // Login Button
                                          Container(
                                            width: double.infinity,
                                            height: 70,
                                            decoration: BoxDecoration(
                                              gradient: const LinearGradient(
                                                colors: [Color(0xFF8D7A1F), Color(0xFFEDC967)],
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                              ),
                                              borderRadius: BorderRadius.circular(35),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: const Color(0xFF8D7A1F).withOpacity(0.3),
                                                  blurRadius: 18,
                                                  offset: const Offset(0, 10),
                                                ),
                                              ],
                                            ),
                                            child: const Center(
                                              child: Text(
                                                "Log In",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: "PlusJakartaSans",
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 36),

                                          // Divider
                                          Row(
                                            children: [
                                              Expanded(child: Divider(color: const Color(0xFFEBE3D0), thickness: 1)),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      "or continue",
                                                      style: TextStyle(
                                                        fontSize: 13,
                                                        color: const Color(0xFF52452A).withOpacity(0.6),
                                                        fontFamily: "Be Vietnam Pro",
                                                      ),
                                                    ),
                                                    Text(
                                                      "with",
                                                      style: TextStyle(
                                                        fontSize: 13,
                                                        color: const Color(0xFF52452A).withOpacity(0.6),
                                                        fontFamily: "Be Vietnam Pro",
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(child: Divider(color: const Color(0xFFEBE3D0), thickness: 1)),
                                            ],
                                          ),
                                          const SizedBox(height: 36),

                                          // Social Buttons
                                          Row(
                                            children: [
                                              Expanded(child: _socialButton("Google")),
                                              const SizedBox(width: 16),
                                              Expanded(child: _socialButton("Apple")),
                                            ],
                                          ),
                                          const SizedBox(height: 48),

                                          // Sign Up
                                          Center(
                                            child: GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) => const SignupPage()),
                                                );
                                              },
                                              child: RichText(
                                                textAlign: TextAlign.center,
                                                text: const TextSpan(
                                                  style: TextStyle(
                                                    color: Color(0xFF52452A),
                                                    fontSize: 16,
                                                    fontFamily: "Be Vietnam Pro",
                                                    height: 1.5,
                                                  ),
                                                  children: [
                                                    TextSpan(text: "Don't have an account? "),
                                                    TextSpan(
                                                      text: "Sign up for\nfree",
                                                      style: TextStyle(
                                                        fontWeight: FontWeight.w600,
                                                        color: Color(0xFF705D00),
                                                        fontFamily: "Be Vietnam Pro",
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 40),
                          
                          // Footer
                          Center(
                            child: Column(
                              children: [
                                const Text(
                                  "© 2024 The Cultural Loom. All rights reserved.",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xFF8C8068),
                                    fontFamily: "Be Vietnam Pro",
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    _footerLink("Privacy Policy"),
                                    _footerDivider(),
                                    _footerLink("Terms of Service"),
                                    _footerDivider(),
                                    _footerLink("Cookie Policy"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _socialButton(String label) {
    final bool isGoogle = label.toLowerCase().contains("google");
    return Container(
      height: 64,
      decoration: BoxDecoration(
        color: const Color(0xFFF7EBD8),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Center(
        child: isGoogle
            ? RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontFamily: "PlusJakartaSans",
                  ),
                  children: [
                    TextSpan(text: 'G', style: TextStyle(color: Color(0xFF4285F4))),
                    TextSpan(text: 'o', style: TextStyle(color: Color(0xFFEA4335))),
                    TextSpan(text: 'o', style: TextStyle(color: Color(0xFFFBBC05))),
                    TextSpan(text: 'g', style: TextStyle(color: Color(0xFF4285F4))),
                    TextSpan(text: 'l', style: TextStyle(color: Color(0xFF34A853))),
                    TextSpan(text: 'e', style: TextStyle(color: Color(0xFFEA4335))),
                  ],
                ),
              )
            : const Text(
                'Apple',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontFamily: "PlusJakartaSans",
                ),
              ),
      ),
    );
  }

  Widget _footerLink(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 13,
        color: Color(0xFF8C8068),
        fontFamily: "Be Vietnam Pro",
      ),
    );
  }

  Widget _footerDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Text("|", style: TextStyle(fontSize: 12, color: Color(0xFFDCCEA1))),
    );
  }
}
