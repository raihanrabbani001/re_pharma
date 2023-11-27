import 'package:flutter/material.dart';
import 'package:re_pharma/widgets/textfield_custom.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: colorScheme.surfaceVariant.withAlpha(150),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 80,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Data Barang',
                style: textTheme.headlineLarge!.copyWith(
                    letterSpacing: 0.1,
                    fontWeight: FontWeight.w700,
                    color: colorScheme.onSurfaceVariant),
              ),
              SizedBox(
                height: 40,
                child: TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  label: const Text('Tambah'),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(16, 126, 16, 16),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: colorScheme.surface.withAlpha(255)),
        child:  Column(
          children: [
            Row(
              children: [
                TextFieldCustom.search(placeholder: 'Cari disini'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
