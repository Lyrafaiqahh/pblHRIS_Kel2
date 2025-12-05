import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../controllers/approval_controllers.dart';
import '../models/approval_request.dart';

class ApprovalDetailScreen extends StatefulWidget {
  final String id;

  const ApprovalDetailScreen({
    super.key,
    required this.id,
  });

  @override
  State<ApprovalDetailScreen> createState() => _ApprovalDetailScreenState();
}

class _ApprovalDetailScreenState extends State<ApprovalDetailScreen> {

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ApprovalController>(context);
    final data = controller.getById(widget.id);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Pengajuan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Nama
            Text(
              data.name,
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const SizedBox(height: 12),

            /// Jabatan, Departemen, Tanggal pengajuan
            Text("Jabatan: ${data.letterType}"),
            Text("Departemen: ${data.department}"),
            Text("Diajukan: ${DateFormat('yyyy-MM-dd').format(data.submittedAt)}"),

            const Spacer(),

            /// Tombol ACC & Tolak jika status masih pending
            if (data.status == ApprovalStatus.pending) ...[
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      onPressed: () async {
                                  await controller.reject(data.id);
                                  Navigator.pop(context);
                                },

                      child: const Text("Tolak"),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                     onPressed: () async {
  await controller.approve(data.id);
  Navigator.pop(context);
},

                      child: const Text("ACC"),
                    ),
                  ),
                ],
              ),
            ] else ...[
              /// Jika status bukan pending → tampilkan status saja
              Text("Status: ${data.status.name.toUpperCase()}"),
            ],
          ],
        ),
      ),
    );
  }
}
