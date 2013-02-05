%% LaTeX-Klasse für Poster im Corporate Design der TU Dresden.
%%
%% Autor: Martin Zabel (martin.zabel@tu-dresden.de)
%% Modifikationen: 
%% Tobias Schlemmer (tobias.schlemmer@mailbox.tu-dresden.de)
%% Daniel Borchmann (daniel.borchmann@mailbox.tu-dresden.de)
%% 
%%
%% Klassenoptionen:
%% - a0paper: DIN A0
%% - a4paper: DIN A4
%% - bluebg: Umschalten auf blauen Hintergrund im Inhaltsbereich.
%% - serifmath: Formeln mit Serifenschrift (CM/EC), statt Univers.
%%
%% Für DIN A1 bis DIN A3 werden zwar schon die Balken und Textbereiche 
%% implementiert, aber es fehlen noch passende Schriftgrößen.
%%
%% Änderungen:
%% v0.6) - Bei Option bluebg: Balken korrigiert, jetzt mit weißen Linien.
%% v0.5) - Serifenlose Formeln (Deaktivierbar).
%%       - Korrekte Größe und Farben für Überschriften (section, u.a.).
%%       - Punkte für Anstriche (\textbullet) korrigiert.
%%
%% v0.4) - Optionaler blauer Hintergrund im Inhaltsbereich.
%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tudmathposter}[2010/07/09 v1.1 Tobias.Schlemmer@mailbox.tu-dresden.de]

\newif\if@tudposter@bluebg\@tudposter@bluebgfalse
\DeclareOption{bluebg}{\@tudposter@bluebgtrue}

% Analog tudbook.cls
\newif\if@tudposter@sansmath\@tudposter@sansmathtrue
\DeclareOption{serifmath}{\@tudposter@sansmathfalse}

\newif\if@tudposter@nodin\@tudposter@nodinfalse
\DeclareOption{noDIN}{\@tudposter@nodintrue}

\newif\if@mathevorgabe\@mathevorgabefalse
\DeclareOption{Mathematik}{\@mathevorgabetrue}

\DeclareOption*{
  % scrartcl: Für Papierformat und Basislayout, Schriftgrößen,
  % Description, ...
  \PassOptionsToClass{\CurrentOption}{scrartcl}%
%  \PassOptionsToPackage{\CurrentOption}{color}%
%  \PassOptionsToPackage{\CurrentOption}{graphicx}%
}
\ProcessOptions\relax

\PassOptionsToPackage{pagesize}{typearea}
% Das Paket a0poster.cls konnte aufgrund eines komischen Fehlers in den
% pagestyles nicht direkt benutzt werden.
% Für zusätzliche Schriftgrößen der CM-/EC-Schriften, die nach wie vor
% für mathematische Symbole benötigt werden, wird außerdem das Paket
% fix-cm.sty statt a0size.sty verwendet. Siehe auch fixltx2e.pdf in
% der Dokumentation zu TeX-Live.
%\RequirePackage{fix-cm}% Vor dem Laden einer LaTeX-Klasse!
\LoadClass{scrartcl}
%\AtBeginDvi{\special{! /landplus90 true store}}% für landscape
\PassOptionsToPackage{table,fixpdftex,cmyk}{xcolor}
\RequirePackage{calc}
\RequirePackage{xcolor}
\RequirePackage{graphicx}
\RequirePackage{textcomp}
\RequirePackage{tabularx}
\RequirePackage{lmodern}

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

\providecommand*{\subtitle}[1]{\renewcommand*{\@subtitle}{#1}}
\newcommand*{\einrichtung}[1]{\renewcommand*{\@einrichtung}{#1}}
\newcommand*{\fachrichtung}[1]{\renewcommand*{\@fachrichtung}{#1}}
\newcommand*{\institut}[1]{\renewcommand*{\@institut}{#1}}
\newcommand*{\professur}[1]{\renewcommand*{\@professur}{#1}}
\newcommand*{\fusszeile}[1]{\renewcommand*{\@fusszeile}{#1}}
\newcommand*{\telefon}[1]{\renewcommand*{\@telefon}{#1}}
\newcommand*{\fax}[1]{\renewcommand*{\@fax}{#1}}
\newcommand*{\homepage}[1]{\renewcommand*{\@homepage}{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Schriftart für Text
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand*{\familydefault}{\sfdefault}
\renewcommand*{\seriesdefault}{l}
\renewcommand*{\shapedefault}{n}
\renewcommand*{\sfdefault}{aun}
\renewcommand*{\ttdefault}{aun}
\renewcommand*{\rmdefault}{aun}% Required for package: url
\normalfont

% Definitionen der Originalfontnamen
\newcommand\tudposter@deffont[2]{%
  \expandafter\newcommand\csname #1\endcsname{#2}%
}
\tudposter@deffont{Univers CE 75 Black}{\fontfamily{aub}\fontseries{m}\normalshape}
\tudposter@deffont{Univers CE 75 Black Oblique}{\fontfamily{aub}\fontseries{m}\slshape}
\tudposter@deffont{Univers CE 60}{\fontfamily{aun}\fontseries{b}\normalshape}
\tudposter@deffont{Univers CE 60 Oblique}{\fontfamily{aun}\fontseries{b}\slshape}
\tudposter@deffont{Univers CE 45 Light}{\fontfamily{aun}\fontseries{l}\normalshape}
\tudposter@deffont{Univers CE 45 Light Oblique}{\fontfamily{aun}\fontseries{l}\slshape}
\tudposter@deffont{Univers CE 55}{\fontfamily{aun}\fontseries{m}\normalshape}
\tudposter@deffont{Univers CE 55 Oblique}{\fontfamily{aun}\fontseries{m}\slshape}
\tudposter@deffont{Din Bold}{\dinBold}
\newcommand\tudfont[1]{\csname #1\endcsname}


% aus tudbook.cls
\newcommand*{\dinBold}{\fontfamily{din}\fontseries{b}\selectfont}

% \textbullet aus Encoding TS1 für korrekte horizontale Ausrichtung.
% Encoding TS1 bereits durch fix-cm.sty verfügbar.
\DeclareTextSymbolDefault{\textbullet}{TS1}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Schriftart für Mathematisches
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Korrekte Symbolgrößen
\usepackage{exscale}
% cmex in beliebigen Größen, analog fix-cm.sty
\DeclareFontShape{OMX}{cmex}{m}{n}{%
      <-8>sfixed * cmex7
      <8-9> cmex8
      <9-10> cmex9
      <10->cmex10
       }{}
\DeclareSymbolFont{largesymbols}{OMX}{cmex}{m}{n}


\if@tudposter@sansmath
% Serifenlose Schrift für Variablen und anderes.
% Für Operatoren kann direkt die Schriftart geändert werden, da hier das
% OT1-Encoding verwendet wird. Dies entspricht der Vorgehensweise in
% den Paketen sfmath.sty und mathptmx.sty.
\SetSymbolFont{operators}{normal}{OT1}{aun}{l}{n}
\SetSymbolFont{operators}{bold}{OT1}{aun}{b}{n}

% Für Buchstaben u.ä. ist aber die Kodierung OML vorgegeben, die nicht
% für Univers existiert. Man muss also die Buchstaben/Symbole einzeln
% ändern. (Siehe auch sfmath.sty) Hier wird ein Auszug aus tudbook.cls
% von Klaus Bergmann wiederverwendet.
    \DeclareSymbolFont{aunLetters}{T1}{aun}{l}{sl}
    \SetSymbolFont{aunLetters}{bold}{T1}{aun}{b}{sl}
    \DeclareMathSymbol{a}{\mathalpha}{aunLetters}{`a}
    \DeclareMathSymbol{b}{\mathalpha}{aunLetters}{`b}
    \DeclareMathSymbol{c}{\mathalpha}{aunLetters}{`c}
    \DeclareMathSymbol{d}{\mathalpha}{aunLetters}{`d}
    \DeclareMathSymbol{e}{\mathalpha}{aunLetters}{`e}
    \DeclareMathSymbol{f}{\mathalpha}{aunLetters}{`f}
    \DeclareMathSymbol{g}{\mathalpha}{aunLetters}{`g}
    \DeclareMathSymbol{h}{\mathalpha}{aunLetters}{`h}
    \DeclareMathSymbol{i}{\mathalpha}{aunLetters}{`i}
    \DeclareMathSymbol{j}{\mathalpha}{aunLetters}{`j}
    \DeclareMathSymbol{k}{\mathalpha}{aunLetters}{`k}
    \DeclareMathSymbol{l}{\mathalpha}{aunLetters}{`l}
    \DeclareMathSymbol{m}{\mathalpha}{aunLetters}{`m}
    \DeclareMathSymbol{n}{\mathalpha}{aunLetters}{`n}
    \DeclareMathSymbol{o}{\mathalpha}{aunLetters}{`o}
    \DeclareMathSymbol{p}{\mathalpha}{aunLetters}{`p}
    \DeclareMathSymbol{q}{\mathalpha}{aunLetters}{`q}
    \DeclareMathSymbol{r}{\mathalpha}{aunLetters}{`r}
    \DeclareMathSymbol{s}{\mathalpha}{aunLetters}{`s}
    \DeclareMathSymbol{t}{\mathalpha}{aunLetters}{`t}
    \DeclareMathSymbol{u}{\mathalpha}{aunLetters}{`u}
    \DeclareMathSymbol{v}{\mathalpha}{aunLetters}{`v}
    \DeclareMathSymbol{w}{\mathalpha}{aunLetters}{`w}
    \DeclareMathSymbol{x}{\mathalpha}{aunLetters}{`x}
    \DeclareMathSymbol{y}{\mathalpha}{aunLetters}{`y}
    \DeclareMathSymbol{z}{\mathalpha}{aunLetters}{`z}
    \DeclareMathSymbol{A}{\mathalpha}{aunLetters}{`A}
    \DeclareMathSymbol{B}{\mathalpha}{aunLetters}{`B}
    \DeclareMathSymbol{C}{\mathalpha}{aunLetters}{`C}
    \DeclareMathSymbol{D}{\mathalpha}{aunLetters}{`D}
    \DeclareMathSymbol{E}{\mathalpha}{aunLetters}{`E}
    \DeclareMathSymbol{F}{\mathalpha}{aunLetters}{`F}
    \DeclareMathSymbol{G}{\mathalpha}{aunLetters}{`G}
    \DeclareMathSymbol{H}{\mathalpha}{aunLetters}{`H}
    \DeclareMathSymbol{I}{\mathalpha}{aunLetters}{`I}
    \DeclareMathSymbol{J}{\mathalpha}{aunLetters}{`J}
    \DeclareMathSymbol{K}{\mathalpha}{aunLetters}{`K}
    \DeclareMathSymbol{L}{\mathalpha}{aunLetters}{`L}
    \DeclareMathSymbol{M}{\mathalpha}{aunLetters}{`M}
    \DeclareMathSymbol{N}{\mathalpha}{aunLetters}{`N}
    \DeclareMathSymbol{O}{\mathalpha}{aunLetters}{`O}
    \DeclareMathSymbol{P}{\mathalpha}{aunLetters}{`P}
    \DeclareMathSymbol{Q}{\mathalpha}{aunLetters}{`Q}
    \DeclareMathSymbol{R}{\mathalpha}{aunLetters}{`R}
    \DeclareMathSymbol{S}{\mathalpha}{aunLetters}{`S}
    \DeclareMathSymbol{T}{\mathalpha}{aunLetters}{`T}
    \DeclareMathSymbol{U}{\mathalpha}{aunLetters}{`U}
    \DeclareMathSymbol{V}{\mathalpha}{aunLetters}{`V}
    \DeclareMathSymbol{W}{\mathalpha}{aunLetters}{`W}
    \DeclareMathSymbol{X}{\mathalpha}{aunLetters}{`X}
    \DeclareMathSymbol{Y}{\mathalpha}{aunLetters}{`Y}
    \DeclareMathSymbol{Z}{\mathalpha}{aunLetters}{`Z}

    \DeclareMathSymbol{,}{\mathpunct}{aunLetters}{`,}
    \DeclareMathSymbol{.}{\mathord}{aunLetters}{`.}
    \DeclareMathSymbol{/}{\mathord}{aunLetters}{`/}

    \DeclareSymbolFontAlphabet{\mathsf}{operators}%MZ: angepasst
    \DeclareSymbolFontAlphabet{\mathnormal}{aunLetters}
    \DeclareMathAlphabet\mathbf{T1}{aun}{b}{n}
    \SetMathAlphabet\mathbf{bold}{T1}{aun}{b}{n}
    \DeclareMathAlphabet\mathit{T1}{aun}{l}{sl}
    \SetMathAlphabet\mathit{bold}{T1}{aun}{l}{sl}
% Ende des Auszugs    
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Schriftgrößen für einzelne Papiergrößen
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ifdim\paperheight>842mm
%-- Gestaltungshöhe: über Höhe DIN A1 bis Höhe DIN A0

%% Copied from a0poster.sty from TeX-Live distribution.
%% Copyright (C) 1997-2004 Gerlinde Kettl and Matthias Weiser
  \renewcommand{\tiny}{\fontsize{17.36}{20.83}\selectfont}

  \renewcommand{\scriptsize}{\fontsize{20.83}{25}\selectfont}   
  \renewcommand{\footnotesize}{\fontsize{25}{30}\selectfont}
  \renewcommand{\small}{\fontsize{30}{36}\selectfont}
  \renewcommand{\normalsize}{\fontsize{36}{43,2}\selectfont}
  \renewcommand{\large}{\fontsize{42}{50,4}\selectfont}
  \renewcommand{\Large}{\fontsize{50}{60}\selectfont}
  \renewcommand{\LARGE}{\fontsize{60}{72}\selectfont}
  \renewcommand{\huge}{\fontsize{80}{96}\selectfont}
  \renewcommand{\Huge}{\fontsize{104}{124,8}\selectfont}

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

\if@tudposter@nodin
  \setkomafont{title}{\fontfamily{aun}\fontseries{b}\Huge} % Univ
  \newcommand\subtitlefont{\fontfamily{aun}\fontseries{m}\huge}
  \newcommand\preprocesstitle[1]{\mbox{#1}}
\else
  \setkomafont{title}{\dinBold\Huge}
  \newcommand\subtitlefont{\dinBold\huge}
  \newcommand\preprocesstitle[1]{\mbox{\MakeUppercase{#1}}}
\fi

\if@mathevorgabe
\if@tudposter@nodin
\setkomafont{title}{\fontfamily{aun}\fontseries{b}\Huge} % Univers 55
                                % bold 104pt
\renewcommand\subtitlefont{\fontfamily{aun}\fontseries{m}\huge}
\else
\setkomafont{title}{\dinBold\Huge} % Univers 55
                                % bold 104pt
\renewcommand\subtitlefont{\dinBold\huge}
\fi
\newcommand{\sectionfont}{\fontfamily{aun}\fontseries{b}\fontshape{n}\LARGE\selectfont} %Univers55 bold 60pt
\newcommand{\subsectionfont}{\fontfamily{aun}\fontseries{b}\fontshape{n}\large\selectfont}
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
      \color{white}
      \makebox[0mm][r]{\rule{\tudposter@lmargin}{3pt}}%
      \makebox[0mm][l]{\rule{\paperwidth-\tudposter@lmargin}{3pt}}%
      \raisebox{\tudposter@cbheight}[0mm][0mm]{
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
	\fontsize{\tudposter@cbfontsize}{1.2\tudposter@cbfontsize}\selectfont
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
  }%
  \renewcommand*{\@oddfoot}{% Fußzeile
    \ifdim\tudposter@footheight>0mm
    \color{HKS41K100}%
    \makebox[0mm][r]{\rule{\tudposter@lmargin}{\tudposter@footheight}}%
    \makebox[0mm][l]{\rule{\paperwidth-\tudposter@lmargin}{\tudposter@footheight}}%
    \raisebox{.5\tudposter@footheight}{%
      \begin{minipage}{\textwidth}%
	\color{white}
	\@fusszeile
      \end{minipage}%
    }%
    \fi
  }%
  \let\@evenhead\@oddhead% gerade und ungerade Seite gleich
  \let\@evenfoot\@oddfoot
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Farbdefinitionen
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\definecolor{HKS41K100}{cmyk}{1.00, 0.70, 0.10, 0.50}
\definecolor{HKS41K90}{cmyk}{0.9, 0.63, 0.09, 0.45}
\definecolor{HKS41K80}{cmyk}{0.8, 0.56, 0.08, 0.40}
\definecolor{HKS41K70}{cmyk}{0.7, 0.49, 0.07, 0.35}
\definecolor{HKS41K60}{cmyk}{0.6, 0.42, 0.06, 0.30}
\definecolor{HKS41K50}{cmyk}{0.5, 0.35, 0.05, 0.25}
\definecolor{HKS41K40}{cmyk}{0.4, 0.28, 0.04, 0.20}
\definecolor{HKS41K30}{cmyk}{0.3, 0.21, 0.03, 0.15}
\definecolor{HKS41K20}{cmyk}{0.2, 0.14, 0.02, 0.10}
\definecolor{HKS41K10}{cmyk}{0.1, 0.07, 0.01, 0.05}
\definecolor{HKS92K100}{cmyk}{0.1,0.00,0.05,0.65}
\definecolor{HKS92K90}{cmyk}{0.09,0.00,0.045,0.585}
\definecolor{HKS92K80}{cmyk}{0.08,0.00,0.04,0.52}
\definecolor{HKS92K70}{cmyk}{0.07,0.00,0.035,0.455}
\definecolor{HKS92K60}{cmyk}{0.06,0.00,0.03,0.39}
\definecolor{HKS92K50}{cmyk}{0.05,0.00,0.025,0.325}
\definecolor{HKS92K40}{cmyk}{0.04,0.00,0.02,0.26}
\definecolor{HKS92K30}{cmyk}{0.03,0.00,0.015,0.195}
\definecolor{HKS92K20}{cmyk}{0.02,0.00,0.01,0.13}
\definecolor{HKS92K10}{cmyk}{0.01,0.00,0.005,0.065}


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
  \vskip 33.02mm\relax
  \vskip -\topskip
  {%
    \ifx\@title\@empty\else
    \usekomafont{title}\preprocesstitle{\@title}
    \ifx\@subtitle\@empty\else\\\fi
    \fi
  }{
    \ifx\@subtitle\@empty\else
    \subtitlefont\preprocesstitle{\@subtitle}
    \fi
    \vskip 3.17cm\relax
  }%
}

% Gliederungstiefen
\if@mathevorgabe
\renewcommand\section{\@startsection{section}{1}{0pt}{68pt}{43.2pt}{\sectionfont}}
\renewcommand\subsection{\@startsection{subsection}{2}{0pt}{26.3pt}{13.4pt}{\subsectionfont}}
\newcommand\centersection{%
  \@startsection{section}{1}{0pt}{68pt}{43.2pt}
  {\sectionfont\centering}%
}
\newcommand\centersubsection{%
  \@startsection{subsection}{2}{0pt}{26.3pt}{13.4pt}
  {\centering\subsectionfont}%
}
\fi
\fusszeile{\normalsize%
\begingroup
 \parbox[t]{907.3pt}{\raggedright%
    \strut Kontakt\\
    \strut Technische Universit\"at Dresden\\
    \ifx\@einrichtung\@empty\else\strut \@einrichtung\\\fi
    \ifx\@fachrichtung\@empty\else\strut \@fachrichtung\\\fi
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
  \hfill\raisebox{-4\baselineskip}{\includegraphics[height=5\baselineskip]{mathelogo.pdf}}
\endgroup
}

% Initialisierung des Textbereiches
\setcounter{secnumdepth}{0}
\if@mathevorgabe
\einrichtung{Fakult\"at f\"ur Mathematik und Naturwissenschaften}
\fachrichtung{Fachrichtung Mathematik}
\homepage{http://tu-dresden.de/mathematik}
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
}{
  \vskip\intextsep
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
