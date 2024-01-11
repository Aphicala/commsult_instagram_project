import 'package:bootleg_instagram/components/comments_block.dart';
import 'package:bootleg_instagram/components/expanding_caption_block.dart';
import 'package:flutter/material.dart';

class PostBlock extends StatelessWidget {
  final int index;
  final String image;
  final String username;
  final String date;
  final String likes;
  final String description;

  const PostBlock(
      {super.key,
      required this.index,
      required this.image,
      required this.username,
      required this.date,
      required this.likes,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundImage: NetworkImage(image),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      username,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )),
              IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => Dialog(
                              child: ListView(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                shrinkWrap: true,
                                children: [
                                  'Delete',
                                  'Report',
                                  'Block',
                                ]
                                    .map((e) => InkWell(
                                          onTap: () {},
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 12, horizontal: 16),
                                            child: Text(e),
                                          ),
                                        ))
                                    .toList(),
                              ),
                            ));
                  },
                  icon: const Icon(Icons.more_vert))
            ],
          ),
        ),
        // Image Section
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          width: double.infinity,
          child: Image.network(image),
        ),

        // Like
        Row(
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite,
                  color: Colors.red,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.comment_outlined,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.send,
                )),
            Expanded(
                child: Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                  onPressed: () {}, icon: Icon(Icons.bookmark_border)),
            ))
          ],
        ),

        // Description + Comments
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("$likes likes"),
              Flexible(
                  fit: FlexFit.loose,
                  child: Row(
                    children: [
                      ExpandingCaption(content: description, username: username)

                      // Getting Closer
                      // Expanded(
                      //     child: ExpandingCaption(
                      //         content: description, username: username))

                      // This is the closest to the layout of Instagram without expanding caption
                      // Expanded(
                      //     child: Text.rich(TextSpan(
                      //         style: TextStyle(fontWeight: FontWeight.bold),
                      //         text: username,
                      //         children: [
                      //       TextSpan(
                      //           text: description,
                      //           style: TextStyle(fontWeight: FontWeight.normal))
                      //     ])))
                    ],
                    // children: [Expanded(child: Text(username + description))],
                  )),
              // Container(
              //   width: double.infinity,
              //   padding: const EdgeInsets.only(top: 8),
              //   child: Row(
              //     children: [
              //       RichText(text: TextSpan(text: username)),
              //       ExpandingCaption(content: description)
              //     ],
              //   ),
              // ),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      useSafeArea: true,
                      builder: (BuildContext context) {
                        return DodgeKeyboard(
                            child: DraggableScrollableSheet(
                                expand: false,
                                builder: (BuildContext context,
                                    ScrollController controller) {
                                  return CommentsDraggable(
                                      scrollController: controller);
                                }));
                      });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Text(
                    '10 comments',
                    style: TextStyle(
                        fontSize: 12, color: Color.fromRGBO(0, 0, 0, 0.6)),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Text(
                  date,
                  style: TextStyle(
                      fontSize: 12, color: Color.fromRGBO(0, 0, 0, 0.6)),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
