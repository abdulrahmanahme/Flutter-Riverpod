import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var country = StateProvider<String>((ref) => 'Country1');
final weatherProvider = StateProvider<String>((ref) {
  final city = ref.watch(country);
  return city == 'Country1' ? '24' : '25';
});

class CombiningRiverpodScreen extends ConsumerWidget {
  const CombiningRiverpodScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    var cityValue = ref.watch(weatherProvider);
     var wather =ref.watch(country);
    log('ddddd ${wather}');

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButton(
            value: 'Country1',
            items: const [
              DropdownMenuItem(
                value: 'Country1',
                child: Text(
                  'country 1',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              DropdownMenuItem(
                value: 'country 2',
                child: Text(
                  'country 2',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
            onChanged: (v) {
              ref.read(country.notifier).state = v!;
              log('value  ${ ref.read(country.notifier).state}');
            },
          ),
          Center(
            child: Text(
              cityValue.toString(),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
