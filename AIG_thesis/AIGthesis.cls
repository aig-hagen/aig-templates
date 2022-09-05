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
        % \begin{tabular}{c p{2.25cm} c}
        %     \includegraphics[height=1.3cm]{logos/uni-logo}
        %     &
        %     \empty
        %     &
        %     \includegraphics[height=1.0cm]{logos/AIG-logo}
        %     \\
        %     \hspace{.71cm}
        %     \begin{footnotesize}
        %         \ifenglish%
        %             Faculty of Mathematics and Computer Science
        %         \else
        %             Fakultät für Mathematik und Informatik
        %         \fi
        %     \end{footnotesize}
        %     &
        %     \empty
        %     &
        %     \begin{footnotesize}
        %         Artificial Intelligence
        %     \end{footnotesize}
        %     \\
        %     &
        %     \empty
        %     &
        %     \begin{footnotesize}
        %         Group
        %     \end{footnotesize}
        % \end{tabular}\\
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
        \begin{flushleft}
            \loop\ifnum\theAuthorNumber>0
            \begin{Large}
                \ifenglish%
                    Statement
                \else
                    Erkl{\"a}rung
                \fi
                \\[5mm]
            \end{Large}
            \ifenglish%
                I hereby certify that this thesis has been composed by me and is based on my own work, that I did not use any further resources than specified \textendash{} in particular no references unmentioned in the reference section \textendash{} and that I did not submit this thesis to another examination before. The paper submission is identical to the submitted electronic version.
            \else
                Hiermit best{\"a}tige ich, dass die vorliegende Arbeit von mir selbstst{\"a}ndig verfasst wurde und ich keine anderen als die angegebenen Hilfsmittel \textendash{} insbesondere keine im Quellenverzeichnis nicht benannten Internet-Quellen \textendash{} benutzt habe und die Arbeit von mir vorher nicht in einem anderen Pr{\"u}fungsverfahren eingereicht wurde. Die eingereichte schriftliche Fassung entspricht der auf dem elektronischen Speichermedium (CD-Rom).
            \fi
            \\[.75cm]
            \begin{center}
                \begin{tabular}{l p{1cm} cc}
                    \empty & \empty & 
                    \ifenglish%
                        Yes
                    \else
                        Ja 
                    \fi
                    & 
                    \ifenglish%
                        No
                    \else
                        Nein
                    \fi
                    \\[.5cm]
                    \ifenglish%
                        I agree to have this thesis published in the library.& \empty & $\square$ & $\square$\\[.5cm]
                    \else
                        Mit der Einstellung dieser Arbeit in die Bibliothek& \empty & \empty & \empty\\
                            bin ich einverstanden. & \empty & $\square$ & $\square$\\[.5cm]
                    \fi
                    \ifenglish%
                        I agree to have this thesis published on the webpage of & \empty & \empty & \empty\\
                        the artificial intelligence group.& \empty & $\square$ & $\square$\\[.5cm]
                    \else
                        Der Ver\"offentlichung dieser Arbeit auf der Webseite des & \empty & \empty & \empty\\
                        Lehrgebiets Künstliche Intelligenz stimme ich zu.& \empty & $\square$ & $\square$\\[.5cm]
                    \fi
                    \ifenglish%
                        The thesis text is available under a Creative Commons  & \empty & \empty & \empty\\
                        License (CC BY-SA 4.0). & \empty & $\square$ & $\square$\\[.5cm]
                    \else
                        Der Text dieser Arbeit ist unter einer Creative & \empty & \empty & \empty \\
                        Commons Lizenz (CC BY-SA 4.0) verf\"ugbar. & \empty & $\square$ & $\square$\\[.5cm]
                    \fi
                    \ifenglish%
                        The source code is available under a GNU General Public & \empty & \empty & \empty\\
                        License (GPLv3). & \empty & $\square$ & $\square$\\[.5cm]
                    \else
                        Der Quellcode ist unter einer GNU General Public & \empty & \empty & \empty\\
                        License (GPLv3) verf\"ugbar. & \empty & $\square$ & $\square$\\[.5cm]
                    \fi
                    \ifenglish%
                        The collected data is available under a Creative Commons & \empty & \empty & \empty\\
                        License (CC BY-SA 4.0). & \empty & $\square$ & $\square$\\[.5cm]
                    \else
                        Die erhobenen Daten sind unter einer Creative & \empty & \empty & \empty\\
                        Commons Lizenz (CC BY-SA 4.0) verf\"ugbar. & \empty & $\square$ & $\square$\\
                    \fi
                \end{tabular}\\[2cm]
            \end{center}
            \begin{small}
                \dotfill\\
                \ifenglish
                    (Place, Date)\hfill(Signature)
                \else
                    (Ort, Datum)\hfill(Unterschrift)
                \fi
            \end{small}
            \addtocounter{AuthorNumber}{-1}
            \cleardoublepage%
            \repeat%
        \end{flushleft}
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