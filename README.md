# eFiliale Stamper

Stamps postmark from Deutsche Post eFiliale to your LaTeX letter.

## Requirements

* LaTeX
* pdfjam
* pdftk
* gs (ghostscript)

## Usage

1. Login to eFiliale at https://www.efiliale.de
1. Select Standardbrief
1. Select "Mit Adresse(n)"
1. Download the generated postmark PDF
1. ./stamp.sh ~/downloads/Briefmarke.pdf

## Example

1. `make`

or explicit

1. `pdflatex letter.tex`
1. `./stamp.sh example_postmark.pdf`
1. `open letter-stamped.pdf`

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
