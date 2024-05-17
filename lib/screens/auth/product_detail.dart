import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int _currentSlide = 0;

  final List<String> _image = ['images/3.jpg', 'images/4.jpg', 'images/5.jpg'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
                height: 200.0,
                enlargeCenterPage: true,
                onPageChanged: (index, _) {
                  setState(() {
                    _currentSlide = index;
                  });
                }),
            items: _image.map((image) {
              return Builder(builder: (context) {
                return Image.asset(image, fit: BoxFit.cover);
              });
            }).toList(),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Shirts',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      'Price: ₱69.99',
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Product Description',
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '• This is an amazing shirt',
                  style: TextStyle(fontSize: 16.0),
                ),
                Text(
                  '• This is an amazing shirt',
                  style: TextStyle(fontSize: 16.0),
                ),
                Text(
                  '• This is an amazing shirt',
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
          Spacer(),
          Row(
            children: [
              Expanded(
                  child: Container(
                height: 60,
                child: ElevatedButton(
                    onPressed: () {},
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    child: Text(
                      'RESELL',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )),
              ))
            ],
          )
        ],
      ),
    );
  }
}
