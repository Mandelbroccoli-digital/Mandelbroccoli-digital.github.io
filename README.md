# OWL_6055 — Services Hub (GitHub Pages)

Sovereign, static, local-first services site. The canonical "who is Owl_6055 / what do I sell" node. All other channels (website.com, Substack, Medium, FB) point here.

## Structure
- `index.html` — services, why-local, writing, contact/outbound
- `assets/style.css` — Eleusinian dark theme (telemetry aesthetic)

## Deploy (2 steps)
1. Create a repo `owl-6055.github.io` (or any repo, then enable Pages on a branch).
2. Push this folder to the repo root (or `/docs` with a config tweak).
   In GitHub: Settings → Pages → Source = branch `main` / root → Save.

Site goes live at `https://owl-6055.github.io` (or your custom domain if set).

## Edit cadence
- Services copy → keep tight, matches `C:\Dev\owl-freelance-kit\01_upwork_profile.md`.
- Social links → swap placeholders (`@owl6055`, `owl-6055`) for real handles once accounts exist.
- No build step. Plain HTML/CSS — GitHub Pages serves it directly.
