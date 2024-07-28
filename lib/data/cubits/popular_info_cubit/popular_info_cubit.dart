import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:project/data/requests/popular_request.dart';
import 'package:project/domain/models/image_model.dart';
import 'package:project/domain/models/popular_info_model.dart';
import 'package:project/domain/models/popular_model.dart';

part 'popular_info_state.dart';

class PopularInfoCubit extends Cubit<PopularInfoState> {
  PopularInfoCubit() : super(PopularInfoInitial());
  static PopularInfoCubit get(context) =>BlocProvider.of(context);
  PopularInfoModel popularInfoModel=PopularInfoModel();
  ImageModel imageModel=ImageModel();
  getPopularInfo({required int id}){
    emit(PopularInfoLoading());
    PopularRequest.getPopularInfo(id: id,
        onSuccess: (res){
      popularInfoModel=res;
      emit(PopularInfoDone());
        },
        onError: (statusCode){
    emit(PopularInfoError());

    });
  }
  getPopularImage({required int id}){
    emit(PopularImageLoading());
    PopularRequest.getPopularImage(id: id,
        onSuccess: (res){
      imageModel=res;
      emit(PopularImageDone());
        },
        onError: (statusCode){
    emit(PopularImageError());

    });
  }
}



