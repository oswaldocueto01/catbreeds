
import 'package:cat_api/domain/entities/cat/weight_entity.dart';

class CatEntity {
  WeightEntity weight;
  String id;
  String name;
  String origin;
  String description;
  int intelligence;
  String? referenceImageId;

  CatEntity(this.weight, this.id, this.name, this.origin, this.description,
      this.intelligence, this.referenceImageId);
}