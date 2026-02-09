import importlib.util
import os


HERE = os.path.dirname(__file__)
MODULE_PATH = os.path.join(os.path.dirname(HERE), 'cachename-rename.py')

spec = importlib.util.spec_from_file_location('cmod', MODULE_PATH)
mod = importlib.util.module_from_spec(spec)
spec.loader.exec_module(mod)

# Shared examples and expected values
OLD_EX = 'atastandings.httpsatamartialartscomeventstournamentstandingsstatestandingscountryUSstategacodeBCOC'
NEW_EX = 'atastandings.state_2dstandings_2f_3fcountry_3dUS_26state_3dga_26code_3dBCOC'
PREFIX = 'dir/sub'
OUTDIR = 'otherdir'
EXPECTED_NEW = NEW_EX
# expected old name (use `OLD_EX` directly as the canonical base)
EXPECTED_OLD = OLD_EX
EXPECTED_OLD_GZ = OLD_EX + '.gz'

# Variants
OLD_EX_GZ = OLD_EX + '.gz'
NEW_EX_GZ = NEW_EX + '.gz'
EXPECTED_NEW_GZ = EXPECTED_NEW + '.gz'

# bz2 variants
OLD_EX_BZ = OLD_EX + '.bz2'
NEW_EX_BZ = NEW_EX + '.bz2'
EXPECTED_NEW_BZ = EXPECTED_NEW + '.bz2'
EXPECTED_OLD_BZ = EXPECTED_OLD + '.bz2'

# worlds samples (no country)
OLD_WORLD = 'atastandings.httpsatamartialartscomeventstournamentstandingsworldsstandingscodeBCOC'
NEW_WORLD = 'atastandings.worlds_2dstandings_2f_3fcode_3dBCOC'
EXPECTED_NEW_WORLD = NEW_WORLD
EXPECTED_OLD_WORLD_BASE = OLD_WORLD
EXPECTED_OLD_WORLD = EXPECTED_OLD_WORLD_BASE

# worlds bz2 variants
OLD_WORLD_BZ = OLD_WORLD + '.bz2'
NEW_WORLD_BZ = NEW_WORLD + '.bz2'
EXPECTED_NEW_WORLD_BZ = EXPECTED_NEW_WORLD + '.bz2'
EXPECTED_OLD_WORLD_BZ = EXPECTED_OLD_WORLD_BASE + '.bz2'

# 5-character code examples
OLD_EX_5 = 'atastandings.httpsatamartialartscomeventstournamentstandingsstatestandingscountryUSstatemicodeB123A'
OLD_EX_5_BZ = OLD_EX_5 + '.bz2'
NEW_EX_5 = 'atastandings.state_2dstandings_2f_3fcountry_3dUS_26state_3dmi_26code_3dB123A'
NEW_EX_5_BZ = NEW_EX_5 + '.bz2'
EXPECTED_NEW_5_BZ = NEW_EX_5_BZ
EXPECTED_OLD_5_BZ = OLD_EX_5_BZ

OLD_WORLD_5 = 'atastandings.httpsatamartialartscomeventstournamentstandingsworldsstandingscodeB123A'
OLD_WORLD_5_BZ = OLD_WORLD_5 + '.bz2'
NEW_WORLD_5 = 'atastandings.worlds_2dstandings_2f_3fcode_3dB123A'
NEW_WORLD_5_BZ = NEW_WORLD_5 + '.bz2'
EXPECTED_NEW_WORLD_5_BZ = NEW_WORLD_5_BZ
EXPECTED_OLD_WORLD_5_BZ = OLD_WORLD_5_BZ

# no-code pair
OLD_NO_CODE = 'atastandings.httpsatamartialartscomeventstournamentstandingsstatestandingscountryUSstatect'
NEW_NO_CODE = 'atastandings.state_2dstandings_2f_3fcountry_3dUS_26state_3dct'
# worlds short-form example (no _3f)
OLD_WORLD_SHORT = 'atastandings.httpsatamartialartscomeventstournamentstandingsworldsstandings.bz2'
NEW_WORLD_SHORT = 'atastandings.worlds_2dstandings_2f.bz2'

# code variant: BCOC -> WYXZ
OLD_EX_CODE = OLD_EX.replace('BCOC', 'WYXZ')
NEW_EX_CODE = NEW_EX.replace('BCOC', 'WYXZ')
EXPECTED_NEW_CODE = EXPECTED_NEW.replace('BCOC', 'WYXZ')
# expected old code variant
EXPECTED_OLD_CODE = EXPECTED_OLD.replace('BCOC', 'WYXZ')

# state variant: ga -> tx
OLD_EX_STATE = OLD_EX.replace('ga', 'tx')
NEW_EX_STATE = NEW_EX.replace('_26state_3dga', '_26state_3dtx')
EXPECTED_NEW_STATE = EXPECTED_NEW.replace('_26state_3dga', '_26state_3dtx')
EXPECTED_OLD_STATE = EXPECTED_OLD.replace('statega', 'statetx')


def test_old_to_new_statestandings():
    assert mod.old_to_new_map(OLD_EX) == EXPECTED_NEW


def test_old_to_new_with_path_prefix():
    assert mod.old_to_new_map(PREFIX + '/' + OLD_EX) == PREFIX + '/' + EXPECTED_NEW


def test_new_to_old_statestandings_comment_example():
    assert mod.new_to_old_map(NEW_EX) == EXPECTED_OLD


def test_new_to_old_with_path_prefix():
    assert mod.new_to_old_map(PREFIX + '/' + NEW_EX) == PREFIX + '/' + EXPECTED_OLD


def test_old_to_new_gz_preserved():
    # old names may include .gz; mapping should preserve the extension into the new name
    assert mod.old_to_new_map(OLD_EX_GZ) == EXPECTED_NEW_GZ


def test_new_to_old_gz():
    assert mod.new_to_old_map(NEW_EX_GZ) == EXPECTED_OLD_GZ


def test_old_to_new_bz_preserved():
    assert mod.old_to_new_map(OLD_EX_BZ) == EXPECTED_NEW_BZ


def test_new_to_old_bz():
    assert mod.new_to_old_map(NEW_EX_BZ) == EXPECTED_OLD_BZ


def test_old_to_new_code_variant():
    assert mod.old_to_new_map(OLD_EX_CODE) == EXPECTED_NEW_CODE


def test_new_to_old_code_variant():
    assert mod.new_to_old_map(NEW_EX_CODE) == EXPECTED_OLD_CODE


def test_old_to_new_state_variant():
    assert mod.old_to_new_map(OLD_EX_STATE) == EXPECTED_NEW_STATE


def test_new_to_old_state_variant():
    assert mod.new_to_old_map(NEW_EX_STATE) == EXPECTED_OLD_STATE


def test_old_to_new_worlds():
    assert mod.old_to_new_map(OLD_WORLD) == EXPECTED_NEW_WORLD


def test_new_to_old_worlds():
    assert mod.new_to_old_map(NEW_WORLD) == EXPECTED_OLD_WORLD


def test_old_to_new_worlds_bz():
    assert mod.old_to_new_map(OLD_WORLD_BZ) == EXPECTED_NEW_WORLD_BZ


def test_new_to_old_worlds_bz():
    assert mod.new_to_old_map(NEW_WORLD_BZ) == EXPECTED_OLD_WORLD_BZ


def test_old_to_new_5char_state_bz():
    assert mod.old_to_new_map(OLD_EX_5_BZ) == EXPECTED_NEW_5_BZ


def test_new_to_old_5char_state_bz():
    assert mod.new_to_old_map(NEW_EX_5_BZ) == EXPECTED_OLD_5_BZ


def test_old_to_new_5char_world_bz():
    assert mod.old_to_new_map(OLD_WORLD_5_BZ) == EXPECTED_NEW_WORLD_5_BZ


def test_new_to_old_5char_world_bz():
    assert mod.new_to_old_map(NEW_WORLD_5_BZ) == EXPECTED_OLD_WORLD_5_BZ


def test_old_to_new_no_code():
    assert mod.old_to_new_map(OLD_NO_CODE) == NEW_NO_CODE


def test_new_to_old_no_code():
    assert mod.new_to_old_map(NEW_NO_CODE) == OLD_NO_CODE


def test_old_to_new_world_short_form():
    assert mod.old_to_new_map(OLD_WORLD_SHORT) == NEW_WORLD_SHORT


def test_new_to_old_world_short_form():
    assert mod.new_to_old_map(NEW_WORLD_SHORT) == OLD_WORLD_SHORT


def test_old_to_new_with_outdir():
    expected = os.path.join(OUTDIR, os.path.basename(EXPECTED_NEW))
    assert mod.old_to_new_map(PREFIX + '/' + OLD_EX, OUTDIR) == expected


def test_new_to_old_with_outdir():
    expected = os.path.join(OUTDIR, os.path.basename(EXPECTED_OLD))
    assert mod.new_to_old_map(PREFIX + '/' + NEW_EX, OUTDIR) == expected
