import 'package:flutter/material.dart';
import 'package:maristcommerce/BottomNavBar/custom_scaffold.dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  List<String> productNames = [
    'Shirt 1',
    'Shirt 2',
    'Shirt 3',
    'Shirt 4',
    'Shirt 5',
  ];
  List<int> quantities = [1, 1, 1, 1, 1];
  List<double> prices = [2.0, 5.99, 18.50, 3.0, 5.0];
  List<String> images = [
    'images/1.jpg',
    'images/2.jpg',
    'images/3.jpg',
    'images/4.jpg',
    'images/5.jpg',
  ];

  void incrementQuantity(int index) {
    setState(() {
      quantities[index]++;
    });
  }

  void decrementQuantity(int index) {
    setState(() {
      quantities[index]--;
    });
  }

  double getCartTotal() {
    double total = 0.0;
    for (int i = 0; i < productNames.length; i++) {
      total += quantities[i] * prices[i];
    }
    return total;
  }

  void showCheckoutDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Checkout'),
            content: Text('Hurray! You have purchased the products'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Ok'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'CART',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: productNames.length,
                  itemBuilder: ((context, index) {
                    return Dismissible(
                      key: Key(productNames[index]),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        setState(() {
                          productNames.removeAt(index);
                        });
                      },
                      background: Container(
                        color: Colors.red,
                        child: Icon(Icons.cancel, color: Colors.white),
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.only(right: 16.0),
                      ),
                      child: Container(
                        margin: EdgeInsets.all(10.0),
                        padding: EdgeInsets.only(right: 16.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              images[index],
                              height: 50,
                              width: 50,
                            ),
                            SizedBox(width: 15.0),
                            Column(
                              children: [
                                Text(
                                  productNames[index],
                                  style: TextStyle(fontSize: 18.0),
                                ),
                                Text(
                                  '\$${prices[index]}',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey),
                                ),
                              ],
                            ),
                            Spacer(),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    decrementQuantity(index);
                                  },
                                  icon: Icon(Icons.remove),
                                ),
                                Text(
                                  quantities[index].toString(),
                                  style: TextStyle(fontSize: 18.0),
                                ),
                                IconButton(
                                  onPressed: () {
                                    incrementQuantity(index);
                                  },
                                  icon: Icon(Icons.add),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Text(
                      'Cart Total',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    SizedBox(width: 50.0),
                    Text(
                      '\$${getCartTotal().toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          showCheckoutDialog();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green),
                        child: Text('Proceed to Checkout'),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      showBottomNavBar: true,
      initalIndex: 2,
    );
  }
}
