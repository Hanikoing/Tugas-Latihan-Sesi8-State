
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
      title: 'Dynamic List Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        useMaterial3: true,
      ),
      home: const DynamicListExample(),
    );
  }
}

class DynamicListExample extends StatefulWidget {
  const DynamicListExample({super.key});

  @override
  State<DynamicListExample> createState() =>
      _DynamicListExampleState();
}

class _DynamicListExampleState
    extends State<DynamicListExample> {
  final List<String> items = [
    'Apple',
    'Banana',
    'Orange',
  ];

  final TextEditingController textEditingController =
      TextEditingController();

  void _addItem() {
    final newItem = textEditingController.text.trim();

    if (newItem.isEmpty) {
      return;
    }

    setState(() {
      items.add(newItem);
      textEditingController.clear();
    });
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FD),

      appBar: AppBar(
        title: const Text(
          'Dynamic List Example',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF2196F3),
        foregroundColor: Colors.white,
      ),

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(items[index]),
                  trailing: const Icon(
                    Icons.chevron_right,
                  ),
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textEditingController,
                    decoration: InputDecoration(
                      labelText: 'Add New Item',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onSubmitted: (_) => _addItem(),
                  ),
                ),

                const SizedBox(width: 8),

                FloatingActionButton(
                  onPressed: _addItem,
                  backgroundColor: const Color(0xFF2196F3),
                  foregroundColor: Colors.white,
                  tooltip: 'Add item',
                  child: const Icon(
                    Icons.add,
                    size: 28,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
