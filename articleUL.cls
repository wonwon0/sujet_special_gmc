%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%%
%%%  article LaTeX' class for article submission
%%%
%%%  File name : articleUL.cls
%%%
%%%  By : Boris Mayer St-Onge -- boris@gmc.ulaval.ca -- http://wwwrobot.gmc.ulaval.ca
%%%  Date : January 13, 2003
%%%
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{articleUL}[2003/13/01 article LaTeX' class for article submission]

%%%  Load the standard class article, with the transfert of options
\PassOptionsToClass{11pt}{article}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions

\LoadClass{article}


\usepackage{ifthen}	    				% Loads the command \ifthenelse
\usepackage[utf8]{inputenc}			% To use accentuated words
\usepackage[english,francais]{babel}	% For multiple language




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%%  FONT DEFINITIONS
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%%  Font Definitions (see The LaTeX Companion chapter 7 -- p.173 and 192 for
%%%  instance --- and section 28 --- question 28.2 and 28.3 for instance ---
%%%  of the fr.comp.text.tex FAQ (http://www.grappa.univ-lille3.fr/FAQ-LaTeX)).
%%%
%%%	\DeclareFixedFont{\CodelineFont}{\encodingdefault}{\familydefault}
%%%		{\seriesdefault}{\shapedefault}{size}
%%%
%%%  Explication:
%%%  + {\CodelineFont} name of the font created
%%%  + {\encodingdefault} Encoding if the font, which is usually OT1.  See Table
%%%		7.12 on page 192 and question 28.1 and 28.2 in the FAQ.
%%%  + {\familydefault} Family of the font, which is cmr by default.  For times
%%%		package, the default is ptm (see file /texmf/tex/latex/psnfss/
%%%		times.sty).  See table 7.3 on page 173 and question 28.2 in the
%%%		FAQ.
%%%  + {\seriesdefault} Series of the font, which is m by default.  Other value
%%%		are a combinaison of "weight" and "width".  See table 7.10 on 
%%%		page 190 and question 28.2 in the FAQ.
%%%  + {\shapedefault} Shape of the font, which is n by default.  Other value 
%%%		can be it, sl, sc, ui and ol.  See table 7.11 on page 191 and 
%%%		question 28.2 in the FAQ.
%%%  + {size} Size of the font, which is 10 by default.  Two values can be 
%%%		specified, one for the size and one for the baseline (space 
%%%		between 2 lines).
%%%
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% These are specific fonts used in the file.

%% For title : Times Roman, 14pt, boldface
%\DeclareFixedFont{\ttlfnt}{OT1}{ptm}{b}{n}{14}
\DeclareFixedFont{\ttlfnt}{\encodingdefault}{\familydefault}{\bfdefault}%
	{\shapedefault}{14}

%% For authors : Times Roman, 11pt, small caps
%\DeclareFixedFont{\autfnt}{OT1}{ptm}{m}{sc}{11}
\DeclareFixedFont{\autfnt}{\encodingdefault}{\familydefault}{\seriesdefault}%
	{\scdefault}{11}

%% For affiliations : Times Roman, 11pt, italic
%\DeclareFixedFont{\afffnt}{OT1}{ptm}{m}{it}{11}
\DeclareFixedFont{\afffnt}{\encodingdefault}{\familydefault}{\seriesdefault}%
	{\itdefault}{11}




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%%  PAGE STYLE
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% Use 8.5 in x 11 in paper, with text of 6.9in x 9in
\usepackage{vmargin}
\setpapersize{USletter}
%% Syntax review
%% \setmargins{leftmargins}{topmargin}{textwidth}{textheight}%
%%    {headheight}{headsep}{footheight}{footskip}
%%
%% leftmargins is the left margins
%% topmargin is the top margins
%% textwidth is the text width
%% textheight is the text height
%% headheight fix the header height
%% headsep fix the distance between the header and the text
%% footheight fix the footer height
%% footskip fix the distance between the footer and the text
\setmargins{1in}{1in}{6.5in}{9in}{0in}{0in}{0in}{30pt}




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%%  TITLE HEADER
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% Add some fields
\def\affiliation#1{\\#1}


%% Paper title: 14pt Times Roman boldface (see \ttlfnt), centered in a 6.5in
%%              box and in uppercase. Start at the top of the page and followed
%%              by 2 empty lines.
%% Author/Affiliation: 11pt Times Roman, small caps for author (see \autfnt)
%%                     and italic for affiliation (see \afffnt).  Centered in a
%%                     7.4in box and followed by 3 empty lines.
\def\@maketitle{%
  \newpage
  %% Paper title and Author/Affiliation
  \begin{center}%
    \parbox{6.5in}{\centering\ttlfnt\uppercase\expandafter{\@title} \par}%
    \vskip2\baselineskip%
    \@author%
  \end{center}
  %% Change to 2 columns already put some extra spaces.  So add only
  %% one empty line here.
  \vskip\baselineskip%
}


%% To be able to enter several author with the command \author.
\newcount\@authcnt\newcount\@tmpcnt\@tmpcnt\z@
\def\@author{\ifnum\@authcnt>7\ifnum\@tmpcnt<\@authcnt\global\advance\@tmpcnt1
\leavevmode\hbox{\hss\csname @auth\romannumeral\the\@tmpcnt\endcsname\hss}\quad
\let\next\@author\else\let\next\relax\fi
\else\ifnum\@tmpcnt<\@authcnt\global\advance\@tmpcnt1
\ifnum\@tmpcnt=\@authcnt
\leavevmode\hbox to \csname @auseq\romannumeral\the\@authcnt\endcsname
  {\hss\csname @auth\romannumeral\the\@tmpcnt\endcsname\hss}\ 
\else
\expandafter\expandafter\expandafter\au@car\csname @auseq\romannumeral\the\@authcnt\endcsname\@nil
\expandafter\expandafter\expandafter\au@cdr\csname @auseq\romannumeral\the\@authcnt\endcsname\@nil
\leavevmode\hbox to \@au@car{\hss\csname @auth\romannumeral\the\@tmpcnt\endcsname\hss}\ 
\fi%\show\@au@car\expandafter\show\csname @auseq\romannumeral\the\@authcnt\endcsname
\let\next\@author\else\let\next\relax\fi\fi\next}%
\def\@auseqi{6.4in}
\def\@auseqii{{3in}{3in}}
\def\@auseqiii{{3in}{3in}{6.4in}}
\def\@auseqiv{{3in}{3in}{3in}{3in}}
\def\@auseqv{{2.1in}{2.1in}{2.1in}{3in}{3in}}
\def\@auseqvi{{2.1in}{2.1in}{2.1in}{2.1in}{2.1in}{2.1in}}
\def\@auseqvii{{3in}{3in}{2.1in}{2.1in}{2.1in}{3in}{3in}}
\def\au@car#1#2\@nil{\gdef\@au@car{#1}}
\def\au@cdr#1#2\@nil{\expandafter\gdef\csname @auseq\romannumeral\the\@authcnt\endcsname{#2}}
\def\author#1{\global\advance\@authcnt1
\expandafter\gdef\csname @auth\romannumeral\the\@authcnt\endcsname{\afffnt\begin
  {tabular}[t]{@{}c@{}}\autfnt#1\\[20pt]\end{tabular}}}%




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%%  ABSTRACT AND SPECIAL ENVIRONMENT
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% Create acknowledgement environment
\newenvironment{acknowledgement}{%
    \if@twocolumn
      \section*{\acknowname}%
    \else
      \vspace*{0.15in}
      \noindent
      {\bfseries \acknowname:}%
    \fi}
    {\if@twocolumn\else\endquote\fi}
\newcommand{\acknowname}{\iflanguage{francais}{Remerciements}{Acknowledgements}}


%% Modify abstract environment.
%% Abstract name in boldface, followed by the text in italic
\if@titlepage
  \renewenvironment{abstract}{%
      \titlepage
      \null\vfil
      \begin{center}%
        \bfseries \abstractname
        \@endparpenalty\@M
      \end{center}}%
     {\par\vfil\null\endtitlepage}
\else
  \renewenvironment{abstract}{%
      \if@twocolumn
        \section*{\abstractname}%
      \else
        \begin{center}%
          {\large\bfseries \abstractname\vspace{-.5em}\vspace{\z@}}%
        \end{center}%
        \itshape
      \fi}
\fi




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%%
%%%   How to use it
%%%
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% 
% 
% \documentclass{articleUL}
% 
% \title{Title of your paper}
% 
% %% You can add up to 7 differents authors and LaTeX will show them correctly.
% \author{First Author
% \affiliation{Affiliation of first author with e-mail}}
% 
% \author{Second Author
% \affiliation{Affiliation of second author with e-mail}}
% 
% \author{Author Name\affiliation{and so on ...}}
% 
% \begin{document}
% 
% \selectlanguage{english}	% Change to "francais" if needed
% 
% \maketitle
% 
% \begin{abstract}
% Text of yout abstract ..
% \end{abstract}
% 
% \section{First section}
% 
% Text of your paper ...
% 
% \begin{acknowledgment}
% Acknowledgment is necessary...
% \end{acknowledgment}
% 
% \begin{thebibliography}{}
% \bibitem{key1} First Reference...
% \end{thebibliography}
% 
% \end{document}
% 
% 
