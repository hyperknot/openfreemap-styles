<a href="https://openfreemap.org/"><img src="logo.jpg" alt="logo" height="200" class="logo" /></a>

# OpenFreeMap Styles

[openfreemap.org](https://openfreemap.org)



This repo contains the forks of the following styles:

**Bright** - forked from https://github.com/openmaptiles/osm-bright-gl-style 

**Liberty** - forked from https://github.com/maputnik/osm-liberty

**Positron** - forked from https://github.com/openmaptiles/positron-gl-style

**Dark** - forked from https://github.com/openmaptiles/dark-matter-gl-style

**Fiord** - forked from https://github.com/openmaptiles/fiord-color-gl-style

All the OpenMapTiles styles (Bright, Positron, Dark, Fiord) are abandoned by their upstream project. Liberty is fresh and alive. 

The long term goal of this project is to maintain a consistent style across these forks. The plan is to split the styles to building blocks (like road layers, etc.) and build up new styles from these blocks.

Work is being done to make **Bright**, **Liberty** and **Positron** consistent. 

Most of the work so far has been done in these areas:

- all labels and text fields (water, roads, cities)
- country and administrative borders
- POIs

Positron, as a special clean looking style, has POIs removed and some highway labels set to show at higher zooms only.

Dark and Fiord is not yet complete. They are unmodified, which means they are exactly as they are on their source repo, with the only difference that fonts are set to Noto Sans.



To access Dark and Fiord, use these URLs (these are not offered on the Quick Start guide for the moment):

```
https://tiles.openfreemap.org/styles/dark
```

and

```
https://tiles.openfreemap.org/styles/fiord
```





### Compare styles app

Part of this repo is a compare styles web app. Currently it works on localhost, but in the future there'll be a web hosted version with a nicer GUI. The point of compare is to compare different styles and different data sources.



### Scripts

- **lint_styles.py** - removes unnecessary keys, runs gl-style-migrate, does recursive JSON sorting, outputs using gl-style-format and runs gl-style-validate
- **lint.sh** - does this for the whole repo, it should be used before every PR
- **copy_text_fields.py** - copies all text fields from a source style to a destination style (and removes existing ones)
- **fix_text_fields.py** - sets OpenFreeMap specific values in styles



#### Node version

Most tools used work on recent node versions, but fonts and sprites use tools which require node 12.



## Contributing

Contributors welcome!

There is a lot to do here, so any kind of contribution is welcome!



## License

The license of this project is [MIT](https://www.tldrlegal.com/license/mit-license). Map data is from [OpenStreetMap](https://www.openstreetmap.org/copyright). The licenses for included projects are listed in [LICENSE.md](https://github.com/hyperknot/openfreemap/blob/main/LICENSE.md).
