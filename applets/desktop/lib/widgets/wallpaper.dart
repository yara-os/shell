import 'package:flutter/material.dart';

final class Wallpaper extends StatefulWidget {
  const Wallpaper({super.key});

  @override
  State<StatefulWidget> createState() => _WallpaperState();
}

final class _WallpaperState extends State<Wallpaper> {
  int current = 1;

  void _change() {
    if (current == 3) {
      setState(() => current = 1);
      return;
    }

    setState(() => current += 1);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: .expand,
      alignment: .center,
      children: [
        Positioned.fill(
          child: GestureDetector(
            onTap: _change,
            child: Image.asset(
              'assets/wallpaper$current.jpg',
              fit: .cover,
              width: .infinity,
              height: .infinity,
              filterQuality: .high,
              gaplessPlayback: true,
            ),
          ),
        ),
        Positioned(
          width: 60,
          height: 60,
          bottom: 24,
          right: 32,
          child: BackdropFilter(
            filter: .blur(),
            blendMode: .softLight,
            child: Image.asset('assets/logo.png'),
          ),
        ),
        Positioned(
          width: 60,
          height: 60,
          bottom: 24,
          right: 32,
          child: BackdropFilter(
            filter: .blur(),
            blendMode: .softLight,
            child: Image.asset('assets/logo.png'),
          ),
        ),
        Positioned(
          width: 60,
          height: 60,
          bottom: 24,
          right: 32,
          child: BackdropFilter(
            filter: .blur(),
            blendMode: .softLight,
            child: Image.asset('assets/logo.png'),
          ),
        ),
      ],
    );
  }
}
