import 'package:flutter/material.dart';

class BigImage extends StatelessWidget {
  const BigImage({
    super.key,
    required this.size,
    required this.imageUrl,
    required this.extras,
    this.alignment = CrossAxisAlignment.center,
  });

  final Size size;
  final String imageUrl;
  final List<Widget> extras;
  final CrossAxisAlignment alignment;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
      child: Stack(
        children: [
          Container(
            width: size.width,
            constraints: BoxConstraints(maxHeight: size.height * 0.3),
            child: Image.asset(
              imageUrl,
              fit: BoxFit.fitWidth,
            ),
          ),
          Container(
            constraints: BoxConstraints(maxHeight: size.height * 0.3),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: alignment,
              children: extras,
            ),
          ),
        ],
      ),
    );
  }
}
