# LaTeX document class for theses, proposals, seminar papers and research lab reports written at the Artificial Intelligence Group.
The document class "AIGpaper.cls" is based on "WeSTthesis.cls". The document class provides a cover page template, a statement on source usage and publication, and some basic text formatting.

## Usage
The following command is used to include the document class in the .tex document.

    \documentclass[<options>]{AIGpaper}

The following options are supported:

- `seminar|researchlab|proposal|bachelor|master`    - seminar paper, research lab report, proposal, bachelor's thesis, or master's thesis (required)
- `english`                                         - Language of the document (optional, default: german)
- `times|palatino`                                  - used font (optional, default: Computer Modern)
- `twoside`                                         - layout for two-sided print (optional, default: one-sided)
- `binding`                                         - adds 8mm on the left/right side for binding (optional, default: no binding)
- `frames`                                          - prints additional frames to check the document layout (optional, default: no frames)

If the option `twoside` is used, blank pages are inserted after the cover page and its following statement(s).

The following commands are used to format the cover page. They must be used before `\begin{document}`.

    \title{thesis title}
    \author{author(s) name(s)}

The following commands are only required for bachelor and master theses.

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

For seminar papers and research lab reports the required statement is created before the '\end{document}' with

    \makestatement

or, if there are multiple authors, e.g. for 5 authors, use

    \makestatement{5}

## Examples
For an example see [AIG_bachelorthesis.tex](AIG_bachelorthesis.tex), [AIG_masterthesis.tex](AIG_masterthesis.tex), [AIG_proposal.tex](AIG_proposal.tex), [AIG_seminar.tex](AIG_seminar.tex) or [AIG_research_lab.tex](AIG_research_lab.tex).


This template is subject to the [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/) license.