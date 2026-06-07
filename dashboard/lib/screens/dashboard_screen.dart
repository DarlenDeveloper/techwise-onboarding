import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../widgets/summary_card.dart';

class DashboardScreen extends StatelessWidget {
  final VoidCallback onNavigate;
  const DashboardScreen({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F5F2),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Header ──────────────────────────────────────────
              Row(
                children: [
                  const CircleAvatar(
                    radius: 26,
                    backgroundColor: Colors.white,
                    child: Icon(Iconsax.profile_circle5, size: 28, color: Color(0xFF1A1A2E)),
                  ),
                  const SizedBox(width: 14),
                  const Text(
                    'Hello Admin',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF1A1A2E),
                    ),
                  ),
                  const Spacer(),
                  _roundIconButton(Iconsax.search_normal),
                  const SizedBox(width: 12),
                  _roundIconButton(Iconsax.notification),
                ],
              ),

              const SizedBox(height: 32),

              // ── Welcome Title ────────────────────────────────────
              const Text(
                'Your',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w300,
                  color: Color(0xFF1A1A2E),
                ),
              ),
              const Text(
                'Dashboard',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1A2E),
                  height: 1.1,
                ),
              ),

              const SizedBox(height: 32),

              // ── 2x2 Summary Grid ─────────────────────────────────
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 1.0,
                children: const [
                  SummaryCard(
                    title: 'Total Sales',
                    value: '\$56,000',
                    svgPath: 'assets/icons/home-trend-down.svg',
                    percentChange: '+12%',
                    isPositive: true,
                  ),
                  SummaryCard(
                    title: 'New Clients',
                    value: '1,240',
                    svgPath: 'assets/icons/clipboard-export.svg',
                    percentChange: '+8%',
                    isPositive: true,
                  ),
                  SummaryCard(
                    title: 'Active Projects',
                    value: '24',
                    svgPath: 'assets/icons/trello.svg',
                    percentChange: '-3%',
                    isPositive: false,
                  ),
                  SummaryCard(
                    title: 'Pending Tasks',
                    value: '16',
                    svgPath: 'assets/icons/task-square.svg',
                    percentChange: '+5%',
                    isPositive: true,
                  ),
                ],
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _roundIconButton(IconData icon) {
    return Container(
      width: 48,
      height: 48,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: 20, color: const Color(0xFF1A1A2E)),
    );
  }
}
