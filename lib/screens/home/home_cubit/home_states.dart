import 'package:shop_app/models/product_details_model.dart';

import '../../../models/cart_model.dart';
import '../../../models/favorites_model.dart';

abstract class HomeStates {}

class InitialState extends HomeStates {}

// change bottomnavigationbar state
class ChangeBottomNavState extends HomeStates {}

// Home data states
class HomeLoadingState extends HomeStates {}

class SuccessGetHomeState extends HomeStates {}

class ErorrGetHomeState extends HomeStates {
  final String error;
  ErorrGetHomeState(this.error);
}

// get Categroy data
class GetCategroyLoadingState extends HomeStates {}

class SuccessGetCategroyeState extends HomeStates {}

class ErorrGetCategroyState extends HomeStates {
  final String error;
  ErorrGetCategroyState(this.error);
}
// change favorites states

class ChangeFavoritesState extends HomeStates {}

class SuccessChangeFavoritesState extends HomeStates {
  final ChangeFavoritesModel model;

  SuccessChangeFavoritesState(this.model);
}

class ErorrChangeFavoritesState extends HomeStates {
  final String error;
  ErorrChangeFavoritesState(this.error);
}

//get favorites states
class GetFavoritesLoadingState extends HomeStates {}

class SuccessGetFavoritesState extends HomeStates {}

class ErorrGetFavoritesState extends HomeStates {
  final String error;
  ErorrGetFavoritesState(this.error);
}

// change cart states

class ChangeCartState extends HomeStates {}

class SuccessChangeCartState extends HomeStates {
  final ChangeCartModel model;

  SuccessChangeCartState(this.model);
}

class ErorrChangeCartState extends HomeStates {
  final String error;
  ErorrChangeCartState(this.error);
}

//get Cart states
class GetCartLoadingState extends HomeStates {}

class SuccessGetCartState extends HomeStates {}

class ErorrGetCartState extends HomeStates {
  final String error;
  ErorrGetCartState(this.error);
}

class GetProductDataLoadingState extends HomeStates {}

class SuccessGetProductDataState extends HomeStates {
  final ProductModel productDetails;

  SuccessGetProductDataState(this.productDetails);
}

class ErorrGetProductDataState extends HomeStates {
  final String error;
  ErorrGetProductDataState(this.error);
}

//change item quantity
class AddItemLoadingState extends HomeStates {}

class SuccessAddItemState extends HomeStates {
  final CartItem cartItem;

  SuccessAddItemState(this.cartItem);
}

class ErorrAddItemState extends HomeStates {
  final String error;
  ErorrAddItemState(this.error);
}

// get profile sataes
class GetProfileLoadingState extends HomeStates {}

class SuccessGetProfileState extends HomeStates {}

class ErorrGetProfileState extends HomeStates {
  final String error;
  ErorrGetProfileState(this.error);
}
