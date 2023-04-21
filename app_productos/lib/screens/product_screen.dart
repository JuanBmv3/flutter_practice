import 'package:app_productos/providers/product_form_provider.dart';
import 'package:app_productos/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../services/services.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsService = Provider.of<ProductService>(context);

    return ChangeNotifierProvider(
      create: (_) => ProductFormProvider(productsService.selectedProduct),
      child: _ProductsScreenBody(productService: productsService),
    );
  }
}

class _ProductsScreenBody extends StatelessWidget {
  final ProductService productService;

  const _ProductsScreenBody({required this.productService});

  @override
  Widget build(BuildContext context) {
    final productForm = Provider.of<ProductFormProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ProductImage(url: productService.selectedProduct.picture),
                Positioned(
                    top: 50,
                    left: 15,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 40,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )),
                Positioned(
                    top: 50,
                    right: 25,
                    child: IconButton(
                      icon: const Icon(
                        Icons.camera_alt_outlined,
                        size: 40,
                        color: Colors.white,
                      ),
                      onPressed: () async {
                        final pick = ImagePicker();
                        final XFile? pickedFile = await pick.pickImage(
                            source: ImageSource.gallery, imageQuality: 100);

                        if (pickedFile == null) {
                          return;
                        }

                        productService
                            .updateSelectedProductImage(pickedFile.path);
                      },
                    )),
              ],
            ),
            _ProductForm(),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: productService.isSaving 
          ? null
          : () async {
            if (!productForm.isValidForm()) return;

            final String? imageUrl = await productService.uploadImage();
            

            if (imageUrl != null) productForm.product.picture = imageUrl;
            productService.saveOrCreateProduct(productForm.product);
            FocusScope.of(context).unfocus();
          },
          child:  productService.isSaving  
          ? const CircularProgressIndicator(color: Colors.white)
          : const Icon(Icons.save_outlined)),
    );
  }
}

class _ProductForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productForm = Provider.of<ProductFormProvider>(context);
    final product = productForm.product;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration: _inputProductDecoration(),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: productForm.formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: product.name,
                onChanged: (value) => product.name = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'El nombre es obligatorio';
                  }

                  return null;
                },
                decoration: CustomInput.customInputDecoration(
                  hintText: 'Nombre del producto',
                  labelText: 'Nombre:',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                initialValue: '${product.price}',
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                      RegExp(r'^(\d+)?\.?\d{0,2}'))
                ],
                onChanged: (value) {
                  double.tryParse(value) == null
                      ? product.price = 0
                      : product.price = double.parse(value);
                },
                keyboardType: TextInputType.number,
                decoration: CustomInput.customInputDecoration(
                  hintText: '\$0.0',
                  labelText: 'Precio del producto',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SwitchListTile.adaptive(
                  value: product.available,
                  title: const Text('Disponible'),
                  activeColor: Colors.indigo,
                  onChanged: productForm.updateAvailability),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _inputProductDecoration() => const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black12, blurRadius: 10, offset: Offset(0, 5))
          ]);
}
