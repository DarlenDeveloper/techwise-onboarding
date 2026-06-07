import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:iconsax/iconsax.dart';

class GraphPopup extends StatelessWidget {
  final String title;
  final String value;
  final bool isPositive;

  const GraphPopup({
    super.key,
    required this.title,
    required this.value,
    this.isPositive = true,
  });

  @override
  Widget build(BuildContext context) {
    final lineColor = isPositive ? const Color(0xFF27AE60) : const Color(0xFFEB5757); // Green if up, Red if down
    
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        padding: const EdgeInsets.all(24),
        width: double.infinity,
        height: 280,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      value,
                      style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF1A1A2E)),
                    ),
                  ],
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF3F5F2),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      )
                    ],
                  ),
                  child: IconButton(
                    icon: const Icon(Iconsax.arrow_right_3, size: 20, color: Color(0xFF1A1A2E)),
                    onPressed: () => Navigator.pop(context),
                    padding: EdgeInsets.zero,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Expanded(
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(
                    show: true,
                    topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 10,
                        interval: 1,
                        getTitlesWidget: (value, meta) {
                          return Container(
                            width: 2,
                            height: 6,
                            margin: const EdgeInsets.only(top: 4),
                            color: Colors.grey.withOpacity(0.3),
                          );
                        },
                      ),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  minX: 0,
                  maxX: 6,
                  minY: 0,
                  maxY: 10,
                  lineBarsData: [
                    LineChartBarData(
                      spots: _getMockSpots(),
                      isCurved: false, // Straight segmented lines like screenshot
                      color: lineColor,
                      barWidth: 3,
                      isStrokeCapRound: true,
                      dotData: FlDotData(
                        show: true,
                        checkToShowDot: (spot, barData) => spot.x == 6, // Show only last dot
                        getDotPainter: (spot, percent, barData, index) {
                          return FlDotCirclePainter(
                            radius: 4,
                            color: lineColor,
                            strokeWidth: 2,
                            strokeColor: Colors.white,
                          );
                        },
                      ),
                      belowBarData: BarAreaData(
                        show: true,
                        color: lineColor.withOpacity(0.15),
                      ),
                    ),
                  ],
                  // Custom tooltip for the last point
                  lineTouchData: LineTouchData(
                    enabled: false,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<FlSpot> _getMockSpots() {
    if (isPositive) {
      return const [
        FlSpot(0, 5),
        FlSpot(1, 4),
        FlSpot(2, 4),
        FlSpot(3, 5),
        FlSpot(4, 3),
        FlSpot(5, 2),
        FlSpot(6, 1),
      ];
    } else {
      return const [
        FlSpot(0, 2),
        FlSpot(1, 3),
        FlSpot(2, 4),
        FlSpot(3, 3),
        FlSpot(4, 5),
        FlSpot(5, 7),
        FlSpot(6, 8),
      ];
    }
  }
}
