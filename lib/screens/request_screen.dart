import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'login_screen.dart';

class RequestScreen extends StatefulWidget {
  final int userId;

  RequestScreen({required this.userId});

  @override
  _RequestScreenState createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  final List<String> _coaches = ['Zahraa Moussa', 'Rawan wehbe', 'Hassan Hassan'];
  final List<String> _types = ['Food Tips', 'Workouts'];
  final List<int> _months = [1, 2, 3];

  String? _selectedCoach;
  List<String> _selectedTypes = [];
  int? _selectedMonth;
  final TextEditingController _payCodeController = TextEditingController();
  double _price = 0.0;

  void _calculatePrice() {
    if (_selectedTypes.contains('Food Tips') && _selectedTypes.contains('Workouts')) {
      _price = 350;
    } else if (_selectedTypes.contains('Food Tips')) {
      _price = 200;
    } else if (_selectedTypes.contains('Workouts')) {
      _price = 150;
    } else {
      _price = 0;
    }

    if (_selectedMonth != null) {
      switch (_selectedMonth) {
        case 2:
          _price *= 1.5;
          break;
        case 3:
          _price *= 2.5;
          break;
      }
    }
  }

  Future<void> _addRequest() async {
    if (_selectedCoach == null ||
        _selectedTypes.isEmpty ||
        _selectedMonth == null ||
        _payCodeController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('All fields are required')),
      );
      return;
    }

    try {
      final response = await http.post(
        Uri.parse('http://healthyplans.atwebpages.com/public_html/add_request.php'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'user_id': widget.userId,
          'coach': _selectedCoach,
          'type': _selectedTypes.join(', '),
          'month': _selectedMonth,
          'payCode': _payCodeController.text,
          'price': _price,
        }),
      );

      final Map<String, dynamic> responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if (responseData['success'] == true) {
          _showSuccessDialog();
        } else {
          String message = responseData['message'] ?? 'An unknown error occurred';
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message)),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Server error: ${response.statusCode}')),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: $error')),
      );
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Done'),
          content: Text('About two days you will be given a consultation'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Request'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'User ID: ${widget.userId}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: _selectedCoach,
                decoration: InputDecoration(
                  labelText: 'Select Coach',
                  border: OutlineInputBorder(),
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedCoach = newValue;
                  });
                },
                items: _coaches.map<DropdownMenuItem<String>>((String coach) {
                  return DropdownMenuItem<String>(
                    value: coach,
                    child: Text(coach),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              Text('Type:'),
              Column(
                children: _types.map((type) => CheckboxListTile(
                  title: Text(type),
                  value: _selectedTypes.contains(type),
                  onChanged: (bool? checked) {
                    setState(() {
                      if (checked == true) {
                        _selectedTypes.add(type);
                      } else {
                        _selectedTypes.remove(type);
                      }
                      _calculatePrice();
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                )).toList(),
              ),
              SizedBox(height: 20),
              Text('Month:'),
              Column(
                children: _months.map((month) => RadioListTile<int>(
                  title: Text('$month month${month > 1 ? 's' : ''}'),
                  value: month,
                  groupValue: _selectedMonth,
                  onChanged: (int? value) {
                    setState(() {
                      _selectedMonth = value;
                      _calculatePrice();
                    });
                  },
                )).toList(),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _payCodeController,
                decoration: InputDecoration(
                  labelText: 'OMT payment code',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.code),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Price: \$$_price',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _addRequest,
                  child: Text('Add Request', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
