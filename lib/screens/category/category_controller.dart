import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stoke/dto/category/category_add.dart';
import 'package:stoke/dto/category/category_update.dart';
import 'package:stoke/screens/category/category_repo.dart';
import 'package:stoke/dto/category/category_list_dto.dart';

final categoryListController =
    FutureProvider.autoDispose<List<CategoryListData>>((ref) async {
  final repo = ref.read(categoryProvider);

  final FormData categoryListCred = FormData.fromMap({
    'action': 'categoryList',
  });

  List<CategoryListData> categoryList =
      await repo.getCategoryList(credential: categoryListCred);
  return categoryList;
});

final categoryUpdateController = FutureProvider.family.autoDispose<CategoryUpdate?, CategoryUpdateArg>((ref, arg) async {
  final repo = ref.read(categoryProvider);

  final FormData categoryUpdateCred = FormData.fromMap({
    'action': 'categoryList',
    'title': arg.title,
    'category_id': arg.categoryId
  });

  CategoryUpdate? categoryUpdate =
      await repo.updateCategory(credential: categoryUpdateCred);
  return categoryUpdate;
});


abstract class CategoryUpdateState {}
class CategoryUpdateInit extends CategoryUpdateState {}
class CategoryUpdateLoading extends CategoryUpdateState {}
class CategoryUpdateLoaded extends CategoryUpdateState {
  final CategoryUpdate updateData;
  CategoryUpdateLoaded(this.updateData);
}
class CategoryUpdateError extends CategoryUpdateState {
  final CategoryUpdate errorData;

  CategoryUpdateError(this.errorData);
}

final categoryUpdateStateProvider = StateNotifierProvider<CategoryUpdateNotifier,CategoryUpdateState>((ref) {
  return CategoryUpdateNotifier();
});

class CategoryUpdateNotifier extends StateNotifier<CategoryUpdateState> {
  CategoryUpdateNotifier():super(CategoryUpdateInit());
  // final WidgetRef ref;

  void update({required WidgetRef ref,required String categoryId,required String title}) async {
    state = CategoryUpdateLoading();
    print("title = $title");
    final repo = ref.read(categoryProvider);
    final FormData categoryUpdateCred = FormData.fromMap({
      'action': 'categoryUpdate',
      'title': title,
      'status':'1',
      'category_id': categoryId
    });

    CategoryUpdate? categoryUpdate = await repo.updateCategory(credential: categoryUpdateCred);
    if(categoryUpdate.data.title.isNotEmpty){
      state = CategoryUpdateLoaded(categoryUpdate);
      ref.refresh(categoryListController);
    }else {
      state = CategoryUpdateLoaded(categoryUpdate);
    }

  }
}



class CategoryUpdateArg {
  final String categoryId;
  final String title;

  CategoryUpdateArg({
    required this.categoryId,
    required this.title,
  });
}
