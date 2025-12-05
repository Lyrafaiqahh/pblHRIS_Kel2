enum ApprovalStatus { pending, approved, rejected }


class ApprovalRequest {
final String id;
final String name;
final String nik;
final String department;
final String letterType;
final String note;
final DateTime submittedAt;
final String? attachmentUrl;
ApprovalStatus status;
String? adminNote;
DateTime? decisionAt;


ApprovalRequest({
required this.id,
required this.name,
required this.nik,
required this.department,
required this.letterType,
required this.note,
required this.submittedAt,
this.attachmentUrl,
this.status = ApprovalStatus.pending,
this.adminNote,
this.decisionAt,
});
}