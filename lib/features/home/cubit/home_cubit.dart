
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tasky_todo/features/home/data/models/todos_response.dart';
import 'package:tasky_todo/features/home/data/repos/todos_repo.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._repo) : super(const HomeState.initial());
  final TodosRepo _repo;
  int selectIndex = 0;
  int page=1;
  String category ='All';
  bool hasMoreTodo=true;
  bool isHasMoreTodoLoading=false;
  List<TodosResponse>? todosList;
  List<TodosResponse>? filteredList;
  List<String> categoriesList = ['All', 'InProgress', 'Waiting', 'Finished'];
  Map<String, dynamic> categoriesTextToApiValue = {
    'All': 'all',
    'InProgress': 'inProgress',
    'Waiting': 'waiting',
    'Finished': 'finished'
  };
  Future<void> getTodos() async {
    selectIndex=0;
    page=1;
    todosList=[];
    filteredList=[];
    hasMoreTodo=true;
    emit(const HomeState.loading());
    final result = await _repo.getTodos(1);
    result.when(success: (data) {
      todosList!.addAll(data);
      changeTaskStatusCategory(category);
      emit(HomeState.success(todos: todosList!));
      log('response:::::::::::::::: $todosList!');
    }, failure: (error) {
   emit(HomeState.failure(error: error.apiErrorModel.message ?? ''));
    });
  }
  void loadedMoreGetTodoList()async{
    if(hasMoreTodo == false || isHasMoreTodoLoading || selectIndex!=0)return;
    page++;
    isHasMoreTodoLoading=true;
    final result= await _repo.getTodos(page);
    result.when(success: (data) {
      isHasMoreTodoLoading=false;
      if(data.isEmpty){
        hasMoreTodo=false;
      }
      todosList!.addAll(data);  
      filteredList = todosList!;
      emit(HomeState.success(todos: todosList!));
    },
    failure: (error) {
       emit(HomeState.failure(error: error.apiErrorModel.message ?? ''));
    },
    );
  }
  void changeTaskStatusCategory(String category) {
    if (category.toLowerCase() == 'all') {
      selectIndex = 0;
      filteredList = todosList!;
       emit(HomeState.changeStatusCategory(
          category: category, filteredItems: filteredList!));
    } else {
      selectIndex = categoriesList
          .indexWhere((item) => item.toLowerCase() == category.toLowerCase());
      filteredList = todosList!
          .where((e) => e.status == categoriesTextToApiValue[category])
          .toList();
    }
     emit(HomeState.changeStatusCategory(
          category: category, filteredItems: filteredList!));
  }
}
