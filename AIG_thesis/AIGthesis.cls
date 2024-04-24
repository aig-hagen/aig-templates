%*******************************************************************************
%  AIGthesis.cls
%
%  LaTeX document class for seminar papers, proposals, bachelor's theses, and
%  master's theses written at the Artificial Intelligence Group.
%
% Adopted from the WeSTThesis.cls template.
%
%*******************************************************************************


%--- Identification ------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{AIGthesis}[2017/06/08 v1.4 Document class for seminar papers, proposals, bachelor's theses, and master's theses written at the Artificial Intelligence Group, FernUniversität in Hagen.]


%--- Declaration of variables --------------------------------------------------

\newif\ifenglish

\newif\iffemalemale
\newif\iffemale
\newif\ifmale

\newif\ifgroup

\newif\ifseminar
\newif\ifproposal
\newif\ifbachelor
\newif\ifmaster

\newif\ifnogermanabstract
\newif\ifnoenglishabstract

\newif\ifscrreprt

\newif\ifdate

\newif\iftimes
\newif\ifpalatino

\newif\iftwoside

\newif\ifbinding

\newif\ifframes


%--- Initialization of variables -----------------------------------------------

%TODO make this depending on \languagename?
\DeclareOption{english}{\englishtrue}

\DeclareOption{fm}{\femalemaletrue}
\DeclareOption{f}{\femaletrue}
\DeclareOption{m}{\maletrue}

\DeclareOption{group}{\grouptrue}

\DeclareOption{seminar}{\seminartrue}
\DeclareOption{proposal}{\proposaltrue}
\DeclareOption{bachelor}{\bachelortrue}
\DeclareOption{master}{\mastertrue}

\DeclareOption{nogermanabstract}{\nogermanabstracttrue}
\DeclareOption{noenglishabstract}{\noenglishabstracttrue}

\DeclareOption{scrreprt}{\scrreprttrue}

\DeclareOption{date}{\datetrue}

\DeclareOption{times}{\timestrue}

\DeclareOption{palatino}{\palatinotrue}

\DeclareOption{twoside}{\twosidetrue}

\DeclareOption{binding}{\bindingtrue}

\DeclareOption{frames}{\framestrue}


%--- Execution of options ------------------------------------------------------


\ProcessOptions

%--- Loading of packages -------------------------------------------------------

\ifscrreprt%
  \LoadClass[a4paper,11pt,titlepage]{scrreprt}
  \iftwoside%
    \PassOptionsToClass{cleardoublepage=empty,twoside}{scrreprt}
  \fi
\else
  \LoadClass[a4paper,11pt,titlepage]{scrartcl}
  \iftwoside%
    \PassOptionsToClass{cleardoublepage=empty,twoside}{scrartcl}
  \fi
\fi

\RequirePackage{titling}
\RequirePackage{ifoddpage}
% Default: Computer Modern (TeX-Standard)
\iftimes%
  \RequirePackage{times}				% font type Times New Roman
\fi
\ifpalatino%
  \RequirePackage{palatino}			% font type Book Antiqua/Palatino
\fi

\ifbinding%
  % twoside does not include a binding offset itself
  \ifframes%
    % showframe option for testing the layout
    \RequirePackage[bindingoffset=8mm,showframe]{geometry}
  \else
    \RequirePackage[bindingoffset=8mm]{geometry}
  \fi
\else
  \ifframes%
    % showframe option for testing the layout
    \RequirePackage[showframe]{geometry}
  \else
    \RequirePackage[]{geometry}
  \fi
\fi


%--- Code ----------------------------------------------------------------------

\newcommand{\degreecourse}[1]{\def\degreecourse{#1}}

\newcommand{\firstreviewer}[1]{\def\firstreviewer{#1}}
\newcommand{\firstreviewerinfo}[1]{\def\firstreviewerinfo{#1}}

\newcommand{\advisor}[1]{\def\advisor{#1}}
\newcommand{\advisorinfo}[1]{\def\advisorinfo{#1}}

\newcommand{\englishabstract}[1]{\def\englishabstract{#1}}
\newcommand{\germanabstract}[1]{\def\germanabstract{#1}}

\newcommand{\monthword}{%
  \ifenglish%
  \ifcase\month%
    \or January\or February\or March\or April\or May\or June\or July
    \or August\or September\or Oktober\or November\or December\fi
  \else
    \ifcase\month%
     \or Januar\or Februar\or M\"arz\or April\or Mai\or Juni\or Juli%
     \or August\or September\or Oktober\or November\or Dezember%
    \fi
  \fi
}

% redefine \maketitle
\renewcommand{\maketitle}{
\ifenglish%
    \selectlanguage{english}
\else
    \selectlanguage{ngerman}
\fi

% ----- titlepage ------
\begin{titlepage}
    \begin{center}
        \renewcommand{\arraystretch}{.8}
        \begin{minipage}{.5\textwidth}
            \includegraphics[height=1.0cm]{figures/Uni_hagen_logo.png}\\
            \begin{footnotesize}
                \ifenglish%
                        Faculty of Mathematics and Computer Science
                    \else
                        Fakultät für Mathematik und Informatik
                    \fi
            \end{footnotesize}
        \end{minipage}%
        \hfill%
        \begin{minipage}{.5\textwidth}
            \raggedleft
            \includegraphics[height=1.0cm]{figures/logo_aig_transparent_bg.png} \\
            \begin{footnotesize}
                Artificial Intelligence Group%
            \end{footnotesize}
        \end{minipage}\\
        \renewcommand{\arraystretch}{1.0} %reset arraystretch to default
        \vspace*{1.75cm}
        \begin{huge}
            \textbf{\thetitle}\\[1.75cm]
            \ifbachelor%
                \ifenglish%
                    Bachelor's Thesis
                \else
                    Bachelorarbeit
                \fi
            \else
                \ifmaster%
                    \ifenglish%
                        Master's Thesis
                    \else
                        Masterarbeit
                    \fi
                \else
                    \ifseminar%
                        \ifenglish%
                            Seminar Paper
                        \else
                            Seminararbeit
                        \fi
                    \else
                        \ifproposal%
                            \ifenglish%
                                Thesis Proposal
                            \else
                                Proposal
                            \fi
                        \else
                            >>SET TYPE (seminar, bachelor...) IN DOCUMENTCLASS OPTIONS<<
                        \fi
                    \fi
                \fi
            \fi
        \\[.2cm]
        \end{huge}
        \ifseminar%
            %do nothing
        \else
            \ifproposal%
                %do nothing
            \else
                \ifenglish%
                    in partial fulfillment of the requirements for\\
                    the degree of
                \else
                    zur Erlangung des Grades
                    \iffemalemale%
                        einer/eines
                    \else
                        \iffemale%
                            einer
                        \else
                            \ifmale%
                                eines
                            \else
                                >>SET GENDER (fm, f, or m) IN DOCUMENTCLASS OPTIONS<<
                            \fi
                        \fi
                    \fi
                \fi
                \ifbachelor%
                    Bachelor of Science (B.Sc.)
                \else
                    \ifmaster%
                        Master of Science (M.Sc.)
                    \else
                        >>SET GRADE (bachelor or master) IN DOCUMENTCLASS OPTIONS<<
                    \fi
                \fi
                \\
                \ifenglish%
                    in
                \else
                    im Studiengang
                \fi
                \degreecourse\\[.75cm]
            \fi
        \fi
        \begin{large}
            \ifenglish%
                submitted by\\
            \else
                vorgelegt von\\
            \fi
        \end{large}
        \begin{Large}
            \theauthor\\[3.79cm]
        \end{Large}
    \end{center}
    \begin{tabular}{ll}
        \ifseminar%
            \ifenglish%
                Supervisors:
            \else
                Betreuer:
            \fi
            & \firstreviewer\\
            \empty & \firstreviewerinfo\\[2.5mm]
            \empty & \advisor\\
            \empty & \advisorinfo\\[2cm]
        \else
            \ifenglish%
                First examiner:
            \else
                Erstgutachter:
            \fi
            & \firstreviewer\\
            \empty & \firstreviewerinfo\\[2.5mm]
            \ifenglish%
                Advisor:
            \else
                Betreuer:
            \fi
            & \advisor\\
            \empty & \advisorinfo\\[2cm]
        \fi
    \end{tabular}
\end{titlepage}
\iftwoside%
    \thispagestyle{empty}
    \null\cleardoublepage%
\fi

% ------ assertion for thesis ------
\ifseminar%
    %don't print the assertion
\else
    \ifproposal%
        %don't print the assertion
    \else
        \newcounter{AuthorNumber}
        \ifgroup%
            \setcounter{AuthorNumber}{2}
        \else
            \setcounter{AuthorNumber}{1}
        \fi
            \loop\ifnum\theAuthorNumber>0
            \begin{Large}
                \ifenglish%
                    \noindent
                    Statement
                \else
                    \noindent
                    Erkl{\"a}rung
                \fi
                \\[5mm]
            \end{Large}
            \ifbachelor%
                \selectlanguage{ngerman}%
                Ich erkl\"are, dass ich die Bachelorarbeit selbstst\"andig und ohne unzul\"assige
                Inanspruchnahme Dritter verfasst habe. Ich habe dabei nur die angegebenen
                Quellen und Hilfsmittel verwendet und die aus diesen w\"ortlich oder sinngem\"a\ss\
                entnommenen Stellen als solche kenntlich gemacht. Die Versicherung
                selbstst\"andiger Arbeit gilt auch für enthaltene Zeichnungen, Skizzen oder
                graphische Darstellungen. Die Bachelorarbeit wurde bisher in gleicher oder
                \"ahnlicher Form weder derselben noch einer anderen Pr\"ufungsbeh\"orde vorgelegt
                und auch nicht ver\"offentlicht. Mit der Abgabe der elektronischen Fassung der
                endgültigen Version der Bachelorarbeit nehme ich zur Kenntnis, dass diese mit
                Hilfe eines Plagiatserkennungsdienstes auf enthaltene Plagiate gepr\"uft werden
                kann und ausschlie\ss lich für Pr\"ufungszwecke gespeichert wird.
            \fi
            \ifmaster%
                \selectlanguage{ngerman}%
                \sloppy%
                Ich erkl\"are, dass ich die Masterarbeit selbstst\"andig und ohne unzul\"assige
                Inanspruchnahme Dritter verfasst habe. Ich habe dabei nur die angegebenen
                Quellen und Hilfsmittel verwendet und die aus diesen w\"ortlich oder sinngem\"a\ss\
                entnommenen Stellen als solche kenntlich gemacht. Die Versicherung selbstst\"andiger
                Arbeit gilt auch f\"ur enthaltene Zeichnungen, Skizzen oder graphische Darstellungen.
                Die Arbeit wurde bisher in gleicher oder \"ahnlicher Form weder derselben noch einer
                anderen Pr\"ufungsbeh\"orde vorgelegt und auch nicht ver\"offentlicht. Mit der Abgabe der
                elektronischen Fassung der endg\"ultigen Version der Arbeit nehme ich zur Kenntnis,
                dass diese mit Hilfe eines Plagiatserkennungsdienstes auf enthaltene Plagiate gepr\"uft
                werden kann und ausschlie\ss lich f\"ur Pr\"ufungszwecke gespeichert wird.
            \fi
            \\[.5cm]
            \ifenglish%
                I explicitly agree to have this thesis published on the webpage of
                the artificial intelligence group and endorse its public availability.
            \else
                Der Ver\"offentlichung dieser Arbeit auf der Webseite des
                Lehrgebiets K\"unstliche Intelligenz und damit dem freien Zugang zu dieser Arbeit stimme ich ausdr\"ucklich zu.
            \fi\\[.5cm]
            \ifenglish%
                Software created for this work has been made available as open source; a corresponding link to the sources is included in this work. The same applies to any research data.
            \else
                F\"ur diese Arbeit erstellte Software wurde quelloffen verf\"ugbar gemacht, ein entsprechender Link zu den Quellen ist in dieser Arbeit enthalten. Gleiches gilt f\"ur angefallene Forschungsdaten.
            \fi\\[.9cm]

            \begin{small}
                \noindent\dotfill\\
                \ifenglish
                    (Place, Date)\hfill(Signature)
                \else
                    (Ort, Datum)\hfill(Unterschrift)
                \fi
            \end{small}
            \addtocounter{AuthorNumber}{-1}
            \cleardoublepage%
            \repeat%
        \vspace{2em}
    \fi
\fi

% ---- Abstract ------
\ifproposal
    \ifenglish
        \selectlanguage{english}
        \begin{center}
            \begin{large}
                \bfseries{Abstract}
            \end{large}
        \end{center}
        \begin{center}
            \begin{minipage}[c]{0.85\textwidth}
                \begin{small}
                    \englishabstract
                \end{small}
            \end{minipage}
        \end{center}
    \else
        \selectlanguage{ngerman}
        \begin{center}
            \begin{large}
                \bfseries{Zusammenfassung}
            \end{large}
        \end{center}
        \begin{center}
            \begin{minipage}[c]{0.85\textwidth}
                \begin{small}
                    \germanabstract
                \end{small}
            \end{minipage}
        \end{center}
    \fi
    %\par\smallskip
\else
    \ifnogermanabstract
        \empty
    \else
        \selectlanguage{ngerman}
        \begin{center}
            \begin{large}
                \bfseries{Zusammenfassung}
            \end{large}
        \end{center}
        \germanabstract
        \par\bigskip
        \par\bigskip
    \fi
    \ifnoenglishabstract
        \empty
    \else
        \selectlanguage{english}
        \begin{center}
            \begin{large}
                \bfseries{Abstract}
            \end{large}
        \end{center}
        \englishabstract
    \fi
    % --- reset language ---
    \ifenglish
        \selectlanguage{english}
    \else
        \selectlanguage{ngerman}
    \fi
    \cleardoublepage%
\fi
}

\newcommand{\addreferences}{
    \cleardoublepage
    \bibliographystyle{alpha}
    \bibliography{references}
}
