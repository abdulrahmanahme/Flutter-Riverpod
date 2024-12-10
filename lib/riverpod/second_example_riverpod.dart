import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod2/product_model/product_model.dart';

final futureProvider = FutureProvider<int>(
  (ref) => getData(),
);

final futureProviderRemote = FutureProvider.autoDispose<List<Map<String, dynamic>>>(
  (ref) => getProducts(),
);
Future<int> getData() async {
  await Future.delayed(
    const Duration(seconds: 2),
  );
  return 5;
}

Future<List<Map<String, dynamic>>> getProducts() async {
  var response = await http.get(
    Uri.parse('https://fakestoreapi.com/products/'),
  );

  // var getData = json.decode(response.body);
  // (getData as List<Map<String, dynamic>>)
  //     .map((product) => ProductModel.fromJson(product))
  //     .toList();
  var data = List<Map<String, dynamic>>.from(
    json.decode(response.body),
  );

  return data;
}

class SecondExampleRiverpod extends ConsumerWidget {
  const SecondExampleRiverpod({super.key});

  @override
  Widget build(BuildContext context, ref) {
    var number = ref.watch(futureProviderRemote);

    return Scaffold(
      body: number.when(
        data: (data) {
          return Expanded(
              child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, int index) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        data[index]["image"],
                                      ),
                                      fit: BoxFit.cover)),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                data[index]["title"],
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
                      )));
        },
        error: (error, trace) {
          return Center(
            child: Text(
              error.toString(),
            ),
          );
        },
        loading: () =>const Center(child:  CircularProgressIndicator()),
      ),
    );
  }
}
