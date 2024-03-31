import 'package:fakestore/app/config/theme/font.dart';
import 'package:fakestore/app/config/theme/style.dart';
import 'package:fakestore/app/config/theme/theme.dart';
import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: theme.style.padding.allLarge,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hi, John', style: theme.font.f14.black),
            Text('What are you looking for today?',
                style: theme.font.f24.semibold),
          ],
        ),
      ),
    );
  }
}
