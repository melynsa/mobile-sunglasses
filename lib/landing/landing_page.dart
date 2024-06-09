import 'package:flutter/material.dart';
import 'package:sunglasses/common/colors.dart';
import 'package:sunglasses/form/auth.dart';
import 'package:sunglasses/home/home_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/landing.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 1,
          child: Container(
            height: 340,
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Glass \nfor eye',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    inherit: false,
                    fontSize: 75,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                     MaterialPageRoute(builder: (context) => LoginScreen()),
                        );
                      },
                      child: const Text('Continue'),
                        // style: TextStyle(
                        //   inherit: false,
                        //   fontSize: 22,
                        //   fontWeight: FontWeight.w500,
                        //   color: Colors.black,
                        // ),
                      
                      style: ElevatedButton.styleFrom(
                        primary: GlassesColors.lightYellow,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 22,
                          horizontal: 30,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(builder: (context) => LoginScreen()),
                    //     );
                    //   },
                    //   child: const Text('Login'),
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
