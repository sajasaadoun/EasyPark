// import 'package:flutter/material.dart';

// class SearchPage extends SearchDelegate<String> {
//   final List<String> items = [
//     'apple',
//     'banana',
//     'cherry',
//     'date',
//     'elderberry'
//   ];

//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       IconButton(
//         icon: Icon(Icons.clear),
//         onPressed: () {
//           query = '';
//         },
//       )
//     ];
//   }

//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//       icon: Icon(Icons.arrow_back),
//       onPressed: () {
//         close(context, '');
//       },
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     final filteredItems = items.where((item) => item.contains(query)).toList();
//     return ListView.builder(
//       itemCount: filteredItems.length,
//       itemBuilder: (context, index) {
//         return ListTile(
//           title: Text(filteredItems[index]),
//           onTap: () {
//             close(context, filteredItems[index]);
//           },
//         );
//       },
//     );
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     final filteredItems = items.where((item) => item.contains(query)).toList();
//     return ListView.builder(
//       itemCount: filteredItems.length,
//       itemBuilder: (context, index) {
//         return ListTile(
//           title: Text(filteredItems[index]),
//           onTap: () {
//             query = filteredItems[index];
//             close(context, filteredItems[index]);
//           },
//         );
//       },
//     );
//   }
// }
