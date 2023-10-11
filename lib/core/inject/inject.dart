import 'package:get_it/get_it.dart';
import 'package:onfly_test/features/expense/data/datasources/sync_decorator/sync_expense_datasource_implementation.dart';
import 'package:onfly_test/features/expense/presentation/controllers/sync_controller.dart';
import '../../features/expense/data/datasources/create_expense_datasource.dart';
import '../../features/expense/data/datasources/get_all_expenses_datasource.dart';
import '../../features/expense/data/datasources/get_expense_from_id_datasource.dart';
import '../../features/expense/data/datasources/local/create_expense_decorator/create_expense_local_decorator_implementation.dart';
import '../../features/expense/data/datasources/local/get_all_expenses_decorator/get_all_expenses_local_decorator_implementation.dart';
import '../../features/expense/data/datasources/local/get_expense_from_id_decorator/get_expense_from_id_decorator_implementation.dart';
import '../../features/expense/data/datasources/local/remove_expense_from_id_decorator/remove_expense_from_id_decorator_implementation.dart';
import '../../features/expense/data/datasources/local/update_expense_decorator/update_expense_decorator_implementation.dart';
import '../../features/expense/data/datasources/remote/create_expense_remote_datasource_implementation.dart';
import '../../features/expense/data/datasources/remote/get_all_expenses_remote_datasource_implementation.dart';
import '../../features/expense/data/datasources/remote/get_expense_from_id_remote_datasource_implementation.dart';
import '../../features/expense/data/datasources/remote/remove_expense_from_id_remote_datasource_implementation.dart';
import '../../features/expense/data/datasources/remote/update_expense_remote_datasource_implementation.dart';
import '../../features/expense/data/datasources/remove_expense_from_id_datasource.dart';
import '../../features/expense/data/datasources/update_expense_datasource.dart';
import '../../features/expense/data/repositories/create_expense_repository_implementation.dart';
import '../../features/expense/data/repositories/get_all_expenses_repository_implementation.dart';
import '../../features/expense/data/repositories/get_expense_from_id_repository_implementation.dart';
import '../../features/expense/data/repositories/remove_expense_from_id_repository_implementation.dart';
import '../../features/expense/data/repositories/update_expense_repository_implementation.dart';
import '../../features/expense/domain/repositories/create_expense_repository.dart';
import '../../features/expense/domain/repositories/get_all_expenses_repository.dart';
import '../../features/expense/domain/repositories/get_expense_from_id_repository.dart';
import '../../features/expense/domain/repositories/remove_expense_from_id_repository.dart';
import '../../features/expense/domain/repositories/update_expense_repository.dart';
import '../../features/expense/domain/usecases/create_expense/create_expense_usecase.dart';
import '../../features/expense/domain/usecases/create_expense/create_expense_usecase_implementation.dart';
import '../../features/expense/domain/usecases/get_all_expenses/get_all_expenses_usecase.dart';
import '../../features/expense/domain/usecases/get_all_expenses/get_all_expenses_usecase_implementation.dart';
import '../../features/expense/domain/usecases/get_expense_from_id/get_expense_from_id_usecase.dart';
import '../../features/expense/domain/usecases/get_expense_from_id/get_expense_from_id_usecase_implementation.dart';
import '../../features/expense/domain/usecases/remove_expense_from_id/remove_expense_from_id_usecase.dart';
import '../../features/expense/domain/usecases/remove_expense_from_id/remove_expense_from_id_usecase_implementation.dart';
import '../../features/expense/domain/usecases/update_expense/update_expense_usecase.dart';
import '../../features/expense/domain/usecases/update_expense/update_expense_usecase_implementation.dart';
import '../../features/expense/presentation/controllers/expense_controller.dart';
import '../http_client/http_client_implementation.dart';

class Inject {
  static void init() {
    GetIt getIt = GetIt.instance;

    // core
    getIt.registerLazySingleton<HttpClientImplementation>(
        () => HttpClientImplementation());

    // datasources
    getIt.registerLazySingleton<CreateExpenseDatasource>(
      () => CreateExpenseLocalDecoratorImplementation(
        CreateExpenseRemoteDatasourceImplementation(getIt()),
      ),
    );

    getIt.registerLazySingleton<GetAllExpensesDatasource>(
      () => GetAllExpensesLocalDecoratorImplementation(
        GetAllExpensesRemoteDatasourceImplementation(getIt()),
      ),
    );

    getIt.registerLazySingleton<GetExpenseFromIdDatasource>(
      () => GetExpenseFromIdDecoratorImplementation(
        GetExpenseFromIdRemoteDatasourceImplementation(getIt()),
      ),
    );

    getIt.registerLazySingleton<RemoveExpenseFromIdDatasource>(
      () => RemoveExpenseFromIdDecoratorImplementation(
        RemoveExpenseFromIdRemoteDatasourceImplementation(getIt()),
      ),
    );

    getIt.registerLazySingleton<UpdateExpenseDatasource>(
      () => UpdateExpenseDecoratorImplementation(
        UpdateExpenseRemoteDatasourceImplementation(getIt()),
      ),
    );

    getIt.registerLazySingleton<SyncExpenseDatasourceImplementation>(
      () => SyncExpenseDatasourceImplementation(getIt()),
    );

    // repositories
    getIt.registerLazySingleton<CreateExpenseRepository>(
      () => CreateExpenseRepositoryImplementation(getIt()),
    );

    getIt.registerLazySingleton<GetAllExpensesRepository>(
      () => GetAllExpensesRepositoryImplementation(getIt()),
    );

    getIt.registerLazySingleton<GetExpenseFromIdRepository>(
      () => GetExpenseFromIdRepositoryImplementation(getIt()),
    );

    getIt.registerLazySingleton<RemoveExpenseFromIdRepository>(
      () => RemoveExpenseFromIdRepositoryImplementation(getIt()),
    );

    getIt.registerLazySingleton<UpdateExpenseRepository>(
      () => UpdateExpenseRepositoryImplementation(getIt()),
    );

    // UseCases
    getIt.registerLazySingleton<CreateExpenseUsecase>(
      () => CreateExpenseUsecaseImplementation(getIt()),
    );

    getIt.registerLazySingleton<GetAllExpensesUsecase>(
      () => GetAllExpensesUsecaseImplementation(getIt()),
    );

    getIt.registerLazySingleton<GetExpenseFromIdUsecase>(
      () => GetExpenseFromIdUsecaseImplementation(getIt()),
    );

    getIt.registerLazySingleton<RemoveExpenseFromIdUsecase>(
      () => RemoveExpenseFromIdUsecaseImplementation(getIt()),
    );

    getIt.registerLazySingleton<UpdateExpenseUsecase>(
      () => UpdateExpenseUsecaseImplementation(getIt()),
    );

    // controllers
    getIt.registerFactory<ExpenseController>(
      () => ExpenseController(
        createExpenseUsecase: getIt(),
        getAllExpensesUsecase: getIt(),
        getExpenseFromIdUsecase: getIt(),
        removeExpenseFromIdUsecase: getIt(),
        updateExpenseUsecase: getIt(),
        syncExpenseDatasourceImplementation: getIt(),
      ),
    );

    getIt.registerFactory<SyncController>(
      () => SyncController(getIt()),
    );
  }
}
