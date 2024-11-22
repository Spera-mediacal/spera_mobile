import 'package:flutter/material.dart';

class GlowContainer extends StatefulWidget {
  final double bottomPosition;
  final double rightPosition;
  final Color color;
  final bool isAnimating;

  const GlowContainer({
    Key? key,
    required this.bottomPosition,
    required this.rightPosition,
    required this.color,
    this.isAnimating = false,
  }) : super(key: key);

  @override
  _GlowContainerState createState() => _GlowContainerState();
}

class _GlowContainerState extends State<GlowContainer> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    if (widget.isAnimating) {
      _controller.repeat(reverse: true);
    }
  }

  @override
  void didUpdateWidget(GlowContainer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isAnimating) {
      _controller.repeat(reverse: true);
    } else {
      _controller.stop();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Positioned(
          bottom: widget.bottomPosition,
          right: widget.rightPosition,
          child: Transform.scale(
            scale: _animation.value,
            child: Container(
              width: 700,
              height: 700,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  radius: 1.2,
                  center: Alignment.center,
                  colors: [
                    widget.color,
                    Colors.transparent,
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}