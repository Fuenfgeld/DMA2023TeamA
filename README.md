# DMA2023TeamA

## Einleitung
Dieses Projekt entstand im Rahmen der Mastervorlesung [Datenmanagement und Archivierung im Umfeld der Forschung](https://www.master-bids.hs-mannheim.de/studienangebot/datenmanagement-und-archivierung-im-umfeld-der-forschung.html) des Masterstudienganges [Biomedizinische Informatik und Data Science](https://www.master-bids.hs-mannheim.de/) an der [Hochschule Mannheim](https://www.hs-mannheim.de/) (in Kooperation mit der [Graduate School Rhein-Neckar](https://gsrn.de/)). 
Ziel war es, mithilfe eines synthetischen Datensatzes (mittels [Synthea](https://github.com/synthetichealth/synthea) generiert) folgende Aufgaben auszuführen:
* Überlegen einer [Forschungsfrage](https://github.com/Fuenfgeld/DMA2023TeamA/wiki/Forschungsfrage)
* Anlegen und Pflegen eines [Datenmanagementplans](https://github.com/Fuenfgeld/DMA2023TeamA/wiki/Datenmanagementplan)
* Erstellen einer Quelldatenbank aus den zur Verfügung gestellten [Quelldaten](https://github.com/Fuenfgeld/DMA2023TeamA/tree/main/Daten/Quelldaten)
* Extrahieren der für die [Forschungsfrage](https://github.com/Fuenfgeld/DMA2023TeamA/wiki/Forschungsfrage) relevanten Daten aus den Quelldatenbank, Transformieren der Daten für die Datenanalyse und Laden der transformierten Daten in eine Data Warehouse-Datenbank ([ETL-Prozess](https://github.com/Fuenfgeld/DMA2023TeamA/wiki/ETL-Prozess))
* Auswerten der Daten mithilfe der Data Warehouse-Datenbank

Während des ganzen Projektes war außerdem eine ausführliche Dokumentation in einem [GitHub-Wiki](https://github.com/Fuenfgeld/DMA2023TeamA/wiki) notwendig.  

### Disclaimer: Synthetische Daten

In unserem Projekt wurde mit synthetischen Daten aus einem Dataset zum Thema Brustkrebs gearbeitet. Die Daten sind echten Patientendaten nachempfunden, beziehen sich aber nicht auf reale Personen. Sie wurden mithilfe von [Synthea](https://github.com/synthetichealth/synthea) generiert. 

## Forschungsthema

### Vorwort zum Krankheitsbild Brustkrebs

In Deutschland ist Brustkrebs die häufigste Krebsart bei Frauen. Etwa 10% aller Frauen erkranken irgendwann in ihrem Leben daran. Nach Angaben des Robert Koch Instituts liegt die altersstandardisierte Mortalitätsrate bei 16,4 pro 100.000 Erkrankter (TODO: Quelle einfügen).

### Forschungsfrage

In dieser exemplarischen Studie wurde folgende Fragestellung untersucht und beantwortet:
Wie hoch ist der monetäre Schaden (definiert als Kosten für die medizinische Behandlung) für Bruskrebspatientinnen und -patienten und ihre Krankenversicherungen im vergleich zu Patientinnen und Patienten mit vergleichbaren Diagnosen, aber keiner Brustkrebserkrankung?

## Projektdurchführung

Im Projekt wurden die Aufgaben folgendermaßen durchgeführt:

1. Die [Quelldaten](https://github.com/Fuenfgeld/DMA2023TeamA/tree/main/Daten/Quelldaten) wurden mithilfe eines Python-Skriptes ([Setup_and_fill_Database](https://github.com/Fuenfgeld/DMA2023TeamA/blob/bdc11258b57c3c30a946ec1ad6c3d35d26108a1b/Code/Setup_and_fill_Database.ipynb)) in eine Datenbank geladen. Nicht alle Quelldaten waren für die Forschungsfrage relevant. Ein ER-Diagramm der Quelldatenbank kann [hier](https://github.com/Fuenfgeld/DMA2023TeamA/wiki/Datenbankschema) gefunden werden, welche der Quelldaten in Tabellen in die Quelldatenbank geladen wurden, wurde im [Wiki](https://github.com/Fuenfgeld/DMA2023TeamA/wiki/Datenbankerstellung) zur Quelldatenbankerstellung dokumentiert. 
2. (TODO: Anonymisierung bzgl. Extract)
3. Für die Beantwortung der analytischen Fragestellung notwendige Informationen aus den Quelldatentabellen wurden mittels eines Python-Skriptes ([ETL-Prozess](https://github.com/Fuenfgeld/DMA2023TeamA/blob/bdc11258b57c3c30a946ec1ad6c3d35d26108a1b/Code/ETL_Process.ipynb)) extrahiert, transformiert und in eine Data Warehouse-Datenbank geladen. Welche Informationen in Mappingtabellen der Data Warehouse-Datenbank geladen wurden und wie die Mappingtabellen benannt wurden, wurde [Datenbankschema der Data Warehouse-Datenbank](https://github.com/Fuenfgeld/DMA2023TeamA/wiki/ETL-Prozess) dokumentiert.
4.  (TODO: Informationen zur Auswertung einfügen)

Während der gesamten Projektdurchfürung wurden unterscheidliche Kriterien der Datenqualität (TODO: Link einfügen, wenn Wiki-Page exisitert) geprüft. Um den echten Umgang mit Patientendaten zu simulieren, wurden Risiken im Umgang mit den uns zu verfügung gestellten Daten bewertet und Gegenmaßnahmen geprüft. Sie können in der [Datenschutzfolgenabschätzung](https://github.com/Fuenfgeld/DMA2023TeamA/wiki/Datenschutz-Folgenabsch%C3%A4tzung) eingesehen werden. 

![Readme_Figure](https://github.com/Fuenfgeld/DMA2023TeamA/blob/main/Dokumentation/Readme_Figure_2.png)

## Analysenergebnisse
TODO: Analysenergebnisse einfügen, kurz 1-2 Sätze darüber verlieren. 


## Informationen über die Systemumgebung

Die Programmierund der Skripte wurde ausschließlich in der Programmiersprache Python durchgeführt. Als Entwicklungsumgebung wurde [Google Colab](https://colab.research.google.com/), eine Google-Version von [Jupyter Notebook](https://jupyter.org/) verwendet. Alle Informationen über die Python-Versionen, Google Colab-Versionen und die verwendeten Python-Pakete können Sie auf der [Systemumgebung-Wiki-Seite](https://github.com/Fuenfgeld/DMA2023TeamA/wiki/Systemumgebung) einsehen. 

Wenn Sie die Projektausführung selbst nachvollziehen möchten, gibt es zwei Möglichkeiten. Sie könnnen den Prozess online mit Google Colab ausführen, oder manuell auf ihrem Rechner.

### Online-Ausführung in Google Colab
Für die Ausführung der Google Colab-Notebooks ist ein [Google Account](https://support.google.com/accounts/answer/27441?hl=de) notwendig. Falls Sie über keinen Account verfügen, folgen Sie bitte [dieser](https://support.google.com/accounts/answer/27441?hl=de) ausführlichen Installationsanleitung. 

Um den Prozess durchlaufen zu könnnen, müssen Sie die Notebooks in folgender Reihenfolge ausführen:
1. [Setup_and_fill_Database](https://github.com/Fuenfgeld/DMA2023TeamA/blob/bdc11258b57c3c30a946ec1ad6c3d35d26108a1b/Code/Setup_and_fill_Database.ipynb)
2. [ETL-Prozess](https://github.com/Fuenfgeld/DMA2023TeamA/blob/bdc11258b57c3c30a946ec1ad6c3d35d26108a1b/Code/ETL_Process.ipynb)

Bitte führen Sie die Codeblöcke in den jeweiligen Notebooks am Stück aus (In Google Colab: Laufzeit -> Alle ausführen (Standard-Tastenbelegung Strg + F9)). 

### Lokale Ausführung auf Ihrem Endgerät

Folgen Sie bitte diesen Schritten, wenn Sie die Projektdurchführung lokal auf Ihrem Rechner nachvollziehen möchten: 

1. Sie benötigen eine Installation von Python auf Ihrem Endgerät. Damit die Funktionalität der Skripte sichergestellt ist, sollten Sie mindestens die [Python-Version 3.8.10](https://www.python.org/downloads/release/python-3810/) verwenden, da das Projekt mit dieser durchgeführt wurde. Informationen, wie Python installiert wird, finden Sie [hier](https://realpython.com/installing-python/). 

2. Wenn Sie Python installiert haben, folgen Sie der [Installationsanleitung](https://jupyter.org/install) für Jupyter Notebooks und installieren Sie Jupyter Notebooks. 

3. Klonen Sie das Repository dieses Projektes auf ihren Computer.  

4. Nun können Sie sich die für das Projekt notwendigen Python-Dependencies installieren (TODO: requirements.txt + Anweisung einfügen, wenn alles fertig programmiert ist) (In Konsole pip install -r requirements.txt

5. Öfnnen Sie Jupyter Notebooks (Konsole: jupyter notebnook)

6. Führen Sie das [Setup_and_fill_Database Skript](https://github.com/Fuenfgeld/DMA2023TeamA/blob/bdc11258b57c3c30a946ec1ad6c3d35d26108a1b/Code/Setup_and_fill_Database.ipynb) aus, dann das [ETL-Prozess Skript](https://github.com/Fuenfgeld/DMA2023TeamA/blob/bdc11258b57c3c30a946ec1ad6c3d35d26108a1b/Code/ETL_Process.ipynb)

