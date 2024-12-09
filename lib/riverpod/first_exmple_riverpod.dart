import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// initialize Provider for String
final userName = Provider<String>((ref) => 'Abdo Ahmed');

/// this consumer is rebuild all screen becasue it warped with ConsumerWidget
// class FirstExampleRiverpod extends ConsumerWidget {
//   const FirstExampleRiverpod({super.key});

//   @override
//   Widget build(BuildContext context ,WidgetRef ref) {

//     final name=ref.watch(userName);
//     return  Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Center(
//             child: Text(
//               name,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

final counterProvider = StateProvider<int>((ref) => 0);

class FirstExampleRiverpod extends ConsumerWidget {
  const FirstExampleRiverpod({super.key});

  @override
  Widget build(BuildContext context, ref) {
    var number = ref.watch(counterProvider);

    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                number.toString(),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          ref.read(counterProvider.notifier).state++;
        }));
  }
}
