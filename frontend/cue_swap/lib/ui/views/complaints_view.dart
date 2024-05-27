import 'package:cue_swap/datatables/made_reports_datasource.dart';
import 'package:cue_swap/provider/auth_provider.dart';
import 'package:cue_swap/ui/button/custom_icon_button.dart';
import 'package:cue_swap/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ComplaintsView extends StatefulWidget {
  const ComplaintsView({super.key});

  @override
  State<ComplaintsView> createState() => _ComplaintsViewState();
}

class _ComplaintsViewState extends State<ComplaintsView> {
  
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthProvider>(context).user!;
    final userReports = user.madeReports;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text('Denuncias',style: CustomLabels.h1),
          const SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Expanded(
              child: PaginatedDataTable(
                headingRowColor: const MaterialStatePropertyAll(
                  Color.fromRGBO(106, 133, 160, 1)
                ),
                columns: [
                  DataColumn(label: Text('Denunciador', style: CustomLabels.tableHeader)),
                  DataColumn(label: Text('Denunciado',style: CustomLabels.tableHeader)),
                  DataColumn(label: Text('Descripción',style: CustomLabels.tableHeader)),
                ],
                source: MadeReportsDTS(userReports, context),
                rowsPerPage: _rowsPerPage,
                onRowsPerPageChanged: (value){
                  setState(() {
                    _rowsPerPage=value ?? 10; 
                  });
                },
                header: Text('Esta es la lista de los reportes que ha hecho el usuario', maxLines: 2, style: CustomLabels.navbarMessage),
                actions: [
                CustomIconButton(
                  onPressed: (){
                    showModalBottomSheet(
                      context: context, 
                      builder: (_) => Container(color: Colors.amberAccent,),
                    );
                  }, 
                  text: 'Crear', 
                  icon: Icons.add_outlined
                )
              ]
              ),
            ),
          )
        ],
      )
    );
  }
}