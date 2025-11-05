import 'package:flutter/material.dart';
import 'package:untitled/bookvisitpage/bookvisit_2.dart';

class BookVisitFlow extends StatefulWidget {
  const BookVisitFlow({Key? key}) : super(key: key);

  @override
  State<BookVisitFlow> createState() => _BookVisitFlowState();
}

class _BookVisitFlowState extends State<BookVisitFlow> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Column(
        children: [
          const SizedBox(height:40),
          // Header section
          Container(
            width: double.infinity,
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Book Visit Flow',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Complete the following steps to book your car visit',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Main content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  // Step card
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: Column(
                      children: [
                        // Header
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              Icon(
                                Icons.calendar_today,
                                size: 20,
                                color: Colors.grey[700],
                              ),
                              const SizedBox(width: 12),
                              const Text(
                                'Select Date & Time Slot',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Divider(height: 1, color: Colors.grey[300]),

                        // Step items
                        _buildStepItem(
                          icon: Icons.calendar_today_outlined,
                          text: 'Select Visit Date',
                          onTap: () {},
                        ),

                        Divider(height: 1, color: Colors.grey[200], indent: 48),

                        _buildStepItem(
                          icon: Icons.access_time,
                          text: 'Select Time Slot',
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),

                  const Spacer(),

                  // Navigation arrows
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildNavigationButton(
                          icon: Icons.arrow_back,
                          onPressed: currentStep > 0
                              ? () {
                            setState(() {
                              currentStep--;
                            });
                          }
                              : null,
                        ),
                        _buildNavigationButton(
                          icon: Icons.arrow_forward,
                          onPressed: () {
                            setState(() {
                              currentStep++;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Bottom navigation
          _buildBottomNavigation(),
        ],
      ),
    );
  }

  Widget _buildStepItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          children: [
            Icon(
              icon,
              size: 20,
              color: Colors.grey[700],
            ),
            const SizedBox(width: 12),
            Text(
              text,
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey[800],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationButton({
    required IconData icon,
    VoidCallback? onPressed,
  }) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: onPressed != null ? Colors.red : Colors.grey[300]!,
          width: 1.5,
        ),
        color: Colors.white,
      ),
      child: IconButton(
        icon: Icon(
          icon,
          size: 20,
          color: onPressed != null ? Colors.red : Colors.grey[300],
        ),
        onPressed: (){
          //
        },
        padding: EdgeInsets.zero,
      ),
    );
  }

  Widget _buildBottomNavigation() {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildBottomNavItem(
              icon: Icons.upload_outlined,
              label: 'Car Details & Pricing',
              isActive: true,
            ),
            _buildBottomNavItem(
              icon: Icons.description_outlined,
              label: 'Document Upload',
              isActive: false,
            ),
            _buildBottomNavItem(
              icon: Icons.account_balance_wallet_outlined,
              label: 'Payment & Escrow',
              isActive: false,
            ),
            _buildBottomNavItem(
              icon: Icons.check_circle_outline,
              label: 'Confirmation',
              isActive: false,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavItem({
    required IconData icon,
    required String label,
    required bool isActive,
  }) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              color: isActive ? Colors.red : Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(
                color: isActive ? Colors.red : Colors.grey[400]!,
                width: 2,
              ),
            ),
            child: Icon(
              icon,
              size: 20,
              color: isActive ? Colors.white : Colors.grey[600],
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: isActive ? Colors.black : Colors.grey[700],
              fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
              height: 1.2,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}