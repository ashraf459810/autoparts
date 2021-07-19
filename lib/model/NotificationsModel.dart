// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

NotificationModel notificationModelFromJson(String str) => NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel data) => json.encode(data.toJson());

class NotificationModel {
    NotificationModel({
        this.id,
        this.type,
        this.clickAction,
    });

    int id;
    String type;
    String clickAction;

    factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
        id: json["id"],
        type: json["type"],
        clickAction: json["click_action"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "click_action": clickAction,
    };
}
