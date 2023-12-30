import 'package:bootleg_instagram/components/story_block.dart';
import 'package:bootleg_instagram/models/story_model.dart';
import 'package:bootleg_instagram/screens/explore.dart';
import 'package:bootleg_instagram/screens/post.dart';
import 'package:bootleg_instagram/screens/profile.dart';
import 'package:bootleg_instagram/screens/reels.dart';
import 'package:flutter/material.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Story> stories = [
      // Story('https://randomuser.me/api/portraits/men/98.jpg', 'You'),
      // Story('https://randomuser.me/api/portraits/men/18.jpg', 'Eric'),
      // Story('https://randomuser.me/api/portraits/women/67.jpg', 'Ida'),
      // Story('https://randomuser.me/api/portraits/women/93.jpg', 'Bonnie'),
      // Story('https://randomuser.me/api/portraits/men/33.jpg', 'Jordan'),
      // Story('https://randomuser.me/api/portraits/women/23.jpg', 'Tracey'),

      Story('assets/You.jpg', 'You'),
      Story('assets/Eric.jpg', 'Eric'),
      Story('assets/Ida.jpg', 'Ida'),
      Story('assets/Bonnie.jpg', 'Bonnie'),
      Story('assets/Jordan.jpg', 'Jordan'),
      Story('assets/Tracey.jpg', 'Tracey'),
    ];

    return Scaffold(
        appBar: topBar(context),
        bottomNavigationBar: NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          destinations: const <Widget>[
            NavigationDestination(icon: Icon(Icons.house), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.search), label: 'Explore'),
            NavigationDestination(icon: Icon(Icons.add_box), label: 'Post'),
            NavigationDestination(icon: Icon(Icons.movie), label: 'Reels'),
            NavigationDestination(icon: Icon(Icons.circle), label: 'Profile'),
          ],
          selectedIndex: currentPageIndex,
        ),
        body: ListView(
          children: [
            <Widget>[
              /// Homepage
              homeContent(stories),

              /// Explore
              Explore(),

              /// Post
              Post(),

              /// Reels
              Reel(),

              /// Profile
              Profile(),
            ][currentPageIndex],
          ],
        ));
  }

  Column homeContent(List<Story> stories) {
    return Column(
      children: [
        SafeArea(
            child: SizedBox(
          height: 100,
          child: ListView.separated(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: ((context, index) {
                var story = stories[index];

                return StoryBlock(
                    index: index, image: story.image, name: story.name);
              }),
              separatorBuilder: separatorBuilder,
              itemCount: stories.length),
        )),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1682687220509-61b8a906ca19?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                    ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'username',
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
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16),
                                      shrinkWrap: true,
                                      children: [
                                        'Delete',
                                        'Report',
                                        'Block',
                                      ]
                                          .map((e) => InkWell(
                                                onTap: () {},
                                                child: Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      vertical: 12,
                                                      horizontal: 16),
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
                child: Image.network(
                    'https://images.unsplash.com/photo-1703803828769-36c110f2d4e1?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
              ),

              // Like Comment
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

              // Comments
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('1,834 Likes'),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(top: 8),
                      child: RichText(
                          text: TextSpan(
                        children: [
                          TextSpan(
                              text: 'username',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(
                            text:
                                'Placeholder description this is an example sentence',
                          ),
                        ],
                      )),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  AppBar topBar(BuildContext context) {
    return AppBar(
      title: const Text(
        'Instagram',
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      actions: [
        IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is notifications')));
            },
            icon: const Icon(
              Icons.favorite_outline,
              color: Colors.black,
            )),
        IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is direct messages')));
            },
            icon: const Icon(
              Icons.message_outlined,
              color: Colors.black,
            ))
      ],
    );
  }

  Widget separatorBuilder(BuildContext context, int index) {
    return const SizedBox(
      width: 16,
    );
  }
}
