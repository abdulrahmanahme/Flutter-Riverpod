import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final streamProvider = StreamProvider<int>(
  (ref) => Stream.periodic(
      const Duration(
        milliseconds: 100,
      ), (value) {
    log(
      value.toString(),
    );
    return value;
  }),
);

class ThirdExampleRiverpod extends ConsumerWidget {
  const ThirdExampleRiverpod({super.key});

  @override
  Widget build(BuildContext context, ref) {
    var number = ref.watch(streamProvider);

    return Scaffold(
      body: number.when(
        data: (data) {
          return Center(
            child: Text(
              data.toString(),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          );
        },
        error: (error, trace) {
          return Center(
            child: Text(
              error.toString(),
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
