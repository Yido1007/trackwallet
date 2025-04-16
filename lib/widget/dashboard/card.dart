import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class SummaryCard extends StatelessWidget {
  final String title;
  final double amount;
  final IconData icon;
  final Color color;
  final List<Color> gradientColor;
  final showSign;
  const SummaryCard({
    super.key,
    required this.title,
    required this.amount,
    required this.icon,
    required this.color,
    required this.gradientColor,
    this.showSign = false,
  });

  @override
  Widget build(BuildContext context) {
    final amountFormat = NumberFormat.currency(symbol: "₺", decimalDigits: 2);
    return Container(
      width: 150,
      margin: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColor,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 18),
                Gap(8),
                Expanded(
                  child: Text(
                    title,
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium?.copyWith(fontSize: 15),
                  ),
                ),
              ],
            ),
            Spacer(),
            Text(
              "${showSign && amount > 0 ? "+" : ""}${amountFormat.format(amount)}",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
