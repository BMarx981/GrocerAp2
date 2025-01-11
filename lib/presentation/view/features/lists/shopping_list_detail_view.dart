// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:grocerapp/data/source/database/database.dart';
// import 'package:grocerapp/domain/repository/lists_repository.dart';
// import 'package:grocerapp/presentation/view/features/app_bar/app_bar.dart';

// class ShoppingListDetailView extends ConsumerStatefulWidget {
//   ShoppingListDetailView({super.key, required this.data});

//   final ShoppingListData data;

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() =>
//       _ShoppingListDetailViewState();
// }

// class _ShoppingListDetailViewState
//     extends ConsumerState<ShoppingListDetailView> {
//   @override
//   Widget build(BuildContext context) {
//     final provider = ref.watch(listsRepositoryProvider);
//     return Scaffold(
//       appBar: GrocerAppbar(title: "${widget.data.name} list"),
//       body: Column(
//         children: [
//           Row(
//             children: [
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: ElevatedButton(
//                       onPressed: () {},
//                       child: const Text("Add item to shopping list")),
//                 ),
//               ),
//             ],
//           ),
//         StreamBuilder(
//         stream: streamOfItems,
//         builder: (context, snapshot) {
//           return Container(
//             decoration: BoxDecoration(color: Colors.grey.shade300),
//             child: ListView.builder(
//                 itemCount: snapshot.data?.length ?? 0,
//                 itemBuilder: (context, index) {
//                   return Text(snapshot.requireData[index].name!);
//                 }),
//           );
//         });
//           ),
//         ],
//       ),
//     );
//   }
// }
