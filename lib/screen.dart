// Thus Screen is totally optional, I used this file for clearing my Concepts.
import 'dart:io';

void main() {
  performtask();
}

void performtask() async {
  task1();
  String ans= await task2();
  //So before we call task 2, we're going to wait for it to finish. Now inside task 2, we have to make
  task3(ans);
  //we make function await ki ruko ans lao phir task3 ko do
}

void task1() {
  String result = 'task 1 data';
  print('task1 is completed');
}

Future<String> task2() async {
  //future is something that will exist in the future.
  Duration abc = Duration(seconds: 3);
//pause for 3 second sleep is sync call after 3 sec task is printed.
  // sleep(abc);
   String result;
   await Future.delayed(abc, () {
     //we have to wait for this Future.delayed method to complete
    //Future is async method.
   result = 'Mein aagya';
    print('task 2 is completed');
  });
  return result;
}

void task3(String task2data) {
  String result = 'task 3 data';
  print('task 3 is completed $task2data');
// But in this case because task 3 relies on this second task to complete, what we can do is we can make

}
//without await mtlb bina waiting ke line 33 mein null aayega phir task2 perform aayega 3 sec  ka delay lekar

//Future is basically : It's not the actual thing that you want.
// It's just a promise that you will get something in the future. 
// Same as thatonce the coffee is done, they'll shout for your order,Order number 1 please come and collect.'
// recipt ke from mein usne promise diya ki jab ban jayegi tab aapko dedunga tab tak you will do your amother work
// It's something that doesn't exist right now but after it's completed its thing, after it's gotten the image
// then your future will actually materialize into a real object
