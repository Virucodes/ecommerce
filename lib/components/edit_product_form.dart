
import 'package:flutter/material.dart';
import 'package:ecommerce/models/product.dart';



class EditProductForm extends StatefulWidget {
  final Product product;

  const EditProductForm({super.key, required this.product});

  @override
  State<EditProductForm> createState() => _EditProductFormState();
}

class _EditProductFormState extends State<EditProductForm> {
  final _formKey = GlobalKey<FormState>();

  late final _titleController = TextEditingController(text: widget.product.name);
  late final _descController = TextEditingController(text: widget.product.description);
  late final _priceController = TextEditingController(text: widget.product.price.toString());
  late final _imageController = TextEditingController(text: widget.product.image);
  late final _categoryController = TextEditingController(text: widget.product.category);

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final updatedProduct = Product.create(
        name: _titleController.text,
        description: _descController.text,
        price: double.tryParse(_priceController.text) ?? 0.0,
        image: _imageController.text,
        category: _categoryController.text,
      );

      Navigator.pop(context, updatedProduct);
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
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Product'),
        backgroundColor: colorScheme.primary,
        centerTitle: true,
      ),
      backgroundColor: colorScheme.surface,
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
              const SizedBox(height: 20),
              FilledButton.icon(
                onPressed: _submitForm,
                icon: const Icon(Icons.check),
                label: const Text("Save Changes"),
                style: FilledButton.styleFrom(
                  backgroundColor: colorScheme.inversePrimary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
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
