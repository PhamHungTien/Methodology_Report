# Makefile cho dự án Smart Canteen AR Report
# Tác giả: Nhóm 5 - Smart Canteen AR Team
# Phiên bản: 2.0

# Các biến cấu hình
MAIN_FILE = src/main.tex
OUTPUT_DIR = .
PDF_FILE = main.pdf
LOG_FILE = main.log
AUX_FILE = main.aux
TOC_FILE = main.toc
LOT_FILE = main.lot
LOF_FILE = main.lof
OUT_FILE = main.out

# Mục tiêu mặc định
.PHONY: all clean help pdf view draft

all: pdf

# Biên dịch file PDF
pdf:
	@echo "🔄 Biên dịch báo cáo Smart Canteen AR..."
	@pdflatex -interaction=nonstopmode $(MAIN_FILE)
	@pdflatex -interaction=nonstopmode $(MAIN_FILE)
	@echo "✅ Biên dịch hoàn tất! File PDF: $(PDF_FILE)"

# Biên dịch nhanh (chỉ 1 lần)
draft:
	@echo "🔄 Biên dịch nhanh (draft mode)..."
	@pdflatex -interaction=nonstopmode $(MAIN_FILE)
	@echo "✅ Biên dịch draft hoàn tất!"

# Mở file PDF sau khi biên dịch
view: pdf
	@echo "📖 Mở file PDF..."
	@if command -v open >/dev/null 2>&1; then \
		open $(PDF_FILE); \
	elif command -v xdg-open >/dev/null 2>&1; then \
		xdg-open $(PDF_FILE); \
	else \
		echo "❌ Không thể mở PDF. Vui lòng mở file $(PDF_FILE) thủ công."; \
	fi

# Dọn dẹp các file tạm
clean:
	@echo "🧹 Dọn dẹp các file tạm thời..."
	@rm -f $(AUX_FILE) $(LOG_FILE) $(TOC_FILE) $(LOT_FILE) $(LOF_FILE) $(OUT_FILE)
	@echo "✅ Dọn dẹp hoàn tất!"

# Dọn dẹp toàn bộ (bao gồm PDF)
cleanall: clean
	@echo "🧹 Dọn dẹp toàn bộ file..."
	@rm -f $(PDF_FILE)
	@echo "✅ Dọn dẹp toàn bộ hoàn tất!"

# Kiểm tra lỗi LaTeX
check:
	@echo "🔍 Kiểm tra lỗi LaTeX..."
	@cd $(OUTPUT_DIR) && pdflatex -interaction=nonstopmode $(MAIN_FILE) | grep -i "error\|warning" || echo "✅ Không có lỗi nghiêm trọng!"

# Đếm số trang và từ (ước tính)
stats: pdf
	@echo "📊 Thống kê báo cáo:"
	@echo "📄 Số trang: $$(pdfinfo $(PDF_FILE) 2>/dev/null | grep "Pages" | awk '{print $$2}' || echo 'Không xác định')"
	@echo "📝 Dung lượng file: $$(du -h $(PDF_FILE) | cut -f1)"
	@echo "🔤 Ước tính số từ: $$(wc -w < $(MAIN_FILE) | xargs)"

# Hiển thị trợ giúp
help:
	@echo "🚀 Makefile cho dự án Smart Canteen AR Report"
	@echo ""
	@echo "Các lệnh khả dụng:"
	@echo "  make pdf      - Biên dịch file PDF (chạy 2 lần để cập nhật mục lục)"
	@echo "  make draft    - Biên dịch nhanh (chỉ 1 lần)"
	@echo "  make view     - Biên dịch và mở file PDF"
	@echo "  make clean    - Dọn dẹp file tạm thời (.aux, .log, .toc, etc.)"
	@echo "  make cleanall - Dọn dẹp toàn bộ (bao gồm file PDF)"
	@echo "  make check    - Kiểm tra lỗi LaTeX"
	@echo "  make stats    - Hiển thị thống kê báo cáo"
	@echo "  make help     - Hiển thị trợ giúp này"
	@echo ""
	@echo "📋 Ví dụ sử dụng:"
	@echo "  make          # Biên dịch file PDF"
	@echo "  make view     # Biên dịch và mở PDF"
	@echo "  make clean    # Dọn dẹp file tạm"
