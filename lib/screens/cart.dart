import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems;

  const CartPage({Key? key, required this.cartItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double totalAmount = 0;
    double tax = 0.1; // 10% tax
    double gst = 0.05; // 5% GST

    double extractDoubleFromPrice(String price) {
      return double.parse(price.replaceAll('£', ''));
    }

    // Calculate totalAmount by iterating through cartItems
    for (var item in cartItems) {
      totalAmount += extractDoubleFromPrice(item['price']);
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
            title: const Text('YOUR CART',  style: TextStyle(
                color:Color(0xFFFED691),
                fontSize: 25,
                fontWeight: FontWeight.w500,
                letterSpacing: 2),),
            backgroundColor: Colors.transparent,

            actions: [
              IconButton(
                  onPressed: () {},
                  icon:
                  const Icon(Icons.add_shopping_cart, size: 30, color: Colors.white)),

            ],),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Display cart items here (similar to FavoritesPage)
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> item = cartItems[index];
                return ListTile(
                  title: Text(item['title'], style: const TextStyle(color: Color(0xFFFED691))),
                  subtitle: Text(item['subtitle'], style: const TextStyle(color: Colors.white)),
                );
              },
            ),
          ),
          // Display bill, tax, GST, and total
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Bill Details',
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: Colors.white,
                    fontSize: Theme.of(context).textTheme.headline6!.fontSize! * 1.5, // Double the original size
                  ),
                ),
                const SizedBox(height: 8.0),
                Text('Total Amount: \$${totalAmount.toStringAsFixed(2)}', style: const TextStyle(color: Colors.white,fontSize: 18)),
                Text('Tax (10%): \$${taxAmount.toStringAsFixed(2)}', style: const TextStyle(color: Colors.white,fontSize: 18)),
                Text('GST (5%): \$${gstAmount.toStringAsFixed(2)}', style: const TextStyle(color: Colors.white,fontSize: 18)),
                const Divider(color: Colors.white),
                Text('Grand Total: \$${grandTotal.toStringAsFixed(2)}', style: const TextStyle(color:  Color(0xFFFED691),fontSize: 20)),
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
                        title: const Text('Payment Successful'),
                        content: Container(
                          height: 120,
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.check_circle, color: Colors.green, size: 50),
                              SizedBox(height: 16),
                              Text('Thank you for your purchase!'),
                            ],
                          ),
                        ),
                        actions: [
                          Container(
                            width:double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                // Clear the cart items or perform other actions after payment
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:  Color(0xFFFED691),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0), // Change the border radius
                                ),
                              ),
                              child: const Text('OK', style: TextStyle(color: Color(0xFF233A66),fontSize: 20, letterSpacing: 2,fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFED691),
                  textStyle: const TextStyle(color: Color(0xFF233A66)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0), // Change the border radius
                  ),
                ),
                child: const Text('PAY NOW', style: TextStyle(color: Color(0xFF233A66),letterSpacing: 2,fontSize: 23,fontWeight: FontWeight.bold)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
