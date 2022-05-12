import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashWidget extends StatefulWidget {
  final String? lottieUrl;
  final Function? onComplete;
  final double? height;
  final double? width;
  final bool? animate;
  final bool? repeat;
  final Duration? duration;

  const SplashWidget(
      {Key? key,
      this.lottieUrl,
      this.onComplete,
      this.height,
      this.width,
      this.animate,
      this.repeat,
      this.duration})
      : super(key: key);

  @override
  _SplashWidgetState createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(widget.lottieUrl ?? 'assets/animations/blipy.json',
        frameRate: FrameRate.max,
        controller: _controller,
        height: widget.height ?? MediaQuery.of(context).size.height,
        width: widget.width ?? MediaQuery.of(context).size.width,
        animate: widget.animate ?? true,
        repeat: widget.animate ?? true, onLoaded: (composition) {
      _controller
        ..duration = composition.duration
        ..forward().whenComplete(() => widget.onComplete!());
    });
  }
}
