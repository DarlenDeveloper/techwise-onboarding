import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:iconsax/iconsax.dart';
import '../data/mock_data.dart';

class ChartWidget extends StatelessWidget {
  const ChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Payment Summery', // Matching user's screenshot typo for authenticity ;) or fixing it? I'll match for now.
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
              const Icon(Iconsax.code, size: 20, color: Color(0xFF1A1A2E)),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            '\$ 56k',
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1A1A2E),
            ),
          ),
          const Text(
            'May gross payment',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 16),
          
          // Legend
          Wrap(
            spacing: 16,
            runSpacing: 8,
            children: [
              _legend(const Color(0xFFE0E0E0), 'Paid'),
              _legend(const Color(0xFFE8B86D), 'Upcoming'),
              _legend(const Color(0xFFD4E157), 'Overdue'),
              _legend(const Color(0xFF9E9E9E), 'Processing'),
            ],
          ),
          
          const SizedBox(height: 48),
          
          // Custom Bar Chart (thin gray lines + colored thick foreground bars)
          SizedBox(
            height: 100,
            child: Stack(
              children: [
                // Background thin lines
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(24, (i) => Container(
                    width: 2,
                    height: 100,
                    color: const Color(0xFFF0F0F0),
                  )),
                ),
                // Foreground data bars (Matching the screenshot's three main groups)
                Positioned(
                  bottom: 0,
                  left: 60,
                  child: _coloredBar(const Color(0xFFD4E157), 50),
                ),
                Positioned(
                  bottom: 0,
                  left: 110,
                  child: _coloredBar(const Color(0xFF9E9E9E), 30),
                ),
                Positioned(
                  bottom: 0,
                  left: 140,
                  child: _coloredBar(const Color(0xFFE8B86D), 40),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          // Percentage labels
          Row(
            children: [
              const SizedBox(width: 0),
              _percentText('50%'),
              const SizedBox(width: 50),
              _percentText('30%'),
              const SizedBox(width: 25),
              _percentText('10%'),
              const SizedBox(width: 20),
              _percentText('10%'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _legend(Color color, String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(width: 10, height: 10, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
        const SizedBox(width: 8),
        Text(label, style: const TextStyle(fontSize: 13, color: Color(0xFF555555))),
      ],
    );
  }

  Widget _coloredBar(Color color, double width) {
    return Container(
      width: width,
      height: 20,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  Widget _percentText(String text) {
    return Text(text, style: const TextStyle(fontSize: 12, color: Colors.grey));
  }
}
