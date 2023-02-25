# DMA2023TeamA

## Einleitung
Dieses Projekt entstand im Rahmen des Moduls [Datenmanagement und Archivierung im Umfeld der Forschung](https://www.master-bids.hs-mannheim.de/studienangebot/datenmanagement-und-archivierung-im-umfeld-der-forschung.html) des berufsbegleitenden Masterstudiengangs [Biomedizinische Informatik und Data Science](https://www.master-bids.hs-mannheim.de/) der [Hochschule Mannheim](https://www.hs-mannheim.de/), in Kooperation mit der [Graduate School Rhein-Neckar](https://gsrn.de/) und dem [MIRACUM Konsortium](https://www.miracum.org/) der [Medizininformatik-Initative](https://www.medizininformatik-initiative.de/). 
Ziel war es, mithilfe eines synthetischen Datensatzes (mittels [Synthea](https://github.com/synthetichealth/synthea) generiert) beispielhaft die Durchführung und umfassende Dokumentation eines datenbasierten Forschungsprojekts zu illustrieren und die folgenden Aufgaben auszuführen:
* Anlegen und Pflegen eines [Datenmanagementplans](https://github.com/Fuenfgeld/DMA2023TeamA/wiki/Datenmanagementplan)
* Durchführen einer [Datenschutz-Folgenabschätzung](https://github.com/Fuenfgeld/DMA2023TeamA/wiki/Datenschutz-Folgenabsch%C3%A4tzung)
* Erstellen einer Quelldatenbank aus den zur Verfügung gestellten [Quelldaten](https://github.com/Fuenfgeld/DMA2023TeamA/tree/main/Daten/Quelldaten)
* Durchführen eines [ETL-Prozesses](https://github.com/Fuenfgeld/DMA2023TeamA/wiki/ETL-Prozess), um die für das Projekt relevanten Daten aus der Quelldatenbank zu extrahieren, sie in ein für die Datenanalyse geeignetes Format zu transformieren und die transformierten Daten in eine [Data Warehouse-Datenbank](https://github.com/Fuenfgeld/DMA2023TeamA/wiki/Datenbankschema-Datawarehouse) zu laden
* Auswerten der Daten zur Beantwortung der [Forschungsfrage](https://github.com/Fuenfgeld/DMA2023TeamA/wiki/Forschungsfrage)
* Erstellen eines [Archivierungskonzepts](https://github.com/Fuenfgeld/DMA2023TeamA/wiki/Archivierungskonzept) um Nachnutzung der Daten zu ermöglichen

Während des gesamten Projektes war außerdem eine ausführliche Dokumentation der Daten und Verarbeitungsschritte im [GitHub-Wiki](https://github.com/Fuenfgeld/DMA2023TeamA/wiki) notwendig.  

### Disclaimer: Synthetische Daten

In unserem Projekt wurde mit synthetischen Daten aus einem Datensatz zum Thema Brustkrebs gearbeitet. Die Daten und zugehörigen Ereignisse wurden anhand realer Statistiken modelliert, beziehen sich aber nicht auf reale Personen sondern fiktive Personen. Sie wurden mithilfe von [Synthea](https://github.com/synthetichealth/synthea) generiert. 

## Forschungsthema

### Vorwort zum Krankheitsbild Brustkrebs

In Deutschland ist Brustkrebs die häufigste Krebsart bei Frauen. Etwa 10% aller Frauen erkranken irgendwann in ihrem Leben daran. Nach Angaben des Robert Koch-Instituts liegt die altersstandardisierte Mortalitätsrate bei 16,4 pro 100.000 Erkrankter.

### Forschungsfrage

In dieser exemplarischen Studie wurded die folgende Fragestellung untersucht und beantwortet:
Wie hoch ist der finanzielle Schaden (definiert als Kosten für die medizinische Behandlung) für Brustkrebspatientinnen und -patienten und ihre Krankenversicherungen im Vergleich zu Patientinnen und Patienten mit vergleichbaren Diagnosen, aber keiner Brustkrebserkrankung?

## Projektdurchführung

Im Projekt wurden die Aufgaben folgendermaßen durchgeführt:

1. Zu Beginn des Projekts wurde ein [Datenmanagementplan](https://github.com/Fuenfgeld/DMA2023TeamA/wiki/Datenmanagementplan) angelegt und ständig aktualisiert, als lebendes Dokument, um den Umgang mit Daten im Rahmen des Projekts zu beschreiben. Zusammen mit dem [GitHub Wiki](https://github.com/Fuenfgeld/DMA2023TeamA/wiki) dient dieser auch der Dokumentation des Projekts und seiner Ergebnisse. Dies umfasst ausführliche Informationen zur Projektplanung, zu den verwendeten und erstellten Daten, zur technischen Implementierung und zur Datenverarbeitung sowie -analyse.
2. Um den Umgang mit echten Patientendaten zu simulieren, wurden Risiken im Umgang mit den uns zu Verfügung gestellten Daten bewertet und Gegenmaßnahmen geprüft. Diese können in der [Datenschutzfolgenabschätzung](https://github.com/Fuenfgeld/DMA2023TeamA/wiki/Datenschutz-Folgenabsch%C3%A4tzung) eingesehen werden.
3. Die [Quelldaten](https://github.com/Fuenfgeld/DMA2023TeamA/tree/main/Daten/Quelldaten) wurden mithilfe eines Google Colab Notebooks ([Setup_and_fill_Database.ipynb](https://github.com/Fuenfgeld/DMA2023TeamA/blob/main/Code/Setup_and_fill_Database.ipynb)) in die Quelldatenbank geladen. Nicht alle Quelldaten waren für die Forschungsfrage relevant; welche der Quelldaten in Tabellen in die Quelldatenbank geladen wurden, wurde im [Wiki](https://github.com/Fuenfgeld/DMA2023TeamA/wiki/Datenbankerstellung) zur Quelldatenbankerstellung dokumentiert. Das zugehörige ER-Diagramm der Quelldatenbank kann [hier](https://github.com/Fuenfgeld/DMA2023TeamA/wiki/Datenbankschema) gefunden werden.
4. Für die Datenanalyse notwendige Informationen aus der Quelldatenbank wurden mittels eines Google Colab Notebooks ([ETL_Process.ipynb](https://github.com/Fuenfgeld/DMA2023TeamA/blob/main/Code/ETL_Process.ipynb)) extrahiert, transformiert und in eine Data Warehouse-Datenbank geladen. Der Aufbau der Data Warehouse-Datenbank sowie die Inhalte und die Ursprünge der enthaltenen Tabellen, wurde im [Datenbankschema der Data Warehouse-Datenbank](https://github.com/Fuenfgeld/DMA2023TeamA/wiki/ETL-Prozess) sowie den zugehörigen Mappingtabellen dokumentiert.
5. Im Rahmen des [ETL-Prozesses](https://github.com/Fuenfgeld/DMA2023TeamA/wiki/ETL-Prozess) erfolgte eine Anonymisierung (durch Entfernen von direkt identifizierenden Daten und Minimierung der personenbezogenen Daten auf notwendige Informationen) der Daten sowie eine Pseudonymisierung der enthaltenen Patienten-Id. Details zu diesem Schritt sind im Wiki unter [Anonymisierung und Pseudonymisierung](https://github.com/Fuenfgeld/DMA2023TeamA/wiki/Anonymisierung-und--Pseudonymisierung) zu finden. 
6. In Vorbereitung für die Analyse wurden die benötigten Daten aus dem Data Warehouse ausgeleitet und mithilfes des Google Colab Notebooks [Data_Analysis.ipynb](https://github.com/Fuenfgeld/DMA2023TeamA/blob/main/Code/Data_Analysis.ipynb) in ein für die Datenanalyse geeignetes Format aufbereitet.
7. Die darauffolgende Datenanalyse mittels des Google Colab Notebooks [Data_Analysis.ipynb](https://github.com/Fuenfgeld/DMA2023TeamA/blob/main/Code/Data_Analysis.ipynb) umfasste eine Explorative Datenanalyse (EDA) zum Vergleich der Kosten in verschiedenen Diagnosegruppen sowie experimentelle Machine Learning Ansätze.
8. Zum Abschluss des Projekts erfolgte eine Veröffentlichung der Daten, Skripte und Ergebnisse als Release des [GitHub Repositories](https://github.com/Fuenfgeld/DMA2023TeamA/) sowie eine Archivierung im Forschungsdatenrepository [Zenodo](https://zenodo.org/).

![Readme_Figure](https://github.com/Fuenfgeld/DMA2023TeamA/blob/main/Dokumentation/Readme_Figure_v3.png)

## Analyseergebnisse

Die Ergebnisse der Analyse in Bezug auf die Forschungsfrage sind im [GitHub Wiki](https://github.com/Fuenfgeld/DMA2023TeamA/wiki/Forschungsergebnisse) dokumentiert, die im Rahmen des Projekts verwendeten Daten ([Link](https://github.com/Fuenfgeld/DMA2023TeamA/tree/main/Daten/Analyse)) sowie die erstellten Plots ([Link](https://github.com/Fuenfgeld/DMA2023TeamA/tree/main/Ergebnisse)) sind Teil des GitHub Repositories. Patient:innen mit Brustkrebs scheinen häufiger einen Arzt aufzusuchen als andere Gruppen und die Behandlungen sind im Vergleich zu anderen Gruppen mit deutlich höheren Kosten verbunden. In Machine Learning-Modellen konnte außerdem mit hoher Accuracy anhand der Kosten auf die Diagnose der einzelnen Patient:innen geschlossen werden. Da nur ein Bruchteil der im Datensatz enthaltenen Patient:innen (11 von 1019) an Brustkrebs erkrankt sind, sind die erzielten Ergebnisse allerdings nur bedingt belastbar.

## Informationen über die Systemumgebung

Die Programmierung der Skripte wurde ausschließlich in der Programmiersprache Python durchgeführt. Als Entwicklungsumgebung wurde [Google Colab](https://colab.research.google.com/), eine Google-Version von [Jupyter Notebook](https://jupyter.org/) verwendet. Alle Informationen über die Python-Versionen, Google Colab-Versionen und die verwendeten Python-Pakete sind im Wiki unter [Systemumgebung](https://github.com/Fuenfgeld/DMA2023TeamA/wiki/Systemumgebung) dokumentiert. 

Wenn Sie die Projektausführung selbst nachvollziehen möchten, gibt es zwei Möglichkeiten. Sie könnnen den Prozess online mit Google Colab ausführen, oder manuell lokal auf ihrem Rechner.

### Online-Ausführung in Google Colab
Für die Ausführung der Google Colab-Notebooks ist ein [Google Account](https://support.google.com/accounts/answer/27441?hl=de) notwendig. Falls Sie über keinen Account verfügen, folgen Sie bitte [dieser](https://support.google.com/accounts/answer/27441?hl=de) ausführlichen Installationsanleitung. 

Um den Prozess durchlaufen zu könnnen, müssen Sie die Notebooks in folgender Reihenfolge ausführen:
1. [Setup_and_fill_Database.ipynb](https://github.com/Fuenfgeld/DMA2023TeamA/blob/main/Code/Setup_and_fill_Database.ipynb)
2. [ETL_Process.ipynb](https://github.com/Fuenfgeld/DMA2023TeamA/blob/main/Code/ETL_Process.ipynb)
3. [Data_Analysis.ipynb](https://github.com/Fuenfgeld/DMA2023TeamA/blob/main/Code/Data_Analysis.ipynb)

Bitte führen Sie die Codeblöcke in den jeweiligen Notebooks am Stück aus (In Google Colab: Laufzeit -> Alle ausführen (Standard-Tastenbelegung Strg + F9)). Ausnahme: zu Beginn der Datenanalyse muss zunächst die verwendete Version von Matplotlib aktualsiert und dann die Runtime neu gestartet werden. 

### Lokale Ausführung auf Ihrem Endgerät

Folgen Sie bitte diesen Schritten, wenn Sie die Projektdurchführung lokal auf Ihrem Rechner nachvollziehen möchten: 

1. Sie benötigen eine Installation von Python auf Ihrem Endgerät. Damit die Funktionalität der Skripte sichergestellt ist, sollten Sie mindestens die [Python-Version 3.8.10](https://www.python.org/downloads/release/python-3810/) verwenden, da das Projekt mit dieser durchgeführt wurde. Informationen, wie Python installiert wird, finden Sie [hier](https://realpython.com/installing-python/). 
2. Wenn Sie Python installiert haben, folgen Sie der [Installationsanleitung](https://jupyter.org/install) für Jupyter Notebooks und installieren Sie Jupyter Notebooks. 
3. Klonen Sie das Repository dieses Projektes auf Ihren Computer.  
4. Stellen Sie sicher, dass alle für das Projekt notwendigen Python-Libraries installiert sind (siehe [Systemumgebung](https://github.com/Fuenfgeld/DMA2023TeamA/wiki/Systemumgebung))
5. Öfnnen Sie Jupyter Notebooks (Konsole: jupyter notebook)
6. Führen Sie die Notebooks in der folgenden Reihenfolge aus:
* [Setup_and_fill_Database.ipynb](https://github.com/Fuenfgeld/DMA2023TeamA/blob/main/Code/Setup_and_fill_Database.ipynb)
* [ETL_Process.ipynb](https://github.com/Fuenfgeld/DMA2023TeamA/blob/main/Code/ETL_Process.ipynb)
* [Data_Analysis.ipynb](https://github.com/Fuenfgeld/DMA2023TeamA/blob/main/Code/Data_Analysis.ipynb)
