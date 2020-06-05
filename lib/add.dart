import 'package:flutter/material.dart';
import 'app.dart';

class AddHabit extends StatelessWidget {
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
        body: AddHabitForm()
    );
  }
}

class AddHabitForm extends StatefulWidget {
  @override
  AddHabitFormState createState() {
    return AddHabitFormState();
  }
}

class AddHabitFormState extends State<AddHabitForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final textController = TextEditingController();

  final InputDecoration titleDecor = InputDecoration(
    hintText: "例如：在家健身...",
    labelText: "习惯名称",
  );

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textController.dispose();
    super.dispose();
  }

  TextFormField textInput(InputDecoration decoration) {
    return TextFormField(
      autofocus: true,
      controller: textController,
      decoration: decoration,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }

  RaisedButton submitButton() {
    return RaisedButton(
      onPressed: () {
        if (_formKey.currentState.validate()) {
          // If the form is valid
          HabitWidget habit = HabitWidget(
            title: textController.text,
            counter: 0,
            streak: 0,
            streakUnit: "day",
          );
          Navigator.pop(context, habit);
        } else {
          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text('Validation failed')));
        }
      },
      child: Text('Submit'),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          textInput(titleDecor),
          submitButton(),
        ],
      ),
    );
  }
}
