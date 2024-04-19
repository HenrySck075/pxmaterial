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

/// hi chat
class AppData extends InheritedWidget {
  late sql.Database _datadb;
  AppData({required super.child,super.key});
  Future<void> initDb() async {
    _datadb = sql.sqlite3.open(join((await getApplicationSupportDirectory()).path,"hichat.db"));
    _datadb.execute('''
      CREATE TABLE IF NOT EXIST history (
        id INTEGER NOT NULL PRIMARY KEY,
        jsondata TEXT NOT NULL,
      );
    '''); 
  }
  _yourwatchhistory watchHistoryManager() {
    return _yourwatchhistory(_datadb);
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
  _yourwatchhistory(this._datadb) : insert = _datadb.prepare("INSERT OR IGNORE INTO history (id,name,url,authorname,authorid,authoravatar) VALUES (?)"), remove = _datadb.prepare("DELETE FROM history WHERE id = ?");
  void addHistory(JSON work) {
    insert.execute([jsonEncode(work)]);
  }
  removeHistory(int id) {
    remove.execute([id]);
  }
  Iterable<PartialArtwork> getHistory() sync* {
    var result = _datadb.select("SELECT * FROM history");
    for (final row in result) {
      yield PartialArtwork.fromJson(row["jsondata"]);
    }
  }
}

class _AppSettings {}
