import os
import hashlib
import requests
from datetime import datetime

import boto3


HOTHAM_TICKETS_ADDRESS = 'https://www.mthotham.com.au/lift-pass/lift-tickets/search-and-book'
DYNAMODB_TABLE_NAME = os.getenv('DYNAMODB_TABLE_NAME', 'cy-aws-hotham-alert')


def write_hash_to_ddb(table, content_hash):
    table = boto3.resource('dynamodb').Table(table)
    print(f'Writing {content_hash} to {table}')
    table.put_item(Item={'ScanDatetime': str(datetime.now()), 'ContentHash': content_hash})


def handler(event, context):
    # get page content
    resp = requests.get(HOTHAM_TICKETS_ADDRESS)

    # remove content which is not deterministic
    lines = [line for line in resp.text.split('\n') if not ('__VIEWSTATE' in line or '__EVENTVALIDATION' in line)]

    # hash content
    content_hash = hashlib.sha256('\n'.join(lines).encode('utf-8')).hexdigest()

    # write hash to dynamodb
    write_hash_to_ddb(DYNAMODB_TABLE_NAME, content_hash)


if __name__ == '__main__':
    handler({}, {})
