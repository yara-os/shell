import 'package:flutter/material.dart';
import 'package:wayland_layer_shell/wayland_layer_shell.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final layer = WaylandLayerShell();

  await layer.initialize(null, 68);
  await Future.wait([
    layer.setExclusiveZone(68),
    layer.setMargin(.edgeBottom, 0),
    layer.setMargin(.edgeLeft, 0),
    layer.setMargin(.edgeRight, 0),
    layer.setAnchor(.edgeBottom, true),
    layer.setAnchor(.edgeLeft, true),
    layer.setAnchor(.edgeRight, true),
    layer.setLayer(.layerBottom),
    layer.setKeyboardMode(.keyboardModeOnDemand),
  ]);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.transparent,
      home: Padding(
        padding: const .only(
          bottom: 8,
          left: 8,
          right: 8,
        ),
        child: Wrap(
          alignment: .center,
          runAlignment: .end,
          crossAxisAlignment: .end,
          children: [
            BackdropFilter(
              filter: .blur(sigmaX: 50, sigmaY: 50),
              child: Container(
                height: 60,
                padding: const .all(8),
                clipBehavior: .antiAlias,
                decoration: BoxDecoration(
                  borderRadius: .circular(16),
                  border: .all(
                    width: 1,
                    color: Colors.white.withValues(alpha: .6),
                  ),
                  gradient: LinearGradient(
                    begin: .topLeft,
                    end: .bottomRight,
                    colors: [
                      Colors.white.withValues(alpha: .6),
                      Colors.white.withValues(alpha: .4),
                      Colors.white.withValues(alpha: .6),
                      Colors.white.withValues(alpha: .4),
                      Colors.white.withValues(alpha: .6),
                    ],
                  ),
                ),
                child: const Row(
                  spacing: 16,
                  mainAxisSize: .min,
                  children: [
                    Icon(
                      Icons.widgets_rounded,
                      size: 38,
                    ),
                    Icon(
                      Icons.widgets_rounded,
                      size: 38,
                    ),
                    Icon(
                      Icons.widgets_rounded,
                      size: 38,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
