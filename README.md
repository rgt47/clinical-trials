# Design and Analysis of Clinical Trials
*2026-08-10 19:12 PDT*

A graduate course on the design, conduct, monitoring,
analysis, and reporting of randomized clinical trials,
written for first- and second-year students in
biostatistics, epidemiology, and public health, and for
medical students with an interest in research.

The core is ten chapters, one per week of an academic
quarter. Eighteen further chapters treat advanced topics,
each built on a research compendium from the author's
methodological work.

## Structure

**Weeks 1-2, Foundations.** The trial as an experiment;
the protocol, the estimand, and the endpoint.

**Weeks 3-5, Design.** Randomization and allocation
concealment; blinding, bias, and conduct; sample size and
power.

**Weeks 6-7, Early-phase trials.** Phase I dose-finding;
phase II screening designs.

**Weeks 8-10, Confirmatory trials.** The primary analysis;
interim monitoring and adaptive designs; missing data,
sensitivity, and reporting.

**Advanced topics.** Run-in designs; visit placement;
N-of-1 designs; covariate-adaptive allocation; multicenter
trials and site effects; baseline covariate adjustment;
factorial and matched-tuple randomization; MMRM in
practice; continuous versus time-to-event endpoints;
longitudinal power; dropout adjustment; exact tests;
conditional power; fully sequential analysis;
multiplicity; repowering; summary statistics; imputation.

## Build

```bash
quarto render analysis/report
```

The cover is generated procedurally:

```bash
Rscript analysis/report/images/build-cover.R
```

## Position in the series

This volume expands the two clinical-trial chapters of
*Applied Statistical Methods for Health Sciences Research*
into a full course. Companion volumes:

- *R for Biostatistics: A One-Week Boot Camp*, the R
  language.
- *Biostatistics Practicum*, workflow infrastructure.
- *Statistical Computing in the Age of AI*, methods and
  computing.
- *Applied Statistical Methods for Health Sciences
  Research*, the applied-methods axis.
- *Applied Generative AI for Health Sciences Research*,
  generative AI.

## License

Prose: CC BY 4.0. Code samples: MIT. Repository code: GPL-3.
