import 'package:flutter/material.dart';

class ModuleCard extends StatelessWidget {
  final String title;
  final String imgUrl;
  final void Function() onTap;

  const ModuleCard(
      {super.key,
      required this.title,
      required this.imgUrl,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: SizedBox(
            height: size.height * 0.15,
            width: size.width * 0.5,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: size.height * 0.15,
                  width: size.width * 0.5,
                  child: Image.asset(
                    imgUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  decoration:
                      BoxDecoration(color: Colors.black.withOpacity(0.5)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
