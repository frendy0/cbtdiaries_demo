import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DiariesEmptyWidget extends StatelessWidget {
  const DiariesEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Opacity(
            opacity: 0.6,
            child: SvgPicture.asset(
              'assets/icons/pazzle_empty.svg',
            )),
        const SizedBox(
          height: 15,
        ),
        Text(
          'Add your\nfirst entry',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade700),
        )
      ],
    ));
  }
}
