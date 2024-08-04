import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UserInfoScreen extends StatefulWidget {
  final String userId;
  final String userName;

  UserInfoScreen({required this.userId, required this.userName});

  @override
  _UserInfoScreenState createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  Map<String, dynamic>? _userInfo;

  @override
  void initState() {
    super.initState();
    _fetchUserInfo();
  }

  Future<void> _fetchUserInfo() async {
    final response = await http.post(
      Uri.parse('http://healthyplans.atwebpages.com/public_html/get_user_info.php'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'user_id': widget.userId,
      }),
    );

    final Map<String, dynamic> responseData = jsonDecode(response.body);

    if (responseData['success']) {
      setState(() {
        _userInfo = responseData;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(responseData['message'])),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_userInfo == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('User Information'),
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('User Information'),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: ClipOval(
              child: _userInfo!['img'] != null
                  ? Image.asset(
                'assets/${_userInfo!['img']}',
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              )
                  : Container(
                width: 40,
                height: 40,
                color: Colors.grey[300],
                child: Center(
                  child: Text(
                    'No image',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ClipOval(
                child: _userInfo!['img'] != null
                    ? Image.asset(
                  'assets/${_userInfo!['img']}',
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                )
                    : Container(
                  width: 150,
                  height: 150,
                  color: Colors.grey[300],
                  child: Center(
                    child: Text(
                      'No image',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.person, color: Colors.green[800]),
                  SizedBox(width: 8),
                  Text(
                    'Username: ${_userInfo!['username']}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.email, color: Colors.green[800]),
                  SizedBox(width: 8),
                  Text(
                    'Email: ${_userInfo!['email']}',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.height, color: Colors.green[800]),
                  SizedBox(width: 8),
                  Text(
                    'Height: ${_userInfo!['height']} cm',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.fitness_center, color: Colors.green[800]),
                  SizedBox(width: 8),
                  Text(
                    'Weight: ${_userInfo!['weight']} kg',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),


    );
  }
}
