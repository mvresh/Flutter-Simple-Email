import 'package:flutter/material.dart';

void main() => runApp(EmailApp());

class EmailApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        accentColor: Colors.red,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;


  MyHomePage({this.title});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var messages = const [
    {
      'subject': 'My first message',
      'body':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut facilisis felis id arcu tincidunt, ac dapibus elit faucibus. Where is the ordinary phenomenan? Attitude is not great in parallel places, the afterworld, or paradise, but everywhere.'
    },
    {
      'subject': 'My second message',
      'body':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut facilisis felis id arcu tincidunt, ac dapibus elit faucibus.'
    },
    {
      'subject': 'You won lottery',
      'body':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut facilisis felis id arcu tincidunt, ac dapibus elit faucibus.'
    },
    {
      'subject': 'You should read this message',
      'body':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut facilisis felis id arcu tincidunt, ac dapibus elit faucibus.'
    },
    {
      'subject': 'Your meetup starts at 18:30',
      'body':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut facilisis felis id arcu tincidunt, ac dapibus elit faucibus.'
    },
//    Test Issue: Weird rendering of overflowed long text using flag TextOverflow.ellipsis
//    https://github.com/flutter/flutter/issues/29416
    {
      'subject': 'Testline 1',
      'body':
          'line 1 123456789_123456789_123456789_123456789_123456789_123456789_'
    },
    {
      'subject': 'Testline 2',
      'body':
          'line2 123456789_123456789_123456789_123456789_123456789_123456789_'
    },
    {
      'subject': 'Testline 13',
      'body':
          'line3_123456789_123456789_123456789_123456789_123456789_123456789_'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.separated(
        itemCount: messages.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (
          BuildContext context,
          int index,
        ) {
          var message = messages[index];

          return ListTile(
            title: Text(
              message['subject'],
            ),
            isThreeLine: true,
            leading: CircleAvatar(
              child: Text('UW'),
            ),
//            trailing: Text('Z'),
            subtitle: Text(
              message['body'],
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          );
        },
      ),
    );
  }
}
