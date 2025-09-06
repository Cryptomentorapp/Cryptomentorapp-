String fmtMoney(num n){
  final abs=n.abs(); String sfx=''; double v=n.toDouble();
  if(abs>=1e12){sfx='T'; v=n/1e12;} else if(abs>=1e9){sfx='B'; v=n/1e9;}
  else if(abs>=1e6){sfx='M'; v=n/1e6;} else if(abs>=1e3){sfx='K'; v=n/1e3;}
  String s=v.toStringAsFixed(v.abs()>=100?0:(v.abs()>=10?1:2));
  if(s.contains('.')) s=s.replaceAll(RegExp(r'\.0+\$'), '');
  return '\$'+s+sfx;
}