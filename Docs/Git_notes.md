# Git Command Reference Guide

## 🔧 Repository Setup
| Command | Description | Example |
|---------|-------------|---------|
| `git init` | Initialize new local repository | `git init project-name` |
| `git clone` | Copy remote repository to local | `git clone https://github.com/user/repo.git` |

## 🔄 Basic Workflow
| Command | Description | Common Flags |
|---------|-------------|--------------|
| `git add` | Stage changes for commit | `-A` (all), `-p` (interactive) |
| `git commit` | Save staged changes | `-m "message"`, `--amend` (edit last) |
| `git status` | Show changed/untracked files | `-s` (short format) |
| `git diff` | Show unstaged changes | `--cached` (staged changes) |

## 🌿 Branching
| Command | Description | Useful Options |
|---------|-------------|----------------|
| `git branch` | List/create branches | `-d` (delete), `-m` (rename) |
| `git checkout` | Switch branches | `-b` (create new branch) |
| `git merge` | Combine branch histories | `--no-ff` (force merge commit) |
| `git rebase` | Reapply commits on another base | `-i` (interactive) |

## 🔄 Remote Collaboration
| Command | Description | Usage Examples |
|---------|-------------|----------------|
| `git fetch` | Download objects/refs from remote | `git fetch origin` |
| `git pull` | Fetch + merge remote changes | `git pull origin main` |
| `git push` | Upload local changes to remote | `git push -u origin branch` |
| `git remote` | Manage remote connections | `-v` (list remotes) |

## 🕵️‍♂️ Inspection
| Command | Description | Useful Formats |
|---------|-------------|----------------|
| `git log` | Show commit history | `--oneline`, `--graph` |
| `git show` | Display commit details | `git show HEAD~2` |
| `git blame` | Show who changed each line | `-L 10,20 file.txt` |

## 🧹 Maintenance
| Command | Description | Common Uses |
|---------|-------------|-------------|
| `git stash` | Temporarily save changes | `save "message"`, `pop` |
| `git clean` | Remove untracked files | `-n` (dry run), `-f` (force) |
| `git reset` | Unstage/rewind changes | `--soft`, `--hard` |
| `git reflog` | Show all reference changes | `git reflog show branch` |

## 🛠️ Advanced
| Command | Description | Pro Tip |
|---------|-------------|---------|
| `git bisect` | Binary search for bugs | `start → bad → good → reset` |
| `git cherry-pick` | Apply specific commit | `git cherry-pick abc123` |
| `git submodule` | Manage nested repos | `update --init --recursive` |
| `git worktree` | Multiple working trees | `add ../new-copy branch-name` |

## 🔄 Common Workflows

### Standard Commit
```bash
git add .
git commit -m "feat: add user authentication"
git push origin main