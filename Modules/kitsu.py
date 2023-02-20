#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from dotenv import load_dotenv as lenv
import json as j
import os
import sys
import kitsupy

# Load .env file
lenv()

# Create dummy variables
ids = None

# grab this script name
script_name = os.path.basename(__file__)

# from env, import translation file
lang = os.getenv('LANGUAGE')
with open(f'./Languages/{lang}/{script_name}.json', 'r') as f:
	trl = j.load(f)


# create a function to get translation string from json file
def _(string: str):
	return trl[string]


def main(argv):
	for index, arg in enumerate(argv):
		if arg == '-h' or arg == '-Help' or arg == '-help':
			print(f'''{_('help_usage')} python3 kitsu.py [OPTIONS]

{_('help_description')}
{_('description')}

{_('help_options')}
	-h, -Help		{_('help_option_help')}
	-i, -Id <int>		{_('help_option_id')}''')
			sys.exit(0)
		elif arg == '-i' or arg == '-Id' or arg == '-id':
			ids = argv[index + 1]

	if len(argv) == 1:
		# if argument is not provided, exit
		raise SystemExit(_('error_no_argument'))

	# if query is not provided, exit
	if (ids is None):
		raise SystemExit(_('error_no_id'))
	else:
		grab_json(ids)

def grab_json(kitsuId: int):
	try:
		kitsu = kitsupy.get_info
		data = kitsu('anime', id=kitsuId)
		json = j.dumps(data)
		print(json)
	except Exception:
		raise SystemExit(_('error_no_result'))

if __name__ == '__main__':
	main(sys.argv)
