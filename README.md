# OpenFreeMap Styles

This contains the forks of the following styles:

**Bright** - forked from https://github.com/openmaptiles/osm-bright-gl-style

**Positron** - forked from https://github.com/openmaptiles/positron-gl-style

**Dark** - forked from https://github.com/openmaptiles/dark-matter-gl-style

**Liberty** - forked from https://github.com/maputnik/osm-liberty

All the OpenMapTiles styles (**Bright**, **Positron**, **Dark**) are abandoned by their upstream project. If you feel like maintaining the forks, please reach out!

**Liberty** is still fresh and alive. We aim to automatically patch Libery in the long term.

---

Some note about scripts:

- **scripts/lint_styles.py** - removes unnecessary keys, runs gl-style-migrate, does recursive JSON sorting, outputs using gl-style-format and runs gl-style-validate
- **lint.sh** does this for the whole repo, it should be used before every PR
- **scripts/copy_text_fields.py** - copies all text fields from a source style to a destination style (and removes existing ones)







### License

Each style has their license in their subfolder.

Code outside the style folders is licensed under MIT License.
