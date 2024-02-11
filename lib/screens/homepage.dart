import 'package:ecommerce/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/screens/cart.dart';
import 'package:ecommerce/screens/favourites.dart';
import 'package:ecommerce/screens/product_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> favoriteItems = [];
  bool isFavourite = false;
  List<Map<String, dynamic>> items = generateCustomNames();
  int currentIndex = 0;
  int currentPage = 0;
  final CarouselController _carouselController = CarouselController();
  final PageController _pageController = PageController(viewportFraction: 0.5);
  final PageController _carouselPageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF233A66),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            iconTheme:
                const IconThemeData(color: Color(0xFFFED691), size: 38.0),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon:
                      const Icon(Icons.search, size: 38, color: Colors.white)),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CartPage(cartItems: favoriteItems),
                      ),
                    );
                  },
                  icon: const Icon(Icons.shopping_cart_outlined,
                      size: 38, color: Colors.white)),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: const Color(0xFF233B69),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text(
                    'YOUR ACCOUNT',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Color(0xFFFED691),
                  )
                ],
              ),
            ),
            ListTile(
              leading:
                  const Icon(Icons.favorite_border, color: Color(0xFFFED691)),
              title: const Text(
                'Your favourites',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FavoritesPage(favoriteItems: favoriteItems),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.history, color: Color(0xFFFED691)),
              title: const Text(
                'Recent Items',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                // Handle item 1 tap
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading:
                  const Icon(Icons.card_giftcard, color: Color(0xFFFED691)),
              title: const Text(
                'Your coupons',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                // Handle item 1 tap
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: Color(0xFFFED691)),
              title: const Text(
                'Settings',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                // Handle item 1 tap
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 60,
              ),
              const Text(
                'FEATURED',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 2),
              ),
              Row(
                children: [
                  const Text(
                    'PRODUCTS',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2),
                  ),
                  const Padding(padding: EdgeInsets.only(left: 159)),
                  IconButton(
                      onPressed: () => _scrollFeatured(-1),
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        size: 38,
                        color: Color(0xFFFED691),
                      )),
                  IconButton(
                      onPressed: () => _scrollFeatured(1),
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        size: 38,
                        color: Color(0xFFFED691),
                      )),
                ],
              ),
              const SizedBox(height: 25),
              CarouselSlider(
                carouselController: _carouselController,
                options: CarouselOptions(
                  height: 270,
                  viewportFraction: 1.0,
                  enableInfiniteScroll: false,
                ),
                items: [
                  Container(
                    width: MediaQuery.of(context).size.width - 60,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFED691),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "ABC-123",
                                    style: TextStyle(
                                      color: Colors.brown,
                                      fontSize: 12,
                                      letterSpacing: 2,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Text(
                                    "WISHDOIT",
                                    style: TextStyle(
                                      color: Color(0xFF233A66),
                                      fontSize: 23,
                                      letterSpacing: 2,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    "Fashion Men Quartz",
                                    style: TextStyle(
                                      color: Color(0xFF233A66),
                                      fontSize: 12,
                                      letterSpacing: 2,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const Text(
                                    "Watch Luxury Leather",
                                    style: TextStyle(
                                      color: Color(0xFF233A66),
                                      fontSize: 12,
                                      letterSpacing: 2,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const Text(
                                    "Strap Waterproof",
                                    style: TextStyle(
                                      color: Color(0xFF233A66),
                                      fontSize: 12,
                                      letterSpacing: 2,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  ElevatedButton(
                                    onPressed: ArgumentError.notNull,
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      shadowColor:
                                          Colors.black.withOpacity(0.5),
                                      elevation: 10,
                                      fixedSize: const Size(150, 5),
                                    ),
                                    child: const Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'BUY NOW',
                                          style: TextStyle(
                                            color: Colors.brown,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Icon(
                                          Icons.arrow_forward,
                                          size: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 130, // Adjust width as needed
                            height: double.infinity,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                'assets/1.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 60,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFED691),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "ABC-123",
                                    style: TextStyle(
                                      color: Colors.brown,
                                      fontSize: 12,
                                      letterSpacing: 2,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Text(
                                    "WISHDOIT",
                                    style: TextStyle(
                                      color: Color(0xFF233A66),
                                      fontSize: 23,
                                      letterSpacing: 2,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    "Fashion Men Quartz",
                                    style: TextStyle(
                                      color: Color(0xFF233A66),
                                      fontSize: 12,
                                      letterSpacing: 2,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const Text(
                                    "Watch Luxury Leather",
                                    style: TextStyle(
                                      color: Color(0xFF233A66),
                                      fontSize: 12,
                                      letterSpacing: 2,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const Text(
                                    "Strap Waterproof",
                                    style: TextStyle(
                                      color: Color(0xFF233A66),
                                      fontSize: 12,
                                      letterSpacing: 2,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  ElevatedButton(
                                    onPressed: ArgumentError.notNull,
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      shadowColor:
                                          Colors.black.withOpacity(0.5),
                                      elevation: 10,
                                      fixedSize: const Size(150, 5),
                                    ),
                                    child: const Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'BUY NOW',
                                          style: TextStyle(
                                            color: Colors.brown,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Icon(
                                          Icons.arrow_forward,
                                          size: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 130, // Adjust width as needed
                            height: double.infinity,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                'assets/2.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 60,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFED691),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "ABC-123",
                                    style: TextStyle(
                                      color: Colors.brown,
                                      fontSize: 12,
                                      letterSpacing: 2,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Text(
                                    "WISHDOIT",
                                    style: TextStyle(
                                      color: Color(0xFF233A66),
                                      fontSize: 23,
                                      letterSpacing: 2,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    "Fashion Men Quartz",
                                    style: TextStyle(
                                      color: Color(0xFF233A66),
                                      fontSize: 12,
                                      letterSpacing: 2,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const Text(
                                    "Watch Luxury Leather",
                                    style: TextStyle(
                                      color: Color(0xFF233A66),
                                      fontSize: 12,
                                      letterSpacing: 2,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const Text(
                                    "Strap Waterproof",
                                    style: TextStyle(
                                      color: Color(0xFF233A66),
                                      fontSize: 12,
                                      letterSpacing: 2,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  ElevatedButton(
                                    onPressed: ArgumentError.notNull,
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      shadowColor:
                                          Colors.black.withOpacity(0.5),
                                      elevation: 10,
                                      fixedSize: const Size(150, 5),
                                    ),
                                    child: const Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'BUY NOW',
                                          style: TextStyle(
                                            color: Colors.brown,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Icon(
                                          Icons.arrow_forward,
                                          size: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 130, // Adjust width as needed
                            height: double.infinity,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                'assets/8.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              const Text(
                'TRENDING',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 2),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'PRODUCTS',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2),
                  ),
                  const Padding(padding: EdgeInsets.only(left: 159)),
                  IconButton(
                      onPressed: () => _scroll(-2),
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        size: 38,
                        color: Color(0xFFFED691),
                      )),
                  IconButton(
                      onPressed: () => _scroll(2),
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        size: 38,
                        color: Color(0xFFFED691),
                      )),
                ],
              ),
              const SizedBox(height: 25),
              SizedBox(
                height: 400,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: _pageController,
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    Map<String, dynamic> item = items[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ProductDetails(product: items[index])),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Stack(
                                children: [
                                  Container(
                                    width: 190,
                                    height: 250,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFFED691),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Image.asset(item['imagePath']),
                                  ),
                                  Positioned(
                                    top: 10,
                                    right: 10,
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.15),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Center(
                                        child: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              item['isFavourite'] =
                                                  !item['isFavourite'];
                                              if (item['isFavourite']) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                  content: const Text(
                                                      'Added to favorites'),
                                                  duration: const Duration(
                                                      seconds: 1),
                                                  behavior:
                                                      SnackBarBehavior.floating,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  action: SnackBarAction(
                                                    label: 'Undo',
                                                    onPressed: () {
                                                      setState(() {
                                                        item['isFavourite'] =
                                                            !item[
                                                                'isFavourite'];
                                                      });
                                                    },
                                                  ),
                                                ));
                                                favoriteItems.add({
                                                  'title': item['title'],
                                                  'subtitle': item['subtitle']
                                                });
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                  content: const Text(
                                                      'Removed from favorites'),
                                                  duration: const Duration(
                                                      seconds: 1),
                                                  behavior:
                                                      SnackBarBehavior.floating,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  action: SnackBarAction(
                                                    label: 'Undo',
                                                    onPressed: () {
                                                      setState(() {
                                                        item['isFavourite'] =
                                                            !item[
                                                                'isFavourite'];
                                                      });
                                                      favoriteItems.removeWhere(
                                                          (favorite) =>
                                                              favorite[
                                                                      'title'] ==
                                                                  item[
                                                                      'title'] &&
                                                              favorite[
                                                                      'subtitle'] ==
                                                                  item[
                                                                      'subtitle']);
                                                    },
                                                  ),
                                                ));
                                              }
                                            });
                                          },
                                          icon: Icon(
                                            Icons.favorite,
                                            color: item['isFavourite']
                                                ? Colors.red
                                                : Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              item['title'],
                              style: const TextStyle(
                                  color: Colors.white,
                                  letterSpacing: 2,
                                  fontSize: 10),
                            ),
                            Text(
                              item['subtitle'],
                              style: const TextStyle(
                                  color: Colors.white,
                                  letterSpacing: 2,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _scroll(int offset) {
    currentIndex += offset;

    if (currentIndex < 0) {
      currentIndex = 0;
    } else if (currentIndex >= items.length - 1) {
      currentIndex = items.length - 1;
    }

    _pageController.animateToPage(
      currentIndex,
      duration: const Duration(milliseconds: 500), // Increase the duration
      curve: Curves.easeInOut,
    );
  }

  void _scrollFeatured(int offset) {
    int newPage = currentPage + offset;
    if (newPage < 0) {
      newPage = 0;
    } else if (newPage >= items.length) {
      newPage = items.length - 1;
    }
    setState(() {
      currentPage = newPage;
    });
    _carouselController.animateToPage(
      newPage,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
