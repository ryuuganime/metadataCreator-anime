#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from dotenv import load_dotenv as lenv
from mediawiki import MediaWiki
import json as j
import os
import sys

# Load .env file
lenv()

# grab this script name
script_name = os.path.basename(__file__)

# from env, import translation file
lang = os.getenv('LANGUAGE')
with open(f'./Languages/{lang}/{script_name}.json', 'r') as f:
	trl = j.load(f)


# create a function to get translation string from json file
def _(string: str):
	return trl[string]


lets = {
	'query': None,
	'lang': 'en'
}


# Read arguments, contains the search query and the language
def main(argv):
	for index, arg in enumerate(argv):
		if arg == '-q' or arg == '-Query' or arg == '-query':
			lets['query'] = argv[index + 1]
		elif arg == '-l' or arg == '-Language' or arg == '-language':
			lets['lang'] = argv[index + 1]
		elif arg == '-h' or arg == '-Help' or arg == '-help':
			print(f'''{_('help_usage')} python3 wikipedia.py [OPTIONS]

{_('help_options')}
	-q, -Query <str>	{_('help_option_query')}
	-l, -Language <str>	{_('help_option_language')}
	-h, -Help		{_('help_option_help')}''')
			sys.exit(0)

	if len(argv) == 1:
		# if argument is not provided, exit
		raise SystemExit(_('error_no_argument'))

	# if query is not provided, exit
	if (lets['query'] == None):
		raise SystemExit(_('error_no_query'))
	else:
		grab_summary(lets['query'], lets['lang'])


def grab_summary(q: str, l: str):
	# get the summary
	wikipedia = MediaWiki(user_agent=os.getenv('MEDIAWIKI_USER_AGENT'), lang=l)
	summary: str = ''
	try:
		search = wikipedia.search(query=q, results=1)
		summary = wikipedia.summary(search[0])
	except:
		raise SystemExit(_('error_page_not_found'))

	# print the summary
	print(summary.replace('\n', '\n\n'))


if __name__ == '__main__':
	main(sys.argv)
