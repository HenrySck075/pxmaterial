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
  String themeMode = "system";

  @override 
  Widget build(ctx) {
    var settings = AppData.of(ctx).appSettings;
    if (!_initialized) {
      noViewConstraints = settings.noViewConstraints;
      themeMode = settings.themeMode;
    }
    _initialized = true;
    return ListView( 
      children: [
        FilledButton(onPressed: ()=>setState(()=>apply(ctx)), child: const Text("Apply")),
        ListTile(
          title: const Text("No view constraints"),
          trailing: Switch2(value: noViewConstraints, onChanged: (v)=>noViewConstraints=v),
        ),
        ListTile(
          title: Text("Theme mode"),
          trailing: DropdownMenu(
            initialSelection: themeMode,
            onSelected: (s)=>themeMode = s!,
            dropdownMenuEntries: const [
              DropdownMenuEntry(label: "System", value: "system"),
              DropdownMenuEntry(label: "Light", value: "light"),
              DropdownMenuEntry(label: "Dark", value: "dark"),
            ]
          ),
        ),
      ],
    );
  }

  void apply(BuildContext ctx) {
    var settings = AppData.of(ctx).appSettings;
    settings.noViewConstraints = noViewConstraints;
    settings.themeMode = themeMode;
    // https://stackoverflow.com/a/58513635
    (ctx as Element).visitChildren((e)=>e.markNeedsBuild());
  }
}
