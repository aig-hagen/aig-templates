# LaTeX document class for seminar papers and proposals written in the Artificial Intelligence Group.
The document class "AIGpaper.cls" is based on "WeSTthesis.cls". The document class provides a cover page template, a statement on source usage and publication, and some basic text formatting.

## Usage
The following command is used to include the document class in the .tex document.

    \documentclass[<options>]{AIGpaper}

The following options are supported:

- `english`                           - Prints an english title page and statement
- `f|m|fm`                            - gender used in the title: female, male, or both (required)
- `seminar|proposal|researchlab`      - seminar paper, research lab report, or proposal (required)
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
For an example see [AIG_seminar.tex](AIG_seminar.tex).
