import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_emoji/flutter_emoji.dart';

class EmotionFace extends StatelessWidget {
  final String emtionFace;

  const EmotionFace({
    Key? Key,
    required this.emtionFace,
  }) : super(key: Key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue[600],
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(16),
      child: Center(
        child: Text(
          emtionFace,
          style: TextStyle(
            fontSize: 28,
          ),
        ),
      ),
    );
  }
}
