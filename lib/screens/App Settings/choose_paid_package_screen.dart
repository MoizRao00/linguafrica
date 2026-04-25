import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:linguafrica/screens/App%20Settings/Secure_payment_screen.dart';

class SubscriptionPlan {
  final String title;
  final String description;
  final double price;
  final String period;
  final List<String> features;
  final bool isPopular;
  final String? discount;

  SubscriptionPlan({
    required this.title,
    required this.description,
    required this.price,
    required this.period,
    required this.features,
    this.isPopular = false,
    this.discount,
  });
}

class ChoosePaidPackageScreen extends StatelessWidget {
  const ChoosePaidPackageScreen({super.key});

  static final _currencyFormat = NumberFormat.simpleCurrency(decimalDigits: 2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFDF9),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildTopBar(context),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    Text(
                      'Choose your\nLoom',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 48,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFF1D1B1E),
                        height: 1.1,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Invest in your future with the tools of language. Master culture through rhythm and geography.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.beVietnamPro(
                        fontSize: 16,
                        color: const Color(0xFF49454E),
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 48),
                    _buildMonthlyCard(context),
                    const SizedBox(height: 24),
                    _buildYearlyCard(context),
                    const SizedBox(height: 24),
                    _buildLifetimeCard(context),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back, color: Color(0xFF735D01), size: 28),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
          Text(
            'The Odyssey',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: const Color(0xFF735D01),
            ),
          ),
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage("assets/Parent Avatar.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceText(double price, String period) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: _currencyFormat.format(price),
            style: GoogleFonts.plusJakartaSans(
              fontSize: 40,
              fontWeight: FontWeight.w800,
              color: const Color(0xFF1D1B1E),
            ),
          ),
          TextSpan(
            text: ' /$period',
            style: GoogleFonts.beVietnamPro(
              fontSize: 18,
              color: const Color(0xFF1D1B1E),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMonthlyCard(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: const Color(0xFFFDF7E7),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Monthly',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: const Color(0xFF1D1B1E),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Flexibility to explore at your pace.',
            style: GoogleFonts.beVietnamPro(
              fontSize: 14,
              color: const Color(0xFF49454E),
            ),
          ),
          const SizedBox(height: 32),
          _buildPriceText(14.99, 'mo'),
          const SizedBox(height: 32),
          _buildFeatureRow(Icons.check_circle, 'All 11 languages unlocked', true),
          _buildFeatureRow(Icons.check_circle, 'Offline access', true),
          _buildFeatureRow(Icons.cancel_outlined, 'Professional certification', false),
          const SizedBox(height: 32),
          PlanButton(
            label: 'Select Plan',
            isPrimary: false,
            onPressed: () => _navigateToPayment(context),
          ),
        ],
      ),
    );
  }

  Widget _buildYearlyCard(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
            border: Border.all(color: const Color(0xFF735D01), width: 1.5),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF735D01).withOpacity(0.1),
                blurRadius: 30,
                offset: const Offset(0, 15),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Yearly',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF1D1B1E),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'The ultimate cultural immersion journey.',
                style: GoogleFonts.beVietnamPro(
                  fontSize: 14,
                  color: const Color(0xFF49454E),
                ),
              ),
              const SizedBox(height: 32),
              _buildPriceText(119.99, 'yr'),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F5E9),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Save 33% Yearly',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF007A33),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              _buildFeatureRow(Icons.check_circle, 'All languages access', true),
              _buildFeatureRow(Icons.check_circle, 'Exclusive content', true),
              _buildFeatureRow(Icons.check_circle, 'Priority support', true),
              const SizedBox(height: 32),
              PlanButton(
                label: 'Get Started',
                onPressed: () => _navigateToPayment(context),
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF735D01), Color(0xFFE9C849)],
              ),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(38),
                bottomLeft: Radius.circular(24),
              ),
            ),
            child: Text(
              'MOST POPULAR',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 12,
                fontWeight: FontWeight.w800,
                color: Colors.white,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLifetimeCard(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: const Color(0xFFFDF7E7),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Lifetime',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: const Color(0xFF1D1B1E),
            ),
          ),
          const SizedBox(height: 24),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF9EC),
              borderRadius: BorderRadius.circular(32),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Unravel the full potential',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: const Color(0xFF735D01),
                  ),
                ),
                const SizedBox(height: 24),
                _buildPriceText(299.99, 'once'),
                const SizedBox(height: 24),
                _buildLifetimeFeature(
                  icon: Icons.translate,
                  title: 'All 11 languages unlocked',
                  subtitle: 'Switch between Portuguese, Swahili, Japanese, and more at any time without restrictions.',
                ),
                const SizedBox(height: 24),
                _buildLifetimeFeature(
                  icon: Icons.lightbulb_outline,
                  title: '1-on-1 tutor support',
                  subtitle: 'Receive personalized feedback from native linguists to perfect your accent and grammar.',
                ),
                const SizedBox(height: 32),
                ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Container(
                    height: 240,
                    width: double.infinity,
                    color: Colors.black,
                    child: Image.asset(
                      "assets/Learning.png",
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                PlanButton(
                  label: 'Get Lifetime Access',
                  onPressed: () => _navigateToPayment(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLifetimeFeature(
      {required IconData icon, required String title, required String subtitle}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
            color: Color(0xFFFFEAB4),
            shape: BoxShape.circle,
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
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF1D1B1E),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: GoogleFonts.beVietnamPro(
                  fontSize: 13,
                  color: const Color(0xFF49454E),
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFeatureRow(IconData icon, String text, bool isEnabled) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: isEnabled ? const Color(0xFF007A33) : const Color(0xFF49454E).withOpacity(0.4),
            size: 24,
          ),
          const SizedBox(width: 16),
          Text(
            text,
            style: GoogleFonts.beVietnamPro(
              fontSize: 15,
              color: isEnabled ? const Color(0xFF1D1B1E) : const Color(0xFF49454E).withOpacity(0.4),
              fontWeight: isEnabled ? FontWeight.w500 : FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToPayment(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SecurePaymentScreen()),
    );
  }
}

class PlanButton extends StatelessWidget {
  final String label;
  final bool isPrimary;
  final VoidCallback onPressed;

  const PlanButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isPrimary = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 64,
      decoration: BoxDecoration(
        color: isPrimary ? null : const Color(0xFFF1E9DB),
        gradient: isPrimary
            ? const LinearGradient(
                colors: [Color(0xFF735D01), Color(0xFFE9C849)],
              )
            : null,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(32),
          onTap: onPressed,
          child: Center(
            child: Text(
              label,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: isPrimary ? Colors.white : const Color(0xFF735D01),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
