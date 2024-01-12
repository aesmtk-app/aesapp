import 'package:aesapp/helpers/data_provider.dart';
import 'package:aesapp/objects/vplan.dart';
import 'package:aesapp/helpers/app.dart';
import 'package:aesapp/ui/aesapp/appbar.dart';
import 'package:aesapp/ui/vplan/vplan_card.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:aesapp/helpers/hive.dart';

class VPlanPage extends StatefulWidget {
  const VPlanPage({this.calledAsWidget=false, super.key});
  final bool calledAsWidget;

  @override
  State<VPlanPage> createState() => _VPlanPageState();
}

class _VPlanPageState extends State<VPlanPage> {
  Stream<List<VPlanEntry>> vPlanBox = Get.find<DataProvider>().allVPlanEntries();
  Box box = Hive.box(HiveKeys.boxName);

  Widget _typeDropDown(){
    bool? isHS = box.get(HiveKeys.pupil.isHighSchool);
    return DropdownButton<bool>(
        items: const [
          DropdownMenuItem(child: Text("Mittelstufe"), value: false,),
          DropdownMenuItem(child: Text("Oberstufe"), value: true,)
        ],
        value: isHS,
        onChanged: (val){
          print("set");
          setState(() {
            if (!(isHS==val)){
              box.put(HiveKeys.pupil.isHighSchool, val);
              box.put(HiveKeys.pupil.classes, null);
              box.put(HiveKeys.pupil.course, null);
              _checkFilter();
            }
          });
        }
    );
  }

  Widget _classDropDown(){
    bool? isHS = box.get(HiveKeys.pupil.isHighSchool);
    String? cl = box.get(HiveKeys.pupil.classes);

    List<String> classes = [];
    if (isHS==null){}
    else if (isHS){
      classes = ["*", "EP", "Q12", "Q34"];
    }
    else {
      classes = ["*", "05", "06", "07", "08", "09", "10"];
    }

    return DropdownButton(
        items: classes.map((e) => DropdownMenuItem(child: Text(e), value: e,)).toList(),
        value: cl,
        onChanged: (val){
          setState(() {
            if (!(cl==val)){
              box.put(HiveKeys.pupil.classes, val);
              box.put(HiveKeys.pupil.course, null);
              _checkFilter();
            }
          });
        }
    );
  }

  Widget _courseDropDown(){
    List<String> courses = [];

    bool? isHS = box.get(HiveKeys.pupil.isHighSchool);
    String? co = box.get(HiveKeys.pupil.course);

    if(isHS==null){
      return Container();
    }
    else if(!isHS){
      courses = ["*", "A", "B", "C", "D", "E", "F"];
    }
    else{
      return Container();
    }
    return DropdownButton(
        items: courses.map((e) => DropdownMenuItem(value: e,child: Text(e),)).toList(),
        value: co,
        onChanged: (val){
          setState(() {
            if (!(val==co)){
              box.put(HiveKeys.pupil.course, val);
              _checkFilter();
            }
          });
        }
    );
  }

  Widget _courseSelection(){
    return Row(
      children: [
        _typeDropDown(),
        if(box.get(HiveKeys.pupil.isHighSchool)!=null) _classDropDown(),
        if(!_condAll(box.get(HiveKeys.pupil.classes))) _courseDropDown()
      ],
    );
  }

  void _checkFilter(){
    bool? isHS = box.get(HiveKeys.pupil.isHighSchool);
    String? co = box.get(HiveKeys.pupil.course);
    String? cl = box.get(HiveKeys.pupil.classes);
    String f = "";
    if(isHS!=null){
      if(!_condAll(co)&&!_condAll(cl)){
        if(isHS){
          f = "$cl@K$co";
        }else{
          f = cl!+co!;
        }
      }
      else if(!_condAll(cl)){
        if(isHS){
         f = cl!;
        }
      }
      if (f!=""&&box.get(HiveKeys.pupil.vPlanFilter)){
        
      }
    }
  }

  bool _condAll(String? v){
    return v==null||v=="*";
  }

  List<VPlanEntry> _filter(List<VPlanEntry> list){
    bool? isHS = box.get(HiveKeys.pupil.isHighSchool);
    String? co = box.get(HiveKeys.pupil.course);
    String? cl = box.get(HiveKeys.pupil.classes);

    if(isHS!=null) {
      if(isHS){
        if(_condAll(cl)){
          return list.where((element) => element.course?.substring(0,1).isAlphabetOnly??false||element.isInfo).toList();
        }
        else{
          return list.where((element) => element.course?.toLowerCase()==cl!.toLowerCase()||element.isInfo).toList();
        }
      } else{
        if(_condAll(cl)&&_condAll(co)){
          return list.where((element) => element.course?.substring(0,1).isNumericOnly??false||element.isInfo).toList();
        } else if(cl!=null&&_condAll(co)){
          return list.where((element) => element.course?.toLowerCase().startsWith(cl.toLowerCase())??false||element.isInfo).toList();
        }
        else if(!_condAll(cl)&&!_condAll(co)){
          return list.where((element) => element.course?.toLowerCase()==(cl!+co!).toLowerCase()||element.isInfo).toList();
        }
      }
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (!widget.calledAsWidget)?CustomAppBar.get(title: "Vertretung"):null,
      body: RefreshIndicator(
        onRefresh: ()=>Future(() => Future.delayed(Duration(seconds: 5))),
        child: StreamBuilder(
          stream: vPlanBox,
          builder: (BuildContext context, AsyncSnapshot<List<VPlanEntry>> mbox){
            if (mbox.hasData){
              List<VPlanEntry> entries = mbox.data!;
              entries = _filter(entries);
              Map<DateTime, List<VPlanEntry>> entriesByDate = groupBy(entries, (p0) => p0.date);
              entriesByDate = Map.fromEntries(entriesByDate.entries.toList()..sort((a, b) => a.key.compareTo(b.key)));
              for (var element in entriesByDate.values) {element.sort((a,b){
                int aLS = a.lessonStart ?? 0;
                int bLS = b.lessonStart ?? 0;
                int aLE = a.lessonEnd ?? aLS;
                int bLE = b.lessonEnd ?? bLS;
                int lSc = aLS.compareTo(bLS);
                if (lSc!=0) return lSc;
                return aLE.compareTo(bLE);
              });}
              if(context.isPortrait){
                List<Widget> w = [];
                for (List<Widget> wl in entriesByDate.values.map((e) => [Text(AESAppUtils.dateFormat.format(e.first.date)),...e.map((f) => VPlanCard(v: f))])) {
                  w.addAll(wl);
                }
                return SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _courseSelection(),
                      ...w
                    ],
                  ),
                );
              }
              else{
                return Column(
                  children: [
                    _courseSelection(),
                    Expanded(child: Row(
                      children: entriesByDate.values.map((e) => Expanded(child: ListView(children: [Text(AESAppUtils.dateFormat.format(e.first.date)), ...e.map((f) => VPlanCard(v: f))],))).toList(),
                    ))
                  ],
                );
              }
            }
            print("recv future");
            return const Center(child: CircularProgressIndicator(),);
          },
        ),
      )
      );
  }
}
