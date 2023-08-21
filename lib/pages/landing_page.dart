import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final  _controller = PageController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
    body: Stack(
      children: [
        Expanded(
          child: PageView(
            physics:const BouncingScrollPhysics(),
            controller: _controller,
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                color: Colors.black,
               child: Center(
                child: SingleChildScrollView(
                  physics:const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      const SizedBox(height: 30,),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset('assets/images/netflix.png', fit: BoxFit.cover,)),
                    ],
                  ),
                ),
               ),
                //color: Colors.red,
              ),
               Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                color: Colors.black,
               child: Center(
                child: SingleChildScrollView(
                  physics:const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      const SizedBox(height: 30,),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset('assets/images/folder.png', fit: BoxFit.cover,)),
                    ],
                  ),
                ),
               ),
                //color: Colors.red,
              ),
               Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                color: Colors.black,
               child: Center(
                child: SingleChildScrollView(
                  physics:const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      const SizedBox(height: 30,),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset('assets/images/video.png', fit: BoxFit.cover,)),
                    ],
                  ),
                ),
               ),
                //color: Colors.red,
              ),
            ],
          ),
        ),
        Container(
          alignment: const Alignment(0, 0.75),
          child: SmoothPageIndicator(controller: _controller, count: 3))
      ],
    ),
    );
  }
}