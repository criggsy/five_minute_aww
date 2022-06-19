import 'package:http/http.dart' as http;

import 'posts.dart';
import 'dart:convert';

Future<List<Posts>> getImageList() async {
  print('FETCHING DATA'); // This gets run only once
  List<Posts> posts = [];

  Uri redditURL = Uri.parse("http://www.reddit.com/r/aww/new.json?limit=100");
  http.Response response = await http.get(redditURL);
  var jsonData = json.decode(response.body);

  for (var u in jsonData['data']['children']) {
    if (u['data']['url'].contains('.jpg')) {
      Posts post = Posts(url: u['data']['url']);
      posts.add(post);
    }
  }

  return posts;
}
