import 'package:flutter/material.dart';

class AddPost extends StatelessWidget {
  const AddPost({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 620,
      child: DraggableScrollableSheet(
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            color: Colors.blue[100],
            child: ListView.builder(
              controller: scrollController,
              itemCount: 25,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(title: Text('Item $index'));
              },
            ),
          );
        },
      ),
    );
  }
}
