import 'package:flutter/material.dart';
// 1. Inclusao do Flutter RiverPod
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:from_zero_to_hero_ht/features/products/presentation/categories_page.dart';

void main() {
  // 2. Alteração da árvore tranformando o App em um child de ProviderScope
  runApp(const ProviderScope(child: App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CategoryPage(),
    );
  }
}
