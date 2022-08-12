"""
Utility to convert examples from one format to another.

Example:
python convert.py to-yaml ../docs/timeline/timeline-1.json ../docs/timeline/timeline-1.yaml
"""
import json
import re
import sys
from typing import Optional

import click
import yaml
from essentials.json import dumps as friendly_json_dumps

_YAML_EXT = re.compile(r"\.ya?ml$", re.IGNORECASE)
_JSON_EXT = re.compile(r"\.json$", re.IGNORECASE)


def read_text_file(file_path: str) -> str:
    with open(file_path, "rt", encoding="utf8") as source_file:
        return source_file.read()


def write_text_file(file_path: str, contents: str):
    with open(file_path, "wt", encoding="utf8") as dest_file:
        dest_file.write(contents)


@click.group()
def convert():
    pass


@click.command("to-json")
@click.argument("source")
@click.argument("destination", required=False)
def yaml_to_json(source: str, destination: Optional[str]):
    if _YAML_EXT.search(source):
        contents = read_text_file(source)
        data = yaml.safe_load(contents)
        output = friendly_json_dumps(data, indent=4, ensure_ascii=False)
        if destination:
            write_text_file(destination, output)
        else:
            print(output)
    else:
        click.echo(f'Unsupported source: "{source}"')
        sys.exit(1)


@click.command("to-yaml")
@click.argument("source")
@click.argument("destination", required=False)
def json_to_yaml(source: str, destination: Optional[str]):
    if _JSON_EXT.search(source):
        contents = read_text_file(source)
        data = json.loads(contents)
        if destination:
            write_text_file(destination, yaml.dump(data))
        else:
            print(yaml.dump(data))
    else:
        click.echo(f'Unsupported source: "{source}"')
        sys.exit(1)


convert.add_command(yaml_to_json)
convert.add_command(json_to_yaml)


if __name__ == "__main__":
    convert()
