// photo_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'photo_model.dart';

Future<List<Photo>> fetchPhotos() async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((photo) => Photo.fromJson(photo)).toList();
  } else {
    throw Exception('Failed to load photos');
  }
}
