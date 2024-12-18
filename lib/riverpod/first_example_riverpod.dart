import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod2/riverpod/combining_riverpod.dart';
import 'package:riverpod2/riverpod/notify_number_screen.dart';
import 'package:riverpod2/riverpod/second_example_riverpod.dart';
import 'package:riverpod2/riverpod/third_example_riverpod.dart';

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
class CartNotifier extends Notifier{
  @override
  build() {
    // TODO: implement build
    throw UnimplementedError();
  }

}
final counterProvider = StateProvider.autoDispose<int>((ref) => 0);

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
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SecondExampleRiverpod(),
                  ),
                );
              },
              child: const Text(
                'Future Provider page',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ThirdExampleRiverpod(),
                  ),
                );
              },
              child: const Text(
                'Stream Provider page',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CombiningRiverpodScreen(),
                  ),
                );
              },
              child: const Text(
                'Combining Riverpod Screen',
              ),
            ),
             const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotifyNumberScreen(),
                  ),
                );
              },
              child: const Text(
                'Notify Number Screen',
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          ref.read(counterProvider.notifier).state++;
        }));
  }
}
