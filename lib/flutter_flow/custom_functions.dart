import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';

String newCustomFunction(
  String weight,
  String concentration,
  String drug,
) {
  final drugsList = <String>[
    'Bupivacaine',
    'Lidocaine',
    'Mepivacaine',
    'Ropivacaine'
  ]; // Creates growable list.

  // Bupivacaine  = 2

  // Lidocaine = 4.5

  // Mepivacaine = 4.4

  // Ropivacaine = 3

  // Convert weight to number
  double parsed_weight = double.parse(weight);

  double mg_kg_Bupivacaine = 2;
  double mg_kg_Lidocaine = 4.5;
  double mg_kg_Mepivacaine = 4.4;
  double mg_kg_Ropivacaine = 3;
  double max_mg_kg = 0;
  double dosage_value = 0;
  double num_tubetes = 0;
  double tubete_volume = 1.8;
  double parsed_concentration = double.parse(concentration.replaceAll('%', ''));

  if (drug == drugsList[0]) {
    max_mg_kg = mg_kg_Bupivacaine;
  } else if (drug == drugsList[1]) {
    max_mg_kg = mg_kg_Lidocaine;
  } else if (drug == drugsList[2]) {
    max_mg_kg = mg_kg_Mepivacaine;
  } else if (drug == drugsList[3]) {
    max_mg_kg = mg_kg_Ropivacaine;
  }

  // Max allowable subQ dose based on weight, mL = max allowable subQ dose for a drug, mg/kg x (weight, kg / 10) x (1 / concentration, %)
  dosage_value = max_mg_kg * (parsed_weight / 10) * (1 / parsed_concentration);
  num_tubetes = dosage_value / tubete_volume;

  String parsed_dosage_string = dosage_value.toStringAsFixed(2);
  String parsed_num_tubetes = num_tubetes.floor().toStringAsFixed(1);

  String? dosage = 'The dosage is ' + parsed_dosage_string + 'mL';
  String? tubes = 'This is equivalent to ' + parsed_num_tubetes + ' tubetes.';

  String? result_string = dosage + '\n' + tubes;

  return result_string;
}
