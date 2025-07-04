
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterTradeScreen extends StatefulWidget {
  const RegisterTradeScreen({super.key});

  @override
  State<RegisterTradeScreen> createState() => _RegisterTradeScreenState();
}

class _RegisterTradeScreenState extends State<RegisterTradeScreen> {
  final titleController = TextEditingController();
  final locationController = TextEditingController();
  final detailController = TextEditingController();

  String selectedCategory = '육식';
  String selectedDuration = '2시간';

  final List<String> categories = ['육식', '과일', '우유', '영양제류', '잡화류'];
  final List<String> durations = ['1시간', '2시간', '3시간'];

  bool get isFormValid =>
      titleController.text.trim().isNotEmpty &&
      locationController.text.trim().isNotEmpty &&
      selectedCategory.isNotEmpty;

  @override
  void initState() {
    super.initState();
    titleController.addListener(() => setState(() {}));
    locationController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final hourOffset = int.tryParse(selectedDuration[0]) ?? 1;
    final endTime = now.add(Duration(hours: hourOffset));
    final endText = '오늘 ${endTime.hour.toString().padLeft(2, '0')}:${endTime.minute.toString().padLeft(2, '0')} 마감';

    return Scaffold(
      backgroundColor: const Color(0xFFEFFFF8),
      appBar: AppBar(
        backgroundColor: const Color(0xFF00C17C),
        title: Text('물품 등록', style: GoogleFonts.pretendard(color: Colors.white)),
        leading: const BackButton(color: Colors.white),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildLabel('교환물품명 *'),
          const SizedBox(height: 6),
          _buildTextField(titleController, '최대 15자까지 입력 가능합니다.'),
          const SizedBox(height: 20),
          _buildLabel('카테고리 *'),
          const SizedBox(height: 6),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: categories.map((cat) {
              final selected = selectedCategory == cat;
              return ChoiceChip(
                label: Text(cat),
                selected: selected,
                onSelected: (_) {
                  setState(() {
                    selectedCategory = cat;
                  });
                },
                selectedColor: const Color(0xFF00C17C),
                labelStyle: GoogleFonts.pretendard(
                  color: selected ? Colors.white : Colors.black,
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          _buildLabel('경매 마감시간 *'),
          const SizedBox(height: 6),
          Row(
            children: [
              DropdownButton<String>(
                value: selectedDuration,
                items: durations.map((e) {
                  return DropdownMenuItem<String>(
                    value: e,
                    child: Text(e, style: GoogleFonts.pretendard()),
                  );
                }).toList(),
                onChanged: (v) {
                  setState(() {
                    selectedDuration = v!;
                  });
                },
              ),
              const SizedBox(width: 16),
              Text(endText, style: const TextStyle(color: Colors.redAccent)),
            ],
          ),
          const SizedBox(height: 20),
          _buildLabel('교환장소 *'),
          const SizedBox(height: 6),
          _buildTextField(locationController, '장소 입력 (최대 15자)'),
          const SizedBox(height: 20),
          _buildLabel('상세설명'),
          const SizedBox(height: 6),
          _buildMultilineTextField(detailController, '상세 정보를 입력해주세요.'),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: isFormValid ? () => _submitForm() : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: isFormValid ? const Color(0xFF00C17C) : const Color(0xFFDDDDDD),
              minimumSize: const Size.fromHeight(48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text('등록하기', style: GoogleFonts.pretendard(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _submitForm() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('등록 완료'),
        content: const Text('물품이 성공적으로 등록되었습니다.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('확인'),
          ),
        ],
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: GoogleFonts.pretendard(fontWeight: FontWeight.w600),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hint) {
    return TextField(
      controller: controller,
      style: GoogleFonts.pretendard(),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.pretendard(),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      ),
    );
  }

  Widget _buildMultilineTextField(TextEditingController controller, String hint) {
    return TextField(
      controller: controller,
      maxLines: 5,
      style: GoogleFonts.pretendard(),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.pretendard(),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      ),
    );
  }
}
