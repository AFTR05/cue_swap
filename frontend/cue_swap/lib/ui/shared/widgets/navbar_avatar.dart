import 'package:flutter/material.dart';

class NavbarAvatar extends StatelessWidget {
  const NavbarAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        child: Image.network('https://static.vecteezy.com/system/resources/thumbnails/000/550/980/small/user_icon_001.jpg'),
        width: 30,
        height: 30,
      ),
    );
  }
}