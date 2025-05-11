import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';
  static const String todos = '$baseUrl/todos';

  Future<dynamic> get(BuildContext context, {required String url}) async {
    final response = await http.get(Uri.parse(url));
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      // Handle successful response
      final data = jsonDecode(response.body);
      return data;
    } else {
      final errorMessage =
          jsonDecode(response.body)['message'] ?? 'Unknown error';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage), backgroundColor: Colors.red),
      );
    }
  }

  Future<T> post<T>({
    required String url,
    Map<String, dynamic>? body,
    required T Function(dynamic) fromJson,
  }) async {
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );
    if (response.statusCode == 201) {
      // Handle successful response
      final data = jsonDecode(response.body);
      return fromJson(data);
    } else {
      // Handle error response
      throw Exception('Failed to create data');
    }
  }

  Future<T> put<T>({
    required String url,
    Map<String, dynamic>? body,
    required T Function(dynamic) fromJson,
  }) async {
    final response = await http.put(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );
    if (response.statusCode == 200) {
      // Handle successful response
      final data = jsonDecode(response.body);
      return fromJson(data);
    } else {
      // Handle error response
      throw Exception('Failed to update data');
    }
  }

  Future<T> delete<T>({
    required String url,
    Map<String, dynamic>? body,
    required T Function(dynamic) fromJson,
  }) async {
    final response = await http.delete(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );
    if (response.statusCode == 200) {
      // Handle successful response
      final data = jsonDecode(response.body);
      return fromJson(data);
    } else {
      // Handle error response
      throw Exception('Failed to delete data');
    }
  }

  Future<T> patch<T>({
    required String url,
    Map<String, dynamic>? body,
    required T Function(dynamic) fromJson,
  }) async {
    final response = await http.patch(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );
    if (response.statusCode == 200) {
      // Handle successful response
      final data = jsonDecode(response.body);
      return fromJson(data);
    } else {
      // Handle error response
      throw Exception('Failed to patch data');
    }
  }
}
