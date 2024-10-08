import 'package:cartscreenmtask/Models/cart%20model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Product List Screen/product list screen.dart';
import 'Providers/cart provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Cartproviders(List as List<ProductList>)),
      ],
    child:
    MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cart Screen',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      home:ProductListScreen(),

    );
  }
}

