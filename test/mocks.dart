import 'package:cbtdiaries_demo/domain/authentication/repositories/user_repository.dart';
import 'package:cbtdiaries_demo/domain/itd/repositories/itd_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:cbtdiaries_demo/presentations/itd/bloc/itd_bloc.dart';

@GenerateNiceMocks([MockSpec<ItdBloc>()])
@GenerateNiceMocks([MockSpec<ItdRepository>()])
@GenerateNiceMocks([MockSpec<UserRepository>()])
void main() {}
