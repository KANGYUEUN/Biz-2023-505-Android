import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:totolist/models/todo.dart';

// ignore: constant_identifier_names
const String TBL_TODO = "tbl_todoList";

/// 안드로이드, 아이폰 에는 공통으로 SQLite 라는 RDBMS 가 내장 되어 있다.
/// 규모는 매우 작지만 phone 에서 DB를 SQL을 사용하여 관리 할 수 있도록
/// 여러가지 명령어를 제공한다.
///
/// 기본적인 기능만으로는 다소 사용이 불편하여 sqflite.dart를 사용해 관리한다.
class TodoService {
  /// 변수 이름에 _ 언더스코어 를 붙이면
  /// 이 변수는 private 이다.
  /// late 키워드는 아직 변수를 초기화 시키지 않았지만
  /// 이 값은 null 이 아니다 라는 선언이다.
  late Database _database;
  final String createTABLE = """
    CREATE TABLE tbl_todoList (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      sdate TEXT,
      stime TEXT,
      content TEXT,
      complete INTEGER
    )
  """;

  /// Future
  /// 함수의 return type 으로 사용하는 키워드
  /// 이 함수는 언젠가 실행 될 것이고, return 값이 null 이 아니다 라는 선언
  /// JS Promise  키워드와 같은 역할을 한다.
  /// 비동기 방식 함수에 주로 사용한다.
  Future<void> onCreateTable(db, version) async {
    return db.execute(createTABLE);
  }

  Future<void> onUpgradeTable(db, oldVersion, newVersion) async {
    if (newVersion > oldVersion) {
      final db = await database;
      final batch = db.batch();
      batch.execute("DROP TABLE $TBL_TODO");
      batch.execute(createTABLE);
      await batch.commit();
    }
  }

  Future<Database> initDatabase() async {
    // 실제 phone 의 DB 가 저장되는 경로(path) 가져오기
    String dbPath = await getDatabasesPath();
    // 저장될 database 파일을 설정
    var dbFile = join(dbPath, "todo.dbf");

    return await openDatabase(
      dbFile,
      onCreate: onCreateTable,
      onUpgrade: onUpgradeTable,
      version: 3,
    );
  }

  /// _database private  변수를 외부에서 사용하기 위해 'getter method '
  Future<Database> get database async {
    _database = await initDatabase();
    return _database;
  }

  Future<int> insert(Todo todo) async {
    final db = await database;
    return await db.insert(TBL_TODO, todo.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace); // 같은 값이 잇으면 덮어써라
  }

  // SQL 사용시 문자열 연결 방식으로 WHERE 절 사용 금지
  // 인젝션 공격에 노출될 위험
  Future<int> delete(int id) async {
    debugPrint(id.toString());
    final db = await database;
    return await db.delete(
      TBL_TODO,
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<int> update(Todo todo) async {
    final db = await database;
    return db.update(
      TBL_TODO,
      todo.toMap(),
      where: "id = ?",
      whereArgs: [todo.id],
    );
  }

  /// 비동기 방식으로
  Future<List<Todo>> selectAll() async {
    final db = await database;
    final List<Map<String, dynamic>> todoList = await db.query(TBL_TODO);

    // select 한 데이터(resultSet)를 List<TodoList> 로 변환하기
    return List.generate(
      todoList.length,
      (index) => Todo(
        id: todoList[index]["id"],
        sdate: todoList[index]["sdate"],
        stime: todoList[index]["stime"],
        content: todoList[index]["content"],
        complete: todoList[index]["complete"] == 1 ? true : false,
      ),
    );
  }
}
