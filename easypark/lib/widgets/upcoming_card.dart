import 'package:easypark/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class UpcomingCard extends StatelessWidget {
  const UpcomingCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 150,
      padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.8),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/images/doctor_2.jpg',
              width: 45,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome Back Ruben Dorwart",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "We are very welcome that you come back",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Colors.white70,
                    ),
              ),
              const SizedBox(height: 10),
              Container(
                // padding: const EdgeInsets.symmetric(
                //   vertical: 6,
                //   horizontal: 8.0,
                // ),
                // decoration: BoxDecoration(
                //     color: Colors.white10,
                //     borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    // Icon(
                    //   Ionicons.calendar_outline,
                    //   size: 18,
                    //   color: Colors.white,
                    // ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/home");
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 15, right: 10),
                        child: Text(
                          "Your Results",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: EdgeInsets.only(right: 8),
                    //   child: Icon(
                    //     Ionicons.time_outline,
                    //     size: 18,
                    //     color: Colors.white,
                    //   ),
                    // ),
                    // Text(
                    //   "14:30 - 15:30 AM",
                    //   style: TextStyle(
                    //     color: Colors.white,
                    //   ),
                    // )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
