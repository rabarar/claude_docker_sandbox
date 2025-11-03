# Claude.ai coding environment + GitHub CLI
FROM node:lts-bookworm

# Install OS deps and GitHub CLI (official repo)
RUN apt-get update && apt-get install -y --no-install-recommends \
    git curl ca-certificates gnupg openssh-client less vim \
 && mkdir -p /etc/apt/keyrings \
 && curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg \
    | tee /etc/apt/keyrings/githubcli-archive-keyring.gpg >/dev/null \
 && chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
 && echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" \
    > /etc/apt/sources.list.d/github-cli.list \
 && apt-get update && apt-get install -y --no-install-recommends gh \
 && rm -rf /var/lib/apt/lists/*

# Install Claude Code CLI globally (provides `claude` command)
RUN npm install -g @anthropic-ai/claude-code

# Create non-root dev user with safe UID/GID handling
# Create non-root dev user with safe UID/GID handling
ARG UID=1001
ARG GID=1001
RUN set -eux; \
    # Resolve or create the primary group
    if getent group "${GID}" >/dev/null; then \
      GRP_NAME="$(getent group "${GID}" | cut -d: -f1)"; \
    else \
      GRP_NAME="dev"; \
      groupadd -g "${GID}" "${GRP_NAME}"; \
    fi; \
    # Create user if it doesn't exist
    if ! id -u dev >/dev/null 2>&1; then \
      if getent passwd "${UID}" >/dev/null; then \
        # UID taken (e.g., node user = 1000). Let system pick a free UID.
        useradd -m -g "${GRP_NAME}" dev; \
      else \
        useradd -m -u "${UID}" -g "${GRP_NAME}" dev; \
      fi; \
    fi
USER dev

# Workspace
WORKDIR /workspace


# Helpful defaults (avoid $HOME/$USER to prevent UndefinedVar warnings)
ENV GIT_EDITOR=vim
ENV PATH="/home/dev/.local/bin:${PATH}"

# Start an interactive shell by default
CMD ["bash"]

