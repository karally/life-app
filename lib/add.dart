import 'package:flutter/material.dart';
import 'app.dart';

class AddHabitForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '新的习惯',
            style: TextStyle(color: Colors.black45),
          ),
          backgroundColor: Colors.white70,
        ),
        body: _buildBody(context)
    );
  }

  Widget _buildBody(BuildContext context) {
    return RaisedButton(
      child: Text(
        'Submit',
        style: TextStyle(color: Colors.white),
      ),
      color: Colors.blue,
      onPressed: () {
        HabitWidget habit = HabitWidget(
          title: "aaa",
          counter: 0,
          streak: 0,
          streakUnit: "day",
        );
        Navigator.pop(context, habit);
      },
    );
  }
}