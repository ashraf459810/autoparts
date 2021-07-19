part of 'chosennotifications_bloc.dart';

@immutable
abstract class ChosennotificationsState {}

class ChosennotificationsInitial extends ChosennotificationsState {}

class ChosenNotificationState extends ChosennotificationsState {
  final List<Notifications> notifications;

  ChosenNotificationState(this.notifications);
}

class Loading extends ChosennotificationsState {}

class Error extends ChosennotificationsState {
  final String error;
  Error(this.error);
}
