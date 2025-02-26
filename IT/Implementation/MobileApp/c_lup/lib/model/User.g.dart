// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 0;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      token: fields[0] as String,
      role: fields[2] as String,
      reservations: (fields[1] as List)?.cast<Reservation>(),
      stores: (fields[3] as List)?.cast<Store>(),
      storeId: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.token)
      ..writeByte(1)
      ..write(obj.reservations)
      ..writeByte(2)
      ..write(obj.role)
      ..writeByte(3)
      ..write(obj.stores)
      ..writeByte(4)
      ..write(obj.storeId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
