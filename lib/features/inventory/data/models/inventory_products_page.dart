import 'package:pharmacy_app/features/inventory/data/models/product_card_model.dart';

class InventoryProductsPage {
  InventoryProductsPage({
    required this.products,
    required this.currentPage,
    required this.lastPage,
    required this.total,
  });

  final List<ProductCardModel> products;
  final int currentPage;
  final int lastPage;
  final int total;

  bool get hasMore => currentPage < lastPage;
}
