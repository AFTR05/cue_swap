import 'package:cue_swap/models/user.dart';
import 'package:cue_swap/provider/auth_provider.dart';
import 'package:cue_swap/provider/create_product_form_provider.dart';
import 'package:cue_swap/provider/product_provider.dart';
import 'package:cue_swap/services/notifications_service.dart';
import 'package:cue_swap/services/validator.dart';
import 'package:cue_swap/ui/button/custom_outlined_button.dart';
import 'package:cue_swap/ui/inputs/custom_dropdown_input_menu.dart';
import 'package:cue_swap/ui/inputs/custom_input.dart';
import 'package:cue_swap/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ProductModal extends StatelessWidget {
  const ProductModal({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return ChangeNotifierProvider(
      create: (_) => CreateProductFormProvider(),
      child: Builder(
        builder: (context) {
          final createProductFormProvider = Provider.of<CreateProductFormProvider>(context);
          final authProvider = Provider.of<AuthProvider>(context);
          return Container(
            height: MediaQuery.of(context).size.height * 0.8, // Ajusta la altura según sea necesario
            decoration: buildBoxDecoration(),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 20),
                      child: Text('Nuevo producto', style: CustomLabels.h1),
                    ),
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close, color: Colors.black),
                    ),
                  ],
                ),
                Divider(color: Colors.white.withOpacity(0.3)),
                const SizedBox(height: 10),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 400),
                        child: Container(
                          margin: const EdgeInsets.only(top: 5.0),
                          child: Form(
                            autovalidateMode: AutovalidateMode.always,
                            key: createProductFormProvider.formkey,
                            child: Column(
                              children: [
                                TextFormField(
                                  initialValue: '',
                                  onChanged: (value) {
                                    createProductFormProvider.name = value;
                                    createProductFormProvider.updateButtonState();
                                  },
                                  validator: (value){
                                    return Validator.emptyValidator(value)
                                        ? null
                                        : 'Nombre de usuario no valido';
                                  },
                                  decoration: CustomInput.loginInputDecoration(
                                    hint: 'Nombre del producto',
                                    label: 'Nombre del producto',
                                    icon: Icons.info_outline,
                                  ),
                                  style: CustomLabels.formStyle,
                                ),
                                const SizedBox(height: 20),
                                TextFormField(
                                  initialValue: '',
                                  onChanged: (value) {
                                    createProductFormProvider.description = value;
                                    createProductFormProvider.updateButtonState();
                                  },
                                  validator: (value){
                                    return Validator.emptyValidator(value)
                                        ? null
                                        : 'Descripcion de producto no valido';
                                  },
                                  decoration: CustomInput.loginInputDecoration(
                                    hint: 'Descripción del producto',
                                    label: 'Descripcion del producto',
                                    icon: Icons.info_outline,
                                  ),
                                  style: CustomLabels.formStyle,
                                ),
                                const SizedBox(height: 20),
                                TextFormField(
                                  initialValue: '',
                                  onChanged: (value) {
                                    createProductFormProvider.price = double.parse(value);
                                    createProductFormProvider.updateButtonState();
                                  },
                                  validator: (value){
                                    return Validator.emptyValidator(value)
                                        ? null
                                        : 'Precio no valido';
                                  },
                                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                                  ],
                                  decoration: CustomInput.loginInputDecoration(
                                    hint: 'Precio del producto',
                                    label: 'Precio',
                                    icon: Icons.info_outline,
                                  ),
                                  style: CustomLabels.formStyle,
                                ),
                                const SizedBox(height: 20),
                                CustomDropdownInputMenu(
                                  onSelectedOptionChanged: (selectedOption) {
                                    createProductFormProvider.category = selectedOption;
                                    createProductFormProvider.updateButtonState();
                                  },
                                  options: const [
                                    "PRODUCTOS_USADOS",
                                    "UNIFORMES",
                                    "LIBROS",
                                  ],
                                  label: 'Categoria',
                                ),
                                const SizedBox(height: 20),
                                CustomOutlinedButton(
                                  onPressed: () => onFormSubmit(
                                    createProductFormProvider,
                                    productProvider,
                                    authProvider,
                                    context,
                                  ),
                                  text: 'Crear',
                                ),
                                const SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void onFormSubmit(
    CreateProductFormProvider createProductFormProvider,
    ProductProvider productProvider,
    AuthProvider authProvider,
    BuildContext context,
  ) {
    final isValid = createProductFormProvider.validateForm();
    if (isValid) {
      NotificationsService.showBusyIndicator(context);
      productProvider.createProduct(
        createProductFormProvider.name,
        createProductFormProvider.description,
        createProductFormProvider.price,
        createProductFormProvider.category,
        authProvider,
      );
      Navigator.of(context).pop();
    }
  }

  BoxDecoration buildBoxDecoration() => const BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black26),
        ],
      );

  List<User> filterOutByNid(List<User> users, String nid) {
    return users.where((user) => user.nid != nid).toList();
  }
}
