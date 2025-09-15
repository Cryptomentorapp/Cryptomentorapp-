import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/auth_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _user = TextEditingController(text: 'admin');
  final _pass = TextEditingController(text: 'admin');
  bool _busy=false; String? _error;

  Future<void> _doLogin() async {
    setState(()=>_busy=true); _error=null;
    final ok = await context.read<AuthController>().login(_user.text, _pass.text);
    if (!ok) _error='Sai tài khoản hoặc mật khẩu (demo: admin/admin)';
    setState(()=>_busy=false);
  }

  @override void dispose(){ _user.dispose(); _pass.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: Card(
            margin: const EdgeInsets.all(24),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24,28,24,24),
              child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                Row(children: [
                  Container(width:40,height:40, decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface, borderRadius: BorderRadius.circular(10)),
                    child: const Icon(Icons.shield_rounded)),
                  const SizedBox(width: 12),
                  const Text('Cryptomentor', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
                ]),
                const SizedBox(height: 18),
                const Text('Đăng nhập để tiếp tục', style: TextStyle(fontWeight: FontWeight.w700)),
                const SizedBox(height: 12),
                TextField(controller: _user, decoration: const InputDecoration(labelText: 'Tài khoản', border: OutlineInputBorder())),
                const SizedBox(height: 12),
                TextField(controller: _pass, obscureText: true, decoration: const InputDecoration(labelText: 'Mật khẩu', border: OutlineInputBorder())),
                const SizedBox(height: 8),
                if (_error!=null) Text(_error!, style: const TextStyle(color: Colors.redAccent)),
                const SizedBox(height: 8),
                FilledButton(onPressed: _busy?null:_doLogin, child: _busy?const SizedBox(height:20,width:20,child:CircularProgressIndicator(strokeWidth:2)):const Text('Đăng nhập')),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
