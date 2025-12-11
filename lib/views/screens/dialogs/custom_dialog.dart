import 'dart:ui';
import 'package:flutter/material.dart';

class CustomDialog {
  bool _isOpen = false;
  BuildContext? _dialogContext;

  Future<void> show({
    required BuildContext context,
    required String title,
    required String message,
    required String primaryText,
    required String secondaryText,
    required VoidCallback onPrimary,
    required VoidCallback onSecondary,
    IconData? icon,
    bool isVerticalButtons = false,
    bool barrierDismissible = false,
  }) async {
    if (_isOpen) return;
    _isOpen = true;
    await showGeneralDialog(
      context: context,
      barrierLabel: "",
      barrierDismissible: barrierDismissible,
      barrierColor: Colors.black.withOpacity(0.3),

      //transitionDuration: const Duration(milliseconds: 250),
      pageBuilder: (_, __, ___) => const SizedBox.shrink(),

      transitionBuilder: (context, animation, secondaryAnimation, child) {
        _dialogContext = context;

        return Stack(
          children: [
            // Background Blur - Applied immediately without animation
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
              child: Container(
                color: Colors.black.withOpacity(0.3 * animation.value),
              ),
            ),

            Center(
              child: ScaleTransition(
                scale: CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeOutBack,
                ),
                child: _buildDialog(
                  title: title,
                  message: message,
                  primaryText: primaryText,
                  secondaryText: secondaryText,
                  onPrimary: onPrimary,
                  onSecondary: onSecondary,
                  icon: icon ?? Icons.info_outline,
                  isVerticalButtons: isVerticalButtons,
                ),
              ),
            ),
          ],
        );
      },
    );

    _isOpen = false;
    _dialogContext = null;
  }

  Widget _buildDialog({
    required String title,
    required String message,
    required String primaryText,
    required String secondaryText,
    required VoidCallback onPrimary,
    required VoidCallback onSecondary,
    required IconData icon,
    required bool isVerticalButtons,
  }) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: 320,
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.75),
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: Colors.white.withOpacity(0.15)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon
            CircleAvatar(
              radius: 32,
              backgroundColor: Colors.white.withOpacity(0.08),
              child: Icon(icon, color: Colors.white, size: 32),
            ),

            const SizedBox(height: 16),

            // Title
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 10),

            // Message
            Text(
              message,
              style: const TextStyle(fontSize: 15, color: Colors.white70),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 24),

            // Buttons
            isVerticalButtons
                ? Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                          child: _primaryButton(primaryText, onPrimary)),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: double.infinity,
                          child: _secondaryButton(secondaryText, onSecondary)),
                    ],
                  )
                : Row(
                    children: [
                      Expanded(
                        child: _secondaryButton(secondaryText, onSecondary),
                      ),
                      const SizedBox(width: 14),
                      Expanded(child: _primaryButton(primaryText, onPrimary)),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  Widget _primaryButton(String text, VoidCallback onTap) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(vertical: 14),
      ),
      onPressed: () {
        onTap();
        dismiss();
      },
      child: Text(text, style: const TextStyle(color: Colors.white)),
    );
  }

  Widget _secondaryButton(String text, VoidCallback onTap) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: Colors.white.withOpacity(0.5)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(vertical: 14),
      ),
      onPressed: () {
        onTap();
        dismiss();
      },
      child: Text(text, style: const TextStyle(color: Colors.white)),
    );
  }

  void dismiss() {
    if (_dialogContext != null) {
      Navigator.of(_dialogContext!).pop();
    }

    _dialogContext = null;
    _isOpen = false;
  }

  Future<bool?> customDialog({
    required BuildContext context,
    required String title,
    required String message,
    String cancelText = "CANCEL",
    String acceptText = "ACCEPT",
  }) async {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          content: Text(message, style: const TextStyle(fontSize: 15)),
          actionsPadding: const EdgeInsets.only(bottom: 8, right: 8),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text(
                cancelText,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text(
                acceptText,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ],
        );
      },
    );
  }
}
