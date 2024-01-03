import 'package:bootleg_instagram/components/story_block.dart';
import 'package:bootleg_instagram/components/post_block.dart';
import 'package:bootleg_instagram/models/story_model.dart';
import 'package:bootleg_instagram/models/post_model.dart';
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

    List<Post> posts = [
      Post(
          'https://images.unsplash.com/photo-1682685797741-f0213d24418c?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          'username1',
          '1/2/2024',
          '89',
          ' The sun is very blinding, idk how I would feel being in a sandy place combined with a sun cranked to 11, or maybe it/s just the camera settings'),
      Post(
          'https://images.unsplash.com/photo-1703446592359-fefe8472cc79?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          'username2',
          '29/12/2023',
          '15',
          ' I like trees, particularly when there/s many of them in a forest. Something about green in nature makes me feel relaxed'),
      Post(
          'https://images.unsplash.com/photo-1704093051130-8650e1663047?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          'username3',
          '26/12/2023',
          '1,871',
          ' Pretty amazing shot. I feel like it/s somewhere in Japan but I/m unsure. Also I should have a long description so lorem ipsum time. In in orci vehicula, hendrerit magna et, ullamcorper orci. Fusce tortor purus, scelerisque ut nisi a, pellentesque tristique magna. Curabitur ornare blandit sem, sed lobortis nunc laoreet sed. Ut vel sem efficitur, ullamcorper dolor vel, tincidunt massa. Nulla facilisi. Aliquam dapibus condimentum semper. Nulla pretium metus sit amet justo faucibus, eu aliquam dolor ullamcorper. Sed tincidunt vehicula eros, et imperdiet risus varius ac.'),
      Post(
          'https://images.unsplash.com/photo-1682686580036-b5e25932ce9a?q=80&w=1975&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          'username4',
          '21/12/2023',
          '834',
          ' This is a beautiful shot btw. Literally like it/s made for cinema. Nothing more to say. Nam gravida vehicula quam, maximus dictum risus varius at. Sed nisl ligula, elementum porttitor pulvinar tincidunt, lacinia sit amet nisi. Ut quis hendrerit elit, sed lacinia turpis. Aliquam facilisis sem id ultricies ullamcorper. Etiam ut hendrerit magna. Ut accumsan convallis arcu. Suspendisse in diam at metus tristique tincidunt id ac ante.'),
      Post(
          'https://images.unsplash.com/photo-1704027115927-9f67ab4e39dc?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          'username5',
          '15/12/2023',
          '68',
          ' Eventually we/re going to have a portrait shot of a human subject. Proin et euismod arcu, a aliquet elit. Suspendisse augue ipsum, finibus quis efficitur malesuada, tincidunt sit amet velit. Aliquam erat volutpat. Curabitur in risus tristique, vulputate neque ut, commodo ligula. Vestibulum blandit non nisl eu lacinia.'),
      Post(
          'https://images.unsplash.com/photo-1682686581413-0a0ec9bb35bb?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          'username6',
          '10/12/2023',
          '3,845',
          ' Diving has always felt like something that looks cool to do but I/m not sure if I really want to do it when I get the opportunity. Perhaps shallow diving works but deep dives are the most interesting as well as the most terrifying. Fusce non ante sem. Interdum et malesuada fames ac ante ipsum primis in faucibus. In hac habitasse platea dictumst. Nunc vehicula et turpis id tincidunt. Nulla vel sapien mollis sem dapibus lobortis. Quisque interdum, ligula in vehicula interdum, enim mi blandit mi, eu porta elit odio in augue. Cras sed pretium urna. Phasellus mauris leo, placerat ac accumsan non, venenatis quis sapien.'),
      Post(
          'https://images.unsplash.com/photo-1703692473067-ed003fcd3d73?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          'username7',
          '9/12/2023',
          '89,420',
          ' Duis venenatis laoreet tortor. Praesent sed pulvinar erat. Nullam sollicitudin ultricies augue, et maximus nulla eleifend sed. Donec nec diam sem. Quisque tempus purus consectetur nisi ultricies condimentum. Donec rhoncus tellus eu porta tincidunt. In lobortis fringilla ante, et vulputate velit eleifend ac. Cras luctus risus nec nibh gravida facilisis. Donec eget efficitur ex, in tincidunt orci. Integer congue arcu in ultricies tincidunt. Ut efficitur condimentum ipsum nec condimentum. Donec massa neque, vulputate et condimentum a, malesuada a nunc.'),
    ];

    List<Widget> WidgetOptions = <Widget>[
      homeContent(stories, posts),
      Explore(),
      AddPost(),
      Reel(),
      Profile()
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
      body:

          // old one
          // SingleChildScrollView(
          //   child: Column(
          //     mainAxisSize: MainAxisSize.min,
          SingleChildScrollView(
              child: WidgetOptions.elementAt(currentPageIndex)),
    );
  }

  Widget homeContent(List<Story> stories, List<Post> posts) {
    return Column(
      children: [storyContent(stories), feed(posts)],
    );
  }

  Widget storyContent(List<Story> stories) {
    return SafeArea(
        child: SizedBox(
      height: 100,
      child: ListView.separated(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: ((context, index) {
            var story = stories[index];

            return StoryBlock(
                index: index, image: story.image, name: story.name);
          }),
          separatorBuilder: separatorBuilder,
          itemCount: stories.length),
    ));
  }

  Widget feed(List<Post> posts) {
    return SizedBox(
        height: 550,
        child: ListView.separated(
            shrinkWrap: false,
            scrollDirection: Axis.vertical,
            itemBuilder: ((context, index) {
              var post = posts[index];

              return PostBlock(
                  index: index,
                  image: post.image,
                  username: post.username,
                  date: post.date,
                  likes: post.likes,
                  description: post.description);
            }),
            separatorBuilder: separatorBuilder2,
            itemCount: posts.length));
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

  Widget separatorBuilder2(BuildContext context, int index) {
    return const SizedBox(
      height: 10,
    );
  }
}
