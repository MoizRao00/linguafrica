import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linguafrica/screens/Adults/Adult_Dashboard.dart';
import 'package:linguafrica/screens/Kids/Kids_onboarding.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String selectedRole = 'Adult';
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFBF7),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // Header
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Color(0xFF703918),
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Linguafrica',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF703918),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 56),
              // Title
              Text(
                'Begin your journey',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 36,
                  fontWeight: FontWeight.w900,
                  color: const Color(0xFF1D1B1E),
                  letterSpacing: -1.5,
                ),
              ),
              const SizedBox(height: 12),
              // Subtitle
              Text(
                'Choose your path through the cultural loom.',
                style: GoogleFonts.beVietnamPro(
                  fontSize: 16,
                  color: const Color(0xFF49454E),
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 52),
              // Role Selection Header
              Text(
                'WHO IS LEARNING TODAY?',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                  color: const Color(0xFF52452A),
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 20),
              // Adult Learner Card
              _buildRoleCard(
                title: 'Adult Learner',
                description: 'Deep dives and professional mastery.',
                role: 'Adult',
                icon: const Icon(
                  Icons.person,
                  color: Color(0xFF755E00),
                  size: 32,
                ),
              ),
              const SizedBox(height: 16),
              // Child Learner Card
              _buildRoleCard(
                title: 'For a Child',
                description: 'Playful quests and tactile fun.',
                role: 'Child',
                icon:Icon (Icons.emoji_emotions_rounded ),
              ),
              const SizedBox(height: 48),
              // Form Fields
              _buildTextField(hintText: 'Full Name'),
              const SizedBox(height: 20),
              _buildTextField(hintText: 'Email Address'),
              const SizedBox(height: 20),
              _buildTextField(
                hintText: 'Password',
                isPassword: true,
                obscureText: _obscurePassword,
                onToggleVisibility: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
              const SizedBox(height: 56),
              // Create Account Button
              _buildGradientButton('Create Account'),
              const SizedBox(height: 40),
              // Divider
              _buildDivider(),
              const SizedBox(height: 32),
              // Social Buttons
              Row(
                children: [
                  Expanded(
                    child: _buildSocialButton(
                      text: 'Google',
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildSocialButton(
                      text: 'Facebook',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 56),
              // Footer
              _buildFooter(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoleCard({
    required String title,
    required String description,
    required String role,
    required Widget icon,
  }) {
    bool isSelected = selectedRole == role;
    return GestureDetector(
      onTap: () => setState(() => selectedRole = role),
      child: Container(
        width: double.infinity,

        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : const Color(0xFFFFF1E4).withOpacity(0.6),
          borderRadius: BorderRadius.circular(44),
          border: Border.all(
            color: isSelected ? const Color(0xFF755E00) : Colors.transparent,
            width: 3,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: const Color(0xFF755E00).withOpacity(0.12),
                    blurRadius: 24,
                    offset: const Offset(0, 12),
                  )
                ]
              : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 32,
              child: icon,
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 16,
                fontWeight: FontWeight.w900,
                color: const Color(0xFF1D1B1E),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              description,
              style: GoogleFonts.beVietnamPro(
                fontSize: 12,
                color: const Color(0xFF49454E).withOpacity(0.9),
                height: 1.3,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String hintText,
    bool isPassword = false,
    bool obscureText = false,
    VoidCallback? onToggleVisibility,
  }) {
    return TextField(
      obscureText: obscureText,
      style: GoogleFonts.beVietnamPro(fontSize: 18, color: const Color(0xFF1D1B1E)),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: GoogleFonts.beVietnamPro(
          color: const Color(0xFF52452A),
          fontSize: 18,

        ),
        filled: true,
        fillColor: const Color(0xFFEFE3CF).withOpacity(0.75),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide.none,

        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 26),
        suffixIcon: isPassword
            ? Padding(
                padding: const EdgeInsets.only(right: 16),
                child: IconButton(
                  icon: Icon(
                    obscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                    color: const Color(0xFF49454E).withOpacity(0.85),
                    size: 28,
                  ),
                  onPressed: onToggleVisibility,
                ),
              )
            : null,
      ),
    );
  }

  Widget _buildGradientButton(String text) {
    return Container(
      width: double.infinity,
      height: 76,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF735D01), Color(0xFFE9C849)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(38),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF735D01).withOpacity(0.35),
            blurRadius: 28,
            offset: const Offset(0, 14),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {
          if (selectedRole == 'Child') {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const KidsOnboarding()),
            );
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const AdultDashboard()),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(38),
          ),
        ),
        child: Text(
          text,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 18,
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Row(
      children: [
        const Expanded(child: Divider(color: Color(0xFFE5E1E6), thickness: 2)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Text(
            'OR JOIN WITH',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 12,
              fontWeight: FontWeight.w900,
              color: const Color(0xFF49454E),
              letterSpacing: 1.0,
            ),
          ),
        ),
        const Expanded(child: Divider(color: Color(0xFFE5E1E6), thickness: 2)),
      ],
    );
  }

  Widget _buildSocialButton({required String text, }) {
    return Container(
      height: 76,
      decoration: BoxDecoration(
        color: const Color(0xFFF6EAD8),
        borderRadius: BorderRadius.circular(38),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Text(
            text,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF1D1B1E),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: GoogleFonts.beVietnamPro(
            fontSize: 12,
            color: const Color(0xFF49454E),
            height: 1.6,
          ),
          children: [
            const TextSpan(text: 'By weaving your path with us, you agree to our '),
            TextSpan(
              text: 'Terms of\nDiscovery',
              style: const TextStyle(fontWeight: FontWeight.w900, color: Color(0xFF756000)),
            ),
            const TextSpan(text: ' and '),
            TextSpan(
              text: 'Privacy Silk',
              style: const TextStyle(fontWeight: FontWeight.w900, color: Color(0xFF756000)),
            ),
            const TextSpan(text: '.'),
          ],
        ),
      ),
    );
  }
}
