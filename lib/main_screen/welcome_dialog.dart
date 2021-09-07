import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class WelcomeDialog extends StatelessWidget {
  const WelcomeDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const CircleBorder(),
      backgroundColor: const Color(0xFFf5f3e4),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: CarouselSlider(
          options: CarouselOptions(
            height: 300,
            autoPlayAnimationDuration: const Duration(seconds: 1),
            pauseAutoPlayOnTouch: true,
            viewportFraction: 1.0,
            enlargeCenterPage: false,
            autoPlay: true,
            enableInfiniteScroll: false,
            pauseAutoPlayInFiniteScroll: true,
            onPageChanged: (index, reason) {
              if (index == 5) {
                Navigator.of(context).pop();
              }
            },
          ),
          items: [
            const Center(
              child: const Text(
                'Смены Полимира 2.0',
                style: const TextStyle(fontSize: 25),
                textAlign: TextAlign.center,
              ),
            ),
            const Center(
              child: const Text(
                'Привет пользователь!\n\n'
                'Это большое обновление.',
                style: const TextStyle(fontSize: 25),
                textAlign: TextAlign.center,
              ),
            ),
            const Center(
              child: const Text(
                'Выбирайте сами \nкакие и сколько смен отображать на главном экране',
                style: const TextStyle(fontSize: 25),
                textAlign: TextAlign.center,
              ),
            ),
            const Center(
              child: const Text(
                'Сохраняйте дополнительную информацию о смене',
                style: const TextStyle(fontSize: 25),
                textAlign: TextAlign.center,
              ),
            ),
            const Center(
              child: const Text(
                'Выбирайте одну из трех тем оформления:\n\n'
                'фиолетовая\n'
                'красная\n'
                'синяя',
                style: const TextStyle(fontSize: 25),
                textAlign: TextAlign.center,
              ),
            ),
            Container(),
          ],
        ),
      ),
    );
  }
}
