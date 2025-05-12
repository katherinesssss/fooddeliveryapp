import 'package:firebase_auth/firebase_auth.dart';
//UserCredential — это объект, возвращаемый методами аутентификации Firebase (например, при входе или регистрации).
// Он содержит информацию о только что аутентифицированном пользователе и дополнительные данные
// (например, учетные данные провайдера).
class AuthService {
  //get instance of firebase auth
  final FirebaseAuth _firebaseAuth=FirebaseAuth.instance; //имя переменной лучше такое оставить
  //все методы доступны только через FirebaseAuth.instance, поскольку FirebaseAuth абстрактный класс
  //get current user
  User? getCurrentUser(){ //может быть null
    return _firebaseAuth.currentUser; //currentUser встроенный метод
  }
  //sign in
  Future<UserCredential> signInWithEmailPassword(String email,password) async{ //имя метода лучше оставить такое как
    //в документации
    try{
      //sign user in
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    }
    on FirebaseAuthException catch(e) {
      throw Exception(e.code);
    }
  }
  //sign up
  Future<UserCredential> signUpWithEmailPassword(String email,password) async{//имя метода лучше оставить такое как
    //в документации
    try{
      //try sign user up
      UserCredential userCredential =
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
      return userCredential;
    }
    on FirebaseAuthException catch(e) {
      print("Ошибка регистрации: ${e.code}");
      throw Exception(e.code);
    }
  }
  //sign out
  Future<void> signOut() async{
    return await _firebaseAuth.signOut();
  }


}