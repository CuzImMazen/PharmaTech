import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/enums/enums.dart';

class ViewModeCubit extends Cubit<ViewMode> {
  ViewModeCubit() : super(ViewMode.list);

  void updateViewMode(ViewMode viewMode) {
    emit(viewMode);
  }
}
