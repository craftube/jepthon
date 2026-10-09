from .utils.extdl import install_pip

try:
    import randomstuff
except ModuleNotFoundError:
    install_pip("randomstuff.py")
    import randomstuff

from ..Config import Config

try:
    rs_client = randomstuff.AsyncClient(api_key=getattr(Config, "RANDOM_STUFF_API_KEY", None), version="4")
except Exception:
    rs_client = None
