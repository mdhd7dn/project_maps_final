import 'package:flutter/material.dart';
import 'package:my_case/featuers/hearings/domain/entities/hearing.dart';

class HearingCard extends StatelessWidget {
  final Hearing hearing;

  const HearingCard({super.key, required this.hearing});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(12),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'جلسة استماع',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[800],
                ),
              ),
            ),
            SizedBox(height: 12),
            Divider(height: 1, color: Colors.grey[300]),
            SizedBox(height: 16),
            if (hearing.caseId != null)
              Center(
                child: Text(
                  'القضية #${hearing.caseId}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            SizedBox(height: 16),
            _buildInfoRow('تاريخ الجلسة', _formatHearingDate(hearing.date)),
            _buildInfoRow('مكان الانعقاد', hearing.sessionLocation,
                isMultiLine: true),
            _buildInfoRow('ملاحظات', hearing.notes, isMultiLine: true),
            SizedBox(height: 16),
            Divider(height: 1, color: Colors.grey[300]),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    'رقم المستخدم: ${_formatUserId(hearing.userId)}',
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Flexible(
                  child: Text(
                    'رقم المحكمة: ${hearing.courtsId}',
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String title, String value, {bool isMultiLine = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey[700],
          ),
        ),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(fontSize: 16),
          maxLines: isMultiLine ? null : 1,
          overflow: isMultiLine ? TextOverflow.visible : TextOverflow.ellipsis,
        ),
        SizedBox(height: 12),
      ],
    );
  }

  String _formatHearingDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year} - ${date.hour}:${date.minute.toString().padLeft(2, '0')}';
  }

  String _formatUserId(String userId) {
    if (userId.length > 10) {
      return userId.substring(0, 10) + '...';
    }
    return userId;
  }
}
