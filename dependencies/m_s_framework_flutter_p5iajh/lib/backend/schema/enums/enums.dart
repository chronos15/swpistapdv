import 'package:collection/collection.dart';
import 'package:ff_commons/flutter_flow/enums.dart';
export 'package:ff_commons/flutter_flow/enums.dart';

enum FormatEnum {
  Real,
  Porcentagem,
  Inteiro,
  Quantidade,
  DoubleDefault,
  RealToDouble,
}

enum Aplicacao {
  SOFTWORKEasy,
  SOFTWORKMobile,
  SOFTWORKCheckt,
  SOFTWORKLicense,
}

enum ExtraDigito {
  SenhaDia,
  ContraSenha,
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (FormatEnum):
      return FormatEnum.values.deserialize(value) as T?;
    case (Aplicacao):
      return Aplicacao.values.deserialize(value) as T?;
    case (ExtraDigito):
      return ExtraDigito.values.deserialize(value) as T?;
    default:
      return null;
  }
}
