"""
Run this module to debug a plugin.
"""
from mkdocs.commands import serve

serve.serve(dev_addr="localhost:44555", livereload=True)
