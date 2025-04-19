import 'package:hive/hive.dart';

part 'device.g.dart';

@HiveType(typeId: 1)
class Device {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? os;

  @HiveField(2)
  String? type;

  @HiveField(3)
  String? name;

  Device({this.id, this.os, this.type, this.name});

  // Factory method to create an empty device
  factory Device.empty() {
    return Device();
  }
}
