### Sprites

Creating a single sprite for all the styles, since they are sharing most of their icons.

**create_sprites.sh** creates a sprite dir and hashes it based on the file's contents. This is needed because - unlike fonts - if a sprite changes over time, the cached versions can look really bad in the map.

It also means that every version ever published has to be kept forever, as custom styles can use any old version.



---

One liner command to detect all the "icon-image" fields in a style.json:

```
jq -c '.. | objects | .["icon-image"]? | select(.)' style.json
```

