import 'package:api_task/features/posts/model/post_model.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
part 'get_post_state.dart';

class GetPostCubit extends Cubit<GetPostState> {
  GetPostCubit() : super(GetPostInitial());
  List<PostModel>posts=[];
  Future<void>fetchData()async{
    try{
      emit(GetPostLoading());
      final response=await Dio().get("https://dummyjson.com/posts");
      final List data = response.data['posts'];
      posts = data
          .map((e) => PostModel.fromJson(e))
          .toList();      emit(GetPostSuccess());
    }catch(e){
      emit(GetPostError(error: e.toString()));
    }
  }
}
