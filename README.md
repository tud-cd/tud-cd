tud-cd
======

Testversion – Hinweis
---------------------

Am 1. Februar traten umfangreiche Änderungen zum Corporate Design der
TU Dresden in Kraft. Dazu wurde auch der Beamerstil angepasst. Näheres
können Sie in der Beispieldatei
https://github.com/tud-cd/tud-cd/raw/master/doc/latex/tud-beamerstyle/beamerpraesentation8pt.pdf
nachlesen.

Diese Änderungen befinden sich derzeit in der Testphase. Sollten
Probleme auftreten, finden Sie unter dem Tag cd2012ts
(https://github.com/tud-cd/tud-cd/archive/cd2012ts.zip) die letzte
Fassung vor den Änderungen.

Corporate Design der TU Dresden – inoffizielles Repository
----------------------------------------------------------

In diesem Verzeichnis liegen ein Beamer-Stil, die (inzwischen
veralteten) Vorlagen für Poster der Fachrichtung Mathematik und ein
(ebenfalls veraltetes) Paket für Preprint-Titelseiten des Instituts
für Algebra der TU Dresden.

Die Posterklasse wurde notdürftig an die Bedürfnisse von OpenSans
angepasst. Ein Beispiel für die Benutzung liefert beispiel-utf8.tex.

Installation: 

1. Zunächst müssen die Schriften des Corporate Design der TU Dresden
   installiert sein.
   
   + Für das seit Februar 2018 gültige Corporate Design genügt es das 
	 OpenSans-Paket Ihrer LaTeX-Distribution zu installieren.
   
   + Die alten Rohschriften Univers und DIN werden nur benötigt, wenn
	 älteren Dokumente ohne Änderungen neu übersetzt werden, und wenn
	 diese Schriften tatsächlich verwendet wurden. Sie mussten per
	 Email angefordert werden. Bei Änderungen und neu erstellten
	 Dokumenten sollte auf das aktuelle Corporate Design umgestellt werden.

	 Der Präsentationsstil kann sowohl mit der alten Variante der Fonts,
     als auch mit den verbesserten Fonts aus dem TUD-Script-Bundle
     verwendet werden. Die anderen Vorlagen verwenden die alten Schriften
     Installationsskripte sind unter 
     +     https://github.com/tud-cd/tudscr/releases/tag/fonts (neu)
     +     https://github.com/tud-cd/tudscr/releases/tag/oldfonts (alt)
     zu finden.
   
     Es wird jedoch empfohlen, für Beamer-Präsentationen stattdessen die
     Schriften so zu installieren, wie es das aktuelle tudscr-Paket
     empfiehlt: http://www.ctan.org/pkg/tudscr
     Als Beispiel sei hier beamerpraesentation-tudscrfonts.tex genannt.

   Fehlermeldungen und Anregungen sind auf https://github.com/tud-cd/tud-cd/issues herzlich willkommen.

2. Das Paket ist entsprechend dem TeX-Standard aufgebaut. Die
   einzelnen Dateien können für die einmalige Verwendung in das
   jeweilige Arbeitsverzeichnis kopeirt werden. Bei häufiger
   Verwendung wird die systemweite oder die Nutzerspezifische
   Installation empfohlen.

3. Soll die Klasse für alle Dokumente eines Nutzers zur Verfügung stehen, müssen
   nur die benötigten Dateien und Verzeichnisse (Klasse+Logos) in das lokale texmf-Verzeichnis
   entpackt werden:
   +	*nix (incl. macports): ~/texmf/
   +	MacTeX: ~/Library/texmf/
   +	MikTeX: ...\Dokumente und Einstellungen\<Benutzername>\texmf\
   
   Im Zweifel kann man sich mit `kpsewhich --var-value=TEXMF --progname=pdflatex` 
   den Suchpfad ansehen. Der Inhalt dieses Repositories muss in einem dieser
   Verzeichnisse entpackt werden. Dabei muss die Verzeichnisstruktur eingehalten werden,
   so dass beispielsweise das Verzeichnis tex/latex/tud-beamerstyle im Unterverzeichnis
   mit selbem Namen landet.

4. Die Dokumentation der Klassen, Stile und Pakete befindet sich in
   den beigefügten PDF-Dateien im Unterordner doc. Die wichtigsten sind
   tud-beamerstyle/beamer-org-mode-demo.pdf (Beamer-Stil), tudmathposter/beispiel-utf8.pdf
   (tudmathposter) und die Quelldatei tex/latex/tudmathposter/algpreprint.sty (algpreprint).

Zum Download finden Sie auf https://github.com/tud-cd/tud-cd auf der
rechten Seite einen unscheinbaren Knopf mit der Aufschrift „Download
ZIP“. Oder Sie rufen die zugehörige Adresse
https://github.com/tud-cd/tud-cd/archive/master.zip direkt auf.


Versionen:
2.0 (24.08.2012)
	Die Beamer-Stile wurden komplett überarbeitet. Ab jetzt wird für
	Abwärtskompatibilität *keinerlei* Haftung mehr übernommen. Ziel
	ist es, brauchbare und schöne Vorlagen zu erstellen. Kapitelnummern
	stehen jetzt vor der Kapitelüberschrift und nicht mehr vor der
	Folienüberschrift. Seiten können nach Folien- oder Seitenzahl
	nummeriert werden. Für Entwicklungszwecke gibt es die Möglichkeit,
	innerhalb einer Folie die Bildnummern anzeigen zu lassen.

1.11 (07.07.2011)
	Da er sowieso mal einer Auffrischung bedurfte habe ich meinen
	TUD-Beamer-Stil startklar gemacht. Die Verwendung des Stiles in
	Verbindung mit babel.sty löst einige Inkompatibiltäten, die
	ngerman.sty aufweist. Außerdem kann der Stil besser ind
	Papier-Dokumente eingebunden werden und dürfte sich besser an andere
	Layouts (z.B. 16:10) anpassen lassen, als tudbeamer.cls

1.10 (11.02.2011)
	Das Paket tudfonts kann nun dank Mike Behrisch auch in Dokumente
	eingebunden werden, die kein PDF-LaTeX verwenden. Bei Verwendung von
	dvips müssen die Optionen „-u+univers.map“ und „-u+dinbold.map“
	hinzugefügt werden, falls diese nicht global geladen werden. Das
	Überschreiben im der Tabellen im nutzerspezifischen texmf-Baum kann
	zu Problemen führen, wenn global Pakete aktualisiert bzw. installiert
	werden.

1.9 (18.10.2010)
	Die Postleitzahl und der Ort Dresden wurden entfernt.

	Aus TeXnischen Gründen darf das Feld Homepage keine Zeilenumbrüche
	o.ä. enthalten. Eine entsprechende Fehlermeldung wurde hinzugefügt.

1.8 (15.10.2010)
	• Absicherung des korrekten Fakultätsnamens
	• Schriftgrößen sind jetzt auch mit älteren Koma-Skript-Klassen
	  kompatibel
	• Neues Fußzeilenfeld \email
	• Offizielle Vorgaben für den Fußbereich wurden umgesetzt:
		• Die linke Spalte enthält Hochschule, Einrichtung,
		  Fachrichtung, Institut und Professur. 
		  Institut und Professur sollten mit \textbackslash institut
		  und \professur gesetzt werden. Die restlichen, Einrichtung
                  und Fachrichtung, werden automatisch gesetzt.
		• Die rechte Spalte ist frei wählbar, und kann alternativ mit
		  den vorgegebenen Variablen \author, \telefon, \email und
		  \homepage oder mit einem frei gewählten Absatz
		  (\footcolumn2) gefüllt werden.
		Hinweis: Wenn sich die Homepage mit dem Institutslogo
		  überschneidet, kann jedes beliebige Feld mit Zeilenumbrüchen
		  vertikal erweitert werden. Dazu können die üblichen
		  Makrokombinationen wie \\ für den Zeilenumbruch und \strut
		  zum Erzeugen von Inhalt für eine leere Zeile genutzt werden.
	• Das Institutslogo erhält seine endgültige Position.


1.7 (21.09.2010)
	Neues Dresden-Concept-Logo (voraussichtlich Endfassung)

1.6 (09.09.2010)
    Hinweis
	Aufgrund falscher Maßangaben in den PowerPoint-Vorlagen, ergab sich
	eine Diskrepanz zwischen InDesign auf der einen Seite und LaTeX und
	PowerPoint/OpenDocument auf der anderen Seite. Aus diesem Grunde wurde
	ein System entwickelt um fertige Poster an ein einheitliches Layout
	anzupassen. Alle LaTeX-Poster, die den Vorgaben entsprechen werden
	während der Druckvorbereitung angepasst werden.
	
	Wer sein Poster selbst anpassen möchte kann statt der Klassenoption
	*Mathematik* die Klassenoption *MathematikA0* verwenden. Dadurch
	werden sich Unterschiede zum bisherigen Layout ergeben. Unter anderem
	wurden einige Abstände neu festgelegt. Das Makro *\oldfontsize* kann
	einige dieser Änderungen zurücksetzen.

    weitere Änderungen
	• bessere Positionierung der Markierungen von Aufzählungen.
	• Institutslogos können jetzt mit dem Makro \institutslogo definiert
	  oder mit \institutslogofile eingebunden werden. Die höhe des
	  Dresden-Concept- und des Institutslogos sind gleich und kann aus dem
	  Register \drittlogoheight ausgelesen werden.
	• Neues Layout für den Fußbereich (weiterhin vorläufig).
	• Auslagerung der Schriftgrößendefinitionen in eigene Dateien
	• Möglichkeit, eine Verschnittkante zu definieren. Definiert man
	  ein Makro namens \schnittrand, wird automatisch ein entsprechender
	  Wert zu allen vier Rändern addiert. 

1.5 (25.08.2010)
    Änderungen
	• Neues Dresden-Concept-Logo. Es gibt jetzt eine offizielle Version
	  für dunkle Hintergründe. Die PDF-Datei dafür enthält auch eine
	  Fassung für Schwarz-Weiß-Dokumente. Es wurde die getönte verwendet.
	• Institutsname in der Fußzeile. Wenn in der linken Spalte des Fußes
	  mehr, als vier Zeilen stehen, wird dafür das Wort „Kontakt“
	  weggelassen.
	• Umstrukturierung der Beispiel-Datei. Die neueren Änderungen
	  stehen jetzt vor den älteren. Links sind jetzt anklickbar (das
	  hyperref sollte aber sicherheitshalber bei Postern weggelassen
	  werden).
	• Die Farbdefinitionen wurden in das Paket tudcolors ausgelagert und
	  um die Definitionen der Auszeichnungsfarben aus dem CD-Handbuch
	  (http://tu-dresden.de/service/cd/6_handbuch/handbuch_farbregister.pdf)
	  ergänzt.
	  Damit stehen jetzt neben den Hausfarben HKS41_K und HKS 92_K auch
	  die Auszeichnungsfarbe 1.~Kategorie HKS 44_K, die
	  Auszeichnungsfarben 2.~Kategorie HKS 36_K, HKS 33_K, HKS 57_K und
	  HKS 65_K und die Ausnahmefarbe HKS 07_K in den jeweils 10
	  Deckungsstufen des Farbregisters zur Verfügung. Das Namensschema
	  orientiert sich an dem der Hausfarben.
  	  Informationen zum Gebrauch entnehmen Sie bitte dem CD-Handbuch
	  (http://tu-dresden.de/service/cd/6_handbuch).

1.4 (20.08.2010)
    Korrekturen
	• ein Fehler in rescalefont.sty wurde behoben, wo bei der
	  Berechnug der Font-Dateinamen eine falsche Zahl benutzt wurde
	  (aufgefallen beim stmaryrd-Paket.
 	• Ein Leerzeichen hatte sich am Anfang der Einrichtungszeile
 	  eingeschlichen und wurde entfernt.
 	• Die CD-Richtlinien für Poster sind nicht ganz klar
 	  formuliert. Die in Ver. 1.3 eingeführten Makros \textbackslash
	  zweitlogo und \zweitlogofile entsprechen nicht dem
 	  CD und wurden mit einer *Warnung* versehen.
    
    Erweiterungen
	• Beispiel für einen Ansatz mit TikZ und freier Positionierung von
	  Textblöcken (siehe beispiel-utf8.pdf).

1.3 (03.08.2010)

    Korrekturen
	• Die Schriftgrößen der Matheschriften bei „serifmath“ entsprechen
	  jetzt denen der Univers.
	• Weitere Mathematik-Symbole sind jetzt verfügbar.

    Erweiterungen
	• Die Fontdefinitionen wurden in eine Datei tudfonts.sty
	  ausgelagert, die für andere Projekte (Übungsblätter, Scheine etc.)
	  eingebunden werden kann. Diese unterstützt die Optionen „noDIN“ (für 
	  Definitionen ohne DIN Bold, „noeulermath“ um die AMS Euler-Schriften
	  nicht zu laden und „serifmath“, die die klassischen
	  Mathematikschriften aus dem Paket „lmodern“ lädt.
	• tudfonts.sty lädt die AMS Euler-Schriften,
	  um Mathematiksymbole darzustellen. Dadurch ändert sich das
	    Erscheinungsbild der Formeln. Das alte Verhalten kann
	  (verbessert) mit der Option „noeulermath“ wiederhergestellt werden.
	• Neue Makros \tudmathsizefactor und \DeclareTudMathSizes. Ersteres
	  stellt das Verhältnis zwischen Matheschriftgröße und Brotschrift dar
	  (Voreinstellung: „7/6“ für „serifmath“ und sonst „1“). Es kann mit
	  \textbackslash renewcommand umdefiniert werden. Das zweitere bekommt
	  vier Argumente, eine Brotschriftgröße und drei Mathematikgrößen. Die
	  erste der Mathematikgrößen sollte der Brotschriftgröße (also der
	  normalen Schriftgröße) entsprechen. Die anderen beiden sind
	  entsprechend den Einstellungen kleiner zu wählen.
	• Neues Paket „rescalefonts.sty“. Damit werden Schriftgrößen
	  umgerechtnet. Das Makro \fontscaling{Faktor}
	  legt den Umrechnungsfaktor fest. Beispielsweise bewirkt
	  „\fontscaling{3}“, dass für eine 30pt-Schrift
	  aus der LM-Familie lmr10 geladen wird. Dieses Paket wird automatisch
	  mit dem Faktor 3 geladen.
	• Das „DRESDEN Concept“-Logo wurde integriert.
	• Neue Makros \textbf{\textbackslash zweitlogo},
	  \zweitlogofile, \drittlogo und \drittlogofile, mit denen
	  das Zweit- (Instituts-) und das Drittlogo („DRESDEN Concept“)
	  eingestellt werden können. Die Variante mit „…file“ ist jeweils
	  für den Dateinamen der entsprechenden PDF-Datei vorgesehen (ohne
	  Endung „.pdf“), während die kürzere Variante beliebigen LaTeX-Code
	  aufnehmen kann, wenn das Logo komplizierter dargestellt werden muss.


1.2 (11.07.2010):

    Korrekturen:
	• Verbesserter Zeilenumbruch im Fußbereich, wenn nur Telefonnummer 
	  oder nur Faxnummer angegeben sind (incl. Demonstration)

    Erweiterungen:
	• Demonstration der Nutzung vom Paket „url“ für die Angabe der Homepage


1.1 (09.07.2010): 

    Fehlerkorrekturen:
	• In der Klasse wurde der Klassenname korrigiert (Warnung behoben)
	• Fakultätsname korrigiert

    Erweiterungen:
	• Neue Umgebungen „tablehere“ und „figurehere“ für die Verwendung
	  anstelle von Fließobjekten innerhalb von Multicol-Umgebungen
	• Schriftgröße für Tabellen- und Abbildungsüberschriften reduziert.

1.0 (07.07.2010): Erste Version.
