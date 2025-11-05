import 'package:flutter/material.dart';

class AITrustScorePage extends StatelessWidget {
  const AITrustScorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            _buildAIEvaluation(),
            _buildTrustScoreLevels(),
            _buildWhyTrust(),
            _buildCTA(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 50, 24, 40),
      color: Colors.white,
      child: Column(
        children: [
          Icon(
            Icons.star,
            size: 40,
            color: Colors.amber[600],
          ),
          const SizedBox(height: 16),
          const Text(
            'AI Trust Score',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1a1a2e),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'AI-powered car evaluation that gives every seller\ntrustworthiness score and car condition to help you make\ninformed decisions.',
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey[700],
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildAIEvaluation() {
    return Container(
      padding: const EdgeInsets.all(24),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'How Our AI Evaluates Trust',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1a1a2e),
            ),
          ),
          const SizedBox(height: 24),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _buildEvaluationCard(
                  icon: Icons.person_outline,
                  title: 'Seller Analysis',
                  items: [
                    'Response time and communication',
                    'Historical transaction success rate',
                    'Identity verification status',
                    'Previous buyer reviews',
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildEvaluationCard(
                  icon: Icons.directions_car_outlined,
                  title: 'Car Condition Assessment',
                  items: [
                    'Photo quality and completeness',
                    'Maintenance records validation',
                    'Price comparison with market',
                    'Description consistency check',
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEvaluationCard({
    required IconData icon,
    required String title,
    required List<String> items,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFAFAFA),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 28, color: Colors.blue[700]),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1a1a2e),
            ),
          ),
          const SizedBox(height: 12),
          ...items.map((item) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 6),
                  width: 4,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[600],
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    item,
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey[700],
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }

  Widget _buildTrustScoreLevels() {
    return Container(
      padding: const EdgeInsets.all(24),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Trust Score Levels',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1a1a2e),
            ),
          ),
          const SizedBox(height: 24),
          _buildScoreLevel(
            stars: 5,
            color: Colors.green,
            rating: 'Excellent (95-100)',
            description:
            'Highly trustworthy seller with a flawless track record. Complete documentation and transparent communication.',
          ),
          const SizedBox(height: 16),
          _buildScoreLevel(
            stars: 3,
            color: Colors.amber,
            rating: 'Good (75-94)',
            description:
            'Reliable seller with good track record. Minor documentation gaps or communication delays may exist.',
          ),
          const SizedBox(height: 16),
          _buildScoreLevel(
            stars: 1,
            color: Colors.red,
            rating: 'Exercise Caution (74)',
            description:
            'Proceed with extreme caution. Significant red flags in seller history or car documentation.',
          ),
        ],
      ),
    );
  }

  Widget _buildScoreLevel({
    required int stars,
    required Color color,
    required String rating,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFAFAFA),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: List.generate(
              5,
                  (index) => Icon(
                index < stars ? Icons.star : Icons.star_border,
                size: 18,
                color: color,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            rating,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            description,
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey[700],
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWhyTrust() {
    return Container(
      padding: const EdgeInsets.all(24),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Why Trust AI Scoring?',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1a1a2e),
            ),
          ),
          const SizedBox(height: 20),
          _buildBulletPoint(
            'Objective Analysis',
            'AI removes emotional bias. Uses hard data, not feelings. Consistent evaluation across all sellers.',
          ),
          const SizedBox(height: 16),
          _buildBulletPoint(
            'Continuous Learning',
            'System improves over time. Identifies new fraud patterns. Real-time updates from actual transactions.',
          ),
          const SizedBox(height: 16),
          _buildBulletPoint(
            'Real-time Updates',
            'Trust scores update automatically as new information becomes available.',
          ),
          const SizedBox(height: 16),
          _buildBulletPoint(
            'Pattern Recognition',
            'Identifies red flags humans miss. Detects suspicious listings early. Flags inconsistencies across listings.',
          ),
        ],
      ),
    );
  }

  Widget _buildBulletPoint(String title, String description) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 4),
          width: 6,
          height: 6,
          decoration: BoxDecoration(
            color: Colors.amber[700],
            shape: BoxShape.circle,
          ),
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
                  color: Color(0xFF1a1a2e),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[700],
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCTA() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Colors.amber[600]!,
            Colors.amber[700]!,
          ],
        ),
      ),
      child: Column(
        children: [
          const Text(
            'Shop with Confidence',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 28),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.search, size: 20),
            label: const Text(
              'Browse Trusted Sellers',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.amber[800],
              padding: const EdgeInsets.symmetric(
                horizontal: 28,
                vertical: 16,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 0,
            ),
          ),
        ],
      ),
    );
  }
}