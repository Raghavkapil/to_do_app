import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 220,
      stretch: true,
      pinned: true,
      floating: true,
      title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Icon(
          Icons.check_box_rounded,
          color: Colors.white,
          size: 30,
          shadows: [
            Shadow(
                color: Colors.black.withOpacity(1),
                offset: Offset(2, 2),
                blurRadius: 10),
          ],
        ),
        Text(
          '  To Do List',
          style: TextStyle(
              fontSize: 30.5,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: [
                Shadow(
                    color: Colors.black.withOpacity(1),
                    offset: Offset(2, 2),
                    blurRadius: 10)
              ]),
        ),
      ]),
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset('lib/images/latest.jpg', fit: BoxFit.fill),
        stretchModes: const <StretchMode>[
          StretchMode.zoomBackground,
          StretchMode.blurBackground,
          StretchMode.fadeTitle,
        ],
      ),
    );
  }
}
