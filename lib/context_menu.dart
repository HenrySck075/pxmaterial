
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

typedef ContextMenuBuilder = Widget Function(
    BuildContext context, Offset offset);
/// Shows and hides the context menu based on user gestures.
///
/// By default, shows the menu on right clicks and long presses.
///
///Taken from widgets.ContextMenuController.1
class ContextMenuRegion extends StatefulWidget {
  /// Creates an instance of [_ContextMenuRegion].
  const ContextMenuRegion({
    required this.child,
    required this.contextMenuBuilder,
  });

  /// Builds the context menu.
  final ContextMenuBuilder contextMenuBuilder;

  /// The child widget that will be listened to for gestures.
  final Widget child;

  @override
  State<ContextMenuRegion> createState() => _ContextMenuRegionState();
}

class _ContextMenuRegionState extends State<ContextMenuRegion> {
  Offset? _longPressOffset;

  final ContextMenuController _contextMenuController = ContextMenuController();

  static bool get _longPressEnabled {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
      case TargetPlatform.iOS:
        return true;
      case TargetPlatform.macOS:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return false;
    }
  }

  void _onSecondaryTapUp(TapUpDetails details) {
    _show(details.globalPosition);
  }

  void _onTap() {
    if (!_contextMenuController.isShown) {
      return;
    }
    _hide();
  }

  void _onLongPressStart(LongPressStartDetails details) {
    _longPressOffset = details.globalPosition;
  }

  void _onLongPress() {
    assert(_longPressOffset != null);
    _show(_longPressOffset!);
    _longPressOffset = null;
  }

  void _show(Offset position) {
    _contextMenuController.show(
      context: context,
      contextMenuBuilder: (BuildContext context) {
        return widget.contextMenuBuilder(context, position);
      },
    );
  }

  void _hide() {
    _contextMenuController.remove();
  }

  @override
  void dispose() {
    _hide();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onSecondaryTapUp: _onSecondaryTapUp,
      onTap: _onTap,
      onLongPress: _longPressEnabled ? _onLongPress : null,
      onLongPressStart: _longPressEnabled ? _onLongPressStart : null,
      child: widget.child,
    );
  }
}

/// which is just [Card] wrapping [ListTile] with a smaller border
class ContextMenuItem extends StatelessWidget {
  String? label;
  String? subtitle;
  IconData? icon;
  bool isThreeLine;
  void Function()? onSelected;

  ContextMenuItem({super.key, this.label, this.subtitle, this.icon, this.isThreeLine=false, this.onSelected});

  @override
  /// i lied
  Widget build(ctx) => Material( 
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
    child: InkWell( 
      onTap: (){
        if (onSelected!=null) {onSelected!();}
        ContextMenuController.removeAny();
      },
      child:ListTile( 
        title: label==null?null:Text(label!),
        subtitle: subtitle==null?null:Text(subtitle!),
        leading: icon==null?Icon(icon):null,
        isThreeLine: isThreeLine,
      ),
    )
  );
}

/// Style: Pixel Launcher context menu (app drawer) (google didn't do this to google workspace but i think it's cool)
class ContextMenu extends StatelessWidget {
  final List<ContextMenuItem> items;
  Widget child; 

  ContextMenu({required this.items, required this.child});

  @override 
  Widget build(ctx) => ContextMenuRegion(
    child: child, 
    contextMenuBuilder: (ctx,off)=>Card( 
        clipBehavior: Clip.hardEdge,
          child: SizedBox(
        width: 100, height: 99,
        child: Column(
            mainAxisSize:MainAxisSize.min,
            children: items,
          ),
      ),
    )
  );
}
