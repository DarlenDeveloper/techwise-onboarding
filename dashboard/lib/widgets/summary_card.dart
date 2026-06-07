import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SummaryCard extends StatelessWidget {
  final String title;
  final String value;
  final String svgPath;
  final String percentChange;
  final bool isPositive;
  final VoidCallback? onTap;

  const SummaryCard({
    super.key,
    required this.title,
    required this.value,
    required this.svgPath,
    this.percentChange = '+0%',
    this.isPositive = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top row: icon (left) + percentage change (right)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                svgPath,
                colorFilter: const ColorFilter.mode(
                  Color(0xFF1A1A2E),
                  BlendMode.srcIn,
                ),
                width: 28,
                height: 28,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: isPositive
                      ? const Color(0xFFE8F5E9)
                      : const Color(0xFFFFEBEE),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  percentChange,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: isPositive
                        ? const Color(0xFF2E7D32)
                        : const Color(0xFFC62828),
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          // Value
          Text(
            value,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1A2E),
            ),
          ),
          const SizedBox(height: 4),
          // Title
          Text(
            title,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      ),
    );
  }
}
