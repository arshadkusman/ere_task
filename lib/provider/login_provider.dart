import 'dart:convert';
import 'package:ere_task/home_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> login(
      String email, String password, BuildContext context) async {
    const String apiUrl = 'https://musicapp.jissanto.com/api/login';

    _isLoading = true;
    notifyListeners();

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'username': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final token = data['token']; // Assuming the token is in the response

        // Save token in SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('auth_token', token);

        // Navigate to the next page (Replace with actual page)
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => const HomePage()));
      } else {
        _showErrorSnackbar(
            context, 'Login failed. Please check your credentials.');
      }
    } catch (e) {
      _showErrorSnackbar(context, 'Something went wrong. Please try again.');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void _showErrorSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
