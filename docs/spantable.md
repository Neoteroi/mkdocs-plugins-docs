Extension to support tables with `colspan` and `rowspan`, including automatic handling of
span value, support for captions, and table classes.

## How to use

Edit your `mkdocs.yml` file to include the extra CSS file from Neoteroi
mkdocs-plugins and the `neoteroi.spantable` extension:

```yaml

extra_css:
  - css/neoteroi-mkdocs.css
  ...

markdown_extensions:
  - neoteroi.spantable
  ...

```

Write a Markdown table like in the following example, use `@span` placeholders for
automatic handling of colspan and rowspan depending on adjacent empty cells (separator
lines are ignored):

```
::spantable::

| Country      | Address                                                  |
| ------------ | -------------------------------------------------------- |
| France @span | 8 Rue St Ferréol - 92190 City: Meudon (Île-de-France)    |
|              | 50 boulevard Amiral Courbet - 94310 Orly (Île-de-France) |
|              | ...                                                      |
|              | ...                                                      |
| Italy @span  | Str. S. Maurizio, 12, 10072 Caselle torinese TO          |
|              | S.S. Torino-Asti - 10026 Santena (TO)                    |
|              | ...                                                      |
| Poland @span | al. Jana Pawła II 22, 00-133 Warszawa                    |
|              | plac Trzech Krzyży 4/6, 00-535 Warszawa                  |
|              | ...                                                      |
|              | ...                                                      |

::end-spantable::
```

Produces an output like the following:

::spantable::

| Country      | Address                                                  |
| ------------ | -------------------------------------------------------- |
| France @span | 8 Rue St Ferréol - 92190 City: Meudon (Île-de-France)    |
|              | 50 boulevard Amiral Courbet - 94310 Orly (Île-de-France) |
|              | ...                                                      |
|              | ...                                                      |
| Italy @span  | Str. S. Maurizio, 12, 10072 Caselle torinese TO          |
|              | S.S. Torino-Asti - 10026 Santena (TO)                    |
|              | ...                                                      |
| Poland @span | al. Jana Pawła II 22, 00-133 Warszawa                    |
|              | plac Trzech Krzyży 4/6, 00-535 Warszawa                  |
|              | ...                                                      |
|              | ...                                                      |

::end-spantable::

## Options

| Option          | Description                                                                                                               |
| :-------------- | :------------------------------------------------------------------------------------------------------------------------ |
| @span           | Applies colspan and rowspan automatically to expand the cell to all adjacent cells (colspan has precedence over rowspan). |
| @span=x         | colspan=x                                                                                                                 |
| @span=x:y       | colspan=x; rowspan=y;                                                                                                     |
| @class="value"  | Adds an HTML _class_ to any cell, to simplify styling (optional).                                                         |
| caption="value" | Adds a _caption_ element with the given value to the table (optional).                                                    |
| class="value"   | Adds a _class_ to the _table_ element with the given value (optional).                                                    |

In the following example, the cells with `Italy` and `France` both get
`colspan="2" rowspan="3"` because they have empty adjacent cells growing one
column and two rows:

```
::spantable:: caption="Life Expectancy By Current Age" class="foo"

| Italy @span   |       | 40 @span      |       | 20 @span      |       |
| ------------- | ----- | ------------- | ----- | ------------- | ----- |
|               |       | Men           | Women | Men           | Women |
|               |       | 78            | 82    | 77            | 81    |
| Poland @span  |       | 40 @span      |       | 20 @span      |       |
| ------------- | ----- | ------------- | ----- | ------------- | ----- |
|               |       | Men           | Women | Men           | Women |
|               |       | 78            | 82    | 77            | 81    |

::end-spantable::
```

::spantable:: caption="Life Expectancy By Current Age" class="foo"

| Italy @span   |       | 40 @span      |       | 20 @span      |       |
| ------------- | ----- | ------------- | ----- | ------------- | ----- |
|               |       | Men           | Women | Men           | Women |
|               |       | 78            | 82    | 77            | 81    |
| Poland @span  |       | 40 @span      |       | 20 @span      |       |
| ------------- | ----- | ------------- | ----- | ------------- | ----- |
|               |       | Men           | Women | Men           | Women |
|               |       | 78            | 82    | 77            | 81    |

::end-spantable::
