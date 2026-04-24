import 'package:hive/hive.dart';

part 'dimensions.g.dart';
@HiveType(typeId: 2)
class Dimensions {
  @HiveField(0)
  double? width;
  @HiveField(1)
  double? height;
  @HiveField(2)
  double? depth;

  Dimensions({this.width, this.height, this.depth});

  factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
    width: (json['width'] as num?)?.toDouble(),
    height: (json['height'] as num?)?.toDouble(),
    depth: (json['depth'] as num?)?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    'width': width,
    'height': height,
    'depth': depth,
  };
}
