import 'package:flutter/material.dart';

class IconTextButton extends StatelessWidget {
  final VoidCallback onTap;
  final String label;
  final IconData icon;
  final int size;
  final Color iconColor;

  const IconTextButton({
    super.key,
    required this.onTap,
    required this.label,
    required this.icon,
    required this.size,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(8.0),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 18, color: iconColor),
              SizedBox(width: 4.0),
              Text(
                label,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
