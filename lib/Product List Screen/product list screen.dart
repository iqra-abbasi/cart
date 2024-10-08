import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Models/cart model.dart';
import '../Providers/cart provider.dart';
import '../Utils/colors.dart';
import '../Utils/images.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<ProductList> products = [
    ProductList(
      image: AppImages.mango,
      productName: "Mango",
      initialPrice: 200,
      decrement: AppImages.minus,
      increment: AppImages.add,
    ),
    ProductList(
      image: AppImages.apple,
      productName: "Apple",
      initialPrice: 150,
      decrement: AppImages.minus,
      increment: AppImages.add,
    ),
    ProductList(
      image: AppImages.grapes,
      productName: "Grapes",
      initialPrice: 150,
      decrement: AppImages.minus,
      increment: AppImages.add,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Product List'),
        centerTitle: true,
        actions: const [
          Icon(Icons.shopping_cart),
          SizedBox(width: 20),
        ],
      ),
      body: ChangeNotifierProvider(
        create: (context) =>  Cartproviders(products),
        child: Consumer<Cartproviders>(
          builder: (context, provider, child) {

            int subtotal = provider.calculateSubtotal();

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      ProductList product = products[index];
                      return Card(
                        child: ListTile(
                          leading: Image.asset(
                            product.image,
                            width: 99,
                            height: 148,
                            fit: BoxFit.cover,
                          ),
                          title: Text(
                            product.productName,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 19.38,
                              fontFamily: 'Uber Move Text',
                            ),
                          ),
                          subtitle: Row(
                            children: [
                              Text(
                                '\$${product.initialPrice}',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.96,
                                  fontFamily: 'Uber Move Text',
                                ),
                              ),
                              SizedBox(width: 90),
                              InkWell(
                                onTap: () {
                                  provider.Decrement(index);
                                  setState(() {});
                                },
                                child: Image.asset(
                                  product.decrement,
                                  width: 20,
                                  height: 10,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 30),
                              Text(
                                '${product.number}',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.96,
                                  fontFamily: 'Uber Move Text',
                                ),
                              ),
                              const SizedBox(width: 30),
                              InkWell(
                                onTap: () {
                                  provider.Increment(index);
                                  setState(() {});
                                },
                                child: Image.asset(
                                  product.increment,
                                  width: 20,
                                  height: 10,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text('Subtotal', style: TextStyle(color: Colors.black)),
                    Text('\$$subtotal', style: const TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)),
                  ],
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.blue,
                    ),
                  ),
                  onPressed: () {},
                  child: const Text('Check out'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
