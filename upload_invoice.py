import pyautogui
import pyperclip
import time

# Wait for Windows Open dialog
time.sleep(3)

file_path = r"C:\Users\dell\PycharmProjects\PythonProject1\Invoices\invoice.pdf"

pyperclip.copy(file_path)

# Paste file path into File name field
pyautogui.hotkey('ctrl', 'v')

# Click Open
pyautogui.press('enter')