import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SecurePaymentScreen extends StatefulWidget {
  const SecurePaymentScreen({super.key});

  @override
  State<SecurePaymentScreen> createState() => _SecurePaymentScreenState();
}

class _SecurePaymentScreenState extends State<SecurePaymentScreen> {
  int _selectedPaymentMethod = 0; // 0 for Card, 1 for Bank

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
          'The Odyssey',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: const Color(0xFF735D01),
          ),
        ),
        centerTitle: false,
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
        decoration: BoxDecoration(
          color: const Color(0xFFFFFDF9),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: _buildSecureCheckoutButton(context),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            _buildSelectedPlanCard(),
            const SizedBox(height: 32),
            Text(
              'Payment Method',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: const Color(0xFF1D1B1E),
              ),
            ),
            const SizedBox(height: 16),
            _buildPaymentMethodTabs(),
            const SizedBox(height: 24),
            _buildCardForm(),
            const SizedBox(height: 32),
            Text(
              'INSTANT BANK TRANSFER',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 12,
                fontWeight: FontWeight.w800,
                color: const Color(0xFF49454E),
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 16),
            _buildBankOptions(),
            const SizedBox(height: 32),
            _buildOrderSummary(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectedPlanCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
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
            top: -10,
            child: Icon(
              Icons.stars,
              size: 100,
              color: const Color(0xFFFDF7E7).withOpacity(0.5),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F5E9),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'SELECTED PLAN',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    color: const Color(0xFF007A33),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Annual\nImmersion',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF1D1B1E),
                  height: 1.1,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Advanced Portuguese & Yoruba\nCurriculum',
                style: GoogleFonts.beVietnamPro(
                  fontSize: 14,
                  color: const Color(0xFF49454E),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '\$199.00',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF735D01),
                    ),
                  ),
                  Text(
                    '/yr',
                    style: GoogleFonts.beVietnamPro(
                      fontSize: 16,
                      color: const Color(0xFF49454E),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                'Save 35% compared to monthly',
                style: GoogleFonts.beVietnamPro(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF007A33),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethodTabs() {
    return Row(
      children: [
        _buildTabItem(0, Icons.credit_card, 'Card'),
        const SizedBox(width: 12),
        _buildTabItem(1, Icons.account_balance, 'Bank'),
        const SizedBox(width: 12),
        _buildTabItem(2, Icons.account_balance_wallet, 'Mobile'),
      ],
    );
  }

  Widget _buildTabItem(int index, IconData icon, String label) {
    bool isSelected = _selectedPaymentMethod == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedPaymentMethod = index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : const Color(0xFFFDF7E7),
          borderRadius: BorderRadius.circular(16),
          border: isSelected ? Border.all(color: const Color(0xFF735D01), width: 1) : null,
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  )
                ]
              : null,
        ),
        child: Row(
          children: [
            Icon(icon, size: 20, color: isSelected ? const Color(0xFF735D01) : const Color(0xFF49454E)),
            const SizedBox(width: 8),
            Text(
              label,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: isSelected ? const Color(0xFF735D01) : const Color(0xFF49454E),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardForm() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFFDF7E7),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTextFieldLabel('CARDHOLDER NAME'),
          _buildTextField('ALEXANDER VOGUE'),
          const SizedBox(height: 20),
          _buildTextFieldLabel('CARD NUMBER'),
          _buildTextField('0000 0000 0000 0000', suffixIcon: Icons.credit_card),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTextFieldLabel('EXPIRY DATE'),
                    _buildTextField('MM/YY'),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTextFieldLabel('CVV'),
                    _buildTextField('***', suffixIcon: Icons.help_outline),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTextFieldLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        label,
        style: GoogleFonts.plusJakartaSans(
          fontSize: 10,
          fontWeight: FontWeight.w800,
          color: const Color(0xFF49454E),
          letterSpacing: 1.0,
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, {IconData? suffixIcon}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            hint,
            style: GoogleFonts.beVietnamPro(
              fontSize: 14,
              color: const Color(0xFF1D1B1E).withOpacity(0.3),
            ),
          ),
          if (suffixIcon != null) Icon(suffixIcon, size: 20, color: Colors.grey[400]),
        ],
      ),
    );
  }

  Widget _buildBankOptions() {
    return Row(
      children: [
        _buildBankItem(Icons.account_balance, 'Standard Bank', const Color(0xFFFBC02D)),
        const SizedBox(width: 12),
        _buildBankItem(Icons.account_balance, 'First National', const Color(0xFF2196F3)),
        const SizedBox(width: 12),
        _buildBankItem(Icons.account_balance, 'Absa Group', const Color(0xFF4CAF50)),
      ],
    );
  }

  Widget _buildBankItem(IconData icon, String name, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFFFDF7E7),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 24),
            ),
            const SizedBox(height: 8),
            Text(
              name,
              textAlign: TextAlign.center,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF1D1B1E),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderSummary() {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: const Color(0xFFF6EBD8).withOpacity(0.6),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Order Summary',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: const Color(0xFF1D1B1E),
            ),
          ),
          const SizedBox(height: 24),
          _buildSummaryRow('Annual Subscription', '\$299.00'),
          const SizedBox(height: 12),
          _buildSummaryRow('Early Bird Discount', '-\$100.00', isDiscount: true),
          const SizedBox(height: 12),
          _buildSummaryRow('Tax (VAT 0%)', '\$0.00'),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'TOTAL',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF49454E),
                ),
              ),
              Text(
                '\$199.00',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF1D1B1E),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildMethodButton(Colors.black, Colors.white, 'Apple Pay'),
          const SizedBox(height: 12),
          _buildMethodButton(Colors.white, Colors.black, 'Google Pay'),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 2.0),
                child: Icon(Icons.location_on_outlined, size: 14, color: Color(0xFF49454E)),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'YOUR DATA IS ENCRYPTED AND SECURE WITH 256-BIT SSL.',
                  style: GoogleFonts.beVietnamPro(
                    fontSize: 9,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF49454E),
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isDiscount = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.beVietnamPro(
            fontSize: 14,
            color: const Color(0xFF49454E),
          ),
        ),
        Text(
          value,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: isDiscount ? const Color(0xFF007A33) : const Color(0xFF1D1B1E),
          ),
        ),
      ],
    );
  }

  Widget _buildMethodButton(Color bgColor, Color textColor, String label) {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(28),
        border: bgColor == Colors.white ? Border.all(color: Colors.grey.withOpacity(0.2)) : null,
      ),
      child: Center(
        child: Text(
          label,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: textColor,
          ),
        ),
      ),
    );
  }

  Widget _buildSecureCheckoutButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Implement payment logic or confirmation
      },
      child: Container(
        width: double.infinity,
        height: 64,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF735D01), Color(0xFFE9C849)],
          ),
          borderRadius: BorderRadius.circular(32),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF735D01).withOpacity(0.3),
              blurRadius: 12,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.lock, color: Colors.white, size: 20),
            const SizedBox(width: 12),
            Text(
              'Secure Checkout',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
