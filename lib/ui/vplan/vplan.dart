import 'package:aesapp/database/database.dart';
import 'package:aesapp/objects/vplan.dart';
import 'package:aesapp/ui/vplan/entry_card.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
class VPlan extends StatefulWidget {
  const VPlan({super.key});

  @override
  State<VPlan> createState() => _VPlanState();
}

class _VPlanState extends State<VPlan> {
  final _stream = Supabase.instance.client.from("vplan_entries").stream(primaryKey: ["date",
    "is_info",
    "course",
    "subject_new",
    "lesson_start",
    "lesson_end",
    "subject_old"
  ]);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(stream: _stream, builder: (context,snapshot){
      if(snapshot.hasData){
        List<VPlanEntry> entries = snapshot.data!.map((e) => VPlanEntries.fromSupabase(e)).toList();
        return ListView.builder(
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index){
            return EntryCard(entries[index]);
        });
      }
      return Text("Loading...");
    });
  }
}
