import 'package:flutter/material.dart';
import 'dart:ui'; // Required for ImageFilter.blur

class ScoreScreen extends StatelessWidget {
  final List<String> selectedSkills;

  const ScoreScreen({Key? key, required this.selectedSkills}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double score = (selectedSkills.length / 10 * 100).clamp(
      0,
      100,
    ); // simple scoring logic

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Your',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'SCORE',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff113AF0),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 80),

          // Circle progress and blur
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: ClipOval(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
                    child: Container(
                      color: const Color(0xff113AF0).withOpacity(0.1),
                    ),
                  ),
                ),
              ),
              Container(
                width: 160,
                height: 160,
                decoration: const BoxDecoration(
                  color: Color(0xff113AF0),
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(
                width: 170,
                height: 170,
                child: CircularProgressIndicator(
                  value: score / 100,
                  strokeWidth: 10,
                  backgroundColor: Colors.transparent,
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
              Text(
                '${score.toStringAsFixed(1)}%',
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),

          const SizedBox(height: 40),

          // Optionally show selected skills
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: selectedSkills.map((skill) {
                return Chip(
                  label: Text(skill),
                  backgroundColor: Colors.grey.shade200,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
