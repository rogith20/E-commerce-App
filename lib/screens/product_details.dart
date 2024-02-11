import 'package:ecommerce/custom_card.dart';
import 'package:ecommerce/screens/cart.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key,required this.product}) : super(key: key);

  final Map<String, dynamic> product;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int currentIndex = 0;
  int cartItemCount = 0;
  List<Map<String, dynamic>> items = generateCustomNames();

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> cartItems = [];
    Map<String, dynamic> currentItem = widget.product;
    // Map<String, dynamic> currentItem = items[currentIndex];
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF233A66),
        body: Stack(
          children: [
            Positioned(
              top: -50.0,
              left: MediaQuery.of(context).size.width / 1.7,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(150),
                  ),
                  color: Color(0xFFFED691),
                ),
                width: MediaQuery.of(context).size.width / 2.25,
                height: MediaQuery.of(context).size.height / 2 + 80.0,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        currentItem['title'],
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.2),
                          fontSize: 50.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 100,
              left: 150,
              child: Image.asset(
                currentItem['imagePath'],
                width: 400,
                height: 400,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 20,
              left: 20,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back, size: 30, color: Color(0xFFFED691)),
              ),
            ),

            Positioned(
              top: 20,
              left: 400,
              child: Row(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.search, size: 38, color: Colors.white),
                      ),
                      Stack(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CartPage(cartItems: cartItems),
                                ),
                              );
                            },
                            icon: const Icon(Icons.shopping_cart_outlined, size: 38, color: Colors.white),
                          ),
                          Positioned(
                            right: 2,
                            top: 2,
                            child: CircleAvatar(
                              backgroundColor: const Color(0xFF233A66),
                              radius: 10,
                              child: Text(
                                cartItemCount > 0 ? cartItemCount.toString() : '',
                                style: const TextStyle(fontSize: 12, color: Color(0xFFFED691)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Left-side column
            Positioned(
              top: 80,
              left: 0,
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height / 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(onPressed: () {}, icon: const Icon(Icons.keyboard_arrow_up_outlined, size: 50, color: Colors.white)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30),
                        const Text(
                          'BRAND',
                          style: TextStyle(
                            color: Color(0xFFFED691),
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),
                        Text(
                          currentItem['title'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),
                        const SizedBox(height: 30),
                        const Text(
                          'STRAP',
                          style: TextStyle(
                            color: Color(0xFFFED691),
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),
                        Text(
                          currentItem['strap'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),
                        const SizedBox(height: 30),
                        const Text(
                          'COLOR',
                          style: TextStyle(
                            color: Color(0xFFFED691),
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),
                        Text(
                          currentItem['color'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),
                        const SizedBox(height: 30),
                        const Text(
                          'WARRANTY',
                          style: TextStyle(
                            color: Color(0xFFFED691),
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),
                        Text(
                          currentItem['warranty'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),
                      ],
                    ),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.keyboard_arrow_down, size: 50, color: Colors.white)),
                  ],
                ),
              ),
            ),

            Positioned(
              top: MediaQuery.of(context).size.height / 1.7,
              left: 40,
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width - 80,
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'TRENDING PRODUCTS',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 2,
                          ),
                        ),
                        Text(
                          'PRICE',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 2,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          currentItem['subtitle'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),
                        Text(
                          currentItem['price'],
                          style: const TextStyle(
                            color: Color(0xFFFED691),
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                      style: TextStyle(color: Colors.white, height: 2, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 30,
              left: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 70,
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          cartItemCount++;
                          cartItems.add({
                            'title': currentItem['title'],
                            'subtitle': currentItem['subtitle'],
                            'price': currentItem['price'],
                          });
                        });

                        // Navigate to the CartPage and pass the cartItems list
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CartPage(cartItems: cartItems),
                          ),
                        );
                      },
                      backgroundColor: const Color(0xFFFED691),
                      child: const Text(
                        'ADD TO CART',
                        style: TextStyle(color: Color(0xFF233A66), fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(width: 30),
                  SizedBox(
                    width: 70,
                    height: 70,
                    child: FloatingActionButton(
                      onPressed: () {},
                      backgroundColor: const Color(0xFFFED691),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            currentItem['isFavourite'] = !currentItem['isFavourite'];
                            if (currentItem['isFavourite']) {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: const Text('Added to favorites'),
                                duration: const Duration(seconds: 1),
                                behavior: SnackBarBehavior.floating,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                action: SnackBarAction(
                                  label: 'Undo',
                                  onPressed: () {
                                    setState(() {
                                      currentItem['isFavourite'] = !currentItem['isFavourite'];
                                    });
                                  },
                                ),
                              ));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: const Text('Removed from favorites'),
                                duration: const Duration(seconds: 1),
                                behavior: SnackBarBehavior.floating,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                action: SnackBarAction(
                                  label: 'Undo',
                                  onPressed: () {
                                    setState(() {
                                      currentItem['isFavourite'] = !currentItem['isFavourite'];
                                    });
                                  },
                                ),
                              ));
                            }
                          });
                        },
                        icon: Icon(
                          Icons.favorite,
                          size: 40,
                          color: currentItem['isFavourite'] ? Colors.red : Colors.white.withOpacity(0.8),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
