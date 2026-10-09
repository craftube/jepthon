# 1. استيراد الأحداث الأساسية
try:
    from .events import *
except Exception:
    pass

# 2. استيراد extmod بأمان في حال عدم وجوده
try:
    from .extmod import *
except Exception:
    pass

# 3. استيراد الموديولات الأساسية وتربيطها بأمان
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

# 4. تصدير كافة المحتويات
try:
    from .format import *
    from .catutils import *
    from .cattools import *
except Exception:
    pass
