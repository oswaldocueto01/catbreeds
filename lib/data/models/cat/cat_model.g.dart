// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatModel _$CatModelFromJson(Map<String, dynamic> json) => CatModel(
      WeightModel.fromJson(json['weight'] as Map<String, dynamic>),
      json['id'] as String,
      json['name'] as String,
      json['origin'] as String,
      json['description'] as String,
      json['intelligence'] as int,
      json['reference_image_id'] as String?,
    );

Map<String, dynamic> _$CatModelToJson(CatModel instance) => <String, dynamic>{
      'weight': instance.weight,
      'id': instance.id,
      'name': instance.name,
      'origin': instance.origin,
      'description': instance.description,
      'intelligence': instance.intelligence,
      'reference_image_id': instance.referenceImageId,
    };
