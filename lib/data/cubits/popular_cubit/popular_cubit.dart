import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:project/data/requests/popular_request.dart';
import 'package:project/domain/models/popular_model.dart';

part 'popular_state.dart';

class PopularCubit extends Cubit<PopularState> {
  PopularCubit() : super(PopularInitial());

  get popularModel => null;
  static PopularCubit get(context) =>BlocProvider.of(context);
  List<Results>popularList=[];
  getPopular(){
    emit(PopularLoading());
    PopularRequest.getPopular(
        onSuccess: (res){
          popularList=res!;
          emit(PopularDone());
        }
        ,
        onError: (statusCode){
          emit(PopularError());
    });
  }
}
