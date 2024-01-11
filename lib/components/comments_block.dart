import 'package:flutter/material.dart';

class CustomComments extends StatelessWidget {
  const CustomComments({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/You.jpg'),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: 'username',
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                      text:
                          'Comment content Hi how are you doing my name is Bob. This is my friend Phil, we/ve been together for a long time.',
                    )
                  ])),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      '1/10/2024',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Icon(
              Icons.favorite,
              size: 16,
            ),
          )
        ],
      ),
    );
  }
}

class CommentsDraggable extends StatefulWidget {
  final ScrollController scrollController;
  const CommentsDraggable({super.key, required this.scrollController});

  @override
  State<CommentsDraggable> createState() => _CommentsDraggableState();
}

class _CommentsDraggableState extends State<CommentsDraggable> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return SingleChildScrollView(
        controller: widget.scrollController,
        child: SizedBox(
          height: constraints.maxHeight,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FilledButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Exit'))
                  ],
                ),
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (BuildContext context, int index) {
                      return CustomComments();
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider();
                    },
                    itemCount: 100,
                  ),
                ),
                const Divider(),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/You.jpg'),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16, right: 8),
                        child: TextField(
                          controller: _textEditingController,
                          decoration: const InputDecoration(
                              hintText: 'Enter Text Here',
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: const Text(
                          'Post',
                          style: TextStyle(color: Colors.blueAccent),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}

class DodgeKeyboard extends StatelessWidget {
  final Widget child;
  const DodgeKeyboard({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
      child: child,
    );
  }
}
