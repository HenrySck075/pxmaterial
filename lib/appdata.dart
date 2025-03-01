/// very bad code

import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sofieru/json/ajax/illust/PartialArtwork.dart';
import 'package:sofieru/shared.dart';
import 'package:sqlite3/sqlite3.dart' as sql;

T? nullOnThrow<T>(T Function() func, List<dynamic>? args, Map<Symbol, dynamic>? kwargs) {
  try {
    return Function.apply(func, args, kwargs);
  } catch (e) {return null;}
}
Future<String> initDb() async {
  var p = join((await getApplicationDocumentsDirectory()).path,"data.db");
  
  _globaldb ??= sql.sqlite3.open(p);
  _globaldb!.execute('''
    CREATE TABLE IF NOT EXISTS history (
      id INTEGER NOT NULL PRIMARY KEY,
      jsondata TEXT NOT NULL
    );
  '''); 
  return "wonderhoy";
}
/// checker since it will be referenced in [AppData] anyways (and also null check on the langserver sucks)
sql.Database? _globaldb;
/// hi chat
class AppData extends InheritedWidget {
  late final sql.Database database;
  
  AppData({required super.child,super.key}) : database = _globaldb!;
  _WatchHistory watchHistoryManager() {
    return _WatchHistory(_globaldb!);
  }
  AppSettings get appSettings => AppSettings();

  static AppData? maybeOf(BuildContext ctx)=>ctx.dependOnInheritedWidgetOfExactType<AppData>();

  static AppData of(BuildContext ctx) {
    final h = maybeOf(ctx);
    assert (h!=null, "There will never be a Touhou Album.");
    return h!;
  }
  @override 
  /// implement when [_AppSettings] is done
  bool updateShouldNotify(AppData old) => false;
}

class _WatchHistory {
  final sql.PreparedStatement insert;
  final sql.PreparedStatement remove; 
  final sql.Database _datadb;
  _WatchHistory(this._datadb) : insert = _datadb.prepare("INSERT OR IGNORE INTO history (id,jsondata) VALUES (?,?)"), remove = _datadb.prepare("DELETE FROM history WHERE id = ?");
  void addHistory(JSON work) {
    /*
    debugPrint(work["id"].toString());
    insert.execute([
      int.parse(work["id"]??"0"),
      jsonEncode(work
        ..["url"]=work["urls"]!["thumb"]!
        //..["tags"]=work["tags"]["tags"].map((e)=>e["tag"]).toList()
      )
    ]);
    */
  }
  removeHistory(int id) {
    remove.execute([id]);
  }
  Iterable<PartialArtwork> getHistory() sync* {
    var result = _datadb.select("SELECT * FROM history");
    for (final row in result) {
      yield jsonDecode(row["jsondata"]);
    }
  }
}

class AppSettings {
  AppSettings(){
    _globaldb!.execute('''
    CREATE TABLE IF NOT EXISTS AppSettings (
      name TEXT NOT NULL PRIMARY KEY,
      value BLOB
    );
    ''');
  }

  dynamic _get(String name,[dynamic defaultv]) {
    var h = _globaldb!.select("SELECT * FROM AppSettings WHERE name = ?", [name]).firstOrNull?["value"];
    dynamic v;
    if (h is int && defaultv is bool) {v = h==1;}
    else {v = h;}
    return v??defaultv;
  }
  void _set(String name, dynamic value) {
    _globaldb!.execute("INSERT OR REPLACE INTO AppSettings (name, value) VALUES (?,?)", [name,value]);
  }


  String get cookie=> _get("cookie","");
  set cookie(String v)=> _set("cookie",v);

  bool get noViewConstraints=> _get("no_view_constraints",false);
  set noViewConstraints(bool v)=> _set("no_view_constraints",v);

  String get themeMode=> _get("theme_mode","system");
  set themeMode(String v)=> _set("theme_mode",v);
}
