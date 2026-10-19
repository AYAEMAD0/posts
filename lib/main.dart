import 'package:api_task/features/posts/view/post_page.dart';
import 'package:api_task/features/posts/cubit/get_post_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Get Post',
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => GetPostCubit()..fetchData(),
        child: const PostPage(),
      ),
    );
  }
}