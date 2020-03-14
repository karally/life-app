import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Life',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '今天'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called.
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.black45
          ),
        ),
        backgroundColor: Colors.white70,
      ),
      body: _buildHabits(),
    );
  }

  Widget _buildHabits() {
    return _buildHabit('Eat at home');
  }

  Widget _buildHabit(String habitName) {
    return Card(
      child: ListTile(
        leading: Icon(
          Icons.fastfood,
          color: Colors.red[300],
          size: 30.0
        ),
        title: Text(habitName),
        subtitle: Text('0 day streak'),
        trailing: FlatButton(
          onPressed: _incrementCounter,
          child: Text(
            '$_counter',
            style: Theme.of(context).textTheme.display1,
          ),
        ),
      ),
    );
  }
}
