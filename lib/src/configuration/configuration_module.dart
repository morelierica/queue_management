import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queue_management/src/configuration/blocs/conf_bloc.dart';

final configurationModule = [
  BlocProvider(create: (context) => ConfBloc(context.read()))
];
