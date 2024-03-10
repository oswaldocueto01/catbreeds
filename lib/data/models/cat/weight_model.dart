import 'package:cat_api/domain/entities/cat/weight_entity.dart';

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

  factory WeightModel.fromJson(Map<String, dynamic> json) => WeightModel(
        imperial: json["imperial"],
        metric: json["metric"],
      );

  Map<String, dynamic> toJson() => {
        "imperial": imperial,
        "metric": metric,
      };
}
