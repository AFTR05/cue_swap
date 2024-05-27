import 'package:flutter/material.dart';

class NavbarAvatar extends StatelessWidget {

  final VoidCallback onPressed;
  const NavbarAvatar({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: InkWell(
        onTap: onPressed,
        child: Container(
          width: 30,
          height: 30,
          child: Image.network('https://static.vecteezy.com/system/resources/thumbnails/000/550/980/small/user_icon_001.jpg'),
        ),
      ),
    );
  }
}