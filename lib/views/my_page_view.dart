import 'package:feed_io/utils/constants.dart';
import 'package:feed_io/views/screens/map_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class MyPageView extends StatefulWidget {
  const MyPageView({super.key});

  @override
  State<MyPageView> createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  dynamic selected = 1;
  PageController controller = PageController(initialPage: 1);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        backgroundColor: kPrimaryColor,
        elevation: 0,
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(FontAwesomeIcons.bars, color: kBackgroundColor),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: Text(
          "Feed.IO",
          style: GoogleFonts.poppins(
            color: kBackgroundColor,
            fontSize: 25,
            fontWeight: FontWeight.bold,
            shadows: [
              const Shadow(
                blurRadius: 10.0,
                color: Colors.white70,
                offset: Offset(2.0, 2.0),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return BottomSheet(
                    onClosing: () {},
                    builder: (context) {
                      return Container(
                        height: 100,
                        color: kBackgroundColor,
                        child: Center(
                          child: Text(
                            "NOTİFİCATİONS",
                            style: GoogleFonts.poppins(),
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            },
            icon: const Icon(
              FontAwesomeIcons.bell,
              color: kBackgroundColor,
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Stack(
          children: [
            ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: const BoxDecoration(
                    color: kPrimaryColor,
                  ),
                  child: Text(
                    "Feed.IO",
                    style: GoogleFonts.poppins(
                      color: kBackgroundColor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        const Shadow(
                          blurRadius: 10.0,
                          color: Colors.white70,
                          offset: Offset(2.0, 2.0),
                        ),
                      ],
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(FontAwesomeIcons.user),
                  title: const Text("Profile"),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(FontAwesomeIcons.gear),
                  title: const Text("Settings"),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(FontAwesomeIcons.rightFromBracket),
                  title: const Text("Logout"),
                  onTap: () {},
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 40,
              child: Lottie.asset(
                'assets/lotties/bottomCat.json',
                height: 120,
                width: 120,
                repeat: false,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kPrimaryColor,
        selectedItemColor: kBackgroundColor,
        unselectedItemColor: kBackgroundColor.withOpacity(0.5),
        currentIndex: selected,
        onTap: (index) {
          setState(() {
            selected = index;
            controller.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.ease,
            );
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.video),
            label: "Cams",
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.map),
            label: "Map",
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.comment),
            label: "Chat",
          ),
        ],
      ),
      body: SafeArea(
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller,
          children: const [
            Center(
              child: Text("Cams"),
            ),
            MapScreen(),
            Center(
              child: Text("Chat"),
            ),
          ],
        ),
      ),
    );
  }
}
