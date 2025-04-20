import 'package:flutter/material.dart';
import 'package:ecommerce/models/product.dart';

class MyNewProduct extends StatefulWidget {
  final void Function(Product product) onAddProduct;

  const MyNewProduct({super.key, required this.onAddProduct});

  @override
  State<MyNewProduct> createState() => _MyNewProductState();
}

class _MyNewProductState extends State<MyNewProduct> {
  final _formKey = GlobalKey<FormState>();

  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  final _priceController = TextEditingController();
  final _imageController = TextEditingController();
  final _categoryController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final newProduct = Product.create(
        name: _titleController.text,
        description: _descController.text,
        price: double.tryParse(_priceController.text) ?? 0.0,
        image: _imageController.text,
        category: _categoryController.text,
      );

      widget.onAddProduct(newProduct);
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    _priceController.dispose();
    _imageController.dispose();
    _categoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: const Text("Add New Product"),
        backgroundColor: colorScheme.primary,
        elevation: 1,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildField(_titleController, "Title"),
              _buildField(_descController, "Description", maxLines: 3),
              _buildField(_priceController, "Price", keyboardType: TextInputType.number),
              _buildField(_imageController, "Image URL"),
              _buildField(_categoryController, "Category"),
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: _submitForm,
                icon: const Icon(Icons.add),
                label: const Text("Add Product"),
                style: FilledButton.styleFrom(
                  backgroundColor: colorScheme.inversePrimary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  textStyle: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildField(
    TextEditingController controller,
    String label, {
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
  }) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        keyboardType: keyboardType,
        style: TextStyle(color: theme.colorScheme.inversePrimary),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: theme.colorScheme.inversePrimary),
          filled: true,
          fillColor: theme.colorScheme.primary,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
        validator: (value) =>
            value == null || value.trim().isEmpty ? 'Please enter $label' : null,
      ),
    );
  }
}
