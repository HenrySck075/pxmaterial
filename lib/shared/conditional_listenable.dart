import 'package:flutter/material.dart';

class ConditionalListenableBuilder extends StatefulWidget {
  final bool Function() condition;
  final Listenable listenable;
  final TransitionBuilder builder;
  Widget? child;
  ConditionalListenableBuilder({super.key, required this.listenable, required this.builder, required this.condition, this.child});

  @override
  State<ConditionalListenableBuilder> createState() => _CLBState();
}

class _CLBState extends State<ConditionalListenableBuilder> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return widget.builder(context,widget.child);
  }

  @override
    void initState() {
      // TODO: implement initState
      super.initState();
      widget.listenable.addListener(_handleChange);
    }

  void _handleChange() {
    if (mounted && widget.condition()) {
      setState(() {
              
      });
    }
  }
}
