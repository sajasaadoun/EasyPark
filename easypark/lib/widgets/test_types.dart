// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HealthNeeds extends StatelessWidget {
  const HealthNeeds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CustomIcon> customIcons = [
      CustomIcon(name: "Spiral", icon: 'assets/images/appointment.png'),
      CustomIcon(name: "Wave", icon: 'assets/images/hospital.png'),
      CustomIcon(name: "Voice", icon: 'assets/virus.png'),
      CustomIcon(name: "Face", icon: 'assets/more.png'),
      CustomIcon(name: "Questionnaire", icon: 'assets/more.png'),
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(customIcons.length, (index) {
        return Column(
          children: [
            InkWell(
              onTap: () {
                // Add your onTap code here for the icon at this index!
                switch (index) {
                  case 0:
                    Navigator.pushNamed(context, 'spiral');
                    print("You tapped on ${customIcons[index].name} icon");
                    break;
                  case 1:
                    Navigator.pushNamed(context, 'spiral');
                    print("You tapped on ${customIcons[index].name} icon");
                    break;
                  case 2:
                    Navigator.pushNamed(context, 'speech');
                    print("You tapped on ${customIcons[index].name} icon");
                    break;
                  case 3:
                    Navigator.pushNamed(context, 'spiral');
                    print("You tapped on ${customIcons[index].name} icon");
                    break;
                  case 4:
                    Navigator.pushNamed(context, 'spiral');
                    print("You tapped on ${customIcons[index].name} icon");
                    break;
                  default:
                    break;
                }
              },
              child: Container(
                width: 60,
                height: 60,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(0.4),
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  customIcons[index].icon,
                ),
              ),
            ),
            const SizedBox(height: 6),
            Text(customIcons[index].name)
          ],
        );
      }),
    );
  }
}

class CustomIcon {
  final String name;
  final String icon;
  CustomIcon({
    required this.name,
    required this.icon,
  });
}
