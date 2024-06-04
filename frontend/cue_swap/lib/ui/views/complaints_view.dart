import 'package:cue_swap/datatables/made_reports_datasource.dart';
import 'package:cue_swap/provider/auth_provider.dart';
import 'package:cue_swap/provider/user_provider.dart';
import 'package:cue_swap/router/router.dart';
import 'package:cue_swap/ui/button/custom_icon_button.dart';
import 'package:cue_swap/ui/cards/ad_card.dart';
import 'package:cue_swap/ui/labels/custom_labels.dart';
import 'package:cue_swap/ui/modal/complaint_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
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
          Row(
            children: [
              Text('Denuncias', style: CustomLabels.h1),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: AdCard(
                  width: 550,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: '¿Quieres saber acerca de economía circular? ',
                              style: CustomLabels.tableHeader,
                            ),
                            TextSpan(
                              text: ' Accede aquí',
                              style: CustomLabels.textSpanLink.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(context, Flurorouter.institutionalBlogRoute);
                                },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(2),
                        child: Icon(
                          Icons.eco_outlined,
                          color: Colors.white.withOpacity(0.7),
                          size: 50,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
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