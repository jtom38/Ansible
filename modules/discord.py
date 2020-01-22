#!/usr/bin/python
# -*- coding: utf-8 -*-

# Copyright: (c) 2019, James Tombleson <luther38@gmail.com>
# GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)



from ansible.module_utils.basic import AnsibleModule
from ansible.module_args.urls import fetch_url
import json

ANSIBLE_METADATA = {
    'metadata_version': '1.0',
    'status': ['preview'],
    'supported_by': 'community'
}

DOCUMENTATION = '''
---
module: discord_webhook

short_description: This module sends messages to a discord webhook.

version_added: "2.4"

description:
    - "This is my longer description explaining my test module"

options:
    webhook_url:
        description:
            - This defines where ansible will send the json payload for discord to intake.
        required: true
    content:
        description:
            - This defines the message that will be presented within the payload.
        required: true
    
    username:
        description:
            - This will allow you to overwrite the default webhook name.  
            - Useful for when different services use the same webhook.
        required: false
    
    avatar_url:
        description:
            - Add a URL here if you want to overwrite the default avatar image configured on the webhook.
        required: false
    

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


def run_module():
    # define available arguments/parameters a user can pass to the module


    # seed the result dict in the object
    # we primarily care about changed and state
    # change is if this module effectively modified the target
    # state will include any data that you want your module to pass back
    # for consumption, for example, in a subsequent task
    result = dict(
        changed=False,
        original_message='',
        message=''
    )

    # the AnsibleModule object will be our abstraction working with Ansible
    # this includes instantiation, a couple of common attr would be the
    # args/params passed to the execution, as well as if the module
    # supports check mode
    module = AnsibleModule(
        argument_spec=module_args,
        supports_check_mode=True
    )

    # if the user is working with this module in only check mode we do not
    # want to make any changes to the environment, just return the current
    # state with no modifications
    if module.check_mode:
        module.exit_json(**result)

    # manipulate or modify the state as needed (this is going to be the
    # part where your module will do what it needs to do)
    result['original_message'] = module.params['name']
    result['message'] = 'goodbye'

    # use whatever logic you need to determine whether or not this module
    # made any modifications to your target
    if module.params['new']:
        result['changed'] = True

    # during the execution of the module, if there is an exception or a
    # conditional state that effectively causes a failure, run
    # AnsibleModule.fail_json() to pass in the message and the result
    if module.params['name'] == 'fail me':
        module.fail_json(msg='You requested this to fail', **result)

    # in the event of a successful module execution, you will want to
    # simple AnsibleModule.exit_json(), passing the key/value results
    module.exit_json(**result)

def basic(ansibleModule):

    headers = '{ "Content-Type": "application/json" }'
    payload = {
        'content': ansibleModule.argument_spec['content']
    }
    resp, info = fetch_url(
        module=payload, 
        url= ansibleModule.argument_spec['webhook_url'], 
        headers= json.loads(headers), 
        method='GET')

    if info['status'] != 204:
        ansibleModule.fail_json(msg="Fail: ")
    
    pass

def main():
    module = AnsibleModule(
        argument_spec= dict(
            webhook_url     =dict(type='str', required=True),
            content         =dict(type='str', required=True),
            username        =dict(type='str', required=False),
            avatar_url      =dict(type='str', required=False)
        ),
        supports_check_mode= True
    )

    result = dict(
        changed= False,
        original_message= '',
        message= ''
    )

    if module.check_mode:
        return result

    basic(module)    

    #run_module()

if __name__ == '__main__':
    main()