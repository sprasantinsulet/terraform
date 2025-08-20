# Simple Terraform Approval Workflow

A very simple GitHub Actions workflow for Terraform deployments with built-in approval using the `trstringer/manual-approval` action.

## What It Does

1. **Plan**: Runs `terraform plan` and detects changes
2. **Approve**: Creates a GitHub issue and waits for manual approval
3. **Apply**: Applies changes after approval

## Quick Test

### 1. Run Test Workflow
1. Go to **Actions** → **Test Terraform Approval**
2. Click **"Run workflow"**
3. Choose:
   - `auto_approve: false` (requires approval)
   - `plan_only: false` (runs plan + apply)
4. Click **"Run workflow"**

## How It Works

- **No changes detected** → Applies immediately
- **Changes detected** → Creates approval issue → Waits for approval → Applies changes

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

1. **Manual Approval**: `auto_approve: false` → creates approval issue
2. **Plan Only**: `plan_only: true` → just review, no apply
3. **Auto-approve**: `auto_approve: true` → skips approval

## To Approve

When an approval issue is created:
1. **Go to the issue** (link provided in workflow logs)
2. **Click "Approve"** button in the issue
3. **Workflow continues** automatically after approval

## How the Approval Works

1. **Workflow creates issue** with plan summary and approval button
2. **Waits for approval** via the manual approval action
3. **Approval button** appears in the GitHub issue
4. **Click approve** to continue the workflow
5. **Workflow proceeds** to apply changes

## Benefits

- ✅ **Simple approval button** - just click "Approve"
- ✅ **Reliable action** - `trstringer/manual-approval@v1` is well-maintained
- ✅ **No environment setup** required
- ✅ **Clear approval process** - obvious approve button
- ✅ **Audit trail** - who approved and when

That's it! Very simple approval workflow using the manual approval action. 🎯
