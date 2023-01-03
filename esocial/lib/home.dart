import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            'e-social',
            style: TextStyle(
                fontFamily: 'Astoria', color: Color(0xFF374AE0), fontSize: 28),
          ),
          actions: const [
            Icon(
              Icons.search,
              color: Color(0xFF363853),
            ),
            SizedBox(
              width: 22,
            ),
            Icon(Icons.message_outlined, color: Color(0xFF363853)),
            SizedBox(
              width: 22,
            ),
            Icon(Icons.notifications_outlined, color: Color(0xFF363853)),
            SizedBox(
              width: 16,
            )
          ],
        ),
        body: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 14, 0, 5),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        stories(
                            user_image: 'assets/images/my_profile.png',
                            name: 'You',
                            color: const Color(0xFF374AE0)),
                        stories(
                            user_image: 'assets/images/pic2.png',
                            name: 'Clara',
                            color: Colors.red),
                        stories(
                            user_image: 'assets/images/pic3.png',
                            name: 'Jarvis',
                            color: Colors.purple),
                        stories(
                            user_image: 'assets/images/pic4.png',
                            name: 'Matilda',
                            color: Colors.grey),
                        stories(
                            user_image: 'assets/images/pic5.png',
                            name: 'Sierra',
                            color: Colors.grey),
                        stories(
                            user_image: 'assets/images/pic3.png',
                            name: 'Henry',
                            color: Colors.pink),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    makePost(
                        user_image: 'assets/images/user1.png',
                        name: 'Ivan Brennan',
                        username: 'ivan- 2m',
                        caption:
                            "Seriously, can someone tell @pinsky to stop talking about Comic Sans. It\\’s getting annoying...",
                        upvotes: '9,230',
                        comments: '92',
                        is_image: false),
                    makePost(
                        user_image: 'assets/images/user2.png',
                        name: 'Beverly Williams',
                        username: '@bev- 25m',
                        caption: 'Oh deer, look what I spotted today!',
                        upvotes: '41',
                        comments: '11',
                        is_image: true,
                        image: 'assets/images/post1.png'),
                    makePost(
                        user_image: 'assets/images/user3.png',
                        name: 'pinsky.eth',
                        username: '@pinsky- 1hr',
                        caption: 'I could literally watch this for hours.',
                        upvotes: '822',
                        comments: '4',
                        is_image: true,
                        image: 'assets/images/post2.png')
                  ],
                ),
              ],
            ),
          ],
        ),
        bottomNavigationBar: NavigationBarTheme(
          data: const NavigationBarThemeData(
            elevation: 0,
          ),
          child: NavigationBar(
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            animationDuration: const Duration(milliseconds: 800),
            selectedIndex: index,
            onDestinationSelected: (index) =>
                setState(() => this.index = index),
            destinations: const [
              NavigationDestination(
                  icon: Icon(
                    Icons.home,
                    color: Colors.black,
                  ),
                  label: 'Home'),
              NavigationDestination(
                  icon: Icon(
                    Icons.videocam_outlined,
                    color: Colors.black,
                  ),
                  label: 'Video'),
              NavigationDestination(
                  icon: Icon(
                    Icons.add_circle,
                    color: Color(0xFF374AE0),
                    size: 40,
                  ),
                  label: 'Post'),
              NavigationDestination(
                  icon: Icon(
                    Icons.bookmark_outline,
                    color: Colors.black,
                  ),
                  label: 'Saved'),
              NavigationDestination(
                  icon: Icon(
                    Icons.face,
                    color: Colors.black,
                  ),
                  label: 'Profile')
            ],
          ),
        ));
  }

  Widget stories({user_image, name, color}) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: color, width: 2),
            ),
            child: Image.asset(user_image),
          ),
          Text(
            name,
            style: const TextStyle(
                fontFamily: 'AstoriaMedium',
                fontSize: 14,
                color: Color(0xFF363853)),
          )
        ],
      ),
    );
  }

  Widget makePost(
      {user_image,
      name,
      username,
      caption,
      is_image,
      image,
      upvotes,
      comments}) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(right: 10),
            height: 45,
            child: Image.asset(
              user_image,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                              fontFamily: 'Astoria',
                              fontSize: 16,
                              color: Color(0xFF363853)),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Icon(
                          Icons.check_circle,
                          color: Colors.blue,
                          size: 18,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(username)
                      ],
                    ),
                    const Icon(Icons.more_horiz)
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  caption,
                  style: const TextStyle(
                      fontFamily: 'AstoriaMedium',
                      fontSize: 14,
                      color: Color(0xFF363853)),
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 5,
                ),
                const SizedBox(
                  height: 5,
                ),
                is_image
                    ? Container(
                        height: 200,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage(image),
                        )),
                      )
                    : const SizedBox(),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.arrow_circle_up,
                            color: Color(0xFF363853)),
                        Text(
                          upvotes,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.messenger_outline,
                            color: Color(0xFF363853)),
                        Text(comments)
                      ],
                    ),
                    Row(
                      children: const [
                        Icon(Icons.bookmark_outline, color: Color(0xFF363853)),
                        Text('Save')
                      ],
                    ),
                    Row(
                      children: const [
                        Icon(Icons.turn_right_outlined,
                            color: Color(0xFF363853)),
                        Text('Share')
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
