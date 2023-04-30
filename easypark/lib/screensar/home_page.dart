import 'package:easypark/screensar/quiz_screen.dart';
import 'package:easypark/screens/search.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import '../widgets/nearby_doctorsar.dart';
import '../widgets/test_typesar.dart';
import '../widgets/upcoming_cardar.dart';
import 'options_screen.dart';

class HomePageeAr extends StatefulWidget {
  const HomePageeAr({Key? key}) : super(key: key);

  @override
  _HomePageeArState createState() => _HomePageeArState();
}

class _HomePageeArState extends State<HomePageeAr> {
  int _selectedIndex = 0;

  late BuildContext _context; // declare a variable to store context

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _context = context; // store context in the variable

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("مرحباَ , أمير"),
            Text(
              "كيف تشعر اليوم؟",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Ionicons.notifications_outline),
          ),
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: SearchPage(),
              );
            },
            icon: const Icon(Ionicons.search_outline),
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(14),
        children: [
          const UpcomingCardAr(),
          const SizedBox(height: 20),
          Text(
            "الاختبارات",
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: 15),
          const HealthNeeds(),
          const SizedBox(height: 25),
          Text(
            "الأطباء الأعلى تصنيف ",
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: 15),
          const NearbyDoctors(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Ionicons.home_outline),
            activeIcon: Icon(Ionicons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.calendar_outline),
            activeIcon: Icon(Ionicons.calendar),
            label: "Calendar",
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.chatbubble_ellipses_outline),
            label: "Chat",
            activeIcon: Icon(Ionicons.chatbubble_ellipses),
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.person_outline),
            activeIcon: Icon(Ionicons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 1) {
        Navigator.push(
          _context,
          MaterialPageRoute(
            builder: (context) => const HomePageeAr(),
          ),
        );
      } else if (_selectedIndex == 2) {
        Navigator.push(
          _context,
          MaterialPageRoute(
            builder: (context) => MyPlansScreenAr(),
          ),
        );
      } else if (_selectedIndex == 3) {
        Navigator.push(
            _context,
            MaterialPageRoute(
              builder: (context) => const QuizScreenAr(),
            ));
      } else if (_selectedIndex == 4) {
        Navigator.push(
            _context,
            MaterialPageRoute(
              builder: (context) => const QuizScreenAr(),
            ));
      }
    });
  }
}
