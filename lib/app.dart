import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Life',
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
  var habits = new List<HabitWidget>();

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called.
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.black45),
        ),
        backgroundColor: Colors.white70,
        actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              color: Colors.black45,
              onPressed: () {
                _addHabit();
              },
            ),
        ]
      ),
      body: _buildHabits(),
    );
  }

  void _addHabit() {
    setState(() {
      habits.add(
        HabitWidget(
          title: "I'm a habit",
          counter: 0,
          streak: 0,
          streakUnit: "day",
        )
      );
    });
  }

  Widget _buildHabits() {
    return ListView.builder(
      itemCount: habits.length,
      itemBuilder: (context, index) {
        return habits[index];
      },
    );
  }
}

class HabitWidget extends StatefulWidget {
  final String title;
  final String streakUnit;
  final int streak;
  final int counter;

  HabitWidget(
      {Key key,
      @required this.title,
      @required this.streakUnit,
      @required this.streak,
      @required this.counter})
      : super(key: key);

  @override
  _HabitWidgetState createState() => _HabitWidgetState();
}

class _HabitWidgetState extends State<HabitWidget> {
  String _title;
  String _streakUnit;
  int _streak;
  int _counter;
  String _streakMessage;

  void initState() {
    super.initState();
    _title = widget.title;
    _streakUnit = widget.streakUnit;
    _streak = widget.streak;
    _counter = widget.counter;
    _generateStreakMessage();
  }

  void _addCounter() {
    setState(() {
      _counter++;
      _streak = _updateStreak();
      _generateStreakMessage();
    });
  }

  int _updateStreak() {
    return 1;
  }

  void _generateStreakMessage() {
    _streakMessage = '$_streak $_streakUnit streak';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: ListTile(
              title: Text(
                _title,
                style: TextStyle(fontSize: 24)
              ),
              subtitle: Text(
                _streakMessage,
                style: TextStyle(fontSize: 16)
              ),
              trailing: FlatButton(
                onPressed: _addCounter,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.display1,
                ),
              ),
            ),
          ),
        )
      );
  }
}
