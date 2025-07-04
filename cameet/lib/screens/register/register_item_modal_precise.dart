
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterItemModal extends StatefulWidget {
  const RegisterItemModal({super.key});

  @override
  State<RegisterItemModal> createState() => _RegisterItemModalState();
}

class _RegisterItemModalState extends State<RegisterItemModal> {
  String selected = 'exchange';

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 8),
                Text(
                  '물품 등록',
                  style: GoogleFonts.pretendard(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  '어떤 유형의 물품을 등록하시겠어요?',
                  style: GoogleFonts.pretendard(fontSize: 14),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildOption(
                      label: '물물교환',
                      value: 'exchange',
                      iconPath: 'assets/icons/exchange_icon.png',
                    ),
                    const SizedBox(width: 16),
                    _buildOption(
                      label: '나눔/받음',
                      value: 'share',
                      iconPath: 'assets/icons/share_icon.png',
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  selected == 'exchange'
                      ? '불필요한 내가 가진 물건과 다른 사용자가 가진 물건을 교환할 수 있는 기능이에요.'
                      : '필요한 물건을 요청하거나 내가 가진 물건을 나눠주는 기능이에요.',
                  style: GoogleFonts.pretendard(
                    fontSize: 13,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00C17C),
                    minimumSize: const Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    // 다음 화면 이동 로직
                  },
                  child: Text('다음', style: GoogleFonts.pretendard()),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('취소',
                      style: GoogleFonts.pretendard(
                          color: Colors.black54, fontWeight: FontWeight.w500)),
                )
              ],
            ),
          ),
          Positioned(
            top: 12,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOption({
    required String label,
    required String value,
    required String iconPath,
  }) {
    final isSelected = selected == value;
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = value;
        });
      },
      child: Container(
        width: 120,
        height: 130,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFF2FDF8) : const Color(0xFFF5F5F5),
          border: Border.all(
            color: isSelected ? const Color(0xFF00C17C) : Colors.transparent,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(iconPath, width: 48),
            const SizedBox(height: 12),
            Text(
              label,
              style: GoogleFonts.pretendard(
                fontWeight: FontWeight.bold,
                color: isSelected ? const Color(0xFF00C17C) : Colors.black87,
              ),
            )
          ],
        ),
      ),
    );
  }
}
