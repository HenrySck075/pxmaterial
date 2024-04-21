
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

MenuStyle _style = const MenuStyle(padding: MaterialStatePropertyAll(EdgeInsets.all(4)));
ButtonStyle _btnStyle = ButtonStyle(shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(2))));

class ContextMenuItem extends StatelessWidget {
  IconData? icon;
  String label;
  /// does nothing if [items] is non-null
  LogicalKeyboardKey? shortcut;
  (bool ctrl, bool alt, bool shift, bool meta) shortcutModifiers;
  List<ContextMenuItem>? items;
  VoidCallback? onPressed;

  ContextMenuItem({super.key, required this.label, this.icon, this.shortcut, this.shortcutModifiers = (false, false, false, false), this.onPressed});

  @override
  Widget build(ctx)=>items==null
  ?MenuItemButton( 
    leadingIcon: icon!=null?Icon(icon):null,
    shortcut: shortcut!=null ?SingleActivator(shortcut!,control: shortcutModifiers.$1, alt: shortcutModifiers.$2, shift: shortcutModifiers.$3, meta: shortcutModifiers.$4):null,
    onPressed: onPressed,
    style: _btnStyle,
    child: Text(label),
  )
  :SubmenuButton(
    menuChildren: items!, 
    leadingIcon: icon!=null?Icon(icon):null,
    menuStyle: _style,
    style: _btnStyle,
    child: Text(label),
  );
}

/// https://dartpad.dev/?split=60&sample_id=material.MenuAnchor.2&sample_channel=stable&channel=stable
class ContextMenuWrapper extends StatefulWidget { 
  final List<ContextMenuItem> items;
  final Widget child;
  ContextMenuWrapper({super.key, required this.items, required this.child});

  @override
  State<ContextMenuWrapper> createState()=>_ContextMenuWrapperState();
}

class _ContextMenuWrapperState extends State<ContextMenuWrapper> with SingleTickerProviderStateMixin {
  MenuController _menuController = MenuController();
  late final AnimationController _animation;
  late final Animation<double> _openAnim;
  late final Animation<double> _closeAnim;
  Offset position = Offset.zero;
  bool _forward = true;
  @override
  void initState(){
    super.initState();
    if (kIsWeb) {
      if (BrowserContextMenu.enabled) {BrowserContextMenu.disableContextMenu();}
    }
    _animation = AnimationController(vsync:this,duration: Durations.medium1)..addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {_menuController.close();}
      else if (!_menuController.isOpen) {_menuController.open(position: position);}
      
    });
    _openAnim = _animation.drive(CurveTween(curve: Curves.bounceOut));
    _closeAnim = _animation.drive(CurveTween(curve: Easing.emphasizedAccelerate));
  }

  void _openContext(Offset pos) {
    if (_animation.status case AnimationStatus.forward || AnimationStatus.completed) {
      _animation.reverse();
      _forward = false;
    } else {
      position = pos;
      _animation.forward();
      _forward = true;
    }
  }

  @override
  Widget build(ctx) {
    return GestureDetector(
      onLongPressDown: (d){
        if (d.kind == PointerDeviceKind.touch) _openContext(d.localPosition);
      },
      onSecondaryTapUp: (d)=>_openContext(d.localPosition),
      child: MenuAnchor(
        controller: _menuController,
        // this guarantees the close animation won't work
        onClose: _animation.reset,
        menuChildren: [
          ScaleTransition(
            scale: _forward?_openAnim:_closeAnim,
            child: Column( 
              children: widget.items,
            ),
          )
        ],
        style: _style,
        child: widget.child,
      ),
    );
  }
}
