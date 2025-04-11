// import 'package:dartactivity/ui/pages/landing/widgets/splash_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';

// class LandingPage extends StatefulWidget {
//   const LandingPage({super.key});

//   @override
//   State<LandingPage> createState() => _LandingPageState();
// }

// class _LandingPageState extends State<LandingPage>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//   late Animation<Offset> _offsetAnimation;
//   @override
//   void initState() {
//     super.initState();

//     _animationController = AnimationController(
//       duration: const Duration(milliseconds: 500),
//       vsync: this,
//     );

//     _offsetAnimation = Tween<Offset>(
//       begin: Offset.zero,
//       end: const Offset(0.5, 0.0),
//     ).animate(
//       CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
//     );
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         padding: const EdgeInsets.all(16),
//         color: Colors.white,
//         width: double.infinity,
//         height: double.infinity,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Text(
//               "SwiftCart",
//               style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(
//               child: Center(
//                 child: LottieBuilder.asset(
//                   'assets/animation/landing_cart.json',
//                   fit: BoxFit.contain,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             Column(
//               children: [
//                 Container(
//                   width: double.infinity,
//                   padding: const EdgeInsets.symmetric(horizontal: 16),
//                   child: GestureDetector(
//                     onHorizontalDragStart: (_) {
//                       _animationController.forward();
//                     },
//                     onTap: () {
//                       _animationController.reset();
//                     },
//                     onHorizontalDragEnd: (_) {
//                       _animationController.reset();
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => SplashScreen()),
//                       );
//                     },
//                     child: Stack(
//                       alignment: Alignment.center,
//                       children: [
//                         Container(
//                           width: double.infinity,
//                           height: 60,
//                           decoration: BoxDecoration(
//                             color: Colors.orange.withAlpha((0.2 * 255).toInt()),
//                             borderRadius: BorderRadius.circular(25),
//                           ),
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             SlideTransition(
//                               position: _offsetAnimation,
//                               child: Row(
//                                 children: [
//                                   Text(
//                                     'Slide to Start',
//                                     style: TextStyle(
//                                       fontSize: 18,
//                                       color: Colors.orange,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   SizedBox(width: 10),
//                                   Icon(
//                                     Icons.arrow_forward,
//                                     color: Colors.orange,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             const SizedBox(width: 10),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
