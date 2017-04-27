from os import chmod

def load(path, mode='rb'):
    with open (path, mode) as file:
        from pickle import load
        return load(file)

def dump(path, obj, mode='wb'):
    with open (path, mode) as file:
        from pickle import dump
        return dump(obj, file)

def read(path, mode='r'):
    with open (path, mode) as file:
        return file.read()

def readline(path, mode='r'):
    with open (path, mode) as file:
        yield from file.readline()

def write(path, content, mode='w', executable=False):
    with open (path, mode) as file:
        file.write(content)
    if executable:
        chmod(path, 0o755)

def append(path, content, mode='a'):
    with open (path, mode) as file:
        file.write(content)
