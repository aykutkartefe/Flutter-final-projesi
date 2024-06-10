import 'package:bloc/bloc.dart';
import 'package:dev_template/feature/jewel/cubit/jewel_state.dart';
import 'package:dev_template/product/core/model/jewel.dart';
import 'package:dev_template/product/utils/service/json_service.dart';

final class JewelCubit extends Cubit<JewelState> {
  JewelCubit(this._jsonService) : super(const JewelState());

  final IJsonService _jsonService;

  Future<void> getJewel() async {
    emit(state.copyWith(status: JewelStatus.loading));
    try {
      final shoes = await _jsonService.getJewel();
      emit(state.copyWith(status: JewelStatus.success, shoes: shoes));
    } catch (e) {
      emit(state.copyWith(status: JewelStatus.failure, error: e.toString()));
    }
  }

  /// Save shoes
  Future<void> saveShoes(List<Jewel> jewel) async {
    emit(state.copyWith(status: JewelStatus.loading));
    try {
      await _jsonService.saveJewel(jewel);
      emit(state.copyWith(status: JewelStatus.success));
    } catch (e) {
      emit(state.copyWith(status: JewelStatus.failure, error: e.toString()));
    }
  }

  /// Load shoes from a selected JSON file
  Future<void> loadShoesFromFile() async {
    emit(state.copyWith(status: JewelStatus.loading));
    try {
      final newShoes = await _jsonService.loadJewelFromField();
      if (newShoes.isEmpty) {
        emit(
          state.copyWith(
            status: JewelStatus.failure,
            error: 'No shoes found',
          ),
        );
      }
      emit(
        state.copyWith(
          status: JewelStatus.success,
          shoes: state.shoes + newShoes,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: JewelStatus.failure, error: e.toString()));
    }
  }
}
