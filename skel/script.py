#!/usr/bin/env python
# -*- coding: utf-8 -*-


"""\
usage: %prog [options]
"""


import argparse
import atexit
import datetime
import logging
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
LOG_LEVEL_KEYS = [ 'very-quiet', 'quiet', 'normal', 'verbose' ]

if sys.platform == 'win32':
    timer = time.clock
else:
    timer = time.time


def parse_args(argv):
    """\
    This parses the command-line arguments in argv and returns a tuple
    containing the options and other arguments.

    """

    ap = argparse.ArgumentParser(
            description=__doc__,
            fromfile_prefix_chars='@',
            )

    ap.add_argument('--log-dest', action='store', dest='log_file',
                    default='STDERR',
                    help='The name of the file to send log messages to. '
                         '"STDOUT" and "STDERR" will print to the screen. '
                         'Default=%(default)s.')
    ap.add_argument('--log-level', action='store', dest='log_level',
                    choices=LOG_LEVEL_KEYS, default='normal',
                    help='The level of logging information to output. Valid '
                         'choices are "quiet", "normal", and "verbose". '
                         'Default="%(default)s".')

    args = ap.parse_args(argv)
    return args


def setup_logging(opts):
    """\
    This sets up the logging system, based on the values in opts. Specifically,
    this looks for the log_file and log_level attributes on opts.

    """

    logging.basicConfig()
    logger = logging.getLogger()
    logger.setLevel(LOG_LEVELS[opts.log_level])
    if opts.log_file == 'STDOUT' or opts.log_file == '-':
        handler = logging.StreamHandler(sys.stdout)
    elif opts.log_file == 'STDERR':
        handler = logging.StreamHandler(sys.stderr)
    else:
        handler = logging.FileHandler(opts.log_file)
    handler.setFormatter(logging.Formatter(LOG_FORMAT))
    logger.addHandler(handler)
    atexit.register(logging.shutdown)


def main(argv=None):
    args = parse_args(argv or sys.argv[1:])
    setup_logging(args)
    try:
        start = timer()

        # TODO: implement functionality here
        logging.info('hello, world!')

        end = timer()
        logging.info('done')
        logging.info('elapsed time: %s', datetime.timedelta(seconds=end-start))
    except SystemExit, exit:
        return exit.code
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

