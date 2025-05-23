%*******************************************************************************
%  AIGpaper.cls
%
%  LaTeX document class for seminar papers, proposals, bachelor's theses, and
%  master's theses written at the Artificial Intelligence Group.
%
% Adopted from the WeSTThesis.cls template.
%
% Version:  v1.7
% Date:     2024/12/04
% License:  CC BY 4.0
%
%*******************************************************************************


%--- Identification ------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{AIGpaper}[2024/12/04 v1.7 Document class for bachelor's theses, master's theses, thesis proposals, seminar papers and research lab reports written at the Artificial Intelligence Group, FernUniversität in Hagen.]


%--- Declaration of variables --------------------------------------------------

\newif\ifenglish

\newif\iffemalemale
\newif\iffemale
\newif\ifmale

\newif\ifgroup

\newif\ifseminar
\newif\ifproposal
\newif\ifresearchlab
\newif\ifbachelor
\newif\ifmaster
\newif\ifthesis

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
\DeclareOption{researchlab}{\researchlabtrue}
\DeclareOption{bachelor}{\bachelortrue\thesistrue}
\DeclareOption{master}{\mastertrue\thesistrue}

\DeclareOption{times}{\timestrue}
\DeclareOption{palatino}{\palatinotrue}

\DeclareOption{twoside}{\twosidetrue}

\DeclareOption{binding}{\bindingtrue}

\DeclareOption{frames}{\framestrue}


%--- Execution of options ------------------------------------------------------

\ProcessOptions

%--- Loading of packages -------------------------------------------------------

\LoadClass[a4paper,11pt,titlepage]{scrartcl}
\iftwoside%
    \PassOptionsToClass{cleardoublepage=empty,twoside}{scrartcl}
\fi

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

\RequirePackage[english,ngerman]{babel}		    % English and new German spelling
\RequirePackage[utf8]{inputenc}                 % Correct input encoding
\RequirePackage[T1]{fontenc}                    % Correct output encoding
\RequirePackage{titling}                        % For title page creation
\RequirePackage{ifoddpage}                      % For clearing double pages dynamically(?)

%%%% Commands %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\degreecourse}[1]{\def\degreecourse{#1}}

\newcommand{\firstreviewer}[1]{\def\firstreviewer{#1}}
\newcommand{\firstreviewerinfo}[1]{\def\firstreviewerinfo{#1}}

\newcommand{\advisor}[1]{\def\advisor{#1}}
\newcommand{\advisorinfo}[1]{\def\advisorinfo{#1}}

\newcommand{\englishabstract}[1]{\def\englishabstract{#1}}
\newcommand{\germanabstract}[1]{\def\germanabstract{#1}}

% Command for creating bibliography
\newcommand{\addreferences}{
    \bibliographystyle{abbrv}
    \bibliography{references}
}

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

\newcommand{\germantitle}{Ausarbeitung}
\ifbachelor%
    \renewcommand{\germantitle}{Bachelorarbeit}
\else
    \ifmaster%
        \renewcommand{\germantitle}{Masterarbeit}
    \fi
\fi

\newcommand{\englishtitle}{paper}
\ifbachelor%
    \renewcommand{\englishtitle}{bachelor´s thesis}
\else
    \ifmaster%
        \renewcommand{\englishtitle}{master´s thesis}
    \fi
\fi
                

% ------ assertion ------
\newcounter{AuthorNumber}
\newcommand{\makestatement}[1]{
    \clearpage
    \setcounter{AuthorNumber}{#1}

    \ifenglish
        \begin{LARGE}
        \noindent
        Statement\\[5mm]
        \end{LARGE}

        \noindent
        I declare that I have written the 
        \ifthesis\englishtitle~\else
            \ifseminar%
                seminar paper
            \else
                \ifresearchlab%
                    research lab report
                \else
                    \PackageError{AIGthesis}{Unsupported document type for creating statement}{Statement is only required for bachelor, master, seminar and researchlab}
                \fi
            \fi
        \fi
        independently and without unauthorized use of third parties.
        I have only used the indicated resources and I have clearly marked the passages taken verbatim or in the sense of these resources as such. 
        The assurance of independent work also applies to any drawings, sketches or graphical representations. 
        The work has not previously been submitted in the same or similar form to the same or another examination authority and has not been published. 
        By submitting the electronic version of the final version of the \englishtitle, I acknowledge that it will be checked by a plagiarism detection service to check for plagiarism and that it will be stored exclusively for examination purposes.\\[.5cm]
    \else
        \begin{LARGE}
        \noindent
        Erkl{\"a}rung\\[5mm]
        \end{LARGE}

        \noindent
        Ich erkl\"are, dass ich die
        \ifthesis\germantitle~\else
            schriftliche Ausarbeitung zum
            \ifseminar%
                Seminar
            \else
                \ifresearchlab%
                    Fachpraktikum
                \else
                    \PackageError{AIGthesis}{Unsupported document type for creating statement}{Statement is only required for bachelor, master, seminar and researchlab}
                \fi
            \fi
        \fi
        selbstst\"andig und ohne unzul\"assige Inanspruchnahme Dritter verfasst habe.
        Ich habe dabei nur die angegebenen Quellen und Hilfsmittel verwendet und die aus diesen w\"ortlich oder sinngem\"a\ss\ entnommenen Stellen als solche kenntlich gemacht. 
        Die Versicherung selbstst\"andiger Arbeit gilt auch für enthaltene Zeichnungen, Skizzen oder graphische Darstellungen.
        Die \germantitle~ wurde bisher in gleicher oder \"ahnlicher Form weder derselben noch einer anderen Pr\"ufungsbeh\"orde vorgelegt und auch nicht ver\"offentlicht.
        Mit der Abgabe der elektronischen Fassung der endgültigen Version der \germantitle~ nehme ich zur Kenntnis, dass diese mit Hilfe eines Plagiatserkennungsdienstes auf enthaltene Plagiate gepr\"uft werden kann und ausschlie\ss lich für Pr\"ufungszwecke gespeichert wird.\\[.5cm]
    \fi
    \ifthesis%
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
    \fi
    \vspace*{\fill}
    \noindent
    \loop\ifnum\theAuthorNumber>0
    \printauthorline
    \addtocounter{AuthorNumber}{-1}
    \repeat%
    \vspace{2em}
}

\newcommand{\printauthorline}{
    \vspace{1.5cm}
    \\
    \vspace{0.01cm}
    \noindent
    \dotfill\\
    \begin{small}
        \ifenglish%
            (Place, Date)\hfill(Signature)
        \else
            (Ort, Datum)\hfill(Unterschrift)
        \fi
    \end{small}
}

% ---- Abstract ------
\newcommand{\makeabstract}{
    \ifthesis%
        \selectlanguage{ngerman}
        \begin{center}
            \begin{large}
                \bfseries{Zusammenfassung}
            \end{large}
        \end{center}
        \germanabstract%
        \relax
        \par\bigskip
        \par\bigskip

        \selectlanguage{english}
        \begin{center}
            \begin{large}
                \bfseries{Abstract}
            \end{large}
        \end{center}
        \englishabstract%
        \relax
    \else
        \ifenglish%
            \begin{center}
                \begin{large}
                    \bfseries{Abstract}
                \end{large}
            \end{center}
            \begin{center}
                \begin{minipage}[c]{0.85\textwidth}
                    \begin{small}
                        \englishabstract%
                        \relax
                    \end{small}
                \end{minipage}
            \end{center}
        \else
            \begin{center}
                \begin{large}
                    \bfseries{Zusammenfassung}
                \end{large}
            \end{center}
            \begin{center}
                \begin{minipage}[c]{0.85\textwidth}
                    \begin{small}
                        \germanabstract%
                        \relax
                    \end{small}
                \end{minipage}
            \end{center}
        \fi
    \fi
    % --- reset language ---
    \ifenglish
        \selectlanguage{english}
    \else
        \selectlanguage{ngerman}
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
%\begin{titlepage}
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
            \includegraphics[height=1.0cm]{figures/logo_aig_transparent_bg.png}\\
            \begin{footnotesize}
                \ifenglish%
                    Artificial Intelligence Group
                \else
                    Artificial Intelligence Group
                \fi
            \end{footnotesize}
        \end{minipage}\\
        \renewcommand{\arraystretch}{1.0} %reset arraystretch to default

        \ifthesis
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
                        \PackageError{AIGthesis}{It is required to set the type of document}{document type must be one of: bachelor, master, seminar, researchlab, proposal}
                        >>SET TYPE (seminar, bachelor...) IN DOCUMENTCLASS OPTIONS<<
                    \fi
                \fi
                \\[.2cm]
            \end{huge}
            \ifenglish%
                in partial fulfilment of the requirements for\\
                the degree of
            \else
                zur Erlangung des Grades
%                \iffemalemale%
%                    einer/eines
%                \else
%                    \iffemale%
%                        einer
%                    \else
%                        \ifmale%
%                            eines
%                        \else
%                            >>SET GENDER (fm, f, or m) IN DOCUMENTCLASS OPTIONS<<
%                        \fi
%                    \fi
%                \fi
            \fi
            \ifbachelor%
                \emph{Bachelor of Science (B.Sc.)}     
            \else
                \ifmaster%
                    \emph{Master of Science (M.Sc.)}
                \else
                    >>SET GRADE (bachelor or master) IN DOCUMENTCLASS OPTIONS<<
                \fi
            \fi
            \linebreak
            \ifenglish%
                in
            \else
                im Studiengang
            \fi
            \degreecourse\\[.75cm]
        \else
            % Title for seminar, proposal or researchlab paper
            \vspace*{0.9cm}
            \begin{LARGE}
                \textbf{\thetitle}\\[0.5cm]
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
                                Exposé
                            \fi
                    \else
                        \ifresearchlab%
                            \ifenglish%
                                Research Lab Report
                            \else
                                Fachpraktikumsbericht
                            \fi 
                        \else
                            \PackageError{AIGpaper}{It is required to set the type of document}{document type must be one of: seminar, researchlab, proposal}
                            >>SET TYPE (seminar, proposal, researchlab) IN DOCUMENTCLASS OPTIONS<<
                        \fi
                    \fi
                \fi
                \\[.1cm]
            \end{LARGE}
        \fi
        
        \begin{large}
            \ifenglish%
                submitted by\\
            \else
                vorgelegt von\\
            \fi
        \end{large}
        \ifthesis%
            \begin{Large}
                \theauthor\\[3.79cm]
            \end{Large}
        \else
            \begin{Large}
                \theauthor\\[0.5cm]
            \end{Large}
        \fi
    \end{center}

    \ifthesis%
        \vspace*{\fill}
        \begin{tabular}{ll}
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
        \end{tabular}
    \else
        \relax
    \fi
%\end{titlepage}

\ifthesis%
    \thispagestyle{empty}
    \cleardoublepage
\fi

\ifthesis%
    \ifgroup%
        \makestatement{1}
        \cleardoublepage
        \makestatement{1}
        \cleardoublepage
    \else
        \makestatement{1}
        \cleardoublepage
    \fi
\fi

\makeabstract
\ifthesis%
    \cleardoublepage
\fi
}