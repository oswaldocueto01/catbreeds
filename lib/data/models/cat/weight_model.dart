import 'package:cat_api/domain/entities/cat/weight_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weight_model.g.dart';


//JsonSerializable generator generates the file where it does
// Serialization and deserialization
@JsonSerializable(fieldRename: FieldRename.snake)
class WeightModel {
  String imperial;
  String metric;

  WeightModel({
    required this.imperial,
    required this.metric,
  });
  WeightEntity toWeightEntity() {
    return WeightEntity(imperial: imperial, metric: metric);
  }

  //FromJson transform the json into a new object instance
  //with the expected data
  factory WeightModel.fromJson(Map<String, dynamic> json) =>
      _$WeightModelFromJson(json);

  //ToJson transform this object into a json for the way you
  // will receive the information in json
  Map<String, dynamic> toJson() => _$WeightModelToJson(this);
}
