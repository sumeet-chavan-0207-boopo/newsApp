import 'dart:convert';
import 'package:api_integrate/model/article_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final endPointUrl = "newsapi.org";
  final client = http.Client();
Future<List<Article>> getArticle() async {
    
    final queryParameters = {
      'country': 'us',
      'category': 'technology',
      'apiKey': '11ac376d495e4e21850fb945c4e8a50a'
    };
final uri = Uri.https(endPointUrl, '/v2/top-headlines', queryParameters);
    final response = await client.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);
    List<dynamic> body = json['articles'];
    List<Article> articles = body.map((dynamic item) => Article.fromJson(item)).toList();
    return articles;
  }
}
