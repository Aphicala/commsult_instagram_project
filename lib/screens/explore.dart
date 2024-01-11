import 'package:flutter/material.dart';
import 'package:bootleg_instagram/data/image_data.dart';

class Explore extends StatelessWidget {
  const Explore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: SearchBar(),
      ),
      body: GridView.builder(
          itemCount: imageList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, mainAxisSpacing: 1, crossAxisSpacing: 1),
          itemBuilder: (context, index) => ImageCart(
                imageData: imageList[index],
              )),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 400,
      child: TextField(
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            fillColor: Colors.grey.shade700,
            prefixIconColor: Colors.white,
            filled: true,
            constraints: BoxConstraints.tightFor(width: 327, height: 60),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            hintStyle: TextStyle(color: Colors.grey.shade300, fontSize: 12),
            hintText: 'Explore...'),
      ),
    );
  }
}

class ImageCart extends StatelessWidget {
  const ImageCart({Key? key, required this.imageData}) : super(key: key);

  final ImageData imageData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: ClipRRect(
          child: Image.network(
        imageData.imageUrl,
        fit: BoxFit.cover,
      )),
    );
  }
}
