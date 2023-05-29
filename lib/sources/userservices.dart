import 'package:notepad/databaseconnection/repositary.dart';
import '../model/User.dart';

class userService{
  late repositary _Repo;
  userService(){
    _Repo=repositary();
  }
  SaveUser(User user)async{
    return await _Repo.insert("User", user.usermap());
  }
  ReadAllUsers()async{
    return await _Repo.readData("User");
  }

  Updateuser(User user) async{
    return await _Repo.updateData("User", user.usermap());
  }

  delete(userId) async{
    return await _Repo.deleteData("User", userId);
  }

}