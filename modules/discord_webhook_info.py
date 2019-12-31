#!/usr/bin/python
# -*- coding: utf-8 -*-

# Copyright: (c) 2019, James Tombleson <luther38@gmail.com>
# GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)

from __future__ import absolute_import, division, print_function

from ansible.module_utils._text import to_text
from ansible.module_utils.basic import AnsibleModule
from ansible.module_utils.urls import fetch_url
import json

ANSIBLE_METADATA = {
    'metadata_version': '1.0',
    'status': ['preview'],
    'supported_by': 'community'
}

DOCUMENTATION = '''
---
module: discord_webhook_info

short_description: This module returns information about a discord webhook.

version_added: "2.4"

description:
    - "This is my longer description explaining my test module"

options:
    webhook_url:
        description:
            - This defines where ansible will send the json payload for discord to intake.
        required: true    

author:
    - James Tombleson (github.com/luther38)
'''

EXAMPLES = '''
# Pass in a message
- name: Test with a message
  my_test:
    name: hello world

# pass in a message and have changed true
- name: Test with a message and changed output
  my_test:
    name: hello world
    new: true

# fail the module
- name: Test failure of the module
  my_test:
    name: fail me
'''

RETURN = '''
original_message:
    description: The original name param that was passed in
    type: str
    returned: always
message:
    description: The output message that the test module generates
    type: str
    returned: always
'''

def check_url(ansibleModule):
    pass

def main():
    module = AnsibleModule(
        argument_spec= dict(
            webhook_url     =dict(type='str', required=True)
        ),
        #supports_check_mode= True
    )

    #result = {}
    result = dict(
        changed=False,
        original_message='',
        message=''
    )

    #if module.check_mode:
    #    return result

    #headers = '{ "Content-Type": "application/json" }'
    url = module.argument_spec['webhook_url']

    resp, info = fetch_url(module=module, 
        url= url, 
        headers= { 'Content-Type': 'application/json'} ,
        method= 'GET')

    result['info'] = info
    result['resp'] = resp
    #body = resp.read()

    #module.fail_json(msg="status = %s" % ( status_code ))

    #if info['status'] != 200:
    #    module.fail_json(msg="Fail: Got wrong status code")

    try:
        resJson = resp.read()
    except AttributeError:
        resJson = info.pop('body', '')

    #return resJson, info
    #resJson, info = check_url(module)

    #result['result']

    #try:
    #    res = json.loads(resJson)
    #except ValueError:
    #    res = ''

    #result['info'] = info
    #result['msg'] = resJson
    
    #module.exit_json(changed=False, msg="hi")
    module.exit_json(**result)

    #run_module()

if __name__ == '__main__':
    main()