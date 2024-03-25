import 'package:flutter/material.dart';

class StatusCircularAvatar extends StatefulWidget {
  const StatusCircularAvatar({super.key});

  @override
  State<StatusCircularAvatar> createState() => _StatusCircularAvatarState();
}

class _StatusCircularAvatarState extends State<StatusCircularAvatar> {
  String ImageUrl = '';
  Color statusColor = Colors.green;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 65,
          height: 65,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.green, width: 2)),
        )
      ],
    );
  }
}
