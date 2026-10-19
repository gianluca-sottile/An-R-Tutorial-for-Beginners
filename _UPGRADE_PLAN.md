# Piano di upgrade — *An R Tutorial for Beginners*

> Documento di lavoro (non viene renderizzato dal sito: il prefisso `_` lo esclude da `render_site()`).
> Stato: **proposta, in attesa di approvazione**. Nessun file del corso è stato modificato.
> Data: 18 ottobre 2026

---

## 0. Diagnosi sintetica dello stato attuale

Ho letto tutte le 40 lezioni `.Rmd`, `index.Rmd`, `about.Rmd`, `_site.yml`, README, workflow CI e la cartella `static_pages/`.

**Punti di forza**

- Copertura ampia e ambiziosa (da `c()` fino a UMAP e deep learning).
- Le lezioni 1–23 sono già state in gran parte modernizzate (pipe nativa `|>`, `across()`, `linewidth`, `seq_along()`, `vapply()`).
- Le lezioni 36–40 hanno una struttura pulita e coerente (stesso dataset, confronto tra metodi, ARI).

**Problemi strutturali**

1. **Il "salto statistico" è troppo brusco.** Si passa dai grafici (L18–20) al t-test (L21) senza alcuna lezione su statistica descrittiva, probabilità, distribuzioni, campionamento, stimatori, intervalli di confidenza o logica del test. Per uno studente senza background statistico, il p-value compare "dal nulla".
2. **Mancano argomenti di base indispensabili**: t-test a due campioni indipendenti (Welch) — il più usato in assoluto —, test su proporzioni e χ² di indipendenza, test non parametrici, potenza ed effect size, interpretazione dei coefficienti della logistica in odds ratio, `tidyr::pivot_*` (reshape), stringhe/date.
3. **Nessun esercizio** in nessuna lezione.
4. **Teoria disomogenea**: le lezioni 1–22 sono quasi solo "ricette"; le lezioni 24–35 sono invece dense di formule senza intuizione, con frasi telegrafiche, residui di italiano ("con", "instabile") e risultati **scritti a mano nel testo** ("AUC 0.85+", "KMO = 0.85", "PC1+PC2 ≈ 62%") che non derivano dal codice e possono essere smentiti dall'output.
5. **Errori di codice e di contenuto** (vedi §5): alcuni producono risultati sbagliati in silenzio (es. `normalize01()` in L9, split di validazione in L29), altri insegnano concetti scorretti (Kaiser in L30, `lambda.min` in L36, importanze RF invertite in L27).
6. **Data leakage sistematico nella parte ML**: standardizzazione, PCA e UMAP stimate sull'intero dataset *prima* dello split.
7. **Infrastruttura fragile**: il workflow CI cerca `docs/**/*.Rmd` ma i sorgenti sono in root (il render incrementale non scatta mai); installa solo 5 pacchetti (un render completo fallirebbe); le lezioni 41–45 esistono solo come HTML statici da ~7 MB senza sorgente; nomi file con spazi; numerazione dei file ≠ ordine del menu (es. L36 è tra L24 e L26, L25 è sotto "Unsupervised").
8. **`about.Rmd` dichiara come prerequisito la statistica inferenziale** — in contraddizione con l'obiettivo di servire studenti senza background rigoroso.

---

## 1. Principi guida della revisione

1. **Intuizione → esempio → formalizzazione.** Ogni concetto statistico parte da un'idea a parole e da una simulazione/grafico; la formula arriva dopo, in un box "Per approfondire" richiudibile. Chi ha poco background segue il filo principale; chi vuole rigore apre il box.
2. **Simulare per capire.** R è perfetto per far *vedere* LLN, TLC, distribuzione campionaria, errore di I tipo, potenza, bootstrap. Diventa lo strumento didattico principale per la parte inferenziale.
3. **Nessun numero scritto a mano.** Tutti i valori citati nel testo vengono da inline code (`` `r round(x, 2)` ``), così testo e output non divergono mai.
4. **Un'interpretazione per ogni output.** Dopo ogni `summary()`, `t.test()`, `glm()`… un box "Come si legge questo output" con frasi modello ("Il coefficiente di `wt` indica che, a parità di…").
5. **Errori comuni esplicitati** (box "Attenzione"): p-value ≠ probabilità che H0 sia vera; correlazione ≠ causalità; non significativo ≠ assenza di effetto; leakage; ecc.
6. **Codice moderno, coerente e riproducibile** (§4).
7. **Crescita graduale e dichiarata**: ogni lezione ha livello, prerequisiti e obiettivi.

---

## 2. Nuovo percorso: piano di crescita statistica

Il corso viene riorganizzato in **4 livelli** e **12 moduli**. Le lezioni esistenti vengono mantenute (riviste) e affiancate da nuove lezioni (🆕). Un **dataset guida** accompagna lo studente lungo tutto il percorso: `penguins` (ora incluso in base R ≥ 4.5 nel pacchetto `datasets`), affiancato dai dataset specifici già presenti.

### Livello 1 — Strumenti (nessun prerequisito)

| Modulo | Lezioni | Concetti statistici introdotti |
|---|---|---|
| **M0. Setup e workflow** | L1 (rivista) · 🆕 Progetti RStudio/Positron, Quarto, `renv`, `here`, come chiedere aiuto | — |
| **M1. Fondamenti di R** | L2 Tipi e operatori · L3 Matrici · L4 Fattori · 🆕 Vettori: coercizione, `NA`, indicizzazione avanzata | **Tipi di variabile**: nominale, ordinale, discreta, continua (spostato qui da L4, con esempi) |
| **M2. Dati e manipolazione** | L5 Data frame/tibble · L6 Liste · L7 Ordinamento · L8 Join · 🆕 *dplyr* in profondità (`filter/select/mutate/summarise/group_by`) · 🆕 Reshape con `tidyr` (`pivot_longer/wider`) · 🆕 Stringhe (`stringr`) e date (`lubridate`) | Unità statistica, variabile, *tidy data* |
| **M3. Programmazione** | L9 Funzioni · L10 if/else · L11 for · L12 while · L13 apply + 🆕 `purrr::map()` | — |
| **M4. Import/Export e qualità dei dati** | L14 Import · L16 Export · L15 Dati mancanti (rivista) | **Meccanismi di missingness** (MCAR/MAR/MNAR) e perché l'imputazione con la media sottostima la variabilità |

### Livello 2 — Descrivere ed esplorare

| Modulo | Lezioni | Concetti statistici |
|---|---|---|
| **M5. Statistica descrittiva** 🆕 | 🆕 Distribuzioni di frequenza e tabelle (`table`, `prop.table`, `janitor::tabyl`) · 🆕 Indici di posizione, dispersione, forma (media vs mediana, outlier, IQR, asimmetria) · 🆕 Due variabili: tabelle di contingenza, medie condizionate | Robustezza, standardizzazione (z-score), percentili |
| **M6. Visualizzazione** | L18 Scatter · L19 Boxplot · L20 Barre/istogrammi (+ 🆕 densità, violin, faceting) · L17 Correlazione (spostata qui, dopo i grafici) | Forma di una distribuzione; **Anscombe**: perché guardare i dati; correlazione ≠ causalità |

### Livello 3 — Dall'incertezza all'inferenza (il ponte che oggi manca)

| Modulo | Lezioni | Concetti statistici |
|---|---|---|
| **M7. Probabilità e simulazione** 🆕 | 🆕 Variabili casuali e distribuzioni in R (`d/p/q/r` per binomiale, Poisson, normale, t) · 🆕 Legge dei grandi numeri e Teorema del limite centrale *per simulazione* · 🆕 Distribuzione campionaria ed errore standard · 🆕 Bootstrap | Popolazione vs campione, parametro vs stima, variabilità campionaria |
| **M8. Inferenza** | 🆕 Intervalli di confidenza (simulazione della copertura al 95%) · 🆕 Logica del test: H0/H1, statistica test, p-value, errori di I e II tipo, potenza (`power.t.test`), effect size · L21 t-test (esteso: one-sample, **due campioni Welch**, paired, verifica assunzioni, Wilcoxon) · 🆕 Proporzioni e χ² (`prop.test`, `chisq.test`, `fisher.test`) · L17-bis `cor.test()` · L22 ANOVA (+ diagnostica residui, Levene, Welch ANOVA, Kruskal–Wallis, confronti multipli) | Interpretazione corretta del p-value; significatività statistica vs rilevanza pratica; test multipli |

### Livello 4 — Modelli e statistical learning

| Modulo | Lezioni | Concetti statistici |
|---|---|---|
| **M9. Modelli di regressione** | L23 Regressione lineare (+ 🆕 interazioni, interpretazione guidata) · L24 Logistica (riscritta: odds ratio, effetti marginali con `marginaleffects`, diagnostica appropriata) · 🆕 GLM di Poisson · L36 Ridge/Lasso/Elastic net | Modello come "media condizionata + errore"; inferenza vs predizione |
| **M10. Statistical learning supervisionato** | 🆕 **Lezione-ponte**: bias–varianza, overfitting, train/test, cross-validation, leakage, metriche (RMSE, accuracy, AUC, calibrazione) · L26 Alberi · L27 Random forest · L28 Boosting · L29 SVM · 🆕 Confronto finale tra modelli | Errore di generalizzazione; validazione onesta |
| **M11. Riduzione della dimensionalità** | L30 PCA · L31 Analisi fattoriale · L35 Analisi delle corrispondenze · L32 MDS · L33 t-SNE · L34 UMAP | Varianza spiegata, variabili latenti, distanze |
| **M12. Clustering** | 🆕 **Lezione-ponte**: distanze, scaling, validazione interna · L25 k-means · L37 Gerarchico · L38 DBSCAN · L39 Mixture models · L40 Spectral | Assenza di "verità" nel non supervisionato; stabilità |
| **Track opzionale: Deep learning** | L41–45 (sorgenti `.qmd` da ricostruire) | — |
| **Capstone** 🆕 | Progetto finale guidato end-to-end (domanda → dati → EDA → modello → report Quarto) con rubrica di valutazione | Sintesi |

**Mappa dei prerequisiti**: verrà disegnata una figura (diagramma) in home page che mostra i 4 livelli e le dipendenze tra moduli, così che lo studente sappia "cosa devo sapere prima di questa lezione".

---

## 3. Template standard di ogni lezione

```
---
title: "..."
level: 1–4            # mostrato come badge
prerequisites: [L5, L9]
time: "~60 min"
---

::: {.callout-note} Obiettivi di apprendimento (3–5 punti, verbi operativi)
## 1. Perché ci serve? (problema concreto, 1 paragrafo, zero formule)
## 2. L'idea intuitiva (grafico o simulazione)
## 3. In R, passo per passo (chunk brevi e commentati)
::: {.callout-tip} Come si legge l'output
::: {.callout-caution collapse="true"} Per approfondire: la matematica
::: {.callout-warning} Errori comuni
## 4. Verifica rapida (2–3 domande a scelta multipla / vero-falso)
## 5. Esercizi (★ / ★★ / ★★★) con soluzioni a scomparsa
## 6. Riepilogo (tabella funzioni + 3 frasi chiave)
## Glossario e riferimenti
```

---

## 4. Esercizi

**Tipologie** (in ogni lezione 4–6 esercizi, difficoltà crescente):

| Tipo | Scopo | Esempio |
|---|---|---|
| ★ Riproduci | Consolidare la sintassi | "Crea un tibble con…, calcola la media di `price` per `store`" |
| ★ Prevedi l'output | Ragionare prima di eseguire | "Cosa restituisce `c(1, "a", TRUE)`? Perché?" |
| ★★ Debug | Leggere errori, capire R | Codice con un errore volontario (es. il bug di riciclo di `normalize01`) |
| ★★ Interpreta | Competenza statistica | "Ecco l'output di `t.test()`: scrivi due frasi per un lettore non tecnico" |
| ★★★ Mini-analisi | Trasferire su dati nuovi | "Ripeti l'analisi su `penguins`: le specie differiscono per `body_mass`?" |

**Implementazione tecnica (da decidere, vedi §8):**

- **Opzione A — statica** (robusta, zero dipendenze): soluzioni in callout `collapse="true"` + domande rapide con il pacchetto `webexercises` (funziona su GitHub Pages, nessun server).
- **Opzione B — interattiva nel browser**: estensione **Quarto Live** (webR), che permette di eseguire e correggere codice R direttamente nella pagina, con hint e soluzioni, anche su GitHub Pages. Ottima per le lezioni dei livelli 1–3; meno adatta per ML/DL (pacchetti pesanti non sempre disponibili in webR).
- **Raccomandazione**: B per i livelli 1–3, A per il livello 4.

Inoltre: un file `exercises/` con le soluzioni complete in `.R`, utile anche per il docente (esercitazioni in aula, esami).

### Esempio concreto (Lezione 21 — t-test)

> **★ Esercizio 1.** Usando `penguins`, filtra le specie *Adelie* e *Gentoo* e verifica con `t.test()` se la massa corporea media differisce. Quale versione del test usa R di default? Perché?
>
> **★★ Esercizio 2.** L'output riporta `p-value = 0.003` e un IC al 95% per la differenza pari a `[−820, −180]`. Quale delle seguenti frasi è corretta? (a) c'è lo 0.3% di probabilità che H0 sia vera; (b) se H0 fosse vera, osservare una differenza almeno così grande avrebbe probabilità 0.003; (c) la differenza vera è sicuramente tra −820 e −180.
>
> **★★★ Esercizio 3.** Con una simulazione (10 000 repliche, `n = 10` per gruppo, nessuna differenza vera) stima la frequenza di p-value < 0.05. Che valore ti aspetti e perché? Ripeti con una differenza vera di 0.5 deviazioni standard: cosa stai stimando ora?

---

## 5. Revisione del codice

### 5.1 Standard trasversali

| Area | Oggi | Proposta |
|---|---|---|
| Formato | R Markdown site (`_site.yml`, Bootstrap 3) | **Quarto website** (`_quarto.yml`): callout, soluzioni collassabili, cross-reference, ricerca integrata, tema chiaro/scuro, `execute: freeze: auto` |
| Riproducibilità | Nessuna gestione versioni pacchetti | `renv.lock` + `sessionInfo()` a fondo pagina |
| Percorsi | `"raw_data/..."` relativo | `here::here("data", "...")` |
| Nomi file | `R course_lesson 1.Rmd` (spazi, numerazione non ordinata) | `lessons/01-fundamentals/01-what-is-r.qmd` (con redirect dai vecchi URL) |
| Stile | Misto | Pipe nativa `\|>`, *tidyverse style guide*, `library()` solo nel chunk iniziale, `pkg::fun()` per funzioni usate una volta, controllo con `lintr`/`styler` |
| Deprecazioni | `size=` nelle linee ggplot (L25, L30), `fct_explicit_na()` (L24), `tree_method="gpu_hist"` (L28) | `linewidth=`, `fct_na_value_to_level()`, `device="cuda"` |
| ML framework | `caret` (in manutenzione, senza nuove funzionalità) + codice ad hoc per lo split ripetuto in 5 lezioni | **`tidymodels`** (`rsample`, `recipes`, `parsnip`, `tune`, `yardstick`): una sola grammatica, preprocessing stimato *solo* sul training (elimina il leakage), split stratificati |
| xgboost | API vecchia (`watchlist=`, parametri misti) | API ≥ 2.x/3.x: `evals=`, `xgb.params()`; oppure via `parsnip::boost_tree()` |
| Spiegabilità | SHAP citato in 3 lezioni ma mai mostrato | `DALEX`/`kernelshap` + `shapviz`, oppure rimuovere le citazioni |
| Risultati nel testo | Scritti a mano | Inline code |
| Seed | Presente quasi ovunque | Sempre, all'inizio del chunk che usa casualità |
| Dataset | 5 file in `raw_data/` non usati (`adult_data`, `bank_marketing`, `lahman-batting`, `train`, `travel_times`); `women.csv`/`mtcars.csv` duplicano dataset base | Pulizia + `data/README.md` con fonte e licenza di ogni dataset |

### 5.2 Errori specifici trovati (da correggere in ogni caso)

🔴 = risultato sbagliato o concetto errato · 🟠 = codice fragile/obsoleto · 🟡 = testo/coerenza

| Lez. | Gravità | Problema | Correzione |
|---|---|---|---|
| L3 | 🟡 | Chunk di slicing stampa `m` due volte; manca `m[1, 2]` | Aggiungere l'esempio mancante |
| L5 | 🟡 | Commento "One cell: row 1, column 2" ma il codice stampa `df` | `df[1, 2]` |
| L6 | 🔴 | `my_list[]` presentato come "list of length 1" e "the matrix itself"; resta la frase "Your original example had inconsistent dimensions" | `my_list[1]` vs `my_list[[2]]`; ripulire il testo |
| L9 | 🔴 | `normalize01()` calcola `(x - rng)` invece di `(x - rng[1])`: **R ricicla il vettore `range` e restituisce valori sbagliati senza errore** | Correggere; usarlo come esercizio di debug |
| L9 | 🔴 | "`length()` returns the number of columns for matrices": falso (restituisce n·m) | Correggere |
| L12, L34, about | 🟡 | Residui di citazioni automatiche `[2]`, `[1][2]`, `[web:236]` | Rimuovere |
| L13 | 🟠 | `data(cars, "dataset")` errato | `data(cars, package = "datasets")` |
| L15 | 🔴 | Imputazione con la media presentata senza caveat | Spiegare MCAR/MAR/MNAR, effetto sulla varianza; citare `mice` come alternativa |
| L17 | 🟡 | Manca `cor.test()` (inferenza sulla correlazione) e il messaggio correlazione ≠ causalità | Aggiungere |
| L21 | 🔴 | Manca il **t-test a due campioni indipendenti** (Welch); nessuna verifica delle assunzioni né effect size | Estendere la lezione |
| L22 | 🟠 | Nessuna diagnostica dei residui; `time` nel dataset poisons è fortemente asimmetrico (esempio classico di trasformazione Box-Cox/reciproca) | Aggiungere diagnostica, trasformazione, alternative robuste |
| L24 | 🔴 | Standardizzazione dell'intero dataset prima dello split (**leakage**); `scale()` restituisce colonne-matrice | Preprocessing con `recipes` stimato sul training |
| L24 | 🔴 | Il testo dice "cap al 99° percentile" ma il codice **elimina** le osservazioni | Allineare codice e testo (winsorizzare o motivare l'esclusione) |
| L24 | 🔴 | `plot(glm_base, which = 1:2)` per una logistica (residui vs fitted e QQ non interpretabili) | Residui binned / `DHARMa`, curva di calibrazione |
| L24 | 🔴 | "LRT p-value: Improved fit justifies added terms" dopo uno stepwise che *rimuove* termini | Riscrivere l'interpretazione |
| L24 | 🔴 | Soglia 0.22 hard-coded "scelta sulla validazione" ma mai calcolata; sezione "Interactions" senza modello con interazioni; manca l'interpretazione in **odds ratio** | Calcolare la soglia; aggiungere OR con IC; rimuovere o implementare le interazioni |
| L25 | 🟡 | Gap statistic annunciato ma non calcolato; il riepilogo cita un confronto con il gerarchico che non c'è; `k = 6` e "62%" scritti prima dei calcoli | Aggiungere `cluster::clusGap` o togliere; inline code |
| L26 | 🔴 | Il commento dice "1-SE rule" ma il codice sceglie il **minimo** di `xerror` | Implementare davvero la regola 1-SE |
| L27 | 🔴 | Importanze **invertite**: `type = 1` è MeanDecreaseAccuracy, `type = 2` è MeanDecreaseGini; "%IncMSE" vale solo per la regressione | Correggere etichette e testo |
| L27 | 🟠 | Griglia `mtry` non intera e `min.node.size` duplicato; `sampsize` non intero; "OOB = unbiased" troppo forte | Correggere griglia; sfumare l'affermazione |
| L28 | 🔴 | Pseudo-residui scritti senza il gradiente (−∂L/∂F); Step 9 "grid search" è un placeholder che non fa nulla | Formula corretta; tuning reale con `tune` o rimozione |
| L28 | 🟠 | API xgboost obsoleta (`watchlist`), `gpu_hist` deprecato; `fare` e `fare_log` entrambi inclusi; `age_child` chiamata "interaction" | Aggiornare |
| L29 | 🔴 | `idx_valid <- sample(n[-idx_train], ...)`: `n` è uno scalare, quindi il set di validazione **si sovrappone al training** (o il codice va in errore) | `sample(setdiff(seq_len(n), idx_train), ...)` o `rsample::initial_validation_split()` |
| L29 | 🟡 | "Step 10: Learning curves" non è una learning curve (stampa l'AUC di CV); 36% vs 38% di sopravvivenza in punti diversi | Implementare o rinominare; coerenza |
| L30 | 🔴 | "Kaiser: retain PC1–PC3": sull'iris standardizzato solo λ₁ > 1 (≈ 2.92; 0.91; 0.15; 0.02) | Correggere |
| L30 | 🔴 | Interpretazione di PC2 errata (è dominata da `Sepal.Width`, non "Petal Width vs Length") | Correggere |
| L30, L34 | 🔴 | PCA/UMAP stimate su tutti i dati prima dello split per il kNN (**leakage**) | Stimare sul training, proiettare il test (`predict()` / `umap_transform()`) |
| L31 | 🔴 | Rotazione varimax (ortogonale) su tratti di personalità correlati; correlazioni di Pearson su item Likert; TLI "> 0.88 excellent" | `oblimin`, `cor = "poly"`, soglie convenzionali corrette; discutere 5 vs 6 fattori suggeriti dalla parallel analysis |
| L32 | 🔴 | `eurodist` descritto come distanze euclidee: sono **distanze stradali** (non euclidee → autovalori negativi, ottimo spunto didattico); interpretazione geografica errata ("Nordic: ATH, HEL, LIS"); definizione di GOF errata | Riscrivere; ribaltare l'asse 2 per ottenere la "mappa" |
| L33 | 🟠 | `glimpse()` su una matrice senza `dplyr` caricato; regola della perplexity confusa | Correggere |
| L34 | 🔴 | "Deterministic given seed (unlike t-SNE)" e "Safe for modeling: preserves meaningful distances" sono affermazioni scorrette | Riscrivere con cautele corrette |
| L35 | 🔴 | Mappa simmetrica costruita con coordinate *standard* invece che principali; lo "Step 5 Contributions" stampa coordinate; interpretazione per quadranti/distanze riga-colonna scorretta; `kmeans()` applicato a un oggetto `dist` | Coordinate principali (o `plot(ca)`/`factoextra`), contributi reali, interpretazione corretta, eliminare lo Step 6 |
| L36 | 🔴 | "Prefer `lambda.min` when you want stability and parsimony": è `lambda.1se` | Correggere |
| L36 | 🔴 | `abline(v = -log(lambda))` su un grafico in `log(lambda)` → linea nel posto sbagliato | `abline(v = log(...))` |
| L36 | 🟠 | OLS con tutte le dummy di `cyl` + intercetta → coefficiente `NA`; test set di 8 osservazioni per confrontare RMSE | Gestire il contrasto; CV ripetuta |
| L38 | 🟠 | `url_path` non definito (errore se il file manca) | Rimuovere o definire |
| L40 | 🟠 | Parametrizzazione di `sigma` in `kernlab` (exp(−σ‖x−y‖²)) diversa dalla formula nel testo; il dataset wholesale non mostra il vantaggio dello spectral | Allineare la formula; aggiungere un esempio *two moons / cerchi concentrici* |
| L41–45 | 🟠 | Solo HTML statici da ~7 MB, senza sorgente; L45 ha titolo "Lesson 42" | Ricostruire `.qmd` con `freeze` |
| L1 | 🟡 | Dati datati ("almost 12,000 packages", aziende citate, RStudio Server Pro) | Aggiornare con dati verificati; citare Positron |
| CI | 🟠 | Il workflow cerca `docs/**/*.Rmd` (non esistono); installa solo 5 pacchetti | Nuovo workflow Quarto + `renv` + `freeze` |

---

## 6. Potenziamento delle parti teoriche

Per ogni lezione dei livelli 2–4 è prevista una riscrittura della teoria secondo il template (§3). Esempi di cosa cambia:

- **t-test (L21)**: si parte dalla domanda "due gruppi hanno davvero medie diverse o è il caso?"; si mostra per simulazione quanto varia la differenza di medie quando H0 è vera; la statistica t si costruisce come "segnale / rumore"; la formula arriva nel box di approfondimento.
- **Regressione (L23)**: grafico dei residui come "distanza verticale dalla retta"; interpretazione dei coefficienti a parole; distinzione tra *spiegare* e *predire*.
- **Logistica (L24)**: dalle probabilità agli odds ai log-odds con una tabella numerica; coefficiente → odds ratio → frase interpretativa; perché l'accuracy inganna con classi sbilanciate.
- **Alberi/Ensemble (L26–28)**: "20 domande" come metafora; bagging spiegato con il bootstrap già visto in M7; boosting come "correggere gli errori del modello precedente".
- **PCA (L30)**: proiezione di una nuvola 2D come primo esempio visivo, poi l'iris.
- **Clustering**: lezione-ponte su "cos'è una distanza" e perché lo scaling cambia tutto.

In più: **glossario** comune (EN, con traduzione IT a fianco per gli studenti italiani), e una pagina **"Statistica in 10 idee"** come mappa concettuale di riferimento.

---

## 7. Roadmap operativa

| Fase | Contenuto | Rilascio |
|---|---|---|
| **F1 — Correzioni urgenti** | Tutti gli 🔴 di §5.2 sul sito attuale (senza cambiare struttura) | Subito pubblicabile, nessun link rotto |
| **F2 — Infrastruttura** | Migrazione a Quarto, `renv`, nuova CI con `freeze`, rinomina file con redirect, template di lezione, pulizia `raw_data/` | Sito equivalente, nuova veste |
| **F3 — Ponte statistico** | Nuovi moduli M5, M7, M8 (≈ 8–9 lezioni nuove) + estensione L21/L22 | È il cuore didattico dell'upgrade |
| **F4 — Riscrittura livelli 1–3** | Teoria + esercizi + verifiche rapide per L1–L22 | |
| **F5 — Livello 4** | Migrazione a `tidymodels`, lezioni-ponte M10/M12, teoria e esercizi, Poisson | |
| **F6 — Completamento** | Sorgenti DL, capstone, glossario, mappa dei prerequisiti, aggiornamento README/About | |

Ogni fase si chiude con: render completo senza errori, controllo `lintr`, verifica che ogni numero citato nel testo sia generato dal codice, e revisione indipendente dei contenuti statistici.

---

## 8. Decisioni che spettano a te

1. **Quarto vs R Markdown.** Consiglio Quarto (callout, soluzioni a scomparsa, `freeze` per le lezioni pesanti, esercizi interattivi). Restare su R Markdown è possibile ma limita gli esercizi.
2. **`tidymodels` vs `caret`** per la parte ML. Consiglio `tidymodels`.
3. **Esercizi interattivi (Quarto Live/webR) o statici** con soluzioni a scomparsa? Consiglio misto (§4).
4. **Lingua**: solo inglese (come oggi) o inglese con glossario/box in italiano?
5. **Track deep learning**: mantenerla (ricostruendo i sorgenti) o congelarla come appendice?
6. **URL**: accetti la rinumerazione delle lezioni (con redirect dai vecchi indirizzi), o preferisci mantenere i nomi attuali?
7. **Ordine di lavoro**: partire da F1 (correzioni rapide sul sito attuale) oppure direttamente da F2?
