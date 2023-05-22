import 'package:flutter/material.dart';

class ZoomableButton extends StatefulWidget {
  const ZoomableButton({Key? key, required this.child, required this.onTap})
      : super(key: key);
  final Widget child;
  final Function() onTap;

  @override
  State<ZoomableButton> createState() => _ZoomableButtonState();
}

class _ZoomableButtonState extends State<ZoomableButton>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    value: 1,
    duration: const Duration(milliseconds: 500),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onLongPressDown: (_) {
        _controller.animateTo(0.75);
      },
      onLongPressEnd: (_) {
        _controller.animateTo(1);
        widget.onTap();
      },
      onLongPressCancel: () {
        _controller.animateTo(1);
      },
      child: ScaleTransition(
        scale: _animation,
        child: widget.child,
      ),
    );
  }
}
