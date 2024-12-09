import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final futureProvider = FutureProvider<int>(
  (ref) => getData(),
);

Future<int> getData() async {
  await Future.delayed(
    const Duration(seconds: 2),
  );
  return 5;
}

class SecondExampleRiverpod extends ConsumerWidget {
  const SecondExampleRiverpod({super.key});

  @override
  Widget build(BuildContext context, ref) {
    var number = ref.watch(futureProvider);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          number.when(
            data: (data) {
              return Center(
                child: Text(
                  data.toString(),
                ),
              );
            },
            error: (error, trace) {
              return Center(
                child: Text(
                  trace.toString(),
                ),
              );
            },
            loading: () => const CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}
