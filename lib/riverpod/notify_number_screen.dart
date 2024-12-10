import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod2/riverpod/notify_number.dart';

var notifyNumber =
    ChangeNotifierProvider<NotifyNumber>((ref) => NotifyNumber());

class NotifyNumberScreen extends ConsumerWidget {
  const NotifyNumberScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    var numerValue = ref.watch(notifyNumber);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            ref.read(notifyNumber).number.toString(),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  ref.read(notifyNumber).increase();
                },
                icon: const Icon(
                  Icons.add,
                  size: 20,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              IconButton(
                onPressed: () {
                  ref.read(notifyNumber).decrease();
                },
                icon: const Icon(
                  Icons.remove,
                  size: 20,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
