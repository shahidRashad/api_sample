import 'dart:convert';

import 'package:api_sample/fruit_model.dart';
import 'package:http/http.dart' as http;

List<Fruit> parseProducts(String responseBody) { 
   final parsed = json.decode(responseBody).cast<Map<String, dynamic>>(); 
   return parsed.map<Fruit>((json) => Fruit.fromJson(json)).toList(); 
} 
Future<List<Fruit>> fetchProducts() async { 
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums')); 
   if (response.statusCode == 200) { 
      return parseProducts(response.body); 
   } else { 
      throw Exception('Unable to fetch products from the REST API');
   } 
}  