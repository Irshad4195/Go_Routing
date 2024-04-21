import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HeartAnimation(),
//     );
//   }
// }

class HeartAnimation extends StatefulWidget {
  const HeartAnimation({super.key});

  @override
  HeartAnimationState createState() => HeartAnimationState();
}

class HeartAnimationState extends State<HeartAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const NextPage()));
          _controller.reset();
        }
      });
  }

  void _handleDoubleTap() {
    _controller.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Heart Animation"),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      body: GestureDetector(
        onDoubleTap: _handleDoubleTap,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.greenAccent,
          child: Center(
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.scale(
                  scale: _animation.value,
                  child: const Icon(
                    Icons.favorite,
                    size: 150,
                    color: Colors.red,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text('Next Page'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Text('This is the next page'),
      ),
    );
  }
}
