import 'package:flutter/material.dart';

void main() => runApp(MyApp()); //최상위 함수라서 한번만 하면 된다. 괄호안에는 arg위젯이 들어온다

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '김창호를 위한 app', //이름 총칭
      theme: ThemeData(
          primarySwatch: Colors.blue
      ),
    home: MyHomePage(), //커스텀위젯이름 지정
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('창호 App'), // 앱바만 보이는 타이틀
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('김창호'),
            Text('김창호'),
            Text('김창호')
          ],
        ),
      ),
    );
  }
}