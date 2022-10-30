// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'human.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Human _$HumanFromJson(Map<String, dynamic> json) => Human(
      name: json['my_name'] as String,
      surname: json['surname'] as String,
      age: json['age'] as int,
      address: (json['address'] as List<dynamic>)
          .map((e) => Address.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HumanToJson(Human instance) => <String, dynamic>{
      'my_name': instance.name,
      'surname': instance.surname,
      'age': instance.age,
      'address': instance.address,
    };
