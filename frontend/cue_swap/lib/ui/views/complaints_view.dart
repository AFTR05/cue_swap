import 'package:cue_swap/datatables/made_reports_datasource.dart';
import 'package:cue_swap/provider/auth_provider.dart';
import 'package:cue_swap/provider/user_provider.dart';
import 'package:cue_swap/ui/button/custom_icon_button.dart';
import 'package:cue_swap/ui/labels/custom_labels.dart';
import 'package:cue_swap/ui/modal/complaint_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ComplaintsView extends StatefulWidget {
  const ComplaintsView({super.key});

  @override
  State<ComplaintsView> createState() => _ComplaintsViewState();
}

class _ComplaintsViewState extends State<ComplaintsView> {

  @override
  void initState() {
    super.initState();
    Provider.of<UserProvider>(context, listen: false).getUsers();
  }
  
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final user = Provider.of<AuthProvider>(context).user!;
    final userReports = user.madeReports;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: Column(
        children: [
          Text('Denuncias',style: CustomLabels.h1),
          const SizedBox(height: 10),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: PaginatedDataTable(
                  headingRowColor: const MaterialStatePropertyAll(
                    Color.fromRGBO(106, 133, 160, 1)
                  ),
                  columns: [
                    DataColumn(label: Text('Denunciador', style: CustomLabels.tableHeader)),
                    DataColumn(label: Text('Denunciado',style: CustomLabels.tableHeader)),
                    DataColumn(label: Text('Descripción',style: CustomLabels.tableHeader)),
                  ],
                  source: MadeReportsDTS(userReports!, context),
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
                        builder: (_) => ComplainModal(users: userProvider.users),
                      );
                    }, 
                    text: 'Crear', 
                    icon: Icons.add_outlined
                  )
                ]
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}