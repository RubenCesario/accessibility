import 'package:accessibility/accessibility.dart';
import 'package:flutter/material.dart';

/// A showcase widget demonstrating DataTable with accessibility theming.
class DataTableShowcase extends StatelessWidget {
  /// Creates a [DataTableShowcase].
  const DataTableShowcase({super.key});

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Data Table', style: context.textTheme.titleMedium),
      const SizedBox(height: 8),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: const [
            DataColumn(label: Text('Name')),
            DataColumn(label: Text('Age')),
            DataColumn(label: Text('Role')),
          ],
          rows: const [
            DataRow(
              cells: [
                DataCell(Text('John Doe')),
                DataCell(Text('30')),
                DataCell(Text('Developer')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Jane Smith')),
                DataCell(Text('25')),
                DataCell(Text('Designer')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Bob Johnson')),
                DataCell(Text('35')),
                DataCell(Text('Manager')),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}
