import 'package:flutter/material.dart';

import '../domain/product.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  product.title,
                  style: const TextStyle(fontSize: 20),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(product.brand),
                    ),
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
              ],
            ),
          ),
          SizedBox(
            height: 300.0,
            child: PageView.builder(
              itemCount: product.images.length,
              itemBuilder: (context, index) {
                return Image.network(
                  product.images[index],
                  fit: BoxFit.fill,
                );
              },
            ),
          ),
          const SizedBox(height: 8), // Adiciona 8 pixels de espaço vertical
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(product.description),
                Text(product.category),
                Text(
                  'US ${product.price.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ),
        ],
      ),
      persistentFooterButtons: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Text("Quantidades disponíveis: ${product.stock}"),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  // Adicione a lógica que deseja executar ao pressionar o botão aqui
                },
                child: const Text('Buscar'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
