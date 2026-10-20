
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Animation Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        useMaterial3: true,
      ),
      home: const AnimationExample(),
    );
  }
}

class AnimationExample extends StatefulWidget {
  const AnimationExample({super.key});

  @override
  State<AnimationExample> createState() =>
      _AnimationExampleState();
}

class _AnimationExampleState extends State<AnimationExample> {
  Color _backgroundColor = Colors.blue;

  void _changeColor() {
    setState(() {
      _backgroundColor = _backgroundColor == Colors.blue
          ? Colors.pink
          : Colors.blue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FD),

      appBar: AppBar(
        title: const Text(
          'Animation Example',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF2196F3),
        foregroundColor: Colors.white,
      ),

      body: Center(
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOut,
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            color: _backgroundColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Center(
            child: Text(
              'Tap me!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _changeColor,
        backgroundColor: const Color(0xFF2196F3),
        foregroundColor: Colors.white,
        tooltip: 'Change color',
        child: const Icon(
          Icons.color_lens,
          size: 28,
        ),
      ),
    );
  }
}
