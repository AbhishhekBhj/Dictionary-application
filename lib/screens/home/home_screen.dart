import 'package:dictionary/screens/home/cubit/dictionary_cubit.dart';
import 'package:dictionary/screens/result/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  getDictionaryForm(BuildContext context) {
    final cubit = context.watch<DictionaryCubit>();

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Spacer(),
          Text(
            "Dictionary App",
            style: TextStyle(
              color: Colors.deepPurpleAccent,
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Search your word",
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
          SizedBox(
            height: 32,
          ),
          TextField(
            controller: cubit.wordController,
            decoration: InputDecoration(
              hintText: "Enter your Word",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(color: Colors.redAccent),
              ),
              fillColor: Colors.purple[200],
              filled: true,
              prefixIcon: Icon(Icons.search),
              hintStyle: TextStyle(color: Colors.white),
            ),
          ),
          Spacer(),
          Container(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                cubit.getSearchedWord();
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.all(16)),
              child: Text("SEARCH"),
            ),
          ),
        ],
      ),
    );
  }

  getLoadingStateWidget(BuildContext context) {
    //widget for the loading state
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.deepPurple,
      ),
    );
  }

  getErrorStateWidget(message) {
    //widget for the error state
    return Center(
        child: Text(
      message,
      style: TextStyle(
          color: Colors.red, fontWeight: FontWeight.w500, fontSize: 16),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<DictionaryCubit>();
    return BlocListener(
      listener: (context, state) {
        //listen for required state
        if (state is WordSearchingSuccessState) {
          // navigate to results page to see result
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ResultScreen(words: state.words),
              ));
        }
      },
      bloc: cubit,
      child: Scaffold(
          backgroundColor: Colors.purple[100],
          // if searching state
          body: cubit.state is WordSearchingState
              ? getLoadingStateWidget(context)
              :
              //if error state
              cubit.state is WordSearchingErrorState
                  ? getErrorStateWidget("Error")
                  :
                  // nothing searched state
                  cubit.state is NoQueryMadeState
                      ? getDictionaryForm(context)
                      : getDictionaryForm(context)),
    );
  }
}
