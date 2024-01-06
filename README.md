# OpenFreeMap Styles

This repo contains the forks of the following styles:

**Bright** - forked from https://github.com/openmaptiles/osm-bright-gl-style

**Liberty** - forked from https://github.com/maputnik/osm-liberty

**Positron** - forked from https://github.com/openmaptiles/positron-gl-style

**Dark** - forked from https://github.com/openmaptiles/dark-matter-gl-style

All the OpenMapTiles styles (Bright, Positron, Dark) are abandoned by their upstream project.

Liberty is still fresh and alive. 

The long term goal of this project is to maintain a consistent style across these forks. A possibility is to make 4 new styles from scratch by picking the best parts of each style.

Work is being done to make **Bright**, **Liberty** and **Positron** consistent. 

The following is done, meaning they are identical, only differing in colors.

- all labels and text fields (water, roads, cities)
- country and administrative borders
- POIs

**Positron**, as a special clean looking style also has POIs removed and some highway labels set to show at higher zooms only.

**Dark** is currently put on hold, it's very different from the rest. I think a better approach would be to try to invert Positron in a fitting color space.



### Compare

Part of this repo is a compare web app. Currently it works on localhost, but in the future there'll be a web hosted version with a nicer GUI. The point of compare is to compare different styles and different data sources.



### Scripts

- **lint_styles.py** - removes unnecessary keys, runs gl-style-migrate, does recursive JSON sorting, outputs using gl-style-format and runs gl-style-validate
- **copy_text_fields.py** - copies all text fields from a source style to a destination style (and removes existing ones)
- **fix_text_fields.py** - copies all text fields from a source style to a destination style (and removes existing ones)
- **lint.sh** does this for the whole repo, it should be used before every PR



#### Node version

Most tools used work on recent node versions, but fonts and sprites use tools which require node 12.



### License

Each style have their license in their subfolder.

Code in this repo is MIT licensed.

Fonts are not stored in this repo, their license should be the one in their original repo.

Spritezero-cli is forked from https://github.com/mapbox/spritezero-cli, license is included.
