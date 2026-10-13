%*******************************************************************************
%  AIGpaper.cls
%
%  LaTeX document class for seminar papers, proposals, bachelor's theses, and
%  master's theses written at the Artificial Intelligence Group.
%
% Adopted from the WeSTThesis.cls template.
%
% Version:  v1.8
% Date:     2025/05/23
% License:  CC BY 4.0
%
%*******************************************************************************


%--- Identification ------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{AIGSeminarReview}[2025/05/23 v1.0 at the Artificial Intelligence Group, FernUniversität in Hagen.]


\LoadClass[11pt,a4paper,fancyheader,sfdefaults=false]{scrartcl}



\RequirePackage[english,ngerman]{babel}		    % English and new German spelling
\RequirePackage[utf8]{inputenc}                 % Correct input encoding
\RequirePackage[T1]{fontenc}                    % Correct output encoding
\RequirePackage{titling}                        % For title page creation
\RequirePackage{ifoddpage}                      % For clearing double pages dynamically(?)



\RequirePackage{fancyhdr}
\RequirePackage{graphicx}				% Einbinden von Bildern
\RequirePackage{xcolor}					% Farben wenn es sein muß
\RequirePackage{hyperref}				% Klickbare Verweise und \autoref{label}
\RequirePackage{booktabs}				% "Schöne" Tabellen
\RequirePackage{amsmath}				% Mathematischer Formelsatz AMS
\RequirePackage{amsfonts}
\RequirePackage{geometry}
\geometry{top=2cm,bottom=3cm,left=2.75cm,right=2.75cm}

\newcommand{\intstudent}{Name of the student}
\newcommand{\intpapertitle}{Title of the reviewed paper}
\newcommand{\intreviewername}{Name of the reviewer}

\newcommand{\student}[1]{\renewcommand{\intstudent}{#1}}
\newcommand{\papertitle}[1]{\renewcommand{\intpapertitle}{#1}}
\newcommand{\reviewername}[1]{\renewcommand{\intreviewername}{#1}}

\newcommand{\removeme}[1]{\begingroup\color{red}\textit{#1}\endgroup}

% redefine \maketitle
\renewcommand{\maketitle}{
\begin{center}
	\newif\ifenglish
	\renewcommand{\arraystretch}{.8}
	%\noindent\rule{\textwidth}{0.4pt} 
	\begin{minipage}{.5\textwidth}
		\includegraphics[height=1.0cm]{figures/Uni_hagen_logo.png}\\[0.1cm]
		%\noindent\rule{\textwidth}{0.4pt} 
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
		\includegraphics[height=1.085cm]{figures/logoaig2025_transparent.png}\\[0.1cm]
		%\noindent\rule{\textwidth}{0.4pt} 
		\begin{footnotesize}
			\ifenglish%
			Artificial Intelligence Group
			\else
			Artificial Intelligence Group
			\fi
		\end{footnotesize}
	\end{minipage}
\end{center}

\bigskip
{\noindent{\LARGE\textbf{Review of a seminar paper}}\\[0.5em]
	\noindent	
	\begin{tabular}{@{}rl@{}}
		 Title: & \makeatletter\intpapertitle\makeatother\\
		 Author: &\intstudent\\
		 Reviewer name:  &\intreviewername\\
		\end{tabular}}

}
