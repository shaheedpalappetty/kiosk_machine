import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:testing/utilities/constants.dart';

class Header extends StatelessWidget {
  const Header({super.key, this.title});
  final String? title;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final currentTime = DateFormat('hh:mm a').format(now);
    return Container(
      height: 100,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const AspectRatio(
            aspectRatio:  1/1,
            child: Image(
              image: AssetImage(parkinLogo),
              fit: BoxFit.contain,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(currentTime.toString()),
              if (title != null)
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    title!,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: const Color(0xFF005060)),
                  ),
                ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF005060),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text('English'),
          ),
        ],
      ),
    );
  }
}
