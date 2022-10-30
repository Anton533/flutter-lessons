// import 'dart:convert';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'example_widget_model.g.dart';

class ExampleWidgetModel {
  Future<Box<User>>? userBox;
  void setup() {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(UserAdapter());
      userBox = Hive.openBox<User>('userBox');
      userBox?.then((box) {
        box.listenable().addListener(() {
          print(box.values);
        });
      });
    }
  }

  void doSome() async {
    final box = await userBox;
    final user = User('Ivan', 21);
    await box?.add(user);

    // Encrypted box!!!
    // const secureStorage = FlutterSecureStorage();
    // final readEncryptionKey = await secureStorage.read(key: 'key');
    // if (readEncryptionKey == null) {
    //   final key = Hive.generateSecureKey();
    //   await secureStorage.write(key: 'key', value: base64UrlEncode(key));
    // }
    // final key = await secureStorage.read(key: 'key');

    // final encryptionKey = base64Url.decode(key!);

    // final encryptedBox = await Hive.openBox<String>('vaultBox',
    //     encryptionCipher: HiveAesCipher(encryptionKey));
    // encryptedBox.put('secret', 'Hive is cool');
    // print(encryptedBox.get('secret'));
    // Encrypted box!!!
  }
}

@HiveType(typeId: 0)
class User {
  @HiveField(0)
  String name;
  @HiveField(1)
  int age;

  User(
    this.name,
    this.age,
  );

  @override
  String toString() => 'Name: $name, Age: $age';
}

// class UserAdapter extends TypeAdapter<User> {
//   @override
//   final typeId = 0;

//   @override
//   User read(BinaryReader reader) {
//     final name = reader.readString();
//     final age = reader.readInt();
//     return User(name, age);
//   }

//   @override
//   void write(BinaryWriter writer, User obj) {
//     writer.writeString(obj.name);
//     writer.writeInt(obj.age);
//   }
// }
