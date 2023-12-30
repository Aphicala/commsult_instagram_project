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
      body: <Widget>[
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
    );
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
        Card(
          child: ListTile(
            leading: Icon(Icons.notifications_sharp),
            title: Text('Notification 1'),
            subtitle: Text('This is a notification'),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.notifications_sharp),
            title: Text('Notification 2'),
            subtitle: Text('This is a notification'),
          ),
        ),
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
