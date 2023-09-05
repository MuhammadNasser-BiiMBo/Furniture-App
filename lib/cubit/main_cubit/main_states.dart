abstract class MainStates{}

class LayoutInitialState extends MainStates {}
class ChangeBottomNavState extends MainStates {}
// User
class GetUserLoadingState extends MainStates {}
class GetUserSuccessState extends MainStates {}
class GetUserErrorState extends MainStates {}
// Favorites
class GetFavLoadingState extends MainStates {}
class GetFavSuccessState extends MainStates {}
class GetFavErrorState extends MainStates {}

class UpdateFavLoadingState extends MainStates {}
class UpdateFavSuccessState extends MainStates {}
class UpdateFavErrorState extends MainStates {}
// Cart
class GetCartLoadingState extends MainStates {}
class GetCartSuccessState extends MainStates {}
class GetCartErrorState extends MainStates {}

class UpdateCartLoadingState extends MainStates {}
class UpdateCartSuccessState extends MainStates {}
class UpdateCartErrorState extends MainStates {}

class UpdateQuantityLoadingState extends MainStates{}
class UpdateQuantitySuccessState extends MainStates{}
class UpdateQuantityErrorState extends MainStates{}

