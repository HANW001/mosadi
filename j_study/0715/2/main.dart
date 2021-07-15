// import 'dart:js';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //정적인 위젯
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // 머티리얼 디자인 기준, 다른 디자인도 선택 가능
        home: home());
  }

  Widget home() {
    return Scaffold(
      // 기본적인 앱같은 형태를 만들어주는 클래스 위젯임
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text('hihi!!!'), // 제목에 Text위젯을 달아서 설정
        actions: <Widget>[
          // 액션을 하기 때문에 버튼 위젯 추가
          IconButton(
            // 아이콘 버튼 위젯 삽입
            icon: Icon(Icons.search), // search모양 버튼 생성
            onPressed: () {
              // 누르면 반응하는 옵션
              print('hihi');
            },
          ),
          IconButton(
            icon: Icon(Icons.search_off),
            onPressed: () {
              print('push');
            },
          )
        ],
      ),
      body: body(),
    );
  }

// container -> row , colum 순
  Widget body() {
    return Container(
        // 지금까지 사용한 것을 한 뭉텅이로 박스에 넣고 여백 색상 등 조절할 때 사용
        padding: EdgeInsets.all(20),
        // decoration: BoxDecoration(
        //   color: Colors.red,
        // ),
        // child: col());
        child: testList());
  }

  Widget testList() {
    // List<String> items = []; // 초기화

    List<String> items = List<String>.generate(100, (i) => '리스트 테스트 $i');

    // items.add('aaa'); //추가
    // items.add('bbb');
    // items.add('ccc');
    // items.add('ddd');
    // items.removeLast(); // 마지막 원소 삭제

    // 랜더링
    // return Center(
    //   child: Text(items[1]),
    // );

    // for (var i = 0; i < 10; i++) items.add('bbbbb');

    // return Column(
    //   children: List.generate(items.length, (i) => Text(items[i])), // generate 일괄로 렌더링
    // );

    // ListView 화면 밖으로 나가면 에러 뜨는 것을 방지 builder로 호출해서 몇개를 표시할지 어떻게 표시할지 정함
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, i) {
        // context 중요함 화면의 주인(?) 위에서 선언해줌
        return ListTile(
          // ListView에는 ListTile이 어울린다 일정 간격을 알아서 만들어줌
          // title: Text('${items[index]}'),
          title: Text(items[i]),
          subtitle: Text('this is test $i ㅎㅎㅎㅎㅎ'),
        );
      },
    );
  }

  // Widget col() {
  //   return Column(
  //     // 수직으로 나타난다. children을 기본으로 사용한다.
  //     children: [
  //       row(), // 위젯 선언한 row호출
  //       row(),
  //       row(),
  //       row(),
  //       row(),
  //       row(),
  //       row(),
  //       row(),
  //       Text('hihihi')
  //     ],
  //   );
  // }

  // Widget row() {
  //   // 보기 편하기 위해서 위젯을 설정해 두고 필요한 곳에 불러 사용한다.
  //   return Row(
  //     // row는 가로로 나타난다. children을 기본으로 사용한다
  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 옵션은 children 위에 달아준다
  //     children: <Widget>[
  //       Text('11112'),
  //       Text('2222'),
  //       Text('3333'),
  //       Text('4444'),
  //       Text('5555'),
  //       Text('1111'),
  //       Text('2222'),
  //       Text('3333'),
  //       Text('4444'),
  //       Text('5555'),
  //     ],
  //   );
  // }
}
