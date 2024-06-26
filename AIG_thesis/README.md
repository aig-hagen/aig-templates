# LaTeX document class for bachelor's and master's theses written at the Artificial Intelligence Group.
The document class "AIGthesis.cls" is based on "WeSTthesis.cls". The document class provides a cover page template, a statement on source usage and publication, and some basic text formatting. 

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

    \advisor{Name of the advisor (incl. academic title)}
    \advisorinfo{insititute/research group or external institution}

The following commands declare the abstract texts.

    \englishabstract{English abstract text.}
    \germanabstract{German abstract text.}

The following commands are used after the `\begin{document}` statement.

    \maketitle  % prints the cover page and a statement about used sources and publication

## Example
For an example see [AIG_bachelorthesis.tex](AIG_bachelorthesis.tex) or [AIG_masterthesis.tex](AIG_masterthesis.tex).
