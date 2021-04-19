import '../Components/micro/field_component.dart';
import '../Models/user_models.dart';
import 'package:flutter/material.dart';

class RiderInfo extends StatelessWidget {
  final PremiumInfo premiumInfo = PremiumInfo('VR RAVICHANDRAN', '# 1231314671',
      'XYZ 7614', '15 Jan 2015', '31 Jan 2021', '15 Jan 2035', '15 Jan 2045');
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.grey[200]),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FieldComponent(
                field: 'NAME',
                value: premiumInfo.name.toUpperCase(),
              ),
              FieldComponent(
                field: 'PAYING AGENT NO',
                value: premiumInfo.agentNo,
              ),
              FieldComponent(
                field: 'PREMIUM DUE DATE',
                value: premiumInfo.dueDate,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FieldComponent(
                field: 'POLICY NO',
                value: premiumInfo.policyNo,
              ),
              FieldComponent(
                field: 'START DATE',
                value: premiumInfo.startDate,
              ),
              FieldComponent(
                field: 'RISK END DATE',
                value: premiumInfo.riskEndDate,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
