import pyautogui
import time
from datetime import datetime, time as dt_time

def minimize_window():
    pyautogui.hotkey('win', 'down')
    
def move_mouse_between_times(start_time, end_time, interval):
    try:
        minimize_window()
        while True:
            now = datetime.now().time()
            if start_time <= now <= end_time:
                # Move the mouse to the right
                pyautogui.moveRel(5, 0, duration=0.5)
                # Move the mouse to the left
                pyautogui.moveRel(-5, 0, duration=0.5)
                # Move the mouse up
                pyautogui.moveRel(0, -50, duration=0.5)
                # Move the mouse down
                pyautogui.moveRel(0, 50, duration=0.5)

            # Wait for the specified interval (in seconds) before moving again
            time.sleep(interval)

    except KeyboardInterrupt:
        print("\nProgram terminated by user.")

if __name__ == "__main__":
    start_time = dt_time(8, 0)      # 08:00 AM
    end_time = dt_time(23, 30)      # 23:30 PM
    interval = 10                   # 10 seconds

    print(f"Moving the mouse every {interval} seconds between {start_time.strftime('%H:%M')} and {end_time.strftime('%H:%M')} CEST.")
    move_mouse_between_times(start_time, end_time, interval)