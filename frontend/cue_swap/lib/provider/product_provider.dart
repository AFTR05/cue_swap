import 'package:cue_swap/api/swap_cue_api.dart';
import 'package:cue_swap/models/http/product_response.dart';
import 'package:cue_swap/models/product.dart';
import 'package:cue_swap/provider/auth_provider.dart';
import 'package:cue_swap/router/router.dart';
import 'package:cue_swap/services/navigation_service.dart';
import 'package:cue_swap/services/notifications_service.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> products = [];

  getProducts() async {
    final resp = await SwapCUEApi.get('api/product/get-all');
    final productResp = ProductsResponse.fromMap(resp);
    products = [...productResp.products];
    notifyListeners();
  }

  createProduct(String name, String description, double price, String category, AuthProvider authProvider){
    final data={
      "name": name,
      "image": "imagen_ejemplo.jpg",
      "price": price,
      "description": description,
      "category": category,
      "user_id": authProvider.user!.id
    };
    SwapCUEApi.post("api/product/create",data).then(
      (json){
        Product.fromMap(json['product']);
        authProvider.isAuthenticated(Flurorouter.myProductsRoute);
        NotificationsService.showSnackbar("Registro exitoso de producto");
        notifyListeners();
      }
    ).catchError((e){
      print('Error en: $e');
      NavigationService.replaceTo(Flurorouter.myProductsRoute);
      NotificationsService.showSnackbarError('Datos no validos');
    });
  }
  
}