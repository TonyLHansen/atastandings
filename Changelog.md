# 2025/05/03:
## Added
- add `--top`, paired with `--district` and/or `--state` and `--maximum-place` gives top students across the given districts and states
- add `--request-interval`
- add `--all-us`
- add `--all-canada`
## Changed
- tweak error messages
- `--use-web-standings-dates` does not re-download first file if the file is < 5 minutes old

# 2025/04/28:
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
