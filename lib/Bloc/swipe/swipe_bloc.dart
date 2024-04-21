import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../UserModel/userModel.dart';
import '../../UserModel/userRepo.dart';

part 'swipe_event.dart';
part 'swipe_state.dart';

class SwipeBloc extends Bloc<SwipeEvent, SwipeState> {
  final UserRepository userRepository;
  SwipeBloc({required this.userRepository})
      : super(SwipeInitialState(userRepository.getNextUser())) {
    on<SwipeUpEvent>((event, emit) {
      emit(SwipeUpState(userRepository.getNextUser()));
    });
    on<SwipeDownEvent>((event, emit) {
      emit(SwipeDownState(userRepository.getNextUser()));
    });
    on<SwipeLikeEvent>((event, emit) {
      emit(SwipeLikeState(userRepository.getNextUser()));
    });
    // on<UserProfileEvent>((event, emit) {
    //   print("UserProfileEvent");
    //   emit(UserProfileState(event.user));
    // });
    // on<BackFromProfileToHomePageEvent>((event, emit) {
    //   print("SwipeUndoEvent");
    //   emit(BackFromProfileToHomePageState(event.user));
    // });
    // on<ActiveForCallEvent>((event, emit) {
    //   print("ActiveForCallEvent");
    //   emit(ActiveForCallState(User.users));
    // });
    // on<MessageEvent>((event, emit) {
    //   print("MessageEvent");
    //   emit(MessageState(User.users));
    // });
    // on<NotificationEvent>((event, emit) {
    //   print("NotificationEvent");
    //   emit(NotificationState(User.users));
    // });
    // on<PeopleOnlineEvent>((event, emit) {
    //   print("PeopleOnlineEvent");
    //   emit(PeopleOnlineState(User.users));
    // });
    // on<EditProfileEvent>((event, emit) {
    //   print("EditProfileEvent");
    //   emit(EditProfileState());
    // });
    // on<ImageViewEvent>((event, emit) {
    //   print("ImageViewEvent");
    //   emit(ImageViewState(event.imageUrls, event.name));
    // });
  }
}
