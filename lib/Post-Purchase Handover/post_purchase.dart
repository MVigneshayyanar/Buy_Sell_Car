import 'package:flutter/material.dart';

class PostPurchaseHandoverScreen extends StatelessWidget {
  const PostPurchaseHandoverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Post-Purchase Handover',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Oswald',
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Your car purchase is complete! Here\'s what happens next in the handover process.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                  fontFamily: 'Oswald',
                ),
              ),
              const SizedBox(height: 24),

              // Purchase Successful Card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green[50],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.green[200]!),
                ),
                child: Row(
                  children: [
                    Icon(Icons.check_circle, color: Colors.green[700], size: 24),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Purchase Successful!',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.green[800],
                              fontFamily: 'Oswald',
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Your car purchase has been completed successfully.',
                            style: TextStyle(
                              fontSize: 13,
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
              const SizedBox(height: 24),

              // Two Column Cards
              Row(
                children: [
                  Expanded(
                    child: _buildInfoCard(
                      icon: Icons.directions_car_outlined,
                      title: 'Buyer marks car as received',
                      description: 'Once you receive the car and verify its condition, mark it as received in your dashboard.',
                      buttonText: 'Mark car as received',
                      buttonColor: Colors.green,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildInfoCard(
                      icon: Icons.notifications_outlined,
                      title: 'Buyer marks car as received',
                      description: 'The seller will be immediately notified once you confirm receipt of the vehicle.',
                      buttonText: 'Notification will be seller',
                      buttonColor: Colors.green,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              Row(
                children: [
                  Expanded(
                    child: _buildInfoCard(
                      icon: Icons.account_balance_wallet_outlined,
                      title: 'Platform releases payment to seller',
                      description: 'After confirmation, the escrowed payment will be released to the seller within 24 hours.',
                      buttonText: 'Esrow payment active time limit',
                      buttonColor: Colors.orange,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildInfoCard(
                      icon: Icons.description_outlined,
                      title: 'RC Transfer Pack downloadable',
                      description: 'Download all necessary documents for RC transfer and registration.',
                      buttonText: 'Download RC Transfer Pack',
                      buttonColor: Colors.blue,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Important Documents Section
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.orange[50],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.orange[200]!),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.warning_amber_rounded, color: Colors.orange[700], size: 24),
                        const SizedBox(width: 8),
                        Text(
                          'Important Documents & Next Steps',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange[900],
                            fontFamily: 'Oswald',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _buildDocumentItem(
                      icon: Icons.article_outlined,
                      title: 'RC Transfer Documents',
                      subtitle: 'All required forms for vehicle registration transfer',
                    ),
                    const SizedBox(height: 12),
                    _buildDocumentItem(
                      icon: Icons.shield_outlined,
                      title: 'Insurance Transfer Guide',
                      subtitle: 'Step-by-step guide to transfer vehicle insurance',
                    ),
                    const SizedBox(height: 12),
                    _buildDocumentItem(
                      icon: Icons.receipt_long_outlined,
                      title: 'Purchase Receipt',
                      subtitle: 'Official receipt for your records and tax purposes',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Congratulations Card
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.purple[50]!, Colors.blue[50]!],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.purple[200]!),
                ),
                child: Column(
                  children: [
                    const Icon(Icons.celebration, color: Colors.purple, size: 48),
                    const SizedBox(height: 12),
                    const Text(
                      'Congratulations successful!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Oswald',
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Congratulations on your successful car purchase! We\'re here to support you through the handover process.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                        fontFamily: 'Oswald',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Action Buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.calendar_today, size: 18),
                      label: const Text(
                        'Schedule Visit',
                        style: TextStyle(fontFamily: 'Oswald'),
                      ),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.red,
                        side: BorderSide(color: Colors.red[300]!),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.visibility, size: 18),
                      label: const Text(
                        'View Order Details',
                        style: TextStyle(fontFamily: 'Oswald'),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String description,
    required String buttonText,
    required Color buttonColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 24, color: Colors.grey[700]),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              fontFamily: 'Oswald',
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey[600],
              height: 1.3,
              fontFamily: 'Oswald',
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: buttonColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: buttonColor.withOpacity(0.3)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.download, size: 12, color: buttonColor),
                const SizedBox(width: 4),
                Flexible(
                  child: Text(
                    buttonText,
                    style: TextStyle(
                      fontSize: 10,
                      color: buttonColor,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Oswald',
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDocumentItem({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, size: 20, color: Colors.orange[700]),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Oswald',
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[700],
                  fontFamily: 'Oswald',
                ),
              ),
            ],
          ),
        ),
      ],
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
              _buildNavItem(Icons.home_outlined, 'Home', false),
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