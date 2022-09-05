# LaTeX document class for seminar papers, proposals, bachelor's theses, and master's theses written at the Artificial Intelligence Group.
The document class "AIGthesis.cls" is based on "WeSTthesis.cls". The document class provides a cover page template, a statement on source usage and publication, and some basic text formatting. The file [example.tex](example.tex) contains a template for creating documents using this document class.

## Usage
The following command is used to include the document class in the .tex document.

    \documentclass[<options>]{AIGpaper}

The following options are supported:

- `english`                           - Prints an english title page and statement
- `f|m|fm`                            - gender used in the title: female, male, or both (required)
- `seminar|proposal`                  - seminar paper or proposal (required)
- `scrreprt`                          - use the scrreprt documentclass (optional, default: article class)
- `group`                             - prints two statements after the cover page (optional, default: one statement)
- `date`                              - prints the exact date (optional, default: month and year)
- `times|palatino`	                  - used font (optional, default: Computer Modern)
- `frames`                            - prints additional frames to check the document layout (optional, default: no frames)

The following commands are used to format the title. They are used before `\begin{document}`.

    \title{paper title}
    \author{author(s) name(s)}

The following commands declare the abstract.

    \abstract{Abstract text.}

The following commands are used after the `\begin{document}` statement.

    \maketitle  % prints the title and author information

## Example
For an example see [AIG_seminar.tex](AIG_seminar).
