import vim 
from urllib.parse import urljoin, uses_relative, uses_netloc
uses_relative.append('gemini')
uses_netloc.append('gemini')

def resolve(path, base=None):
    if base is None:
        base = vim.eval('@%')
        base = vim.current.buffer.vars.get('netfind_basehref', base)
    return urljoin(base, path)
