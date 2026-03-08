import 'package:flutter/material.dart';
import 'package:wayland_layer_shell/wayland_layer_shell.dart';
import 'package:yaraos_shell_desktop/widgets/wallpaper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final layer = WaylandLayerShell();

  await layer.initialize();
  await Future.wait([
    layer.setExclusiveZone(-1),
    layer.setMargin(.edgeTop, 0),
    layer.setMargin(.edgeBottom, 0),
    layer.setMargin(.edgeLeft, 0),
    layer.setMargin(.edgeRight, 0),
    layer.setAnchor(.edgeTop, true),
    layer.setAnchor(.edgeBottom, true),
    layer.setAnchor(.edgeLeft, true),
    layer.setAnchor(.edgeRight, true),
    layer.setLayer(.layerBackground),
    layer.setKeyboardMode(.keyboardModeNone),
  ]);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Wallpaper());
  }
}
