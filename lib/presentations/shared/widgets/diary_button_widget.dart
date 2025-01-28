import 'package:flutter/material.dart';

class DiaryButtonWidget extends StatelessWidget {
  final Widget background;
  final Widget blur;
  final String label;

  const DiaryButtonWidget(
      {super.key,
      required this.background,
      required this.blur,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
        child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(blurRadius: 8, color: Colors.black.withOpacity(0.2))
                ]),
            child: Stack(
              children: [
                Positioned.fill(child: background),
                Positioned.fill(
                    child: ShaderMask(
                        shaderCallback: (rect) {
                          return LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.black.withOpacity(1),
                                Colors.black.withOpacity(0),
                                Colors.black.withOpacity(0)
                              ],
                              stops: const [
                                0.5,
                                0.6,
                                1
                              ]).createShader(rect);
                        },
                        blendMode: BlendMode.dstOut,
                        child: FittedBox(child: blur))),
                Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                      Colors.white.withOpacity(0),
                      Colors.white.withOpacity(0.8)
                    ],
                            stops: const [
                      0.3,
                      0.8
                    ]))),
                Positioned(
                    bottom: 15,
                    left: 10,
                    right: 10,
                    child: Text(
                      label.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w700),
                    ))
              ],
            )));
  }
}
