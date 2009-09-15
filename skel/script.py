#!/usr/bin/env python
# -*- coding: utf-8 -*-


"""\
usage: %prog [options]
"""


import atexit
import datetime
import logging
import optparse
import os
import sys
import time


__version__ = '0.0'


LOG_FORMAT = (
    '%(asctime)s [%(levelname)s] %(name)s : %(message)s'
    )
LOG_LEVELS = {
    'very-quiet': logging.CRITICAL,
    'quiet': logging.WARNING,
    'normal': logging.INFO,
    'verbose': logging.DEBUG,
    }

if sys.platform == 'win32':
    timer = time.clock
else:
    timer = time.time


def parse_args(argv):
    """\
    This parses the command-line arguments in argv and returns a tuple
    containing the options and other arguments.

    """

    op = optparse.OptionParser(usage=__doc__, version='%prog '+__version__)
    op.add_option('--log-dest', action='store', dest='log_file',
                  default='STDOUT',
                  help='The name of the file to send log messages to. '
                       '"STDOUT" will print to the screen. Default=%default.')
    op.add_option('--log-level', action='store', dest='log_level',
                  choices=LOG_LEVELS.keys(), default='normal',
                  help='The level of logging information to output. Valid '
                       'choices are "quiet", "normal", and "verbose". '
                       'Default="%default".')
    (opts, args) = op.parse_args(argv)
    return (opts, args)


def setup_logging(opts):
    """\
    This sets up the logging system, based on the values in opts. Specifically,
    this looks for the log_file and log_level attributes on opts.

    """

    args = {}
    if opts.log_file == 'STDOUT':
        args['stream'] = sys.stdout
    else:
        args['filename'] = opts.log_file
    logging.basicConfig(
        level=LOG_LEVELS[opts.log_level],
        format=LOG_FORMAT,
        **args
        )
    atexit.register(logging.shutdown)


def main(argv=None):
    (opts, args) = parse_args(argv or sys.argv[1:])
    setup_logging(opts)
    try:
        start = timer()

        # TODO: implement functionality here
        logging.info('hello, world!')

        end = timer()
        logging.info('done')
        logging.info('elapsed time: %s', datetime.timedelta(seconds=end-start))
    except SystemExit:
        return 0
    except KeyboardInterrupt:
        logging.warning('KeyboardInterrupt')
        return 2
    except:
        logging.exception('ERROR')
        return 1
    else:
        return 0


if __name__ == '__main__':
    sys.exit(main())

