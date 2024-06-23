import 'package:flutter/material.dart';
import 'package:notes_app/blocs/search%20note/search_note_bloc.dart';
import 'package:notes_app/data/services/navigation_service.dart';
import 'package:notes_app/di/injector.dart';
import 'package:notes_app/models/note/note.dart';
import 'package:notes_app/utils/app_colors.dart';

class SearchNoteForm extends StatefulWidget {
  final List<Note> notes;
  const SearchNoteForm({super.key, required this.notes});

  @override
  State<SearchNoteForm> createState() => _SearchNoteFormState();
}

class _SearchNoteFormState extends State<SearchNoteForm> {
  final TextEditingController searchController = TextEditingController();
  bool isExpanded = false;

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        isExpanded = !isExpanded;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              NavigationService.pop();
            },
            icon: const Icon(Icons.arrow_back),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 350),
            curve: Curves.ease,
            width: (!isExpanded) ? 0 : MediaQuery.of(context).size.width * 0.78,
            height: 60,
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(20),
              color: AppColors.backgroundColor,
            ),
            child: Center(
              child: TextField(
                controller: searchController,
                onChanged: (value) {
                  getIt.get<SearchNoteBloc>().add(
                        SearchNote(widget.notes, value),
                      );
                },
                decoration: const InputDecoration(
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
