//import necessary packages
import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';

//import necessary decorations
import 'package:funkyfitness/cores/decorations/bottom_box_border.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//import necessary widgets
import 'package:funkyfitness/cores/widgets/workout_bar.dart';
import 'package:funkyfitness/cores/widgets/loader.dart';

//import error page
import 'package:funkyfitness/features/auth/pages/error_page.dart';

//import user data provider
import 'package:funkyfitness/features/auth/provider/user_provider.dart';
import 'package:funkyfitness/features/auth/repository/user_data_service.dart';

class WorkoutScreen extends ConsumerStatefulWidget {
  const WorkoutScreen({super.key});

  @override
  ConsumerState<WorkoutScreen> createState() => new _WorkoutScreenState();
}

class _WorkoutScreenState extends ConsumerState<WorkoutScreen> {
  final user = FirebaseAuth.instance.currentUser;

  int _workoutCount = 0;
  List _allUserWorkouts = [];
  //before
  //Color lightPurple = Color.fromARGB(255, 199, 129, 211);

  Color lightPurple = Color.fromARGB(255, 206, 139, 218);
  
  @override
  Widget build(BuildContext context) {
    //This holds number of workouts user has created 
    List<Widget> _workouts = 
      new List.generate(
        _allUserWorkouts.length, (int i) => new WorkoutBar(
            //Splits the workout name from _allUserWorkouts
            currentWorkout: _allUserWorkouts[i].substring(0, _allUserWorkouts[i].indexOf(',')),

            //Splits the exercises from a workout from _allUserWorkouts
            currentExercises: _allUserWorkouts[i].substring(_allUserWorkouts[i].indexOf(',') + 2),
          )
        );

    return Column(
      children: [
        SafeArea(
          bottom: false,
          
          child: Row(
            children: [
              GestureDetector(
                child: Container(
                  padding: EdgeInsets.only(left: 7),
                  child: Text(
                    'Edit',
                    style: TextStyle(
                      fontSize: 18,
                      color: lightPurple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                onTap: () {
                  
                },
              ),

              Spacer(),

              IconButton(
                icon: Icon(
                  FontAwesomeIcons.plus,
                  color: lightPurple,
                ),
                onPressed: () {
                  _addNewWorkoutBar();
                },
              ),
            ]
          ),
        ),


        SafeArea(
          top: false,
          bottom: false, 

          child: Container(
            margin: const EdgeInsets.only(top: 3, left: 7,),
            decoration: bottomBoxBorder(),
            child: Row(
              children: [
                Container(
                  child: const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    
                    child: Text(
                      'Workouts',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                  ),
                ),

                Spacer(),
                
              ],
            ),
          ),
        ),

        Consumer(
          builder: (context, ref, child) {
              return ref.watch(userProvider).when(
              data: (currentUser) => Column(

                children: _workouts,
                  
              ), 
              error: (error, stackTrace) => Container(), 
              loading: () => const Loader()
            );
          }
        ),

      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _getUserData();
  }
  
  void _getUserData() {
    setState(() {
      ref
        .read(userProvider)
        .when(
          data: (currentUser) {
            _allUserWorkouts = currentUser.workouts;
          }, 
          error: (_, __) { 
            print("\n\nError\n\n");
            return const Text("An Error Occured");
          },

          loading: () {
            //print("\nLoading...");
            return const Loader();
          }
        );
      }
    );
   
   
    print("\n\n$_allUserWorkouts\n\n");
  
  }

  void _addNewWorkoutBar() {
    _allUserWorkouts.add("Unnamed Workout, Placeholder Exercise, 3, 12, Add notes here!,");
    _updateUserData();
  }

  void _updateUserData() {
    ref
      .read(userDataServiceProvider)
      .updateUserDataInFirestore(
        user: ref.read(userProvider).value!,
        workouts: _allUserWorkouts, 
      );
    
    print("\n\nUPDATED DATA\n\n");
    _getUserData();
    setState(() {});
  }

}