These plugins are designed to be used with [MkDocs](https://www.mkdocs.org) and
are tested for [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/).
They should work also without Material for MkDocs, but they aren't tested for
different kinds of themes.

## How to obtain CSS files

The plugins in this library use specific CSS rules to work. The source code is
written in SASS, CSS files are built during the CI build of the project.

The recommended way to obtain the CSS files is to download a copy from one of these sources:

- the `dist-package-css` artifact generated by a build ([example](https://github.com/Neoteroi/mkdocs-plugins/actions/runs/2843393852))
- downloads or assets of the latest successful release ([example](https://github.com/Neoteroi/mkdocs-plugins/releases/tag/v0.0.6))
