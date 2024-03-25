import 'package:flutter/material.dart';
import 'package:whatsapp_FBI/features/app/theme/style.dart';
import 'package:whatsapp_FBI/features/calls/presentation/pages/calls_history_page.dart';
import 'package:whatsapp_FBI/features/chat/presentation/pages/chat_page.dart';
import 'package:whatsapp_FBI/features/status/presentation/pages/StatusPage.dart';

import '../../Community/presentation/pages/Community.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late PageController _pageController;

  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _currentIndex = _tabController!.index;
      });
    });
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "whatsapp_FBI",
          style: TextStyle(
              fontSize: 20, color: greyColor, fontWeight: FontWeight.w600),
        ),
        actions: [
          Row(
            children: [
              const Icon(
                Icons.camera_alt_outlined,
                color: greyColor,
                size: 28,
              ),
              const SizedBox(
                width: 25,
              ),
              const Icon(Icons.search, color: greyColor, size: 28),
              const SizedBox(
                width: 10,
              ),
              PopupMenuButton<String>(
                icon: const Icon(
                  Icons.more_vert,
                  color: greyColor,
                  size: 28,
                ),
                color: appBarColor,
                iconSize: 28,
                onSelected: (value) {},
                itemBuilder: (context) => <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: "Settings",
                    child: Text('Settings'),
                  ),
                ],
              ),
            ],
          ),
        ],
        //   bottom: TabBar(
        //     labelColor: tabColor,
        //     unselectedLabelColor: greyColor,
        //     indicatorColor: tabColor,
        //     controller: _tabController,
        //     tabs: const [
        //       Tab(
        //         child: Text(
        //           "Chats",
        //           selectionColor: Colors.white,
        //           style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        //         ),
        //       ),
        //       Tab(
        //         child: Text(
        //           "Status",
        //           selectionColor: Colors.white,
        //           style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        //         ),
        //       ),
        //       Tab(
        //         child: Text(
        //           "Calls",
        //           selectionColor: Colors.white,
        //           style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        // // floatingActionButton: FloatingActionButton(
        // //   onPressed: () {},
        // //   backgroundColor: tabColor,
        // //   child: const Icon(
        // //     Icons.message,
        // //     color: Colors.white,
        // //   ),
        // // ),
        // floatingActionButton: SwitchFloatingButtonTabIndex(_currentIndex),
        // body: TabBarView(
        //     controller: _tabController,
        //     children: const [Center(), Center(), Center()]),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
            _tabController.animateTo(index);
          });
        },
        children: const [
          ChatPage(),
          StatusPage(),
          CommunityPage(),
          CallsPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _tabController.animateTo(index);
          });
        },
        selectedItemColor: tabColor,
        unselectedItemColor: greyColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_outlined),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.update_sharp),
            label: 'Updates',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_alt),
            label: 'Communities',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Calls',
          ),
        ],
      ),
      floatingActionButton: SwitchFloatingButtonTabIndex(_currentIndex),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

SwitchFloatingButtonTabIndex(int index) {
  switch (index) {
    case 0:
      {
        return FloatingActionButton(
          onPressed: () {},
          backgroundColor: tabColor,
          child: const Icon(
            Icons.message,
            color: Colors.white,
          ),
        );
      }
    case 1:
      {
        return FloatingActionButton(
          onPressed: () {},
          backgroundColor: tabColor,
          child: const Icon(
            Icons.camera_alt_outlined,
            color: Colors.white,
          ),
        );
      }
    case 2:
      {
        return FloatingActionButton(
          onPressed: () {},
          backgroundColor: tabColor,
          child: const Icon(
            Icons.people_alt_sharp,
            color: Colors.white,
          ),
        );
      }
    default:
      {
        return FloatingActionButton(
          onPressed: () {},
          backgroundColor: tabColor,
          child: const Icon(
            Icons.add_call,
            color: Colors.white,
          ),
        );
      }
  }
}
