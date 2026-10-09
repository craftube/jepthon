import sys
import subprocess

# 1. استيراد الأحداث والأدوات الأساسية
try:
    from .events import *
except Exception:
    pass

try:
    from .extmod import *
except Exception:
    pass

# 2. ربط الموديولات الرئيسية
try:
    from . import format as _format
except Exception:
    try:
        from . import _format
    except Exception:
        _format = None

try:
    from . import catutils as _catutils
except Exception:
    try:
        from . import _catutils
    except Exception:
        _catutils = None

try:
    from . import cattools as _cattools
except Exception:
    try:
        from . import _cattools
    except Exception:
        _cattools = None

# 3. تصدير كافة المحتويات الداخلية
try:
    from .format import *
    from .catutils import *
    from .cattools import *
except Exception:
    pass

# 4. توفير دالة install_pip للبدائل في حال عدم وجودها
if "install_pip" not in globals():
    def install_pip(pip_name):
        try:
            subprocess.check_call([sys.executable, "-m", "pip", "install", pip_name])
            return True
        except Exception:
            return False

# 5. توفير دالة reply_id للبدائل
if "reply_id" not in globals():
    def reply_id(event):
        if hasattr(event, "reply_to_msg_id") and event.reply_to_msg_id:
            return event.reply_to_msg_id
        return None
