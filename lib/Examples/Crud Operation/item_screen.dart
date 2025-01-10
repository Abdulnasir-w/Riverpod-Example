import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpord_example/Components/custom_button.dart';
import 'package:riverpord_example/Examples/Crud%20Operation/item_provider.dart';

class ItemScreen extends ConsumerWidget {
  const ItemScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemsShow = ref.watch(itemProvider);
    debugPrint("Scaffold build");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Screen'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            itemsShow.isEmpty
                ? Center(
                    child: Text(
                    "Items Not Found",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ))
                : Expanded(
                    child: ListView.builder(
                      itemCount: itemsShow.length,
                      itemBuilder: (context, index) {
                        final itemDetail = itemsShow[index];
                        return ListTile(
                          title: Text(itemDetail.name),
                          trailing: SizedBox(
                            width: 100,
                            child: Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.edit),
                                  onPressed: () {
                                    debugPrint("Edit");
                                    fields(context, ref, itemDetail.name,
                                        (newName) {
                                      ref
                                          .read(itemProvider.notifier)
                                          .updateItem(itemDetail.id, newName);
                                    });
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {
                                    debugPrint("Edit");

                                    ref
                                        .read(itemProvider.notifier)
                                        .deleteItem(itemDetail.id);
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          fields(context, ref, '', (newName) {
            ref.read(itemProvider.notifier).addItem(newName);
          });
        },
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        tooltip: "Add Item",
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  fields(BuildContext context, WidgetRef ref, String initialValue,
      Function(String) onSave) {
    final nameController = TextEditingController(text: initialValue);

    return showAdaptiveDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog.adaptive(
          title: Text(initialValue.isEmpty ? 'Add Item' : "Edit Item"),
          content: SingleChildScrollView(
            child: Column(
              spacing: 10,
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: 'Name',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    enabled: true,
                  ),
                ),
                CustomButton(
                  label: initialValue.isEmpty ? "Save" : "Update",
                  onPressed: () {
                    final newName = nameController.text.trim();

                    if (newName.isNotEmpty) {
                      onSave(newName);
                      Navigator.of(context).pop();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Name cannot be empty!'),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
