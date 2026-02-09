#!/usr/bin/env python3

"""
Convert old cache names to new cache names, or vice versa.
Generate a shell script to do the renaming or (with -R) do the renames directly.

Samples:

Old cache name:
   atastandings.httpsatamartialartscomeventstournamentstandingsstatestandingscountryUSstategacodeBCOC
   atastandings.httpsatamartialartscomeventstournamentstandingsworldsstandingscountryUScodeBCOC
New cache name:
   atastandings.state_2dstandings_2f_3fcountry_3dUS_26state_3dga_26code_3dBCOC.bz2
   atastandings.worlds_2dstandings_2f_3fcountry_3dUS_26code_3dBCOC.bz2
"""

import os
import re
import sys
import argparse


PAT_OLD_TO_NEW = re.compile(r'(.*/)?atastandings\.httpsatamartialartscomeventstournamentstandings'
                         r'(statestandings|worldsstandings)(?:country(..))?((state)(..))?(?:code([A-Za-z0-9]{4,6}))?(\.bz2|\.gz)?$')


def old_to_new_map(fname: str, outdir: str | None = None) -> str | None:
    """Map an old-style cache name (optionally with a path prefix) to the new name.

    Returns the new filename (including preserved directory prefix) or None when no match.
    """
    m = PAT_OLD_TO_NEW.match(fname)
    if not m:
        return None
    prefix = m.group(1) or ""
    # if an output directory was provided, use it instead of the input dirname
    if outdir:
        prefix = outdir if outdir.endswith('/') else outdir + '/'
    kind = m.group(2)
    country = m.group(3)
    state = m.group(6)
    code = m.group(7)
    # preserve extension from the old name (including leading dot, e.g. '.bz2' or '.gz', or '')
    ext = m.group(8) or ''
    # construct new-kind with _2d inserted (e.g. state_2dstandings)
    if kind == "statestandings":
        new_kind = "state_2dstandings"
    elif kind == "worldsstandings":
        new_kind = "worlds_2dstandings"
    else:
        return None

    if kind == "statestandings":
        # statestandings require country and state
        if not country or not state:
            return None
        # include code part only if present
        code_part = f"_26code_3d{code}" if code else ""
        return f"{prefix}atastandings.{new_kind}_2f_3fcountry_3d{country}_26state_3d{state}{code_part}{ext}"
    else:
        # world standings never include a country token in the new name; always omit it
        # include code part only if present
        if code:
            return f"{prefix}atastandings.{new_kind}_2f_3fcode_3d{code}{ext}"
        # if there's no code, emit only the trailing _2f marker (no _3f)
        return f"{prefix}atastandings.{new_kind}_2f{ext}"
    return None


PAT_NEW_TO_OLD = re.compile(r'atastandings\.(.*)$')

def new_to_old_map(fname: str, outdir: str | None = None) -> str | None:
    """
    Map a new-style cache name (optionally with a path prefix) back to the old name.
    Use os.path.dirname and os.path.basename to preserve the directory prefix, but only operate on the basename for the mapping.
    Do not use a regular expression replacement here, since the old name is not a simple transformation of the new name.
    Keep the prefix "atastandings.", add "httpsatamartialartscomeventstournamentstandings",
    then add the rest of the string but removing "_XX" (underscore followed by 2 hex digits).

    Returns the old filename (including preserved directory prefix) or None when no match.
    """
    
    dirname = outdir if outdir else os.path.dirname(fname)
    basename = os.path.basename(fname)
    
    m = PAT_NEW_TO_OLD.match(basename)
    if not m:
        return None
    rest = m.group(1)
    # in the rest, remove _XX for hex XX, and __ -> literal underscore
    decoded = []
    i = 0
    while i < len(rest):
        if rest[i] == '_':
            if i + 1 < len(rest) and rest[i + 1] == '_':
                decoded.append('_')
                i += 2
            elif i + 2 < len(rest) and all(c in "0123456789abcdefABCDEF" for c in rest[i+1:i+3]):
                # remove the underscore and the two-hex digits (_XX)
                i += 3
                # skip the hex escape entirely (do not append any character)
            else:
                decoded.append('_')
                i += 1
        else:
            decoded.append(rest[i])
            i += 1

    decoded_str = ''.join(decoded)
    # keep decoded string as-is (no character stripping)
    cleaned = decoded_str

    old = f"atastandings.httpsatamartialartscomeventstournamentstandings{cleaned}"
    if dirname:
        old = f"{dirname}/{old}"

    return old


def process_old_to_new(filenames, do_rename=False, outdir=None):
    for fname in filenames:
        new = old_to_new_map(fname, outdir)
        if new:
            if do_rename:
                try:
                    os.rename(fname, new)
                    print(f"renamed {fname} -> {new}")
                except OSError as e:
                    print(f"# rename-failed: {fname} -> {new}: {e}", file=sys.stderr)
            else:
                print(f"mv {fname} {new}")
        else:
            print(f"# no-old_to_new-match: {fname}", file=sys.stderr)


def process_new_to_old(filenames, do_rename=False, outdir=None):
    for fname in filenames:
        old = new_to_old_map(fname, outdir)
        if old:
            if do_rename:
                try:
                    os.rename(fname, old)
                    print(f"renamed {fname} -> {old}")
                except OSError as e:
                    print(f"# rename-failed: {fname} -> {old}: {e}", file=sys.stderr)
            else:
                print(f"mv {fname} {old}")
        else:
            print(f"# no-new_to_old-match: {fname}", file=sys.stderr)


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('files', nargs='+', help='Files to map/rename')
    parser.add_argument('-N', '--new-to-old', action='store_true', help='Map new names back to old names')
    parser.add_argument('-R', '--rename', action='store_true', help='Actually rename files instead of printing mv commands')
    parser.add_argument('-o', '--output-directory', help='Directory to place mapped files into instead of preserving input directories')
    args = parser.parse_args(argv)

    if args.new_to_old:
        process_new_to_old(args.files, args.rename, args.output_directory)
    else:
        process_old_to_new(args.files, args.rename, args.output_directory)


if __name__ == '__main__':
    main()
