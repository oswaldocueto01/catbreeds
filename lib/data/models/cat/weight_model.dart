import 'package:cat_api/domain/entities/cat/weight_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weight_model.g.dart';

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

  factory WeightModel.fromJson(Map<String, dynamic> json) =>
      _$WeightModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeightModelToJson(this);
}
