import 'package:ecommerce/screens/homepage.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;

  const CartPage({Key? key, required this.cartItems}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    for (var item in widget.cartItems) {
      if (item['quantity'] == null) {
        // Set a default quantity if it's null
        item['quantity'] = 1;
      }
    }
    double totalAmount = 0;
    double tax = 0.1; // 10% tax
    double gst = 0.05; // 5% GST

    double extractDoubleFromPrice(String price) {
      return double.parse(price.replaceAll('£', ''));
    }

    // Calculate totalAmount by iterating through cartItems
    for (var item in widget.cartItems) {
      totalAmount += extractDoubleFromPrice(item['price']) * item['quantity'];
    }

    double taxAmount = totalAmount * tax;
    double gstAmount = totalAmount * gst;
    double grandTotal = totalAmount + taxAmount + gstAmount;

    return Scaffold(
      backgroundColor: const Color(0xFF233A66),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back, size: 25, color: Color(0xFFFED691)),
            ),
            title: const Text(
              'YOUR CART',
              style: TextStyle(
                  color: Color(0xFFFED691),
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 2),
            ),
            backgroundColor: Colors.transparent,
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage() ));
                },
                icon: const Icon(
                  Icons.add_shopping_cart,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.cartItems.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> item = widget.cartItems[index];
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xFFFED691).withOpacity(0.1),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: ListTile(
                            title: Text(
                              item['title'],
                              style: const TextStyle(color: Color(0xFFFED691)),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['subtitle'],
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              width: 22,
                              height: 22,
                              decoration: BoxDecoration(
                                color: Color(0xFFFED691).withOpacity(0.8),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    if (item['quantity'] > 1) {
                                      item['quantity']--;
                                    }
                                  });
                                },
                                child: Icon(Icons.remove, size: 18, color: Colors.white),
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              '${item['quantity']}',
                              style: TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            SizedBox(width: 10),
                            Container(
                              width: 22,
                              height: 22,
                              decoration: BoxDecoration(
                                color: Color(0xFFFED691).withOpacity(0.8),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    item['quantity']++;
                                  });
                                },
                                child: Icon(Icons.add, size: 18, color: Colors.white),
                              ),
                            ),
                            SizedBox(width: 15),
                          ],
                        ),


                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'BILL DETAILS',
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 2,
                      fontSize: 30),
                ),
                const SizedBox(height: 8.0),
                Text('Total Amount: \$${totalAmount.toStringAsFixed(2)}',
                    style: const TextStyle(color: Colors.white, fontSize: 18)),
                Text('Tax (10%): \$${taxAmount.toStringAsFixed(2)}',
                    style: const TextStyle(color: Colors.white, fontSize: 18)),
                Text('GST (5%): \$${gstAmount.toStringAsFixed(2)}',
                    style: const TextStyle(color: Colors.white, fontSize: 18)),
                const Divider(color: Colors.white),
                Text('Grand Total: \$${grandTotal.toStringAsFixed(2)}',
                    style: const TextStyle(
                        color: Color(0xFFFED691), fontSize: 20)),
              ],
            ),
          ),
          // Pay Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 70, // Fixed height for the dialog content
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text(
                          'Payment Successful',
                          style: TextStyle(fontSize: 22),
                        ),
                        content: Container(
                          height: 120,
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.check_circle,
                                  color: Colors.green, size: 50),
                              SizedBox(height: 16),
                              Text(
                                'Thank you for your purchase!',
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        actions: [
                          Container(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                // Clear the cart items or perform other actions after payment
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFFFED691),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                              child: const Text('OK',
                                  style: TextStyle(
                                      color: Color(0xFF233A66),
                                      fontSize: 20,
                                      letterSpacing: 2,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFED691),
                  textStyle:
                  const TextStyle(color: Color(0xFF233A66)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: const Text('PAY NOW',
                    style: TextStyle(
                        color: Color(0xFF233A66),
                        letterSpacing: 2,
                        fontSize: 23,
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
