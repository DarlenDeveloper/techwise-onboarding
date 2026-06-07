import 'package:flutter/material.dart';

class ActivityItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String amount;
  final String time;
  final bool isIncome;

  const ActivityItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.time,
    required this.isIncome,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subtitle, // 9AM in screenshot
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE0E0E0),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    title, // "Gym Session"
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF1A1A2E),
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE0E0E0),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    time, // "Design"
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF1A1A2E),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          // Vertical divider line from screenshot
          Container(width: 1, height: 80, color: const Color(0xFFF0F0F0)),
          const SizedBox(width: 12),
          // Placeholder for the "+" button columns in screenshot
          Column(
            children: [
              const Text('6 PM', style: TextStyle(fontSize: 12, color: Colors.grey)),
              const SizedBox(height: 35),
              _circleAdd(),
            ],
          ),
          const SizedBox(width: 12),
          Container(width: 1, height: 80, color: const Color(0xFFF0F0F0)),
          const SizedBox(width: 12),
          Column(
            children: [
              const Text('7 PM', style: TextStyle(fontSize: 12, color: Colors.grey)),
              const SizedBox(height: 35),
              _circleAdd(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _circleAdd() {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.withOpacity(0.5)),
      ),
      child: const Icon(Icons.add, size: 14, color: Colors.grey),
    );
  }
}
