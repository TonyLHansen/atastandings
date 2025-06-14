# 2025/06/11: 2026.06.10
## Added
- allow "," to be used with -c/--division-code
## Changed
- add "or with commas" to the descriptions of options that allow comma lists
# 2025/05/03: 2025.05.03.1
## Changed
- make `--use-web-standings-dates` the default caching algorithm
- rename `--ignore-cache-times` to `--ignore-cache` (`--ignore-cache-times` is still an alias as an option, but not in the configuration file)
- removed `--all-states` and `--all-provinces`, made `--all-us` and `--all-canada` non-exclusive
## Add
- add `--use-time-based-cache` to force time-based caching

# 2025/05/03: 2025.05.03.0
## Added
- add `--top`, paired with `--district` and/or `--state` and `--maximum-place` gives top students across the given districts and states
- add `--request-interval`
- add `--all-us`
- add `--all-canada`
## Changed
- tweak error messages
- `--use-web-standings-dates` does not re-download first file if the file is < 5 minutes old

# 2025/04/28: 2025.04.28.0
## Added
- add first cut at `--output-json`
- add options `--connection-count` and `--retry-interval`
- add ATASTANDINGS environnment variable
- list support for `--minimize` and `--competition`, `--omit`, state and district lists, as in `--competition 'forms,weapons'` or `--state 'NJ,CA'`
- add option `--offline` that only uses what is cached
- support gzip'd or bzip2'd cache
- add option `--bzip2-cache`
- add option `--gzip-cache`
- add option `--use-web-standings-dates` to base the cache on the 'standings updated on mm/dd/yyyy' value
- add option `--update-cache`
- add option `--all-districts`
- add option `--all-state`
- add `--no-` option for '--no-bzip2-cache', '--no-dots', '--no-gzip-cache' or '--no-offline'.

# Changed
- switch to httpx
