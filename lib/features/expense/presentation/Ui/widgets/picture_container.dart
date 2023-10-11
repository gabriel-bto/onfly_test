import 'package:flutter/material.dart';

class PictureContainer extends StatelessWidget {
  const PictureContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      decoration: BoxDecoration(
        color: const Color(0xFFAAAAAA).withAlpha(30),
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.add_a_photo_outlined,
            size: 86,
            color: const Color(0xFFAAAAAA).withAlpha(200),
          ),
          const SizedBox(height: 16),
          Text(
            'Faça upload de uma imagem',
            style: TextStyle(
              color: const Color(0xFFAAAAAA).withAlpha(200),
            ),
          ),
        ],
      ),
    );
  }
}
