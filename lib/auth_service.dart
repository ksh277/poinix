class AuthService {
  Future<void> login(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 300));
  }

  Future<void> signup(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 300));
  }

  Future<void> logout() async {
    await Future.delayed(const Duration(milliseconds: 300));
  }
}
