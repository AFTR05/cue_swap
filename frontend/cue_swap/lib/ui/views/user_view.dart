import 'package:cue_swap/datatables/user_reports_datasource.dart';
import 'package:cue_swap/models/auth_user.dart';
import 'package:cue_swap/provider/auth_provider.dart';
import 'package:cue_swap/ui/cards/white_card.dart';
import 'package:cue_swap/ui/inputs/simulated_input.dart';
import 'package:cue_swap/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class UserView extends StatefulWidget {
  const UserView({super.key});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthProvider>(context).user!;
    final userReports = user.userReports;

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Table(
            columnWidths: const {
              0: FlexColumnWidth(),
              1: FlexColumnWidth()
            },
            children: [
              TableRow(
                children: [
                  // AVATAR
                  FittedBox(fit: BoxFit.fitWidth, child: _AvatarContainer()),
                  // Formulario de actualización
                  _UserData(user: user),
                ]
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: PaginatedDataTable(
              headingRowColor: const MaterialStatePropertyAll(
                Color.fromRGBO(106, 133, 160, 1)
              ),
              columns: [
                DataColumn(label: Text('Denunciado', style: CustomLabels.tableHeader)),
                DataColumn(label: Text('Denunciador',style: CustomLabels.tableHeader)),
                DataColumn(label: Text('Descripción',style: CustomLabels.tableHeader)),
              ],
              source: UserReportsDTS(userReports!, context),
              rowsPerPage: _rowsPerPage,
              onRowsPerPageChanged: (value){
                setState(() {
                  _rowsPerPage=value ?? 10; 
                });
              },
              header: Text('Esta es la lista de todas los reportes del usuario', maxLines: 2, style: CustomLabels.navbarMessage),
            ),
          ),
        ],
      ),
    );
  }
}

class _AvatarContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WhiteCard(
      width: 250,
      child: Center(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Profile', style: CustomLabels.h2),
              const SizedBox(height: 20),
              Container(
                width: 150,
                height: 160,
                child: const Stack(
                  children: [
                    Center(
                      child: ClipOval(
                        child: Image(image: AssetImage('profile-icon-design-free-vector.jpg')),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _UserData extends StatelessWidget {
  const _UserData({
    super.key,
    required this.user,
  });

  final AuthUser user;

  @override
  Widget build(BuildContext context) {
    return WhiteCard(
      title: 'Información general',
      child: Column(
        children: [
          SimulatedInput(
            value: user.nid,
            label: 'NID', 
            icon: Icons.info_outline
          ),
          const SizedBox(height: 20),
          SimulatedInput(
            value: user.name,
            label: 'Nombre', 
            icon: Icons.account_circle_outlined
          ),
          const SizedBox(height: 20),
          SimulatedInput(
            value: user.username,
            label: 'Nombre de usuario', 
            icon: Icons.person_outline
          ),
          const SizedBox(height: 20),
          SimulatedInput(
            value: user.email,
            label: 'Correo electrónico', 
            icon: Icons.email_outlined
          ),
          const SizedBox(height: 20),
          SimulatedInput(
            value: user.availablePoints.toString(), 
            label: 'Puntos disponibles', 
            icon: Icons.star_outline,
          ),
          const SizedBox(height: 20),
          SimulatedInput(
            icon: Icons.group_outlined,
            label: 'Rol',
            value: user.role,
          ),
        ],
      ),
    );
  }
}
