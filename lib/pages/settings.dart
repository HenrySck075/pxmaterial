import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sofieru/appdata.dart';

StatefulBuilder Switch2({
  required bool value,
  required ValueChanged<bool>? onChanged,
}) => StatefulBuilder(builder: (ctx,setState)=>Switch(
  value: value, onChanged: onChanged==null?null:(v)=>setState((){
    value = v;
    onChanged(v);
  })
));

class Settings extends StatefulWidget {
  Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool _initialized = false;

  // s 
  bool noViewConstraints = false;

  @override 
  Widget build(ctx) {
    if (!_initialized) {
      var settings = AppData.of(ctx).appSettings;
      noViewConstraints = settings.noViewConstraints;
    }
    _initialized = true;
    return ListView( 
      children: [
        FilledButton(onPressed: ()=>setState(()=>apply(ctx)), child: Text("Apply")),
        ListTile(
          title: Text("No view constraints"),
          trailing: Switch2(value: noViewConstraints, onChanged: (v)=>noViewConstraints=v),
        ),
      ],
    );
  }

  void apply(BuildContext ctx) {
    var settings = AppData.of(ctx).appSettings;
    settings.noViewConstraints = noViewConstraints;
  }
}
