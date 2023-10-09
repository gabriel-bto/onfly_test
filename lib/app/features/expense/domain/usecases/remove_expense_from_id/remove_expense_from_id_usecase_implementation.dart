import '../../repositories/remove_expense_from_id_repository.dart';
import 'remove_expense_from_id_usecase.dart';

class RemoveExpenseFromIdUsecaseImplementation
    implements RemoveExpenseFromIdUsecase {
  final RemoveExpenseFromIdRepository _removeExpenseFromIdRepository;

  RemoveExpenseFromIdUsecaseImplementation(this._removeExpenseFromIdRepository);

  @override
  Future<bool> call(String id) async {
    return await _removeExpenseFromIdRepository(id);
  }
}
