import 'package:flutter/material.dart';
import 'dart:math';

import 'package:starbucks_clone_app/constants/colors.dart';

class SemiCircularChart extends StatelessWidget {
  final int total;
  final int completed;

  const SemiCircularChart({
    Key? key,
    required this.total,
    required this.completed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            // Grafik Çizimi
            CustomPaint(
              size: const Size(120, 120), // Çemberin boyutu
              painter: CircularChartPainter(
                total: total,
                completed: completed,
              ),
            ),
            // Bardak Resmi
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                'https://www.pngall.com/wp-content/uploads/4/Starbucks-Coffee-PNG-Image.png',
                width: 75,
                height: 75,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        // Oran Yazısı
        Text(
          "$completed / $total",
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.grey),
        ),
      ],
    );
  }
}

class CircularChartPainter extends CustomPainter {
  final int total;
  final int completed;

  CircularChartPainter({
    required this.total,
    required this.completed,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    // Yarı çap ve merkez noktası
    final radius = size.width / 2;
    final center = Offset(size.width / 2, size.height / 2);

    // Tam çember
    const startAngle = pi / 2; // Aşağıdan başlar
    const sweepAngle = 2 * pi;

    // Gri (Tamamlanmamış) alan
    paint.color = Colors.grey;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      paint,
    );

    // Yeşil (Tamamlanmış) alan
    paint.color = AColors.primaryGreen;
    final completedSweepAngle = (completed / total) * sweepAngle;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      completedSweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
