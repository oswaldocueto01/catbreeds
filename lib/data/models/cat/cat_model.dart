

import 'package:cat_api/data/models/cat/weight_model.dart';
import 'package:cat_api/domain/entities/cat/cat_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cat_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CatModel {
  WeightModel weight;
  String id;
  String name;
  String? cfaUrl;
  String? vetstreetUrl;
  String? vcahospitalsUrl;
  String temperament;
  String origin;
  String countryCodes;
  String countryCode;
  String description;
  String lifeSpan;
  int indoor;
  int? lap;
  String? altNames;
  int adaptability;
  int affectionLevel;
  int childFriendly;
  int dogFriendly;
  int energyLevel;
  int grooming;
  int healthIssues;
  int intelligence;
  int sheddingLevel;
  int socialNeeds;
  int strangerFriendly;
  int vocalisation;
  int experimental;
  int hairless;
  int natural;
  int rare;
  int rex;
  int suppressedTail;
  int shortLegs;
  String? wikipediaUrl;
  int hypoallergenic;
  String? referenceImageId;
  int? catFriendly;
  int? bidability;

  CatModel({
    required this.weight,
    required this.id,
    required this.name,
    this.cfaUrl,
    this.vetstreetUrl,
    this.vcahospitalsUrl,
    required this.temperament,
    required this.origin,
    required this.countryCodes,
    required this.countryCode,
    required this.description,
    required this.lifeSpan,
    required this.indoor,
    this.lap,
    this.altNames,
    required this.adaptability,
    required this.affectionLevel,
    required this.childFriendly,
    required this.dogFriendly,
    required this.energyLevel,
    required this.grooming,
    required this.healthIssues,
    required this.intelligence,
    required this.sheddingLevel,
    required this.socialNeeds,
    required this.strangerFriendly,
    required this.vocalisation,
    required this.experimental,
    required this.hairless,
    required this.natural,
    required this.rare,
    required this.rex,
    required this.suppressedTail,
    required this.shortLegs,
    this.wikipediaUrl,
    required this.hypoallergenic,
    this.referenceImageId,
    this.catFriendly,
    this.bidability,
  });

  CatEntity toCatEntity() {
    return CatEntity(
        weight: weight.toWeightEntity(),
        id: id,
        name: name,
        temperament: temperament,
        origin: origin,
        countryCodes: countryCodes,
        countryCode: countryCode,
        description: description,
        lifeSpan: lifeSpan,
        indoor: indoor,
        adaptability: adaptability,
        affectionLevel: affectionLevel,
        childFriendly: childFriendly,
        dogFriendly: dogFriendly,
        energyLevel: energyLevel,
        grooming: grooming,
        healthIssues: healthIssues,
        intelligence: intelligence,
        sheddingLevel: sheddingLevel,
        socialNeeds: socialNeeds,
        strangerFriendly: strangerFriendly,
        vocalisation: vocalisation,
        experimental: experimental,
        hairless: hairless,
        natural: natural,
        rare: rare,
        rex: rex,
        referenceImageId: referenceImageId,
        suppressedTail: suppressedTail,
        shortLegs: shortLegs,
        hypoallergenic: hypoallergenic,
        altNames: altNames,
        bidability: bidability,
        catFriendly: catFriendly,
        cfaUrl: cfaUrl,
        lap: lap,
        vcahospitalsUrl: vcahospitalsUrl,
        vetstreetUrl: vetstreetUrl,
        wikipediaUrl: wikipediaUrl);
  }

  factory CatModel.fromJson(Map<String, dynamic> json) =>
      _$CatModelFromJson(json);

  Map<String, dynamic> toJson() => _$CatModelToJson(this);
}
