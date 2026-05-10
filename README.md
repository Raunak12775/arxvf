
# Preprint Template Quarto Manuscript (arxvf)

## Creating a New Article

To create a new article using this format:

```bash
quarto use template Raunak12775/arxvf
```

This will create a new directory with an example document that uses this format.

## Using with an Existing Document

To add this format to an existing document:

```bash
quarto add Raunak12775/arxvf
```

Then, add the format to your document options:

```yaml
format:
  arxvf-pdf: default
  arxvf-typst: default
  arxvf-html: default
```    

The `typst` option is added for quick pdf generation.

## Dependencies
For the `typst` pdf output the latin modern font is required. In ubuntu linux one can install it through the standard package manager.

```bash
sudo apt install fonts-lmodern
```

Otherwise it will fall back to typst default Libertinus Serif font
## Separate Rendering

For separate format rendering in CLI 

```bash
quarto render template.qmd --to arxvf-html
quarto render template.qmd --to arxvf-pdf
quarto render template.qmd --to arxvf-typst
```

|Output|Format|
|:----|:----|
|Latex PDF|`arxvf-pdf`|
|Typst PDF|`arxvf-typst`|
|HTML|`arxvf-html`|

