import 'package:collection/collection.dart';
import "package:m_s_framework_flutter_p5iajh/backend/schema/enums/enums.dart"
    as m_s_framework_flutter_p5iajh_enums
    hide FFEnumExtensions, FFEnumListExtensions;

enum Pages {
  Home,
  List,
  Panel,
  Profile,
}

enum TPRegistro {
  Todos,
  Abastecimentos,
  Diversos,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (Pages):
      return Pages.values.deserialize(value) as T?;
    case (TPRegistro):
      return TPRegistro.values.deserialize(value) as T?;
    case (m_s_framework_flutter_p5iajh_enums.FormatEnum):
      return m_s_framework_flutter_p5iajh_enums.FormatEnum.values
          .deserialize(value) as T?;
    default:
      return null;
  }
}
