# outline-summaryst

## Description

`outline-summaryst` is a basic package designed for including a summary for each entry in the table of contents, particularly useful for writing books. It provides a simple structure for organizing content and generating formatted documents with summary sections.


## Features

- A template for the outline, which includes both the heading and their summaries.
- A macro for creating new headings and a summary for each heading.


## Note:
Because of the way the project is implemented, only the headings created with the provided `make-heading("heading name", "summary")` are shown in in the outline. Headings created with the default `= Heading` syntax will not show in said outline (though they will show up in the document itself).


## Example Usage:
```
#set par(justify: true)
#show: style-outline.with(outline-title: "Table of Contents")



#set page(numbering: "1/1")
#outline()


#make-heading("Part One", "This is the summary for part one")
#lorem(500)

#make-heading("Chapter One", "Summary for chapter one in part one", level: 2)
#lorem(300)

#make-heading("Chapter Two", "This is the summary for chapter two in part one", level: 2)
#lorem(300)

#make-heading("Part Two", "And here we have the summary for part two")
#lorem(500)

#make-heading("Chapter One", "Summary for chapter one in part two", level: 2)
#lorem(300)

#make-heading("Chapter Two", "Summary for chapter two in part two", level: 2)
#lorem(300)
```

## Known limitations
- Currently, we do not provide a way for styling the table of contents or headings
- Page numbering is a bit buggy
- long summaries (>= 1 page long) are not supported


## License:
This project is licensed under the MIT License. See the LICENSE file for details.


## Contribution:
Contributions are welcome! Feel free to open an issue or submit a pull request on GitHub.


