import sys

from lxml.etree import tostring
from lxml.objectify import enable_recursive_str, fromstring

with open("/home/julian/.config/syncthing/config.xml", encoding="utf-8") as f:
    obj = fromstring(f.read())

folder_to_remove = obj.xpath(f'//folder[@path = "{sys.argv[1]}"]')[0]
obj.remove(folder_to_remove)

enable_recursive_str(True)
with open("/home/julian/.config/syncthing/config.xml", mode="w", encoding="utf-8") as f:
    f.write(tostring(obj, pretty_print=True, encoding="utf-8").decode("utf-8"))
