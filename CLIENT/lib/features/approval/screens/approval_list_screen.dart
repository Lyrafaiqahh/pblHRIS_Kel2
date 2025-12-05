import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/approval_controllers.dart';
import 'approval_detail_screen.dart';


class ApprovalListScreen extends StatelessWidget {
const ApprovalListScreen({super.key});


@override
Widget build(BuildContext context) {
final controller = Provider.of<ApprovalController>(context);


return Scaffold(
appBar: AppBar(title: const Text('Approval Surat')),
body: controller.isLoading
    ? const Center(child: CircularProgressIndicator())
    : ListView.builder(
        itemCount: controller.list.length,
        itemBuilder: (context, index) {
          final item = controller.list[index];
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              title: Text(item.name),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Jabatan: ${item.letterType}'),
                  Text('Departemen: ${item.department}'),
                  Text('Diajukan: ${item.submittedAt.toString().split(" ").first}'),

                ],
              ),
              trailing: Text(item.status.name.toUpperCase()),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ApprovalDetailScreen(id: item.id),
                ),
              ),
            ),
          );
        },
      ),
);
}
}
