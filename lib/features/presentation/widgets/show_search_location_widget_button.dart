import 'package:flutter/cupertino.dart';

class ShowSearchLocationWidgetButton extends StatelessWidget {
  const ShowSearchLocationWidgetButton({super.key, required this.title, required this.color, required this.icon, required this.onPressed});

  final String title;
  final Color color;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CupertinoButton(
          onPressed: onPressed,
          color: color,
          padding: const EdgeInsets.all(12),
          child: Icon(
            icon,
            color: CupertinoColors.white,
            size: 35,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: CupertinoColors.white,
            fontSize: 15,
          ),
          softWrap: true,
        )
      ],
    );
  }
}
