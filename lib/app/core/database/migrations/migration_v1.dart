import 'package:sqflite/sqflite.dart';

import 'migration.dart';

class MigrationV1 implements Migration {
  @override
  void create(Batch batch) {
    batch.execute('''
      create table expense(
        id integer primary key,
        descricao varchar(500) not null,
        expenseDate datetime not null,
        amount integer not null,
        latitude varchar(20) not null,
        longitude varchar(20) not null
      );

      create table localExpense(
        id integer primary key,
        idExpense integer foreign key references expense(id)
        isDelete integer(1) not null default 0, 
        isUpdate integer(1) not null default 0, 
        isCreate integer(1) not null default 0,
      );
    ''');
  }
}