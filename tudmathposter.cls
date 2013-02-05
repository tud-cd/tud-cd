%% LaTeX-Klasse für Poster im Corporate Design der TU Dresden.
%%
%% Originalautor: Martin Zabel (martin.zabel@tu-dresden.de)
%% Modifikationen (Mathematik): 
%% Tobias Schlemmer (tobias.schlemmer@mailbox.tu-dresden.de)
%% Daniel Borchmann (daniel.borchmann@mailbox.tu-dresden.de)
%% 
%%
%% Dokumentation: Siehe Beispiel-utf8.pdf
%%
%%
%% Für DIN A1 bis DIN A3 werden zwar schon die Balken und Textbereiche 
%% implementiert, aber es fehlen noch passende Schriftgrößen.
%%
%%
%% Änderungen:
%% tudmathposter: siehe Beispiel-utf8.pdf
%% v0.6) - Bei Option bluebg: Balken korrigiert, jetzt mit weißen Linien.
%% v0.5) - Serifenlose Formeln (Deaktivierbar).
%%       - Korrekte Größe und Farben für Überschriften (section, u.a.).
%%       - Punkte für Anstriche (\textbullet) korrigiert.
%%
%% v0.4) - Optionaler blauer Hintergrund im Inhaltsbereich.
%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tudmathposter}[2010/08/20 v1.5 TU Dresden Matheposter Tobias.Schlemmer@mailbox.tu-dresden.de]

\newif\if@tudposter@bluebg\@tudposter@bluebgfalse
\DeclareOption{bluebg}{\@tudposter@bluebgtrue}

% Font-Optionen weitergeben
\DeclareOption{serifmath}{\PassOptionsToPackage{\CurrentOption}{tudfonts}}
\DeclareOption{noeulermath}{\PassOptionsToPackage{\CurrentOption}{tudfonts}}
\DeclareOption{noDIN}{\PassOptionsToPackage{\CurrentOption}{tudfonts}}

% Wers hardcore haben möchte. Acrobat schimpft dann über falsche Angaben
\DeclareOption{x-1a}{\RequirePackage[x-1a]{pdfx}}
\DeclareOption{a-1b}{\RequirePackage[a-1b]{pdfx}}

\newif\if@mathevorgabe\@mathevorgabefalse
\DeclareOption{Mathematik}{\@mathevorgabetrue}


\DeclareOption*{
  % scrartcl: Für Papierformat und Basislayout, Schriftgrößen,
  % Description, ...
  \PassOptionsToClass{\CurrentOption}{scrartcl}%
}
\ProcessOptions\relax

\PassOptionsToPackage{pagesize}{typearea}
% Das Paket a0poster.cls konnte aufgrund eines komischen Fehlers in den
% pagestyles nicht direkt benutzt werden.
\RequirePackage{rescalefont}%
\LoadClass{scrartcl}
%\AtBeginDvi{\special{! /landplus90 true store}}% für landscape
\RequirePackage{calc}
\PassOptionsToPackage{table,fixpdftex,cmyk,dvipsnames}{xcolor}
\RequirePackage{xcolor}
\convertcolorsDtrue
\convertcolorsUtrue
\RequirePackage{graphicx}
\RequirePackage{textcomp}
\RequirePackage{tabularx}
\RequirePackage{tudfonts}
\RequirePackage{tudcolors}

% Konfiguration
% Vom Nutzer anzugebende / veraenderbare Namen und Bezeichnungen
% analog tudbeamer.cls
\providecommand*\@subtitle{}
\newcommand*\@einrichtung{}
\newcommand*\@fachrichtung{}
\newcommand*\@institut{}
\newcommand*\@professur{}
\newcommand*\@fusszeile{}
\newcommand*\@telefon{}
\newcommand*\@fax{}
\newcommand*\@homepage{http://www.math.tu-dresden.de/}
\newcommand*\@zweitlogo{}
\newcommand*\@drittlogo{}

\providecommand*{\subtitle}[1]{\renewcommand*{\@subtitle}{#1}}
\newcommand*{\einrichtung}[1]{\renewcommand*{\@einrichtung}{#1}}
\newcommand*{\fachrichtung}[1]{\renewcommand*{\@fachrichtung}{#1}}
\newcommand*{\institut}[1]{\renewcommand*{\@institut}{#1}}
\newcommand*{\professur}[1]{\renewcommand*{\@professur}{#1}}
\newcommand*{\fusszeile}[1]{\renewcommand*{\@fusszeile}{#1}}
\newcommand*{\telefon}[1]{\renewcommand*{\@telefon}{#1}}
\newcommand*{\fax}[1]{\renewcommand*{\@fax}{#1}}
\newcommand*{\homepage}[1]{\renewcommand*{\@homepage}{#1}}
\newcommand*{\zweitlogo}[1]{%
  \ClassWarning{tudmathposter}{Die Position fuer das Zweitlogo ist im\MessageBreak
    CD der TU Dresden nicht eindeutig geregelt.\MessageBreak
    Die aktuell implementierte Position ist *falsch*.\MessageBreak
    Eine Reimplementation ist aus o.g. Gruenden nicht möglich.\MessageBreak
    Verwenden Sie bitte \string\drittlogo, \string\drittlogofile oder\MessageBreak
    positionieren Sie bitte das Logo im Hauptteil.%
  }%
  \renewcommand*{\@zweitlogo}{#1}%
}
\newcommand*{\zweitlogofile}[1]{\zweitlogo{\includegraphics[height=0.292\tudposter@logowidth]{#1}}}
\newcommand*{\drittlogo}[1]{\renewcommand*{\@drittlogo}{#1}}
\newcommand*{\drittlogofile}[1]{\drittlogo{\includegraphics[heigt=5\baselineskip]{#1}}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Schriftgrößen für einzelne Papiergrößen
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ifdim\paperheight>842mm
%-- Gestaltungshöhe: über Höhe DIN A1 bis Höhe DIN A0

%% Copied from a0poster.sty from TeX-Live distribution.
%% Copyright (C) 1997-2004 Gerlinde Kettl and Matthias Weiser
  \renewcommand{\tiny}{\@setfontsize\tiny{17.36}{20.83}}

  \renewcommand{\scriptsize}{\@setfontsize\scriptsize{20.83}{25}}   
  \renewcommand{\footnotesize}{\@setfontsize\footnotesize{25}{30}}
  \renewcommand{\small}{\@setfontsize\small{30}{36}}
  \renewcommand{\normalsize}{\@setfontsize\normalsize{36}{43,2}}
  \renewcommand{\large}{\@setfontsize\large{42}{50,4}}
  \renewcommand{\Large}{\@setfontsize\Large{50}{60}}
  \renewcommand{\LARGE}{\@setfontsize\LARGE{60}{72}}
  \renewcommand{\huge}{\@setfontsize\huge{80}{96}}
  \renewcommand{\Huge}{\@setfontsize\Huge{104}{124,8}}

  \DeclareTudMathSizes{17.36}{17.36}{17.36}{17.36}
  \DeclareTudMathSizes{20.83}{20.83}{17.36}{17.36}
  \DeclareTudMathSizes{25}{25}{20.83}{17.36}
  \DeclareTudMathSizes{30}{30}{25}{20.83}
  \DeclareTudMathSizes{36}{36}{30}{25}
  \DeclareTudMathSizes{42}{42}{36}{30}
  \DeclareTudMathSizes{50}{50}{42}{36}
  \DeclareTudMathSizes{60}{60}{50}{42}
  \DeclareTudMathSizes{80}{80}{60}{50}
  \DeclareTudMathSizes{104}{104}{80}{60}

  \setlength\smallskipamount{9pt plus 2pt minus 2pt}
  \setlength\medskipamount{18pt plus 4pt minus 4pt}
  \setlength\bigskipamount{36pt plus 8pt minus 8pt}

  \setlength\abovecaptionskip{25pt}
  \setlength\belowcaptionskip{0pt}
  \setlength\abovedisplayskip{25pt plus 6pt minus 15 pt}
  \setlength\abovedisplayshortskip{0pt plus 6pt}
  \setlength\belowdisplayshortskip{13pt plus 7pt minus 6pt}
  \setlength\belowdisplayskip\abovedisplayskip
  
%% End of Copy
\fi

\if@tudfonts@nodin
  \setkomafont{title}{\fontfamily{aun}\fontseries{b}\Huge} % Univ
  \newcommand\subtitlefont{\fontfamily{aun}\fontseries{m}\huge}
  \newcommand\preprocesstitle[1]{\mbox{#1}}
\else
  \setkomafont{title}{\dinBold\Huge}
  \newcommand\subtitlefont{\dinBold\huge}
  \newcommand\preprocesstitle[1]{\mbox{\MakeUppercase{#1}}}
\fi

\if@mathevorgabe
\if@tudfonts@nodin
\setkomafont{title}{\fontfamily{aun}\fontseries{b}\Huge} % Univers 55
                                % bold 104pt
\renewcommand\subtitlefont{\fontfamily{aun}\fontseries{m}\huge}
\else
\setkomafont{title}{\dinBold\Huge} % DIN bold 104pt
\renewcommand\subtitlefont{\dinBold\huge}
\fi
\newcommand{\sectionfont}{\fontfamily{aun}\fontseries{b}\fontshape{n}\LARGE} %Univers55 bold 60pt
\newcommand{\subsectionfont}{\fontfamily{aun}\fontseries{b}\fontshape{n}\large}
% Univers45 light bold 42pt
\fi

\normalsize
%\@bigheadings% muss explizit noch einmal aufgerufen werden

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Logo (ala tudbeamer)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\tudposter@logo{logo_weiss}
\ifx\pdfoutput\undefined\else\ifx\pdfoutput\relax\else\ifcase\pdfoutput\else
\def\tudposter@logo{TU_Logo_SW}\fi\fi\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Seiten-Maße
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newlength{\tudposter@headheight}% Höhe des Kopfbereichs
\newlength{\tudposter@cbheight}% Höhe des Querbalkens
\newlength{\tudposter@footheight}% Fußbereich-Höhe
\newlength{\tudposter@lmargin}% Achsenabstand linker Rand
\newlength{\tudposter@rmargin}% Achsenabstand linker Rand (automatisch)
\newlength{\tudposter@logospacex}% Logo-Abstand x
\newlength{\tudposter@logospacey}% Logo-Abstand y
\newlength{\tudposter@logowidth}% Logo-Breite
\newlength{\tudposter@cbfontsize}% Schriftgröße für Querbalkentext
\newlength{\tudposter@cbtextraise}% Verschiebung für Querbalkentext

% Die Vergleichswerte sind jeweils ein Millimeter größer als nötig.
% Maße für A0 hoch und A1 hoch aus den Vorlage-Dateien
% entnommen. Diese weichen bewusst von den Angaben im CD-Handbuch
% ab. Abweichungen als Kommentar angegeben.
\ifdim\paperheight>842mm
% Gestaltungshöhe: über Höhe DIN A1 bis Höhe DIN A0
  \setlength{\tudposter@headheight}{140mm}%
  \setlength{\tudposter@cbheight}{20mm}%
  \setlength{\tudposter@footheight}{84.1mm}%
  \setlength{\tudposter@lmargin}{120mm}%
  \setlength{\tudposter@logospacex}{43.5mm}%
  \setlength{\tudposter@logospacey}{53.4mm}%
  \setlength{\tudposter@logowidth}{225.3mm}%
  \setlength{\tudposter@cbfontsize}{29.86pt}% Vorgabe 20pt
  \setlength{\tudposter@cbtextraise}{6mm}

% Überschreibung Mathematik-Vorgaben
\if@mathevorgabe
  \setlength{\paperheight}{1257.3mm}
  \setlength{\paperwidth}{889.00mm}
  \typearea{1}% Papiermaße ans PDF weiterreichen
  \setlength{\tudposter@logospacex}{34mm}
  \setlength{\tudposter@logospacey}{34mm}
  \setlength{\tudposter@headheight}{112mm}
  \setlength{\tudposter@logowidth}{228mm}
  \setlength{\tudposter@cbheight}{25.4mm}
  \setlength{\tudposter@cbfontsize}{44pt}
  \setlength{\tudposter@footheight}{112mm}
  \setlength{\tudposter@lmargin}{110.0mm}
  \setlength{\abovedisplayskip}{9.81mm}
  \setlength{\abovedisplayshortskip}{\abovedisplayskip}
  \setlength{\belowdisplayskip}{14.78mm}
  \setlength{\belowdisplayshortskip}{\belowdisplayskip}
  \setlength{\intextsep}{\baselineskip}
\fi

\else\ifdim\paperheight>595mm
%-- Gestaltungshöhe: über Höhe DIN A2 bis Höhe DIN A1
%-- entspricht auch A0 quer
  \setlength{\tudposter@headheight}{100mm}%
  \setlength{\tudposter@cbheight}{14mm}%
  \setlength{\tudposter@footheight}{60mm}%
  \setlength{\tudposter@lmargin}{85mm}%
  \setlength{\tudposter@logospacex}{31mm}%
  \setlength{\tudposter@logospacey}{38mm}%
  \setlength{\tudposter@logowidth}{161.5mm}%
  \setlength{\tudposter@cbfontsize}{20.74pt}% Vorgabe 14pt
  \setlength{\tudposter@cbtextraise}{4mm}

\else\ifdim\paperheight>421mm
%-- Gestaltungshöhe: über Höhe DIN A3 bis Höhe DIN A2
%-- entspricht auch A1 quer
  \setlength{\tudposter@headheight}{70mm}%
  \setlength{\tudposter@cbheight}{10mm}%
  \setlength{\tudposter@footheight}{42mm}%
  \setlength{\tudposter@lmargin}{60mm}%
  \setlength{\tudposter@logospacex}{22mm}%
  \setlength{\tudposter@logospacey}{27mm}%
  \setlength{\tudposter@logowidth}{114mm}%
  \setlength{\tudposter@cbfontsize}{14.4pt}% Vorgabe 13.5pt
  \setlength{\tudposter@cbtextraise}{3mm}

\else\ifdim\paperheight>298mm
%-- Gestaltungshöhe: über Höhe DIN A4 bis Höhe DIN A3
  \setlength{\tudposter@headheight}{50mm}%
  \setlength{\tudposter@cbheight}{7mm}%
  \setlength{\tudposter@footheight}{30mm}%
  \setlength{\tudposter@lmargin}{42mm}%
  \setlength{\tudposter@logospacex}{15.5mm}%
  \setlength{\tudposter@logospacey}{19mm}%
  \setlength{\tudposter@logowidth}{80mm}%
  \setlength{\tudposter@cbfontsize}{12pt}% Vorgabe 13pt
  \setlength{\tudposter@cbtextraise}{2mm}

\else\ifdim\paperheight>148mm
%-- Gestaltungshöhe: über Höhe DIN A6 bis Höhe DIN A4
  \setlength{\tudposter@headheight}{35mm}%
  \setlength{\tudposter@cbheight}{5mm}%
  \setlength{\tudposter@footheight}{21mm}%
  \setlength{\tudposter@lmargin}{30mm}%
  \setlength{\tudposter@logospacex}{11mm}%
  \setlength{\tudposter@logospacey}{13.5mm}%
  \setlength{\tudposter@logowidth}{57mm}%
  \setlength{\tudposter@cbfontsize}{9pt}% Vorgabe 9pt
  \setlength{\tudposter@cbtextraise}{1.25mm}

\else
%-- Gestaltungshöhe: Höhe DIN A6
  \setlength{\tudposter@headheight}{17.5mm}%
  \setlength{\tudposter@cbheight}{2.5mm}%
  \setlength{\tudposter@footheight}{10.5mm}%
  \setlength{\tudposter@lmargin}{15mm}%
  \setlength{\tudposter@logospacex}{5.5mm}%
  \setlength{\tudposter@logospacey}{6.5mm}%
  \setlength{\tudposter@logowidth}{28.5mm}%
  \setlength{\tudposter@cbfontsize}{6pt}% Vorgabe 6.5pt
  \setlength{\tudposter@cbtextraise}{1mm}

\fi\fi\fi\fi\fi

% Makro für die Berechnung des Layouts, damit Seitenparameter im
% Dokument angepasst werden können.
\newcommand*\tudposter@calclayout{%
% rechter Rand: lt. M. Kaden: Achsenabstand minus zweimal Querbalken
\setlength{\tudposter@rmargin}{\tudposter@lmargin-2\tudposter@cbheight}
%
\setlength{\topmargin}{-1in}% -1in wegen globaler Verschiebung
% Kopfzeile = Kopfbereich + Querbalken
\setlength{\headheight}{\tudposter@headheight+\tudposter@cbheight}
% minimaler Leerraum unter dem Querbalken (lt. M. Kaden)
\setlength{\headsep}{2\tudposter@cbheight}
% Basislinie erster Zeile: Standardwert, ggf. im Dokument anpassen
\setlength{\topskip}{\baselineskip}
% unterer Rand: Fußbereich + minimaler Abstand (lt. M. Kaden)
\setlength{\footskip}{\tudposter@footheight+2\tudposter@cbheight}
% -1in wegen globaler Verschiebung in \topmargin
\setlength{\textheight}{\paperheight-1in-\topmargin-\headheight-\headsep-\footskip}
% -1in wegen globaler Verschiebung
\setlength{\oddsidemargin}{\tudposter@lmargin-1in}
\setlength{\evensidemargin}{\oddsidemargin}
% -2in wegen globaler Verschiebung in \oddsidemargin
\setlength{\textwidth}{\paperwidth-\tudposter@lmargin-\tudposter@rmargin}
}
\tudposter@calclayout

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Seiten-Layout
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newlength{\tudposter@logoposx}% Logo-Position X
\newlength{\tudposter@logoposy}% Logo-Position Y
\setlength{\tudposter@logoposx}{-\tudposter@lmargin+\tudposter@logospacex}
% Logo-Höhe = 0.292 * Logo-Breite
\setlength{\tudposter@logoposy}{\headheight-\tudposter@logospacey-0.292\tudposter@logowidth}

% Kopf- und Fußzeile
\newcommand*{\ps@tudposter}{%
  \renewcommand*{\@oddhead}{% Kopfzeile
    \if@tudposter@bluebg
      % Blauer Inhaltsbereich
      \color{HKS41K100}%
      \raisebox{-\paperheight+\headheight}[0mm][0mm]{%
        \makebox[0mm][r]{\rule{\tudposter@lmargin}{\paperheight}}%
        \makebox[0mm][l]{\rule{\paperwidth-\tudposter@lmargin}{\paperheight}}%
      }%
      % ... mit weißen Linien statt Balken
      \color{white}%
      \makebox[0mm][r]{\rule{\tudposter@lmargin}{3pt}}%
      \makebox[0mm][l]{\rule{\paperwidth-\tudposter@lmargin}{3pt}}%
      \raisebox{\tudposter@cbheight}[0mm][0mm]{%
        \makebox[0mm][r]{\rule{\tudposter@lmargin}{3pt}}%
        \makebox[0mm][l]{\rule{\paperwidth-\tudposter@lmargin}{3pt}}%
      }%
    \else
      % Weißer Inhaltsbereich, mit hellblauem Balken
      \color{HKS41K50}%
      \makebox[0mm][r]{\rule{\tudposter@lmargin}{\tudposter@cbheight}}%
      \makebox[0mm][l]{\rule{\paperwidth-\tudposter@lmargin}{\tudposter@cbheight}}%
      \color{HKS41K100}%
      \raisebox{\tudposter@cbheight}[0mm][0mm]{%
        \makebox[0mm][r]{\rule{\tudposter@lmargin}{\headheight-\tudposter@cbheight}}%
        \makebox[0mm][l]{\rule{\paperwidth-\tudposter@lmargin}{\headheight-\tudposter@cbheight}}%
      }%
    \fi
    \rlap{\raisebox{\tudposter@cbtextraise}{%
	\color{white}%
	\fontsize{\tudposter@cbfontsize}{1.2\tudposter@cbfontsize}%
	% auf leere Inhalte prüfen
        \def\tudposter@comma{}%
	\ifx\@einrichtung\@empty\else\textbf{\@einrichtung}%
	  \def\tudposter@comma{~~}%
	\fi%
	\ifx\@fachrichtung\@empty\else\tudposter@comma\@fachrichtung%
	  \def\tudposter@comma{, }%
	\fi%
        \if@mathevorgabe\else
          \ifx\@institut\@empty\else\tudposter@comma\@institut
   	    \def\tudposter@comma{, }%
	  \fi%
          \ifx\@professur\@empty\else\tudposter@comma\@professur\fi%
        \fi
    }}%
    \rlap{\raisebox{\tudposter@logoposy}{%
	\hspace*{\tudposter@logoposx}%
	\color{white}% pdflatex: Logo-Farbe
	\includegraphics[width=\tudposter@logowidth]{\tudposter@logo}%
    }}%
    \hfill% Damit alles links ausgerichtet wird
    \raisebox{\tudposter@logoposy}{\@zweitlogo}%
  }%
  \renewcommand*{\@oddfoot}{% Fußzeile
    \ifdim\tudposter@footheight>0mm
    \color{HKS41K100}%
    \makebox[0mm][r]{\rule{\tudposter@lmargin}{\tudposter@footheight}}%
    \makebox[0mm][l]{\rule{\paperwidth-\tudposter@lmargin}{\tudposter@footheight}}%
    \raisebox{.5\tudposter@footheight}{%
      \begin{minipage}{\textwidth}%
	\color{white}%
	\@fusszeile
      \end{minipage}%
    }%
    \fi
  }%
  \let\@evenhead\@oddhead% gerade und ungerade Seite gleich
  \let\@evenfoot\@oddfoot
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Text-Layout
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\parskip1ex plus 1ex
\parindent0cm

\AtBeginDocument{%
  \if@tudposter@bluebg\color{white}\fi
}

\if@tudposter@bluebg
\renewcommand*\sectfont{\normalcolor\sffamily\bfseries\color{white}}
\else
\renewcommand*\sectfont{\normalcolor\sffamily\bfseries\color{HKS41K100}}
\fi

\renewcommand\maketitle{%
  \setlength\@tempskipa{33.02mm-\topskip}%
  \vskip\@tempskipa
 {%
    \ifx\@title\@empty\else
    \usekomafont{title}\preprocesstitle{\@title}%
    \ifx\@subtitle\@empty\else\\\fi
    \fi
  }{
    \ifx\@subtitle\@empty\else
    \subtitlefont\preprocesstitle{\@subtitle}%
    \fi
    \vskip 3.17cm\relax
  }%
}

% Gliederungstiefen
\if@mathevorgabe
\newcommand\sectiontopskip{68pt}
\newcommand\subsectiontopskip{26.3pt}
\newcommand\topsection{\@startsection{section}{1}{0pt}{0pt}{43.2pt}{\sectionfont}}
\newcommand\topsubsection{\@startsection{subsection}{2}{0pt}{26.3pt}{13.4pt}{\subsectionfont}}
\newcommand\topcentersection{%
  \@startsection{section}{1}{0pt}{0pt}{43.2pt}
  {\sectionfont\centering}%
}
\newcommand\topcentersubsection{%
  \@startsection{subsection}{2}{0pt}{0pt}{13.4pt}
  {\centering\subsectionfont}%
}

\renewcommand\section{\@startsection{section}{1}{0pt}{\sectiontopskip}{43.2pt}{\sectionfont}}
\renewcommand\subsection{\@startsection{subsection}{2}{0pt}{\subsectiontopskip}{13.4pt}{\subsectionfont}}
\newcommand\centersection{%
  \@startsection{section}{1}{0pt}{\sectiontopskip}{43.2pt}
  {\sectionfont\centering}%
}
\newcommand\centersubsection{%
  \@startsection{subsection}{2}{0pt}{\subsectiontopskip}{13.4pt}
  {\centering\subsectionfont}%
}
\fi
\fusszeile{\normalsize%
\begingroup
 \def\tud@kontakt{}%
 \ifx\@einrichtung\@empty\def\tud@kontakt{\strut Kontakt\\}\fi
 \ifx\@einrichtung\@empty\def\tud@kontakt{\strut Kontakt\\}\fi
 \ifx\@einrichtung\@empty\def\tud@kontakt{\strut Kontakt\\}\fi
 \ifx\@einrichtung\@empty\def\tud@kontakt{\strut Kontakt\\}\fi
 \parbox[t]{907.3pt}{\raggedright%
    \tud@kontakt
    \strut Technische Universit\"at Dresden\\
    \ifx\@einrichtung\@empty\else\strut \@einrichtung\\\fi
    \ifx\@fachrichtung\@empty\else\strut \@fachrichtung\\\fi
    \ifx\@institut\@empty\else\strut \@institut\\\fi
    \ifx\@professur\@empty\else\strut \@professur\\\fi
  }%
  \parbox[t]{907.3pt}{\raggedright
    \strut\hfill\\
    \ifx\@author\@empty\else\strut\@author\\\fi
    \strut 01062 Dresden\\
    \ifx\@telefon\@empty
    \else
      \strut Tel.:~\@telefon
      \ifx\@fax\@empty\\\else{} / \fi
    \fi
    \ifx\@fax\@empty\else\strut Fax:~\@fax\\\fi
    \ifx\@homepage\@empty\else\strut \@homepage \fi
  }%
  \hfill\raisebox{-4\baselineskip}{\@drittlogo}%
\endgroup
}

% Initialisierung des Textbereiches
\setcounter{secnumdepth}{0}
\if@mathevorgabe
\einrichtung{Fakult\"at f\"ur Mathematik und Naturwissenschaften}
\fachrichtung{Fachrichtung Mathematik}
\homepage{http://tu-dresden.de/mathematik}
%\drittlogo{\colorbox{white}{\includegraphics[height=5\baselineskip]{DDC-01.pdf}}}
\drittlogo{\includegraphics[page=3,height=5\baselineskip]{DDC_Logo_BB.pdf}}
\pagestyle{tudposter}
\normalsize
\fi 

\newenvironment{tablehere}
{%
  \def\@captype{table}%
  \vskip\intextsep
}{%
  \vskip\intextsep
}

\newenvironment{figurehere}
{%
  \def\@captype{figure}%
  \vskip\intextsep
  \ignorespaces
}{
  \vskip\intextsep
  \ignorespaces
}

\addtokomafont{caption}{\small}
\addtokomafont{captionlabel}{\small}

\newcommand{\blautabelle}{%
  \colorlet{tableoddcolor}{HKS41K20}%
  \colorlet{tableevencolor}{HKS41K10}%
}
\newcommand\grautabelle{%
  \colorlet{tableoddcolor}{HKS92K20}%
  \colorlet{tableevencolor}{HKS92K10}%
}
\blautabelle
\rowcolors{1}{tableoddcolor}{tableevencolor}
\newif\if@tudposter@rowcolors
\@tudposter@rowcolorsfalse
\newcommand\tudposter@resetrowcolors{%
  \if@tudposter@rowcolors
  \else
  \@rowcolorsfalse
  \fi
}
\newenvironment{farbtabellen}{%
  \begingroup
  \let\if@tudposter@rowcolors\if@rowcolors
  \@rowcolorstrue
}{%
  \aftergroup\tudposter@resetrowcolors
  \endgroup
}
%\show\showrowcolors
\global \@rowcolorsfalse % Abschalten, da Interferenz mit Mathe-Arrays
\newcommand\farbtabelle{\@rowcolorstrue\@rowcolors}
\renewcommand\normalcolor{\color{HKS41K100}}
\normalcolor
%\raggedbottom
\setlength{\columnsep}{1.5cm}%
\AfterPackage{multicols}{%
  \setlength{\multicolsep}{0pt}%
}
\endinput
