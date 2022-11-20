import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    Key? key,
    required this.radius,
  }) : super(key: key);

  const Avatar.small({
    Key? key,
  })  : radius = 16,
        super(key: key);

  const Avatar.medium({
    Key? key,
  })  : radius = 22,
        super(key: key);

  const Avatar.large({
    Key? key,
  })  : radius = 44,
        super(key: key);

  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: const AssetImage('images/pdt.png'),
      backgroundColor: Theme.of(context).cardColor,
    );
  }
}
