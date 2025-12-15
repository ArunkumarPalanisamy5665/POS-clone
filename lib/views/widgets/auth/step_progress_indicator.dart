import 'package:flutter/material.dart';

class StepProgressIndicator extends StatelessWidget {
  final int totalSteps;
  final int currentStep;
  final double height;
  final double spacing;
  final Color activeColor;
  final Color inactiveColor;
  final BorderRadius borderRadius;

  const StepProgressIndicator({
    super.key,
    required this.totalSteps,
    required this.currentStep,
    this.height = 6,
    this.spacing = 8,
    this.activeColor = const Color(0xFF0C76E1),
    this.inactiveColor = const Color(0xFFE2E8F0),
    this.borderRadius = const BorderRadius.all(Radius.circular(10)),
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(totalSteps, (index) {
        final bool isActive = index < currentStep;

        return Expanded(
          child: Container(
            margin: EdgeInsets.only(
              right: index == totalSteps - 1 ? 0 : spacing,
            ),
            height: height,
            decoration: BoxDecoration(
              color: isActive ? activeColor : inactiveColor,
              borderRadius: borderRadius,
            ),
          ),
        );
      }),
    );
  }
}
