part of 'chosennotifications_bloc.dart';

@immutable
abstract class ChosennotificationsEvent {}

class GetNotificationsEvent extends ChosennotificationsEvent {
  final String status;
  final int pages;
  final int ssize;
  GetNotificationsEvent(this.status, this.pages, this.ssize);
}
