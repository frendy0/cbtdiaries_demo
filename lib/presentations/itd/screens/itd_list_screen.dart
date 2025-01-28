import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/enums/processing_note_status.dart';
import '../../../domain/itd/entities/itd_note_model.dart';
import '../../shared/themes/colors.dart';
import '../../shared/widgets/add_item_button.dart';
import '../../shared/widgets/default_app_bar.dart';
import '../../shared/widgets/diaries_empty_widget.dart';
import '../../shared/widgets/snack_bars.dart';
import '../bloc/itd_bloc.dart';
import '../bloc/itd_event.dart';
import '../bloc/itd_state.dart';
import '../widgets/itd_list_item_widget.dart';
import 'itd_upsert_screen.dart';

class ItdListScreen extends StatefulWidget {
  const ItdListScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ItdListScreenState();
}

class _ItdListScreenState extends State<ItdListScreen> {
  ItdNote? noteSelected;

  @override
  void dispose() {
    super.dispose();
    noteSelected = null;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          setState(() {
            noteSelected = null;
          });
        },
        child: Scaffold(
          extendBodyBehindAppBar: true,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: AddItemButton(onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (c) => ItdAddScreen()));
          }),
          appBar: DefaultAppBar(
            title: Text(noteSelected != null ? '1 Selected' : "CBT Journal"),
            actions: [
              if (noteSelected != null)
                CupertinoButton(
                  minSize: 12,
                  padding: EdgeInsets.zero,
                  onPressed: _deleteNote,
                  child: const Icon(CupertinoIcons.delete_solid,
                      size: 25, color: Colors.black),
                )
            ],
            leading: noteSelected != null
                ? CupertinoButton(
                    minSize: 12,
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      setState(() {
                        noteSelected = null;
                      });
                    },
                    child:
                        const Icon(Icons.close, size: 30, color: Colors.black),
                  )
                : null,
          ),
          body: BlocConsumer<ItdBloc, ItdState>(
              listener: _onEventChanges,
              builder: (context, state) {
                return state.map<Widget>(
                    initial: (_) => _buildLoadingWidget(),
                    generalLoading: (_) => _buildLoadingWidget(),
                    generalError: (_) => _buildErrorWidget(),
                    contentLoaded: (s) => _buildListView(s),
                    loadingNextPage: (s) =>
                        _buildListView(s, nextPageLoading: true),
                    processingMutation: (s) => _buildListView(s),
                    mutationResult: (s) => _buildListView(s));
              }),
        ));
  }

  Widget _buildErrorWidget() {
    var itdBloc = context.read<ItdBloc>();
    return Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          Text(
            "There was an error loading notes.\nCheck your network connection",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 15),
          CupertinoButton(
              color: primaryColor,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              child: Text("Try again"),
              onPressed: () {
                itdBloc.add(ItdInitializeEvent());
              })
        ]));
  }

  Widget _buildListView(ItdContentStateInterface state,
      {bool nextPageLoading = false}) {
    if (state.notes.isEmpty) return DiariesEmptyWidget();
    return NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          if (notification.metrics.extentAfter == 0) {
            _loadMore();
          }
          return true;
        },
        child: CustomScrollView(slivers: [
          SliverToBoxAdapter(
              child: SizedBox(
                  height: 10 +
                      MediaQuery.of(context).padding.top +
                      kToolbarHeight)),
          SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                childCount: state.notes.length,
                (context, i) {
                  var prevNote = i > 0 ? state.notes[i - 1] : null;
                  var note = state.notes[i];
                  var noteItem = _buildNoteItem(note, state);
                  if (prevNote?.dateTime.year == note.dateTime.year) {
                    return noteItem;
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        note.dateTime.year.toString(),
                        style:
                            const TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                      noteItem
                    ],
                  );
                },
              ))),
          if (nextPageLoading)
            SliverToBoxAdapter(
                child: Align(
                    child: Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: CircularProgressIndicator()))),
          SliverToBoxAdapter(
              child: SizedBox(
                  height: 120 + MediaQuery.of(context).padding.bottom)),
        ]));
  }

  Widget _buildLoadingWidget() {
    return const Center(
        child: CircularProgressIndicator(
      color: primaryColor,
    ));
  }

  void _onEventChanges(BuildContext context, ItdState state) {
    state.maybeMap(
        mutationResult: (mutationResult) {
          TypeSnackBar? typeSnackBar;
          if (mutationResult.result.status == ProcessingNoteStatus.error) {
            typeSnackBar = TypeSnackBar.error;
          } else if (mutationResult.result.status ==
              ProcessingNoteStatus.still) {
            typeSnackBar = TypeSnackBar.success;
          }
          if (typeSnackBar != null) {
            ScaffoldMessenger.of(context).showSnackBar(CustomSnackBar(
                typeSnackBar: typeSnackBar,
                text: mutationResult.result.message));
          }
        },
        orElse: () => null);
  }

  Widget _buildNoteItem(ItdNote note, ItdContentStateInterface state) {
    ProcessingNoteStatus status = ProcessingNoteStatus.still;

    status =
        state.processingNotes[note.id]?.status ?? ProcessingNoteStatus.still;

    return ItdListItem(
      note: note,
      status: status,
      key: ValueKey(note.id),
      onPress: () {
        if (status == ProcessingNoteStatus.loading) return;
        if (noteSelected != null) {
          setState(() {
            noteSelected = note;
          });
          return;
        }
        Navigator.of(context).push(MaterialPageRoute(
            builder: (c) => ItdAddScreen(
                  itdNote: note,
                )));
      },
      selected: noteSelected == note,
      onLongPress: () {
        if (status == ProcessingNoteStatus.loading) return;

        setState(() {
          noteSelected = note;
        });
      },
    );
  }

  void _deleteNote() async {
    var itdBloc = context.read<ItdBloc>();

    var res = await showOkCancelAlertDialog(
      context: context,
      title: 'Delete entry',
      message:
          'Are you sure you want to delete this entry? This action cannot be undone.',
      okLabel: 'Delete',
      cancelLabel: 'Cancel',
      isDestructiveAction: true,
    );
    if (res.index == 0) {
      itdBloc.add(ItdDeleteNoteEvent(itdNote: noteSelected!));
      setState(() {
        noteSelected = null;
      });
    }
  }

  void _loadMore() async {
    var itdBloc = context.read<ItdBloc>();
    ItdContentStateInterface? contentState = itdBloc.state.asContentState;
    if (!itdBloc.state.isEditAllowed || contentState == null) return;
    if (!contentState.hasMoreResults) return;
    itdBloc.add(ItdNextPageEvent());
  }
}
