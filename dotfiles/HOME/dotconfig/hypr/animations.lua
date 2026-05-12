-- Animations
-- Reference:      https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
-- Variables:      https://wiki.hypr.land/Configuring/Basics/Variables/#animations
-- Bezier curves:  https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/#curves
-- Animation tree: https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/#animation-tree

-- ── Curves ────────────────────────────────────────────────────────────────

-- Spring: snappy, slightly elastic window motion
hl.curve("snap", { type = "spring", mass = 1, stiffness = 120, dampening = 18 })

-- Bezier: smooth near-linear ease for fades / workspaces (subtle, not boring)
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1.0 } } })

-- Bezier: quick ease-in-out for instant-feeling transitions
hl.curve("quick", { type = "bezier", points = { { 0.15, 0.0 }, { 0.1, 1.0 } } })

-- Bezier: true linear for continuous border-angle rotation
hl.curve("liner", { type = "bezier", points = { { 1.0, 1.0 }, { 1.0, 1.0 } } })


-- ── Windows ───────────────────────────────────────────────────────────────
-- Spring motion for move/drag; popin for open/close (windows "materialise")

hl.animation({ leaf = "windows", enabled = true, speed = 4.8, spring = "snap" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.2, spring = "snap", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.5, bezier = "liner", style = "popin 87%" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 4.0, spring = "snap" })


-- ── Border ────────────────────────────────────────────────────────────────

hl.animation({ leaf = "border", enabled = true, speed = 1, bezier = "liner" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 20, bezier = "liner", style = "loop" })


-- ── Fade ──────────────────────────────────────────────────────────────────
-- Use almostLinear so fades are smooth and actually visible (speed=3–4 ≈ 0.3–0.4 s)

hl.animation({ leaf = "fade", enabled = true, speed = 3.0, bezier = "quick" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 3.5, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 2.5, bezier = "almostLinear" })
hl.animation({ leaf = "fadeDim", enabled = true, speed = 3.5, bezier = "almostLinear" })
hl.animation({ leaf = "fadeShadow", enabled = true, speed = 3.5, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayers", enabled = true, speed = 3.5, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 3.5, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 2.5, bezier = "almostLinear" })


-- ── Workspaces ────────────────────────────────────────────────────────────
-- Crossfade feels cleaner than a hard directional slide for workspace switching

hl.animation({ leaf = "workspaces", enabled = true, speed = 2.5, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 2.5, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 2.0, bezier = "almostLinear", style = "fade" })


-- ── Layers (notifications, launchers, bars, etc.) ─────────────────────────
-- Fade is appropriate for overlaid surfaces; slide looks wrong here

hl.animation({ leaf = "layers", enabled = true, speed = 3.5, bezier = "quick", style = "fade" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 3.5, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 3.0, bezier = "almostLinear", style = "fade" })


-- ── Cursor zoom ───────────────────────────────────────────────────────────

hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })
