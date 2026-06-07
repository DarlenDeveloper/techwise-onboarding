import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../data/mock_data.dart';
import '../models/transaction.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F5F2),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Header ──────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Transactions',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1A2E),
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // Summary Row (Flat)
                  Row(
                    children: [
                      _summaryTile('Income', '\$6,200', const Color(0xFFD4E157)),
                      const SizedBox(width: 12),
                      _summaryTile('Expenses', '\$1,450', const Color(0xFFF0F0F0)),
                    ],
                  ),
                ],
              ),
            ),

            // ── Transaction List ────────────────────────────────
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                itemCount: MockData.transactions.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final tx = MockData.transactions[index];
                  return _TransactionItem(transaction: tx);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _summaryTile(String label, String value, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: const TextStyle(fontSize: 14, color: Colors.grey)),
            const SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: color == const Color(0xFFF0F0F0) ? const Color(0xFF1A1A2E) : color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TransactionItem extends StatelessWidget {
  final Transaction transaction;
  const _TransactionItem({required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFF3F5F2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              transaction.isIncome ? Iconsax.arrow_down_1 : Iconsax.arrow_up_3,
              color: transaction.isIncome ? const Color(0xFFD4E157) : Colors.redAccent,
              size: 20,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.title,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF1A1A2E)),
                ),
                Text(
                  transaction.category,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
          Text(
            '${transaction.isIncome ? '+' : '-'}\$${transaction.amount}',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: transaction.isIncome ? const Color(0xFFD4E157) : const Color(0xFF1A1A2E),
            ),
          ),
        ],
      ),
    );
  }
}
