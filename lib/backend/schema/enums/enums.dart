import "package:m_s_framework_flutter_p5iajh/backend/schema/enums/enums.dart"
    as m_s_framework_flutter_p5iajh_enums;
import 'package:ff_commons/flutter_flow/enums.dart';
export 'package:ff_commons/flutter_flow/enums.dart';

enum Pages {
  Home,
  Produtos,
  Clientes,
  Historico,
}

enum TPRegistro {
  Todos,
  Abastecimentos,
  Diversos,
}

enum TpPagamento {
  CARTAO_CREDITO,
  CARTAO_DEBITO,
  VOUCHER,
  PIX,
  DINHEIRO,
  VAZIO,
  CREDIARIO,
  CHEQUE,
  VALECOMBUSTIVEL,
}

enum GateWay {
  Getnet,
  Cielo,
  Vazio,
  InfinitePay,
}

enum StatusFinalizado {
  Sucesso,
  Falha,
  Aguardo,
}

enum PagNumServer {
  DINHEIRO,
  CARTAO,
  PIX,
  CREDIARIO,
  VOUCHER,
  VALECOMBUSTIVEL,
}

enum TpSelecaoFrentista {
  seNone,
  seComparative,
  seFiltro,
}

enum TEOpcao {
  AAdd,
  ARemove,
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (Pages):
      return Pages.values.deserialize(value) as T?;
    case (TPRegistro):
      return TPRegistro.values.deserialize(value) as T?;
    case (TpPagamento):
      return TpPagamento.values.deserialize(value) as T?;
    case (GateWay):
      return GateWay.values.deserialize(value) as T?;
    case (StatusFinalizado):
      return StatusFinalizado.values.deserialize(value) as T?;
    case (PagNumServer):
      return PagNumServer.values.deserialize(value) as T?;
    case (TpSelecaoFrentista):
      return TpSelecaoFrentista.values.deserialize(value) as T?;
    case (TEOpcao):
      return TEOpcao.values.deserialize(value) as T?;
    case (m_s_framework_flutter_p5iajh_enums.FormatEnum):
      return m_s_framework_flutter_p5iajh_enums.FormatEnum.values
          .deserialize(value) as T?;
    case (m_s_framework_flutter_p5iajh_enums.Aplicacao):
      return m_s_framework_flutter_p5iajh_enums.Aplicacao.values
          .deserialize(value) as T?;
    case (m_s_framework_flutter_p5iajh_enums.ExtraDigito):
      return m_s_framework_flutter_p5iajh_enums.ExtraDigito.values
          .deserialize(value) as T?;
    default:
      return null;
  }
}
