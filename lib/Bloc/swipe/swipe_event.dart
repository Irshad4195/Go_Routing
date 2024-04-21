part of 'swipe_bloc.dart';

abstract class SwipeEvent extends Equatable {
  const SwipeEvent();

  @override
  List<Object> get props => [];
}

class SwipeUpEvent extends SwipeEvent {
  const SwipeUpEvent();
}

class SwipeDownEvent extends SwipeEvent {
  const SwipeDownEvent();
}

class SwipeLikeEvent extends SwipeEvent {
  const SwipeLikeEvent();
}

// class UserProfileEvent extends SwipeEvent {
//   final User user;
//   const UserProfileEvent({required this.user});
//   @override
//   List<Object> get props => [user];
// }
//
// class BackFromProfileToHomePageEvent extends SwipeEvent {
//   final User user;
//   const BackFromProfileToHomePageEvent({required this.user});
//   @override
//   List<Object> get props => [user];
// }
//
// // class BackFromImageViewToProfileEvent extends SwipeEvent {
// //   final User user;
// //   const BackFromImageViewToProfileEvent( {required this.user});
// //   @override
// //   List<Object> get props => [user];
// // }
//
// class ActiveForCallEvent extends SwipeEvent {}
//
// class MessageEvent extends SwipeEvent {}
//
// class NotificationEvent extends SwipeEvent {}
//
// class PeopleOnlineEvent extends SwipeEvent {}
//
// class EditProfileEvent extends SwipeEvent {}
//
// class ImageViewEvent extends SwipeEvent {
//   final String imageUrls;
//   final String name;
//   const ImageViewEvent({required this.imageUrls, required this.name});
//   @override
//   List<Object> get props => [imageUrls, name];
// }
