import 'package:flutter/material.dart';
import 'package:wayland_layer_shell/wayland_layer_shell.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final layer = WaylandLayerShell();

  await layer.initialize(null, 48);
  await Future.wait([
    layer.setLayer(.layerTop),
    layer.setExclusiveZone(48),
    layer.setMargin(.edgeTop, 0),
    layer.setMargin(.edgeLeft, 0),
    layer.setMargin(.edgeRight, 0),
    layer.setAnchor(.edgeTop, true),
    layer.setAnchor(.edgeLeft, true),
    layer.setAnchor(.edgeRight, true),
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
      home: Material(
        type: .transparency,
        child: Padding(
          padding: const .only(
            top: 8,
            left: 8,
            right: 8,
          ),
          child: Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              const Flexible(child: SizedBox.expand()),
              Container(
                clipBehavior: .antiAlias,
                padding: const .symmetric(
                  vertical: 4,
                  horizontal: 8,
                ),
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
                child: const Text('00:00 Day 0 Month'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
