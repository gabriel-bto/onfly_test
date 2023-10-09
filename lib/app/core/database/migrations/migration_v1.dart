import 'package:sqflite/sqflite.dart';

import 'migration.dart';

class MigrationV1 implements Migration {
  @override
  void create(Batch batch) {
    batch.execute('''
      create table expense(
        id Integer primary key autoincrement,
        descricao varchar(500) not null,
        expenseDate datetime not null,
        amount integer not null,
        latitude varchar(20) not null,
        longitude varchar(20) not null
      )
    ''');
  }
}