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
                    'Activities',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1A2E),
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),

            // ── Activity List ──────────────────────────────────
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                itemCount: MockData.transactions.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final tx = MockData.transactions[index];
                  return _ActivityItem(transaction: tx);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

}

class _ActivityItem extends StatefulWidget {
  final Transaction transaction;
  const _ActivityItem({required this.transaction});

  @override
  State<_ActivityItem> createState() => _ActivityItemState();
}

class _ActivityItemState extends State<_ActivityItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _isExpanded = !_isExpanded),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            // Head Row (Always visible)
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(
                    color: Color(0xFFF0F2F5),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    widget.transaction.isIncome ? Iconsax.arrow_down_1 : Iconsax.arrow_up_2,
                    color: const Color(0xFF1A1A2E), // Using minimalist layout icon styling
                    size: 16,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.transaction.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1A1A2E),
                        ),
                      ),
                      Text(
                        '${widget.transaction.category} • ${widget.transaction.date.month}/${widget.transaction.date.day}',
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${widget.transaction.isIncome ? '+' : '-'}\$${widget.transaction.amount}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1A1A2E),
                      ),
                    ),
                    Icon(
                      _isExpanded ? Iconsax.arrow_up_2 : Iconsax.arrow_down_1,
                      color: Colors.grey,
                      size: 14,
                    ),
                  ],
                ),
              ],
            ),
            
            // Expanded Dropdown Detail Section
            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: _isExpanded
                  ? Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Column(
                        children: [
                          Divider(color: Colors.grey.withOpacity(0.2), thickness: 1),
                          const SizedBox(height: 12),
                          _buildDetailRow('Transaction ID', widget.transaction.id),
                          const SizedBox(height: 8),
                          _buildDetailRow('Time', '${widget.transaction.date.hour}:${widget.transaction.date.minute.toString().padLeft(2, '0')}'),
                          const SizedBox(height: 8),
                          _buildDetailRow('Status', 'Completed', valueColor: const Color(0xFF27AE60)),
                        ],
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {Color? valueColor}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500),
        ),
        Text(
          value,
          style: TextStyle(
            color: valueColor ?? const Color(0xFF1A1A2E),
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
