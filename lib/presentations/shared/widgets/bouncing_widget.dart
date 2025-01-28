import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Bouncing extends StatefulWidget {
  final Widget child;
  final bool disabled;
  final VoidCallback? onPress;
  final VoidCallback? onLongPress;

  const Bouncing(
      {super.key,
      this.onPress,
      this.disabled = false,
      required this.child,
      this.onLongPress});

  @override
  State<Bouncing> createState() => _BouncingState();
}

class _BouncingState extends State<Bouncing>
    with SingleTickerProviderStateMixin {
  bool isHold = true;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
      lowerBound: 0.0,
      upperBound: 0.05,
    );
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
        scale: 1 - _controller.value,
        child: Listener(
            behavior: HitTestBehavior.deferToChild,
            onPointerDown: (event) {
              if (widget.disabled) return;
              isHold = true;
              _controller.forward().whenComplete(() {
                if (!isHold) {
                  isHold = true;
                  _controller.reverse();
                }
              });
            },
            onPointerUp: (event) {
              if (widget.disabled) return;
              isHold = false;
              if (_controller.status == AnimationStatus.completed) {
                _controller.reverse();
              }
            },
            child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  if (widget.onPress != null) widget.onPress!();
                },
                onLongPress: () async {
                  if (widget.onLongPress != null) {
                    await _controller.reverse();
                    widget.onLongPress!();
                  }
                },
                child: widget.child)));
  }
}
