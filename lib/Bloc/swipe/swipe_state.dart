part of 'swipe_bloc.dart';

abstract class SwipeState extends Equatable {
  const SwipeState();

  @override
  List<Object> get props => [];

  get user => null;
}

final class SwipeInitialState extends SwipeState {
  @override
  final User user;

  const SwipeInitialState(this.user);

  @override
  List<Object> get props => [user];
}

final class SwipeUpState extends SwipeState {
  @override
  final User user;

  const SwipeUpState(this.user);

  @override
  List<Object> get props => [user];
}

final class SwipeDownState extends SwipeState {
  @override
  final User user;

  const SwipeDownState(this.user);

  @override
  List<Object> get props => [user];
}

final class SwipeLikeState extends SwipeState {
  @override
  final User user;

  const SwipeLikeState(this.user);

  @override
  List<Object> get props => [user];
}

// final class UserProfileState extends SwipeState {
//   @override
//   final User user;
//
//   const UserProfileState(this.user);
//
//   @override
//   List<Object> get props => [user];
// }
//
// final class BackFromProfileToHomePageState extends SwipeState {
//   @override
//   final User user;
//
//   const BackFromProfileToHomePageState(this.user);
//
//   @override
//   List<Object> get props => [user];
// }

// final class BackFromImageViewToProfileState extends SwipeState {
//   @override
//   final User user;
//
//   const BackFromImageViewToProfileState(this.user);
//
//   @override
//   List<Object> get props => [user];
// }

// final class ActiveForCallState extends SwipeState {
//   final List<User> users;
//
//   const ActiveForCallState(this.users);
//
//   @override
//   List<Object> get props => [users];
// }
//
// final class MessageState extends SwipeState {
//   final List<User> users;
//
//   const MessageState(this.users);
//
//   @override
//   List<Object> get props => [users];
// }
//
// final class NotificationState extends SwipeState {
//   final List<User> users;
//
//   const NotificationState(this.users);
//
//   @override
//   List<Object> get props => [users];
// }
//
// final class PeopleOnlineState extends SwipeState {
//   final List<User> users;
//
//   const PeopleOnlineState(this.users);
//
//   @override
//   List<Object> get props => [users];
// }
//
// final class EditProfileState extends SwipeState {
//
// }
//
// final class ImageViewState extends SwipeState {
//   final String imageUrls;
//   final String name;
//
//   const ImageViewState(this.imageUrls, this.name);
//
//   @override
//   List<Object> get props => [imageUrls, name];
// }
