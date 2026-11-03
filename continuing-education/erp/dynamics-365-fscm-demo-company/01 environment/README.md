# 01 Environment

Create a non-production Dynamics 365 Finance and Operations environment for the
Kuettel Labs AG (KLAB) demo. Use the Power Platform admin center (PPAC) unless
the tenant already uses an LCS-managed deployment process.

## Before you start

- Ask the tenant's Power Platform or Dynamics 365 administrator to create the
  environment or grant the required role.
- Confirm that the tenant has an appropriate Dynamics 365 license and enough
  database and Finance and Operations database capacity. Microsoft's current
  guidance lists at least 1 GB of each for this provisioning path.
- Agree on the region, language, URL, and an Entra ID security group with the
  administrator. Use the organization's data-residency requirements when
  choosing a region.
- Decide which Finance and Operations app or apps the demo needs. The available
  choices depend on the tenant's licenses.

## Create a sandbox in PPAC

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com)
   with an account that has the required administrator role.
2. Go to **Manage > Environments**, select **New**, and configure the first
   screen:
   - **Type:** **Sandbox**. Do not leave **Trial (subscription-based)**
     selected for this FSCM demo; trial-type environments can't have Dynamics
     365 apps enabled under the current PPAC guidance.
   - **Macro Region Geography:** **European Union & EFTA**, if this matches the
     organization's data-residency requirements. The service assigns a
     specific region within this geography based on capacity.
   - **Name:** `test-eu-klab` (or another agreed descriptive name.
   - **Environment group:** leave **None** unless the administrator has
     assigned an environment group for this demo.
   - **Make this a Managed Environment:** **No**, unless the administrator
     requires Managed Environments.
   - **Add a Dataverse data store?:** **Yes**. If the control is fixed to Yes,
     that is expected for environment types that require Dataverse.
   - **Pay-as-you-go with Azure?:** **No**, unless the administrator has
     explicitly arranged Azure billing for this environment.
3. Select **Next** and configure the database:
   - **Language:** English (United States), unless the demo requires another
     language. Choose carefully because the environment's base language cannot
     be changed later.
   - **URL:** a unique organization URL, for example `klab-fscm-demo`
   - **Currency:** choose the agreed base currency. This does not set the
     accounting currency of the KLAB legal entity; that is configured later.
   - **Enable Dynamics 365 apps:** **Yes**, then select the licensed Finance
     and/or Supply Chain Management app required for the demo. This choice
     cannot be enabled after the environment is created.
   - **Security group:** select the group approved for demo users; avoid an
     unrestricted environment unless the administrator has approved it.
4. Review the settings and select **Save**. Wait for PPAC to finish provisioning
   and show the environment as ready before continuing.
5. Open the environment URL and sign in with a licensed user. Confirm that the
   Finance and Operations app opens and that the intended users can access it.
6. Record the environment URL, region, language, and administrator/contact in
   the team's approved documentation. Do not record passwords or access tokens.
7. Continue with the legal entity and demo-data setup in the following
   chapters. Creating the environment does not by itself create KLAB or load
   USMF/Contoso demo data.

## Keep the cost low

- First ask the tenant administrator whether an existing licensed sandbox can
  host the demo. Reusing an approved environment avoids creating another one.
- If a new environment is needed, use **Sandbox** with the required Finance and
  Operations app, and confirm license eligibility and available Dataverse and
  Operations database capacity before provisioning. Avoid buying extra
  capacity or licenses until the administrator confirms they are necessary.
- Keep **Pay-as-you-go with Azure?** set to **No** unless there is an approved
  Azure billing plan and a cost owner. Pay-as-you-go can add metered charges;
  it is not required just to create this sandbox.
- Leave **Make this a Managed Environment** set to **No** unless organizational
  policy requires it. Use the approved user security group and grant access
  only to people participating in the demo.
- Do not choose **Trial (subscription-based)** merely because it appears
  cheaper: under current PPAC guidance, trial-type environments can't have
  Dynamics 365 apps enabled. It is not a viable substitute for this FSCM demo.

## Trial and LCS notes

- **Trial (subscription-based)** is an option visible in the PPAC creation
  panel, but it is temporary and subject to Microsoft's trial and tenant
  limits. Current PPAC guidance says Dynamics 365 apps can't be enabled on
  trial-type environments; use **Sandbox** for this Finance and Operations
  demo. If only a trial type is available, ask the tenant administrator about
  licensing and permissions rather than creating a trial that cannot host the
  required app.
- Use Lifecycle Services (LCS) only if the tenant's existing Finance and
  Operations deployment process specifically requires it. LCS-managed
  development or hosted environments are not interchangeable with a PPAC
  sandbox; confirm the supported environment type, subscription, and access
  with the tenant administrator before provisioning.
- Review Microsoft's current
  [environment creation guidance](https://learn.microsoft.com/en-us/power-platform/admin/create-environment)
  before provisioning, since available options and licensing requirements can
  change.
