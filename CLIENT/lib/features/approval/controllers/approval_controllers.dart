import 'package:flutter/material.dart';
import '../models/approval_request.dart';
import '../services/approval_service.dart';


class ApprovalController extends ChangeNotifier {
final ApprovalService _service = ApprovalService();


List<ApprovalRequest> list = [];
bool isLoading = false;

 ApprovalController() {
    loadData();   // ← Tambahkan ini
  }

Future<void> loadData() async {
isLoading = true;
notifyListeners();


list = await _service.fetchRequests();


isLoading = false;
notifyListeners();
}

Future<void> approve(String id) async {
  final data = getById(id);
  data.status = ApprovalStatus.approved;

  await _service.approveRequest(id, ""); // tanpa admin note
  notifyListeners();
}

Future<void> reject(String id) async {
  final data = getById(id);
  data.status = ApprovalStatus.rejected;

  await _service.rejectRequest(id, ""); // tanpa admin note
  notifyListeners();
}


ApprovalRequest getById(String id) {
return list.firstWhere((e) => e.id == id);
}
}