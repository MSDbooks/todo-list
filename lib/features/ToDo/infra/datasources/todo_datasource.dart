import 'package:clean_arquitecture/features/ToDo/infra/models/todo_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ITodoDatasource{
  Future<List<TodoModel>> list();
  Future<void> addItem(TodoModel todo, bool update);
}

class TodoDatasource implements ITodoDatasource{

  final _firebase = FirebaseFirestore.instance;
  @override
  Future<List<TodoModel>> list() async {

    List<TodoModel> _listResult = [];

    print('######CHEGOU NO PROVIDER ############');
       
    await _firebase.collection('todo')
      .get().then((snapshots) {
      var _list = snapshots.docs;
      for (var item in _list){
        var todo = TodoModel.fromJson(item.data()); 
        _listResult.add(todo);
          
      }
    }).onError((error, stackTrace) {
      print('FALHAAAAA' + error.toString());
      
    });
    return _listResult;
    
  }

  @override
  Future<void> addItem(TodoModel todo, bool update) async{
     
     if(update){
       await _firebase.collection('todo')
       .where('name', isEqualTo: todo.name)
       .get()
       .then((snapshots) {
         for(var item in snapshots.docs){
           item.reference.set(todo.toJson(), SetOptions(merge: true));
         }
       });
     }else{
        await _firebase.collection('todo')
        .add(todo.toJson());
     }
  
  }

}