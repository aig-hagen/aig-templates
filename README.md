# LaTeX document class for seminar papers, proposals, bachelor's theses, and master's theses written at the Artificial Intelligence Group.
The document class "AIGthesis.cls" is based on "WeSTthesis.cls". The document class provides a cover page template, a statement on source usage and publication, and some basic text formatting. The file [example.tex](example.tex) contains a template for creating documents using this document class.

## Usage
The following command is used to include the document class in the .tex document.

    \documentclass[<options>]{AIGthesis}

The following options are supported:

- `english`                           - Prints an english title page and statement
- `f|m|fm`                            - gender used in the title: female, male, or both (required)
- `seminar|proposal|bachelor|master`  - seminar paper, proposal, bachelor's thesis, or master's thesis (required)
- `scrreprt`                          - use the scrreprt documentclass (optional, default: article class)
- `group`                             - prints two statements after the cover page (optional, default: one statement)
- `date`                              - prints the exact date (optional, default: month and year)
- `times|palatino`	                  - used font (optional, default: Computer Modern)
- `twoside`                           - layout for two-sided print (optional, default: one-sided)
- `binding`                           - adds 8mm on the left/right side for binding (optional, default: no binding)
- `frames`                            - prints additional frames to check the document layout (optional, default: no frames)

If the option `twoside` is used, blank pages are inserted after the cover page and its following statement(s).

The following commands are used to format the cover page. They are used before `\begin{document}`.

    \title{thesis title}
    \author{author(s) name(s)}

    \degreecourse{degree course}

    \firstreviewer{Name of the first reviewer (incl. academic title)}
    \firstreviewerinfo{institute/research group}

    \secondreviewer{Name of the second reviewer (incl. academic title)}
    \secondreveiwerinfo{insititute/research group or external institution}

The following commands declare the abstract texts.

    \englishabstract{English abstract text.}
    \germanabstract{German abstract text.}

The following commands are used after the `\begin{document}` statement.

    \maketitle  % prints the cover page and a statement about used sources and publication

## Example
For an example see [main.tex](main.tex).
