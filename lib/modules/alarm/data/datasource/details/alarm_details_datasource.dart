import 'package:thingsboard_app/modules/alarm/data/datasource/details/i_alarm_details_datasource.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

class AlarmDetailsDatasource implements IAlarmDetailsDatasource {
  const AlarmDetailsDatasource(this.thingsboardClient);

  final ThingsboardClient thingsboardClient;

  @override
  Future<PageData<AlarmCommentInfo>> fetchAlarmComments(
    AlarmCommentsQuery query,
  )  {
    return thingsboardClient.getAlarmService().getAlarmComments(query);
  }

  @override
  Future<AlarmInfo> acknowledgeAlarm(AlarmId id)  {
    return thingsboardClient.getAlarmService().ackAlarm(id.id!);
  }

  @override
  Future<AlarmInfo> clearAlarm(AlarmId id)  {
    return thingsboardClient.getAlarmService().clearAlarm(id.id!);
  }

  @override
  Future<AlarmCommentInfo> postComment(
    AlarmId alarmId, {
    required String comment,
  }) {
    final alarmComment = AlarmComment(
      alarmId.id,
      DateTime.now().millisecondsSinceEpoch,
      alarmId,
      null,
      AlarmCommentType.OTHER,
      AlarmCommentJsonNode(
        text: comment,
        subtype: null,
        userId: null,
        edited: false,
        editedOn: null,
        assigneeId: null,
      ).toJson(),
      null,
    );

    return thingsboardClient
        .getAlarmService()
        .postAlarmComment(alarmComment, alarmId: alarmId);
  }

  @override
  Future<void> deleteComment(AlarmId id, {required String commentId}) {
    return thingsboardClient.getAlarmService().deleteAlarmComment(
          commentId,
          alarmId: id,
        );
  }

  @override
  Future<AlarmCommentInfo> updateComment(
    AlarmId alarmId, {
    required String id,
    required String comment,
  }) {
    final alarmComment = AlarmComment(
      alarmId.id,
      DateTime.now().millisecondsSinceEpoch,
      alarmId,
      null,
      AlarmCommentType.OTHER,
      AlarmCommentJsonNode(
        text: comment,
        subtype: null,
        userId: null,
        edited: true,
        editedOn: DateTime.now().millisecondsSinceEpoch,
        assigneeId: null,
      ).toJson(),
      null,
    );

    // The updated SDK routes comment operations through postAlarmComment.
    return thingsboardClient
        .getAlarmService()
        .postAlarmComment(alarmComment, alarmId: alarmId);
  }

  @override
  Future<PageData<UserInfo>> fetchAssignee(UsersAssignQuery query) {
    return thingsboardClient.getUserService().getUsersAssign(query);
  }

  @override
  Future<AlarmInfo> assignAlarm(String alarmId, String assigneeId) {
    return thingsboardClient.getAlarmService().assignAlarm(alarmId, assigneeId);
  }

  @override
  Future<AlarmInfo> unassignAlarm(String alarmId) {
    return thingsboardClient.getAlarmService().unassignAlarm(alarmId);
  }
}
