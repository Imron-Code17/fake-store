import 'package:fakestore/app/config/theme/style.dart';
import 'package:flutter/material.dart';

import '../../../config/theme/theme.dart';

class CardBorder extends StatelessWidget {
  const CardBorder({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: theme.style.padding.allMedium,
      decoration: BoxDecoration(
        borderRadius: theme.style.borderRadius.allSmall,
        border: theme.style.boder,
      ),
      child: child,
    );
  }
}
