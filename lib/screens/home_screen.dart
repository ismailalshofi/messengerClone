import 'package:flutter/material.dart';

import '../data/stories_json.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
          child: Column(
            children: [
              _buildAppBar(),
              const SizedBox(
                height: 10,
              ),
              _buildSearchField(size),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: size - 30,
                height: 100,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildStoryAdder(),
                      _buildStoryList(),
                    ],
                  ),
                ),
              ),
              _buildChatBody(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Image(
              height: 20,
              image: AssetImage("images/people.png"),
            ),
            label: "People",
          ),
          BottomNavigationBarItem(
            icon: Image(
              height: 20,
              image: AssetImage("images/stories.png"),
            ),
            label: "Stories",
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 30,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              stories[0]['img'],
            ),
            radius: 20,
          ),
        ),
        const Text(
          "Chats",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.new_label,
          ),
        )
      ],
    );
  }

  Widget _buildSearchField(size) {
    return Container(
      width: size - 30,
      height: 35,
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10)),
      child: TextField(
        decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    color: Colors.black.withOpacity(0.3),
                  ),
                  Text(
                    "Search",
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.2), fontSize: 15),
                  ),
                ],
              ),
            ),
            border: InputBorder.none),
        cursorColor: Colors.black.withOpacity(0.3),
        style: TextStyle(color: Colors.black.withOpacity(0.3)),
      ),
    );
  }

  Widget _buildStoryAdder() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.grey.withOpacity(0.3),
            child: const Image(
              height: 20,
              image: AssetImage('images/add_story.png'),
            ),
          ),
          Column(
            children: const [
              Text(
                "Create",
                style: TextStyle(fontSize: 12, color: Colors.black),
              ),
              Text(
                "room",
                style: TextStyle(fontSize: 12, color: Colors.black),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildStoryList() {
    return Row(
        children: List.generate(stories.length, (index) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.grey.withOpacity(0.3),
              backgroundImage: NetworkImage(
                stories[index]["img"],
              ),
            ),
            Column(
              children: [
                Text(
                  stories[index]['first_name'],
                  maxLines: 2,
                  textAlign: TextAlign.justify,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12, color: Colors.black),
                ),
                Text(
                  stories[index]['last_name'],
                  maxLines: 2,
                  textAlign: TextAlign.justify,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12, color: Colors.black),
                ),
              ],
            )
          ],
        ),
      );
    }));
  }

  Widget _buildChatBody() {
    return Column(
        children: List.generate(stories.length, (index) {
      return ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage(stories[index]['img']),
        ),
        title: Text(
            stories[index]['first_name'] + " " + stories[index]['last_name']),
        subtitle: Row(
          children: [
            Text(stories[index]['message']),
            const SizedBox(
              width: 8,
            ),
            Text(stories[index]['Date'],
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 12))
          ],
        ),
      );
    }));
  }
}
