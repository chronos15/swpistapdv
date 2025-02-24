// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:elegant_notification/resources/stacked_options.dart';

Future elegantNotificationCustom(
  BuildContext context,
  String title,
  String description,
  Color colorText,
  Color colorBackground,
  double vWidth,
  String positionAlingment,
  String animationType,
  Color colorIndicator,
  String? imageIcon,
) async {
  // Add your function code here!
  Alignment getAlignmentFromString(String alignment) {
    switch (alignment.toLowerCase()) {
      case 'topcenter':
        return Alignment.topCenter;
      case 'topright':
        return Alignment.topRight;
      case 'topleft':
        return Alignment.topLeft;
      case 'center':
        return Alignment.center;
      case 'bottomcenter':
        return Alignment.bottomCenter;
      case 'bottomright':
        return Alignment.bottomRight;
      case 'bottomleft':
        return Alignment.bottomLeft;
      default:
        return Alignment.bottomCenter; // Alinhamento padrão
    }
  }

  // Função para mapear a string de animação para o valor correspondente
  AnimationType getAnimationFromString(String animation) {
    switch (animation.toLowerCase()) {
      case 'fromtop':
        return AnimationType.fromTop;
      case 'fromleft':
        return AnimationType.fromLeft;
      case 'fromright':
        return AnimationType.fromRight;
      default:
        return AnimationType.fromBottom; // Animação padrão
    }
  }

  // Função para verificar se a combinação de alinhamento e animação é válida
  bool isValidAnimationForAlignment(
      AnimationType animation, Alignment alignment) {
    // Proibindo certas combinações de animação e alinhamento
    if (animation == AnimationType.fromLeft ||
        animation == AnimationType.fromBottom) {
      // Restringindo para evitar conflitos
      if (alignment == Alignment.topCenter ||
          alignment == Alignment.topLeft ||
          alignment == Alignment.topRight) {
        return false;
      }
    }
    return true;
  }

  // Pegando o alinhamento e a animação
  AnimationType animation = getAnimationFromString(animationType);
  Alignment alignment = getAlignmentFromString(positionAlingment);

  // Verificando se a animação é válida para o alinhamento
  if (!isValidAnimationForAlignment(animation, alignment)) {
    // Se a combinação não for válida, defina a animação padrão
    //animation = AnimationType.scale; // Alterando para uma animação segura
  }

  ElegantNotification(
    width: vWidth,
    background: colorBackground,
    isDismissable: true,
    position: alignment,
    animation: animation,
    title: Text(title,
        style: TextStyle(
          color: colorText,
        )),
    description: Text(description,
        style: TextStyle(
          color: colorText,
        )),
    icon: imageIcon != null
        ? Image.network(
            // Carrega imagem diretamente da URL
            imageIcon,
            width: 32,
            height: 32,
            errorBuilder: (context, error, stackTrace) => Icon(
              Icons.broken_image,
              color: colorIndicator,
            ),
          )
        : Icon(Icons.notifications, color: colorIndicator),
    onDismiss: () {},
    onNotificationPressed: () {},
    progressIndicatorColor: colorIndicator,
    shadow: BoxShadow(
      color: Colors.black.withOpacity(0.2),
      spreadRadius: 2,
      blurRadius: 5,
      offset: const Offset(0, 4),
    ),
  ).show(context);
}
