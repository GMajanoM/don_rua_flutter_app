import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final Color color;
  final String status;
  final String information;
  final bool coversWidth;

  const CustomCard(
      {super.key,
      required this.title,
      required this.color,
      required this.status,
      required this.information,
      required this.coversWidth});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            blurRadius: 15,
            color: Colors.grey[400]!,
            offset: const Offset(0, 0.75),
          )
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: size.width * 0.6,
                child: Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                constraints: BoxConstraints(maxWidth: size.width * 0.3),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Text(
                  status,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            information,
            style: const TextStyle(fontSize: 14),
          )
        ],
      ),
    );
  }
}
