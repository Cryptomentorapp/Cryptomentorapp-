
// Offline AI mock. Replace with your endpoint.
Future<String> askAi(String prompt) async {
  await Future.delayed(const Duration(milliseconds: 400));
  if (prompt.toLowerCase().contains('late entry')) {
    return '⚠️ Late Entry: Giá đã chạy khỏi entry. Cân nhắc bỏ qua hoặc chờ pullback.';
  }
  if (prompt.toLowerCase().contains('risk')) {
    return 'Risk guide: • Low ≤ 1% • Medium 1–2% • High 2–3% vốn. Dùng SL cứng.';
  }
  return 'AI gợi ý (demo): Chia lệnh, dùng SL, quan sát khối lượng & funding rate.';
}
