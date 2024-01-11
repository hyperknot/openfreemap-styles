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

Most of the work so far has been done in these areas:

- all labels and text fields (water, roads, cities)
- country and administrative borders
- POIs

**Positron**, as a special clean looking style also has POIs removed and some highway labels set to show at higher zooms only.

**Dark** is currently put on hold, it's very different from the rest. I think a better approach would be to try to invert Positron in a fitting color space.



### Compare

Part of this repo is a compare web app. Currently it works on localhost, but in the future there'll be a web hosted version with a nicer GUI. The point of compare is to compare different styles and different data sources.



### Scripts

- **lint_styles.py** - removes unnecessary keys, runs gl-style-migrate, does recursive JSON sorting, outputs using gl-style-format and runs gl-style-validate
- **lint.sh** does this for the whole repo, it should be used before every PR
- **copy_text_fields.py** - copies all text fields from a source style to a destination style (and removes existing ones)
- **fix_text_fields.py** - sets OpenFreeMap specific values in styles



#### Node version

Most tools used work on recent node versions, but fonts and sprites use tools which require node 12.



## License

The license of this project is [MIT](https://www.tldrlegal.com/license/mit-license). Map data is from [OpenStreetMap](https://www.openstreetmap.org/copyright). The licenses for included projects are listed in [LICENSE.md](https://github.com/hyperknot/openfreemap/blob/main/LICENSE.md).
