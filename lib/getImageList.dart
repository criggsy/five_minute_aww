import 'package:http/http.dart' as http;

import 'posts.dart';
import 'dart:convert';

Future<List<Posts>> getImageList() async {
  //returns a list of String urls which link to of cute pics from reddit
  List<Posts> posts = [];
  const HtmlEscape htmlEscape = HtmlEscape();

  Uri redditURL = Uri.parse(
      "https://www.reddit.com/r/IllegallySmolCats/new.json?limit=100");
  http.Response response = await http.get(redditURL);
  var jsonData = json.decode(response.body);

  // for (var u in jsonData['data']['children']) {
  //   if (u['data']['url'].contains('.jpg')) {
  //     Posts post = Posts(url: u['data']['url']);
  //     posts.add(post);
  //   }
  // }

  for (var u in jsonData['data']['children']) {
    if (u['data']['url'].contains('.jpg')) {
      String url = u['data']['preview']['images'][0]['source']['url'];

      url = url.replaceAll("&amp;", "&");
      int height = u['data']['preview']['images'][0]['source']['height'];
      int width = u['data']['preview']['images'][0]['source']['width'];

      

      Posts post = Posts(url: url, width: width, height: height);
      posts.add(post);
    }
  }

  return posts;
}
