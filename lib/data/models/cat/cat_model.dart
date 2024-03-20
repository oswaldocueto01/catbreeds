import 'package:cat_api/data/models/cat/weight_model.dart';
import 'package:cat_api/domain/entities/cat/cat_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cat_model.g.dart';

//JsonSerializable generator generates the file where it does
// Serialization and deserialization
@JsonSerializable(fieldRename: FieldRename.snake)
class CatModel {
  WeightModel weight;
  String id;
  String name;
  String origin;
  String description;
  int intelligence;
  String? referenceImageId;

  CatModel(this.weight, this.id, this.name, this.origin, this.description,
      this.intelligence, this.referenceImageId);

  CatEntity toCatEntity() {
    return CatEntity(weight.toWeightEntity(), id, name, origin, description,
        intelligence, referenceImageId);
  }

  //FromJson transform the json into a new object instance
  //with the expected data
  factory CatModel.fromJson(Map<String, dynamic> json) =>
      _$CatModelFromJson(json);

  //ToJson transform this object into a json for the way you
  // will receive the information in json
  Map<String, dynamic> toJson() => _$CatModelToJson(this);
}
