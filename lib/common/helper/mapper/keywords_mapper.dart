import 'package:movie_zone/core/entities/keywords.dart';
import 'package:movie_zone/core/models/keywords.dart';

class KeywordsMapper {
  static KeywordsEntity toEntity(KeywordsModel keywordsModel) {
    return KeywordsEntity(name: keywordsModel.name, id: keywordsModel.id);
  }
}
