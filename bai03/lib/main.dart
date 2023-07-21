import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My app',
      home: MyHomeScreen(),
    ),
  );
}

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  // Biến lưu trạng thái màu nền hiện tại
  Color _backgroundColor = Colors.white; // Màu nền ban đầu là trắng

  // Danh sách các màu bạn muốn chuyển đổi
  final List<Color> _colorList = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.purple,
  ];

  // Hàm để thay đổi màu nền
  void changeBackgroundColor() {
    setState(() {
      // Lấy màu tiếp theo trong danh sách màu
      int nextColorIndex =
          (_colorList.indexOf(_backgroundColor) + 1) % _colorList.length;
      _backgroundColor = _colorList[nextColorIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My home work'),
      ),
      body: SafeArea(
        child: SizedBox.expand(child: Container(
          alignment: Alignment.center,
          width: 390,
          color: _backgroundColor, // Sử dụng biến màu nền đã lưu trạng thái
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildButton(context),
            ],
          ),
        ),)
      ),
    );
  }

  Widget buildButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            changeBackgroundColor(); // Khi nhấn vào nút, gọi hàm thay đổi màu nền
          },
          style: ElevatedButton.styleFrom(
            backgroundColor:
            Colors.blue, // Màu nền của nút, bạn có thể thay đổi tùy ý
          ),
          child: const Text(
            'Click me',
            style: TextStyle(fontSize: 40),
          ),
        ),
      ],
    );
  }
}