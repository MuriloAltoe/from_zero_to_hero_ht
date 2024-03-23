import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:from_zero_to_hero_ht/features/products/presentation/product_detail_page.dart';
import 'package:from_zero_to_hero_ht/features/products/presentation/providers/product_provider.dart';

// 1. Alterar o StatelessWidget para ConsumerWidget
class ProductBycategoryConsumer extends ConsumerWidget {
  const ProductBycategoryConsumer(this.category, {super.key});

  final String category;

  @override //2. Incluir o WidgetRef
  Widget build(BuildContext context, WidgetRef ref) {
    //3. OBSERVAR o estado do provider productsByCategoryProvider com base no parametro category
    final products = ref.watch(productsByCategoryProvider(category: category));

    return Scaffold(
        appBar: AppBar(
          title: const Text('Products By Category'),
        ),
        //4. Uso do AsyncStare do provider como na tela anterior
        body: products.when(
          data: (data) {
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final product = data[index];
                //TODO: Implementem os cards com base na especificacao do M3.
                return Card(
                  child: ListTile(
                    title: Text(product.title),
                    onTap: () {
                      // 5. Navegação para a tela de detalhe de produto enviando o objeto completo já coletado na request
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetail(product: product),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          },
          error: (error, stackTrace) {
            return Center(child: Text(error.toString()));
          },
          loading: () {
            return const Center(child: CircularProgressIndicator());
          },
        ));
  }
}