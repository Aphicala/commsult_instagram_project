import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class StoryBlock extends StatelessWidget {
  final int index;
  final String image;
  final String name;

  const StoryBlock(
      {super.key,
      required this.index,
      required this.image,
      required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DottedBorder(
          color: Colors.purpleAccent,
          borderType: BorderType.Circle,
          padding: const EdgeInsets.all(4),
          dashPattern: const [8, 4],
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage(image))),
            child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: index == 0
                        ? const Color.fromRGBO(255, 255, 255, 0.75)
                        : Colors.transparent,
                    shape: BoxShape.circle),
                child: Icon(
                  Icons.add,
                  size: 14,
                  color: index == 0 ? Colors.black : Colors.transparent,
                )),
          ),
        ),
        Text(name)
      ],
    );
  }
}
