import 'package:aesapp/database/database.dart';
import 'package:flutter/material.dart';
class EntryCard extends StatelessWidget {
  const EntryCard(this.vPlanEntry, {super.key});
  final VPlanEntry vPlanEntry;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Text(vPlanEntry.subjectNew),
    );
  }
}
