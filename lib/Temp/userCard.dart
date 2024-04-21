import 'dart:async';
import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:go_routing_example/Bloc/swipe/swipe_bloc.dart';

import '../UserModel/userModel.dart';

class UserCard extends StatefulWidget {
  final User user;

  const UserCard({
    super.key,
    required this.user,
  });

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard>
    with SingleTickerProviderStateMixin {
  Timer? _timer;
  bool autoPlay = false;
  int currentIndex = 0;
  bool showIndicator = false;
  CarouselController carouselController = CarouselController();
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _startTimer();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          context.read<SwipeBloc>().add(const SwipeLikeEvent());
          _controller.reset();
        }
      });
  }

  void _handleDoubleTap() {
    _controller.forward(from: 0);
  }

  @override
  void didUpdateWidget(UserCard oldWidget) {
    if (widget.user != oldWidget.user) {
      super.didUpdateWidget(oldWidget);
      currentIndex = 0;
      showIndicator = false;
      autoPlay = false;
      carouselController.jumpToPage(0);
      if (widget.user.imageUrls.length > 1) {
        _startTimer();
      } else {
        _timer?.cancel();
      }
    }
  }

  @override
  void dispose() {
    currentIndex = 0;
    _timer!.cancel();
    super.dispose();
  }

  void onTouch() {
    setState(() {
      autoPlay = false;
      showIndicator = true;
    });
    _timer!.cancel();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      setState(() {
        autoPlay = true;
        showIndicator = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: _handleDoubleTap,
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            CarouselSlider.builder(
              itemCount: widget.user.imageUrls.length,
              itemBuilder: (BuildContext context, int index, int realIndex) {
                return Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(widget.user.imageUrls[index]),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 60,
                      left: 0,
                      right: 0,
                      child: AnimatedBuilder(
                        animation: _animation,
                        builder: (context, child) {
                          return Transform.scale(
                            scale: _animation.value,
                            child: const Icon(
                              Icons.favorite,
                              size: 100,
                              color: Colors.red,
                            ),
                          );
                        },
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: ClipRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 5),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.1,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Colors.white.withOpacity(0.5),
                                    Colors.white.withOpacity(0.1),
                                    Colors.transparent,
                                  ]),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height,
                viewportFraction: 1.001,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: autoPlay,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                enlargeCenterPage: false,
                scrollDirection: Axis.horizontal,
                scrollPhysics: const BouncingScrollPhysics(),
                pageSnapping: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                  if (reason == CarouselPageChangedReason.manual) {
                    onTouch();
                  }
                },
              ),
              carouselController: carouselController,
            ),
            if (showIndicator)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.user.imageUrls.asMap().entries.map((entry) {
                  int index = entry.key;
                  return Container(
                    width: currentIndex == index ? 35 : 20,
                    height: 8.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: currentIndex == index
                          ? Colors.grey
                          : Colors.grey.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  );
                }).toList(),
              ),
            Positioned(
              bottom: 30,
              left: 20,
              child: InkWell(
                onTap: () {
                  context.goNamed("profile");
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.user.name},${widget.user.age}",
                      style:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
                                color: Colors.black,
                              ),
                    ),
                    Text(
                      widget.user.jobTitle,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 30,
              right: 20,
              child: IconButton(
                  onPressed: () {
                    _showMessageField(context);
                  },
                  icon: const Icon(
                    Icons.messenger_outline_rounded,
                    color: Colors.black,
                    size: 40,
                  )),
            ),
          ],
        ),
      ),
    );
  }

  void _showMessageField(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController messageController = TextEditingController();

        return AlertDialog(
          backgroundColor: Colors.white.withOpacity(0.5),
          scrollable: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          elevation: 10,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          content: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                const SizedBox(width: 10.0),
                const CircleAvatar(
                  radius: 15.0,
                  backgroundImage: AssetImage('assets/Smily.png'),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: TextField(
                    textInputAction: TextInputAction.send,
                    decoration: const InputDecoration.collapsed(
                      hintText: 'Send a message...',
                    ),
                    onSubmitted: (String message) {
                      print('Message sent: $message');
                      Navigator.of(context).pop();
                    },
                    controller: messageController,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    String message = messageController.text;
                    print('Message sent: $message');
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
