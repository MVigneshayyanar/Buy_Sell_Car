import 'package:flutter/material.dart';
import 'package:untitled/Direct Purchase Flow/document_upload.dart';

class DirectPurchaseFlowScreen extends StatefulWidget {
  const DirectPurchaseFlowScreen({Key? key}) : super(key: key);

  @override
  State<DirectPurchaseFlowScreen> createState() => _DirectPurchaseFlowScreenState();
}

class _DirectPurchaseFlowScreenState extends State<DirectPurchaseFlowScreen> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'Direct Purchase Flow',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Oswald',
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Complete your car purchase with our secure process',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      fontFamily: 'Oswald',
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildProgressSteps(),
                  const SizedBox(height: 32),
                  _buildCarDetailsSection(),
                  const SizedBox(height: 24),
                  _buildNavigationButtons(),
                  const SizedBox(height: 24),
                  _buildOrderSummarySection(),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildProgressSteps() {
    final steps = [
      {'icon': Icons.description, 'label': 'Car Details & Pricing'},
      {'icon': Icons.upload_file, 'label': 'Document\nUpload      '},
      {'icon': Icons.account_balance_wallet, 'label': 'Payment & Escrow'},
      {'icon': Icons.check_circle, 'label': 'Confirmation'},
    ];

    return Row(
      children: List.generate(steps.length, (index) {
        final isActive = index == currentStep;
        return Expanded(
          child: Column(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: isActive ? Colors.black : Colors.grey[200],
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  steps[index]['icon'] as IconData,
                  color: isActive ? Colors.white : Colors.grey[400],
                  size: 24,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                steps[index]['label'] as String,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 11,
                  color: isActive ? Colors.black : Colors.grey,
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
                  fontFamily: 'Oswald',
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildCarDetailsSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFFAFAFA),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.article_outlined, size: 20),
              SizedBox(width: 8),
              Text(
                'Car Details & Full Amount Breakdown',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Oswald',
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Container(
                width: 100,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.directions_car, size: 40, color: Colors.white),
              ),
              const SizedBox(width: 16),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Honda City 2019',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Oswald',
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Base Price: ₹850,000',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontFamily: 'Oswald',
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'Amount Breakdown',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontFamily: 'Oswald',
            ),
          ),
          const SizedBox(height: 16),
          _buildBreakdownRow('Car Price', '₹850,000'),
          _buildBreakdownRow('Tax (GST 18%)', '₹153,000'),
          _buildBreakdownRow('Platform Fee', '₹5,000'),
          const Divider(height: 32),
          _buildBreakdownRow('Total Amount', '₹1,008,000', isBold: true),
        ],
      ),
    );
  }

  Widget _buildBreakdownRow(String label, String amount, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 15,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              fontFamily: 'Oswald',
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              fontSize: 15,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              fontFamily: 'Oswald',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.red[300]!),
          ),
          child: const Icon(Icons.arrow_back, color: Colors.red),
        ),
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_forward, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DocumentUploadScreen(),
                ),
              );
            },
            padding: EdgeInsets.zero,
          ),
        ),
      ],
    );
  }

  Widget _buildOrderSummarySection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Order Summary',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'Oswald',
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Container(
                width: 100,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.directions_car, size: 40, color: Colors.white),
              ),
              const SizedBox(width: 16),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Honda City 2019',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Oswald',
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '2019 • Petrol • Manual',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                      fontFamily: 'Oswald',
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildSummaryRow('Car Price', '₹850,000'),
          _buildSummaryRow('Tax & Fees', '₹158,000'),
          const Divider(height: 24),
          _buildSummaryRow('Total', '₹1,008,000', isBold: true),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(Icons.shield_outlined, color: Colors.blue[700], size: 20),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Escrow Protected',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.blue[700],
                          fontFamily: 'Oswald',
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Your payment is secured until delivery confirmation',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.blue[700],
                          fontFamily: 'Oswald',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.green[50],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(Icons.access_time, color: Colors.green[700], size: 20),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Quick Process',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.green[700],
                          fontFamily: 'Oswald',
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Complete purchase in under 10 minutes',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.green[700],
                          fontFamily: 'Oswald',
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

  Widget _buildSummaryRow(String label, String amount, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 15,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              fontFamily: 'Oswald',
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              fontSize: 15,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              fontFamily: 'Oswald',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.home_outlined, 'Home', true),
              _buildNavItem(Icons.shopping_bag_outlined, 'Buy', false),
              _buildNavItem(Icons.add_circle_outline, 'Sell', false),
              _buildNavItem(Icons.chat_bubble_outline, 'Chat', false),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isActive) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: isActive ? Colors.black : Colors.grey,
          size: 28,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: isActive ? Colors.black : Colors.grey,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
            fontFamily: 'Oswald',
          ),
        ),
      ],
    );
  }
}