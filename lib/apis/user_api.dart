import '../model/model_user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserApi{
  static Future<List<Users>>getUsers()async{
    const url = 'https://randomuser.me/api/?results=30';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final result = json['results']as List<dynamic>;
    final users=result.map((e) => Users.fromJson(e)).toList();
    return users;
  }
}