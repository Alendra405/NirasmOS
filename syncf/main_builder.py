import os

combined_content = ""
list_file = 'syncf/newline.txt'

# چک کنیم اصلاً فایل لیست وجود داره؟
if not os.path.exists(list_file):
    print(f"sync file was not found!")
else:
    with open(list_file, 'r', encoding='utf-8') as f:
        lines = f.readlines()

    for line in lines:
        filename = line.strip()
        if not filename: 
            continue
        
        # بیایم ببینیم پایتون فایل رو می‌بینه یا نه
        if os.path.exists(filename):
            try:
                with open(filename, 'r', encoding='utf-8') as f:
                    content = f.read()
                    combined_content += content + "\n"
                    print(f"{filename} added!")
            except Exception as e:
                print(f"error : {e}")
        else:
            print(f"file was not found!")

# ذخیره نهایی
with open('syncf/kernel2.asm', 'w', encoding='utf-8') as output:
    output.write(combined_content)
print("kernel2.asm builded!")
