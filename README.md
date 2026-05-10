
# arxvf
## Preprint Template Quarto Manuscript html and typst
---
### Creating a New Article

To create a new article using this format:

```bash
quarto use template Raunak12775/arxvf
```

This will create a new directory with an example document that uses this format.

### Using with an Existing Document

To add this format to an existing document:

```bash
quarto add Raunak12775/arxvf
```

Then, add the format to your document options:

```yaml
format:
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

For separate format rendering in CLI inside a manuscript project.

```bash
quarto render template.qmd --to arxvf-html
quarto render template.qmd --to arxvf-typst
```

## Usage

For the manuscript project edit the `_quarto.yml` file

```yaml
project:
  type: manuscript
  output-dir: public
format:
  arxvf-html: default
  arxvf-typst: default
```

For a standalone article with pdf included ready to be hosted in gitlab using CI 

```yaml
project:
  output-dir: public
format:
  arxvf-html: default
  arxvf-typst: default
```

## Gitlab CI yaml file

Put a `.gitlab-ci.yml` file in the root directory of the project. For the standalone article one needs to render with argument.

```yaml
image: ubuntu:24.04

pages:
	stage: deploy
	before_script:
		- apt-get update -qq && apt-get install -y curl gdebi-core wget fonts-lmodern fontconfig
		- fc-cache -fv
		- export TYPST_FONT_PATHS="/usr/share/fonts"
		- wget -q https://github.com/quarto-dev/quarto-cli/releases/download/v1.8.26/quarto-1.8.26-linux-amd64.deb
		- gdebi --non-interactive quarto-1.8.26-linux-amd64.deb
		- quarto check
	script:
		- quarto render testing.qmd --to arxvf-html
		- mv public/testing.html public/index.html
		- quarto render testing.qmd --to arxvf-typst
	artifacts:
		paths:
			- public
	only:
		- main
```

> Also it is notable that Gitlab accepts `index.html` as the homepage hence the renaming at the end.

For the manuscript project one needs to render without argument. All the python notebooks under `notebooks/` directory automatically gets rendered for visualization on the web html interface.

```yaml
image: ubuntu:24.04

pages:
	stage: deploy
	before_script:
		- apt-get update -qq && apt-get install -y curl gdebi-core wget fonts-lmodern fontconfig
		- fc-cache -fv
		- export TYPST_FONT_PATHS="/usr/share/fonts"
		- wget -q https://github.com/quarto-dev/quarto-cli/releases/download/v1.8.26/quarto-1.8.26-linux-amd64.deb
		- gdebi --non-interactive quarto-1.8.26-linux-amd64.deb
		- quarto check
	script:
		- quarto render
	artifacts:
		paths:
			- public
	only:
		- main
```

> In quarto manuscript project `index.html` is automatically rendered.