import os
import sys
import runpy

# تفعيل nest_asyncio لحل مشكلة الـ Event Loop
try:
    import nest_asyncio
    nest_asyncio.apply()
except Exception:
    pass

current_dir = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, current_dir)

print("=" * 40)
print(f"Starting bot from directory: {current_dir}")
print("=" * 40)

try:
    runpy.run_module("JoKeRUB", run_name="__main__")
except Exception as e:
    print(f"Error starting module: {e}")
    
