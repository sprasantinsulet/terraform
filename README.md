# Simple Terraform Approval Workflow

A very simple GitHub Actions workflow for Terraform deployments with built-in approval.

## What It Does

1. **Plan**: Runs `terraform plan` and detects changes
2. **Approve**: Waits for manual approval via environment protection
3. **Apply**: Applies changes after approval

## Quick Test

### 1. Setup Environment Protection
1. Go to your repository **Settings** → **Environments**
2. Click **"New environment"**
3. Name it: `approval`
4. Enable **"Required reviewers"** and add yourself
5. Click **"Configure protection rules"**

### 2. Run Test Workflow
1. Go to **Actions** → **Test Terraform Approval**
2. Click **"Run workflow"**
3. Choose:
   - `auto_approve: false` (requires approval)
   - `plan_only: false` (runs plan + apply)
4. Click **"Run workflow"**

## How It Works

- **No changes detected** → Applies immediately
- **Changes detected** → Creates approval job → Waits for environment approval → Applies changes

## Usage

```yaml
jobs:
  terraform:
    uses: ./.github/workflows/terraform-plan-apply.yml
    with:
      terraform-directory: './terraform'
      auto_approve: false  # Requires approval
      plan_only: false     # Runs plan + apply
```

## Options

| Option | Description | Default |
|--------|-------------|---------|
| `terraform-directory` | Where your Terraform files are | `.` |
| `auto_approve` | Skip approval (true/false) | `false` |
| `plan_only` | Only plan, no apply (true/false) | `false` |

## Test Files

- `terraform/main.tf` - Simple test configuration
- `.github/workflows/test-terraform-approval.yml` - Test workflow
- `.github/workflows/terraform-plan-apply.yml` - Main workflow

## Test Scenarios

1. **Manual Approval**: `auto_approve: false` → creates approval job
2. **Plan Only**: `plan_only: true` → just review, no apply
3. **Auto-approve**: `auto_approve: true` → skips approval

## To Approve

When the approval job runs:
1. **Go to the workflow run**
2. **Click on the approval job**
3. **Click "Review deployments"**
4. **Approve the deployment**

That's it! Very simple approval workflow for Terraform using GitHub's built-in environment protection.
