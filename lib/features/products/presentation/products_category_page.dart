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
          backgroundColor: Colors.amber,
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
                  elevation: 1,
                  child: ListTile(
                    leading: Image.network(
                      product.thumbnail,
                      width: 70.00,
                      fit: BoxFit.fitWidth,
                    ),
                    title: Text(product.title),
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(product.brand),
                        Row(
                          children: [
                            Text(product.rating.toStringAsFixed(1)),
                            for (int i = 0; i < product.rating.toInt(); i++)
                              const Icon(
                                Icons.star,
                                size: 12,
                              ),
                          ],
                        ),
                      ],
                    ),
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
