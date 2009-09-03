#!/usr/bin/env python


from distutils.core import setup
from distutils.core import Extension


setup(
    name='NAME',
    version='0.0',
    description='DESCRIPTION',
    author='AUTHOR',
    author_email='EMAIL',
    url='NA',

    py_modules=[],
    ext_modules=[
        Extension('foo', ['foo.c'], include_dirs=[], libraries=[], library_dirs=[]),
        ],

    packages=[
        ],
    package_data={
        'bar': ['bar/*.dat'],
        },

    scripts=[],
    data_files=[
        # target-dir is relative to sys.prefix
        ('target-dir', ['file/list']),
        ],

    )

