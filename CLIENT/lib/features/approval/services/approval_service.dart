import '../models/approval_request.dart';
import 'package:uuid/uuid.dart';

class ApprovalService {
  final List<ApprovalRequest> _dummyRequests = [];
  final _uuid = const Uuid();

  ApprovalService() {
    _dummyRequests.addAll([
      ApprovalRequest(
        id: _uuid.v4(),
        name: 'Budi Santoso',
        nik: '123456',
        department: 'Finance',
        letterType: 'Izin Sakit',
        note: 'Sakit flu',
        submittedAt: DateTime.now(),
      ),
    ]);
  }

  Future<List<ApprovalRequest>> fetchRequests() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _dummyRequests;
  }

  Future<void> approveRequest(String id, String adminNote) async {
    final data = _dummyRequests.firstWhere((e) => e.id == id);
    data.status = ApprovalStatus.approved;
    data.adminNote = adminNote;
  }

  Future<void> rejectRequest(String id, String adminNote) async {
    final data = _dummyRequests.firstWhere((e) => e.id == id);
    data.status = ApprovalStatus.rejected;
    data.adminNote = adminNote;
  }
}
