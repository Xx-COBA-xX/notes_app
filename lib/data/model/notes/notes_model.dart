
import 'package:hive/hive.dart';

part 'notes_model.g.dart';

@HiveType(typeId: 0)
class NoteModel {
  @HiveField(0)
  String title;

  @HiveField(1)
  String subTitle;

  @HiveField(2)
  String date;

  @HiveField(3)
  int color;

  NoteModel(
      {required this.color,
      required this.date,
      required this.title,
      required this.subTitle});
}
