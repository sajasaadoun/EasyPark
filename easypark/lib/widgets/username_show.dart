import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
// import 'package:provider/provider.dart';
// import '../data/repo/user_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/login_provider.dart';

class UsernameShow extends StatelessWidget {
  const UsernameShow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (_, ref, __) {
      return ref.watch(userDataProvider).when(data: (value) {
        return Center(
          child: Text(
            'Welcome, ${value.get('name')}',
            // 'Welcome Sameh',
            style: const TextStyle(
              backgroundColor: Colors.transparent,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        );
      }, error: (Object error, StackTrace err) {
        return const Text('Error loading the name');
      }, loading: () {
        return const CircularProgressIndicator();
      });
    });
  }
}

// class EmailShow extends StatelessWidget {
//   const EmailShow({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Consumer(builder: (_, ref, __) {
//       return ref.watch(userDataProvider).when(data: (value) {
//         return Center(
//           child: Text(
//             '${value.get('email')}',
//             style: const TextStyle(
//               backgroundColor: Colors.transparent,
//               fontSize: 25.0,
//               fontWeight: FontWeight.bold,
//             ),
//             textAlign: TextAlign.center,
//           ),
//         );
//       }, error: (Object error, StackTrace err) {
//         return const Text('Error loading the email');
//       }, loading: () {
//         return const CircularProgressIndicator();
//       });
//     });
//   }
// }
