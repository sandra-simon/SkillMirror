import 'package:flutter/material.dart';
import 'dart:ui'; // Required for ImageFilter.blur

class ScoreScreen extends StatelessWidget {
  final List<String> selectedSkills;

  const ScoreScreen({Key? key, required this.selectedSkills}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Example full skill list (replace with Firestore or dynamic list if needed)
    final List<String> allSkills = [
      "Python",
      "SQL",
      "Flutter",
      "Machine Learning",
      "Data Visualization",
      "Java",
      "React",
      "Communication",
      "Problem Solving",
      "Cloud Computing"
    ];

    // Match only the skills that exist in allSkills
    final matchedSkills = selectedSkills
        .where((skill) =>
            allSkills.map((s) => s.toLowerCase()).contains(skill.toLowerCase()))
        .toList();

    // Calculate score based on matched skills only
    final double score =
        (matchedSkills.length / allSkills.length * 100).clamp(0, 100);

    // Suggested skills = ones missing from matched
    final List<String> suggestedSkills = allSkills
        .where((skill) => !matchedSkills
            .map((s) => s.toLowerCase())
            .contains(skill.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
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
            const SizedBox(height: 80),

            // Circle progress and blur (Centered)
            Center(
              child: Stack(
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
                      valueColor:
                          const AlwaysStoppedAnimation<Color>(Colors.white),
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
            ),

            const SizedBox(height: 40),

            // Selected Skills Section
            if (selectedSkills.isNotEmpty) ...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  "Your Selected Skills",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 12),
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
              const SizedBox(height: 30),
            ],

            // Suggested Skills Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Suggested Skills",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: suggestedSkills.isEmpty
                    ? const Center(
                        child: Text(
                          "You're all set! 🎉",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    : Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: suggestedSkills.map((skill) {
                          return Chip(
                            label: Text(skill),
                            backgroundColor: Colors.blue.shade50,
                            labelStyle: const TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          );
                        }).toList(),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
