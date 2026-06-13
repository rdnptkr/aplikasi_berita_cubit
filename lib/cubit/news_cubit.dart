import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/news_service.dart';
import 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  final NewsService service;

  NewsCubit(this.service) : super(NewsInitial());

  Future<void> fetchNews() async {
    try {
      emit(NewsLoading());
      final result = await service.getNews();
      emit(NewsLoaded(result));
    } catch (e) {
      emit(NewsError(e.toString()));
    }
  }
}