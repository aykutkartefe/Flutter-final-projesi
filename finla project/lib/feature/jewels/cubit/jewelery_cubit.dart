import 'package:dev_template/feature/jewels/cubit/jewelery_state.dart';
import 'package:dev_template/feature/jewels/service/jewelery_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class JeweleryCubit extends Cubit<JeweleryState> {
  JeweleryCubit(this._postService)
      : super(const JeweleryState(status: JeweleryStatus.initial));

  final JeweleryService _postService;

  Future<void> getJewelery() async {
    emit(state.copyWith(status: JeweleryStatus.loading));
    final response = await _postService.getJewelery();
    if (response.data != null) {
      emit(
        state.copyWith(
          status: JeweleryStatus.loaded,
          products: response.data,
        ),
      );
    } else {
      emit(state.copyWith(status: JeweleryStatus.error, error: response.error));
    }
  }
}
