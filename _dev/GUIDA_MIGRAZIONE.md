# Guida alla migrazione (per Gianluca)

Questa guida spiega come pubblicare il nuovo sito Quarto **al posto** di quello attuale, mantenendo lo stesso indirizzo
`https://gianluca-sottile.github.io/An-R-Tutorial-for-Beginners/`. Tempo stimato: 1–2 ore la prima volta (soprattutto per il primo render).

## Cosa è cambiato nella cartella

| Elemento | Dove |
|---|---|
| Nuovo sito (67 lezioni `.qmd`) | `lessons/`, `index.qmd`, `setup.qmd`, `learning-path.qmd`, `glossary.qmd`, `about.qmd` |
| Configurazione e menu | `_quarto.yml` |
| Grafica (tema chiaro/scuro, colori, font) | `assets/` |
| Opzioni comuni a tutte le lezioni | `_common.R` |
| Dati (ex `raw_data/`) | `data/` (+ `data/README.md`) |
| Immagini | `images/` |
| Installazione pacchetti | `scripts/install-packages.R` |
| Pubblicazione automatica | `.github/workflows/publish.yml` |
| **Vecchio sito, intatto** | `_legacy/` (non viene pubblicato; cancellalo quando sei soddisfatto) |
| Guida per scrivere nuove lezioni | `_dev/STYLE_GUIDE.md` |

Le cartelle che iniziano con `_` non vengono pubblicate da Quarto.

## Passo 1 — Installa Quarto

Scarica e installa Quarto (≥ 1.6) da <https://quarto.org/docs/get-started/>. Verifica dal Terminale:

```bash
quarto --version
```

(RStudio recente include già Quarto, ma conviene avere l'ultima versione.)

## Passo 2 — Prepara il progetto (una volta sola)

Apri il Terminale nella cartella del progetto (`An-R-Tutorial-for-Beginners`) ed esegui:

```bash
mkdir -p /tmp/quarto-live
cd /tmp/quarto-live
quarto add r-wasm/quarto-live --no-prompt
cp -R /tmp/quarto-live/_extensions ~/Website/An-R-Tutorial-for-Beginners/
cd ~/Website/An-R-Tutorial-for-Beginners
```

(L'estensione si installa in una cartella temporanea e poi si copia nel progetto: lanciando `quarto add` direttamente nel progetto Quarto si blocca, perché le lezioni includono già un file dell'estensione che ancora non esiste.) Poi:

```bash
Rscript scripts/install-packages.R
```

Nota: nel Terminale di macOS (zsh) non incollare i commenti che iniziano con `#` sulla stessa riga dei comandi: zsh non li riconosce come commenti e dà errori come `unknown file attribute`.

Il primo comando crea la cartella `_extensions/`: **va committata** su GitHub. Senza estensione il sito non si compila (tutte le pagine usano il formato `live-html`).

Facoltativo ma consigliato, per fissare le versioni dei pacchetti: in R, `renv::init()` e poi `renv::snapshot()`; committa `renv.lock`.

R deve essere **≥ 4.5** (il corso usa il dataset `penguins` incluso in R da quella versione).

## Passo 3 — Deep learning (facoltativo, ma risolve il tuo problema con keras)

Le lezioni 61–66 hanno `freeze: true`: vengono eseguite **una sola volta sul tuo computer** e i risultati sono salvati in `_freeze/`. GitHub non deve mai installare keras/TensorFlow.

1. In R: `install.packages("keras3"); keras3::install_keras()` (dettagli nella lezione 61).
2. Esegui il render (passo 4). Le lezioni DL verranno addestrate localmente (qualche minuto ciascuna su CPU).
3. Se keras **non** è installato, quelle lezioni mostrano il codice senza eseguirlo (c'è un avviso nella pagina). Quando in seguito installi keras, cancella la cartella della lezione in `_freeze/lessons/13-deep-learning/` e rifai il render di quel file:
   ```bash
   quarto render lessons/13-deep-learning/62-dnn-tabular.qmd
   ```

## Passo 4 — Primo render e anteprima

```bash
quarto preview      # anteprima live nel browser mentre lavori
quarto render       # compila tutto il sito in _site/
```

Il primo `quarto render` esegue tutto il codice di tutte le lezioni (può richiedere 30–60 minuti, soprattutto per tuning ML e DL). I render successivi sono rapidi: grazie a `freeze: auto` Quarto riesegue solo le lezioni modificate.

### Cosa controllare al primo render

Il codice R di base è stato verificato eseguendolo (R 4.6 in WebAssembly); il codice che usa pacchetti esterni (tidyverse, tidymodels, keras, ecc.) è stato scritto con attenzione ma **non ho potuto eseguirlo** in questo ambiente. Se un chunk dà errore, Quarto si ferma e indica file e riga. I punti più delicati segnalati da chi ha scritto le lezioni:

- tidymodels (lezioni 41, 43–49): argomenti di `tune_grid`, `workflow_map`, `select_by_one_std_err`, `vip`;
- xgboost/parsnip (47): argomento `validation` del motore xgboost;
- GGally (27), ggplot2 con sottofigure multiple (29);
- `readxl_example("datasets.xlsx")` foglio "quakes" = 4 (18);
- keras3 (62–66): `pad_sequences`, `layer_random_translation`, conteggio parametri;
- `tsibbledata::vic_elec` (64) richiede il pacchetto tsibbledata.

Puoi mandarmi l'errore e lo correggiamo insieme.

## Passo 5 — Pubblica su GitHub

1. Copia il contenuto di questa cartella nel tuo clone locale del repository (se non lo è già) ed esegui:
   ```bash
   git add -A
   git commit -m "New Quarto version of the course"
   git push
   ```
   Assicurati che siano inclusi `_freeze/` e `_extensions/` (il `.gitignore` è già configurato per non escluderli).
2. Su GitHub: **Settings → Pages → Build and deployment → Source: GitHub Actions** (è già così per il vecchio sito).
3. Vai su **Actions**: il workflow "Publish site" compila e pubblica in 1–2 minuti, **senza eseguire R** (usa i risultati in `_freeze/`).

Se il workflow segnala che R non è disponibile, significa che una lezione non è stata "congelata": esegui `quarto render` in locale e fai di nuovo commit di `_freeze/`.

## I vecchi link continuano a funzionare

Ogni vecchia pagina `R-course_lesson-N.html` reindirizza automaticamente alla nuova lezione corrispondente (campo `aliases` nelle lezioni). Esempio: `R-course_lesson-21.html` → lezione 34 *t-tests*.

## Flusso di lavoro quotidiano

1. Modifichi un `.qmd` (o ne aggiungi uno e lo inserisci nel menu in `_quarto.yml`).
2. `quarto preview` per vedere il risultato.
3. `git add -A && git commit && git push` (includendo `_freeze/`).

## Note

- Nella riorganizzazione dei file è stato eliminato per errore `R_logo.png` (il logo ufficiale di R): non è usato dal nuovo sito, che ha un logo proprio (`images/logo.svg`), ma se ti serve è recuperabile dalla cronologia Git del repository.
- Il piano didattico completo e l'elenco degli errori corretti sono in `_UPGRADE_PLAN.md`.
