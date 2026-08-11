#!/usr/bin/env Rscript

# Procedurally generate the book cover and favicon.
# Watercolor gradient anchored on the brand oxblood #7a3b52,
# overlaid with title typography. Reproducible: re-running
# regenerates identical output (seed is fixed).

set.seed(71)

out_dir <- if (interactive()) "images" else
  dirname(sub("--file=", "", grep("--file=", commandArgs(),
    value = TRUE)))
if (length(out_dir) == 0 || is.na(out_dir)) out_dir <- "."

brand <- "#7a3b52"

# Vertical gradient from deep oxblood through clay to warm sand.
ramp <- grDevices::colorRampPalette(
  c("#3a1626", brand, "#b06a60", "#d6a060", "#f0e4d2")
)

draw_cover <- function(path, width, height, with_text) {
  grDevices::png(path, width = width, height = height,
    units = "px", res = 150, bg = brand)
  on.exit(grDevices::dev.off(), add = TRUE)

  op <- graphics::par(mar = c(0, 0, 0, 0))
  on.exit(graphics::par(op), add = TRUE)

  n <- 400
  cols <- ramp(n)
  graphics::plot.new()
  graphics::plot.window(xlim = c(0, 1), ylim = c(0, 1),
    xaxs = "i", yaxs = "i")
  ys <- seq(0, 1, length.out = n + 1)
  for (i in seq_len(n)) {
    graphics::rect(0, ys[i], 1, ys[i + 1], col = cols[i],
      border = NA)
  }

  # Faint vertical rules suggesting sequential interim looks.
  for (x in seq(0.06, 0.94, by = 0.08)) {
    graphics::segments(x, 0, x, 1,
      col = grDevices::adjustcolor("#ffffff", 0.05),
      lwd = 1)
  }

  # A stylized pair of divergent trajectories.
  tt <- seq(0, 1, length.out = 200)
  graphics::lines(0.08 + 0.84 * tt, 0.30 - 0.10 * tt,
    col = grDevices::adjustcolor("#fdf3ea", 0.30), lwd = 3)
  graphics::lines(0.08 + 0.84 * tt, 0.30 - 0.19 * tt,
    col = grDevices::adjustcolor("#fdf3ea", 0.30), lwd = 3)

  if (with_text) {
    graphics::text(0.5, 0.72, "Design and Analysis",
      col = "#fdf3ea", cex = 3.0, font = 2)
    graphics::text(0.5, 0.63, "of Clinical Trials",
      col = "#fdf3ea", cex = 3.0, font = 2)
    graphics::text(0.5, 0.52, "A ten-week graduate course",
      col = "#fdf3ea", cex = 1.5, font = 3)
    graphics::text(0.5, 0.08, "The rgtlab Curriculum Project",
      col = grDevices::adjustcolor("#fdf3ea", 0.85),
      cex = 1.0)
  }
}

draw_cover(file.path(out_dir, "cover.png"),
  width = 1200, height = 1800, with_text = TRUE)

draw_cover(file.path(out_dir, "favicon.png"),
  width = 128, height = 128, with_text = FALSE)

message("Wrote cover.png and favicon.png to ", out_dir)
