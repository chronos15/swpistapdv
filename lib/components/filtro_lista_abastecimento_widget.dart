import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'filtro_lista_abastecimento_model.dart';
export 'filtro_lista_abastecimento_model.dart';

class FiltroListaAbastecimentoWidget extends StatefulWidget {
  const FiltroListaAbastecimentoWidget({super.key});

  @override
  State<FiltroListaAbastecimentoWidget> createState() =>
      _FiltroListaAbastecimentoWidgetState();
}

class _FiltroListaAbastecimentoWidgetState
    extends State<FiltroListaAbastecimentoWidget> {
  late FiltroListaAbastecimentoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FiltroListaAbastecimentoModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
