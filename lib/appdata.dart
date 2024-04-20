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
/// checker since it will be referenced in [AppData] anyways (and also null check on the langserver sucks)
sql.Database? _globaldb;
/// hi chat
class AppData extends InheritedWidget {
  late sql.Database database;
  
  AppData({required super.child,super.key});
  Future<String> initDb() async {
    var p = join((await getApplicationDocumentsDirectory()).path,"data.db");
    
    _globaldb ??= sql.sqlite3.open(p);
    _globaldb!.execute('''
      CREATE TABLE IF NOT EXISTS history (
        id INTEGER NOT NULL PRIMARY KEY,
        jsondata TEXT NOT NULL
      );
    '''); 
    database = _globaldb!;
    return "wonderhoy";
  }
  _yourwatchhistory watchHistoryManager() {
    return _yourwatchhistory(_globaldb!);
  }

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

class _yourwatchhistory {
  final sql.PreparedStatement insert;
  final sql.PreparedStatement remove; 
  final sql.Database _datadb;
  _yourwatchhistory(this._datadb) : insert = _datadb.prepare("INSERT OR IGNORE INTO history (id,jsondata) VALUES (?,?)"), remove = _datadb.prepare("DELETE FROM history WHERE id = ?");
  void addHistory(JSON work) {
    debugPrint(work["id"].toString());
    insert.execute([int.parse(work["id"]??"0"),jsonEncode(work..["url"]=work["urls"]!["thumb"]!)]);
  }
  removeHistory(int id) {
    remove.execute([id]);
  }
  Iterable<PartialArtwork> getHistory() sync* {
    var result = _datadb.select("SELECT * FROM history");
    for (final row in result) {
      yield PartialArtwork.fromJson(jsonDecode(row["jsondata"]));
    }
  }
}

class _AppSettings {}
