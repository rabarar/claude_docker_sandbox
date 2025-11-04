# Claude Docker Sandbox

> Scripted scaffolding to spin up **isolated, reproducible dev sandboxes** for Claude, Docker, and GitHub workflows.

This repo provides a lightweight way to create disposable, locked-down work environments by copying a template directory and bringing it up with a few shell scripts. It’s ideal when you want Claude (or any agentic workflow) to work inside a container with clearly defined boundaries and minimal host exposure.

- **Single-command setup** using the included `standup.sh`
- **Template-driven**: duplicate `container_template_dir/` to start a new sandbox
- **Reproducible envs**: deterministic Docker build + scriptable validation
- **Safer-by-default**: encourages filesystem isolation; easy to add network restrictions
- **GitHub-friendly**: room to wire in `gh` auth and PR flows

> “Stand up a new work environment by copying the `container_template_dir` to a new directory and stand it up with `build.sh`, `validate.sh`, and `authenticate.sh`.” 

---
