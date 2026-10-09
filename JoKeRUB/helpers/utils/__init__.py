from .events import *
from .extmod import *

# ربط ملف format.py بالاسم المطلوب _format
try:
    from . import format as _format
except Exception:
    try:
        from . import _format
    except Exception:
        _format = None

# ربط ملف catutils.py بالاسم المطلوب _catutils
try:
    from . import catutils as _catutils
except Exception:
    try:
        from . import _catutils
    except Exception:
        _catutils = None

# ربط ملف cattools.py بالاسم المطلوب _cattools
try:
    from . import cattools as _cattools
except Exception:
    try:
        from . import _cattools
    except Exception:
        _cattools = None

# تصدير الدوال العامة
try:
    from .format import *
    from .catutils import *
    from .cattools import *
except Exception:
    pass
