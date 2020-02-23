#!/usr/bin/env python

# source: http://www.dasblinkenlichten.com/creating-ansible-filter-plugins/
class FilterModule(object):
    def filters(self):
        return {
            'be_jinja_console_log': self.be_jinja_console_log
        }

    def be_jinja_console_log(self, a_text):
        print text
        return ''
