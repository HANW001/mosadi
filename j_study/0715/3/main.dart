import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

// 클래스를 생성 전역변수 느낌
// 자료형이며 실체가 없다
class AppState {
  bool loading; // true false로 나눌것이다
  String user; // 비어있는지 판단으로 로그인 로그아웃을 표시 -> fire auth로 변경
  AppState(this.loading, this.user);
}

class Home extends StatefulWidget {
  // stateful은 클래스를 따로 만들어야한다
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState(); // 언더바(_)는 private로 인식
}

class _HomeState extends State<Home> {
  final app = AppState(true, ''); // final은 한번만 설정 가능한 변수 로딩과 유저는 true와 ''으로 시작

  @override
  //클래스가 생성될때 init을 들리게 된다
  void initState() {
    super.initState();
    _delay();
  }

  _delay() {
    Future.delayed(Duration(seconds: 1), () {
      // future는 1초 지연시키기 위한 방법정도로 알고있기
      setState(() {
        app.loading = false; // 1초뒤에 로딩은 false로 변경됨
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // if (app.loading) return Text('loading...');
    if (app.loading)
      return _loading(); // app.loading경우 _loading()를 렌더링하며 밑으로 내려가지 않는다
    if (app.user.isEmpty) return _signIn(); // app.user가 비었다면 _signIn()을 렌더링한다
    return _main(); // 이상없으면 _main()을 렌더링한다
  }

//페이지 구성

  Widget _loading() {
    // 로딩페이지
    return Scaffold(
      appBar: AppBar(
        title: Text('Loading....'),
      ),
      body: Center(
        child: CircularProgressIndicator(), // 빙글빙글 도는 프로그레스바
      ),
    );
  }

  Widget _signIn() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // 정중앙에 배치
          children: [
            Text('ID'),
            Text('PASS'),
            RaisedButton(
              child: Text('LOGIN'),
              onPressed: () {
                // 버튼을 누르면 로딩은 true 유저는 my name으로 변경후 딜레이
                app.loading = true;
                app.user = 'my name';
                _delay();
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _main() {
    // 로그인 후 화면
    return Scaffold(
      appBar: AppBar(
        title: Text(app.user), // 유저 ID가 나타남
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle), //로그아웃버튼
            onPressed: () {
              setState(() {
                app.loading = true;
                app.user = ''; // 유저 초기화
                _delay();
              });
            },
          )
        ],
      ),
      body: Center(child: Text('contents')), // 화면에 contents나타남
    );
  }
}
//   int i = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Title'),
//         actions: [
//           IconButton(
//               onPressed: () {
//                 // setState가 잇어야 실시간으로 i값이 증가하는 것을 볼수잇음 State class에서만 사용가능
//                 setState(() {
//                   i++;
//                   if (i > 2) i = 0;
//                 });
//               },
//               icon: Icon(Icons.security))
//         ],
//       ),
//       // body: Text('hihihi $i'),

//       // 홀수일때 아이콘 짝수일때 문자열
//       // body: ((i % 2 == 0) ? Icon(Icons.select_all) : Text('hihi $i')),

//       body: XXX(i: i),
//     );
//   }
// }

// //삼항연산자는 2가지 표현만 가능하다
// // 다양한렌더링을 하려면 위젯을 새로 만든다
// // class XXX extends StatelessWidget { //Text('') 를 사용하기 위해 stateless를 사용
// //   const XXX({Key? key, required this.i}) : super(key: key);
// //   final int i; //
// //   @override
// //   Widget build(BuildContext context) {
// //     if (i == 0)
// //       return CircularProgressIndicator();
// //     else if (i == 1)
// //       return Icon(Icons.security);
// //     else
// //       return Text('llll $i');
// //   }
// // }

// // 가운데에서 출력
// class XXX extends StatelessWidget {
//   XXX({Key? key, this.i: 0}) : super(key: key);
//   final int i;
//   @override
//   Widget build(BuildContext context) {
//     return Center(child: _change(i));
//   }

//   Widget _change(i) {
//     if (i == 0)
//       return CircularProgressIndicator();
//     else if (i == 1)
//       return Icon(Icons.settings);
//     else
//       return Text('yyy: $i');
//   }
// }
