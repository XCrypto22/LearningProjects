import 'package:hive_flutter/adapters.dart';
import 'package:todoapp/models/task.dart';

class TaskAdapter extends TypeAdapter<Task> {
  @override
  final typeId = 0;

  @override
  Task read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Task(
      title: fields[0] as String,
      isCompleted: fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Task obj) {
    writer.writeByte(2);
    writer.writeByte(0);
    writer.write(obj.title);
    writer.writeByte(1);
    writer.write(obj.isCompleted);
  }
}
