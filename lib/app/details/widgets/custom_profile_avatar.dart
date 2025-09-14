import 'package:flutter/material.dart';

class CustomProfileAvatar extends StatefulWidget {
  final ImageProvider imageUrl;
  final double? size;

  const CustomProfileAvatar({required this.imageUrl, this.size, super.key});

  @override
  State<CustomProfileAvatar> createState() => _CustomProfileAvatarState();
}

class _CustomProfileAvatarState extends State<CustomProfileAvatar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircleAvatar(radius: widget.size ?? 53, backgroundColor: Colors.white),

        FittedBox(
          child: CircleAvatar(radius: widget.size != null ? (widget.size! - 4) : 50, backgroundColor: Colors.transparent, backgroundImage: widget.imageUrl),
        ),
      ],
    );
  }
}
