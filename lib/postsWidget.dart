import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:math';
import 'getImageList.dart';

final imageProvider = FutureProvider((ref) => getImageList());

class postsWidget extends HookConsumerWidget {
  const postsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final images = ref.watch(imageProvider);
    return Card(
      child: Column(
        children: [
          images.when(
            data: (data) => Container(
              height: 300,
              width: MediaQuery.of(context).size.width - 50,
              //width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:
                      CachedNetworkImageProvider(data[listPosition(data)].url),
                  alignment: Alignment.center,
                ),
              ),
            ),
            loading: () => const CircularProgressIndicator(),
            error: (_, __) => const Text('Something bad happended'),
          ),
        ],
      ),
    );
  }
}

int listPosition(data) {
  Random random = Random();

  int randomNumber = random.nextInt(data.length);
  return randomNumber;
}

void cycleImages() {}
