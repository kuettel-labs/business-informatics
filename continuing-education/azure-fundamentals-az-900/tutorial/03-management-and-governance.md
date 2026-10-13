# Domain 3: Describe Azure management and governance (30-35%)

Further reading: Cheshire, Exam Ref AZ-900 3rd ed., Ch. 3 (Skills 3.1-3.4); Boyce, Sybex, Ch. 4, 6, 7.

## 3.1 Cost management

- **Cost factors:** resource type and size (SKU), consumption, region, bandwidth (inbound data is generally free, outbound egress and cross-region traffic are charged), storage tier and redundancy, licensing, reservations/savings plans, spot, Azure Hybrid Benefit, marketplace third-party fees.
- **Pricing calculator:** estimate the cost of Azure services you plan to deploy *before* deploying.
- **TCO calculator:** compares running workloads on-premises vs in Azure over years. Not named in the current outline; know it as background.
- **Microsoft Cost Management:** analyse *actual* and forecast spend, budgets with alerts, recommendations, exports.
- **Tags:** name/value pairs on resources, groups, subscriptions (for example `env=prod`, `costcenter=42`) for cost reporting, ownership, automation. Tags are **not** inherited automatically (Azure Policy can enforce or copy them).

## 3.2 Governance and compliance

- **Microsoft Purview:** data governance, risk and compliance across Azure, on-premises, multi-cloud and Microsoft 365: data map and catalog, classification, lineage, information protection.
- **Azure Policy:** create, assign and evaluate rules on resource *properties* (allowed regions, allowed VM sizes, required tags). Effects such as deny, audit, modify. Initiatives group policies. Shows compliance and can remediate.
- **Resource locks:** **CanNotDelete** (read and modify, no delete) and **ReadOnly** (read only). Applied at subscription, group or resource; inherited; override even Owner permissions until the lock is removed.
- **Service Trust Portal:** Microsoft's audit reports, compliance documentation and privacy information. Background, not named in the current outline.
- **Azure Blueprints (legacy):** packaged policies, roles and templates. Retiring (no new definitions since 31 Jul 2026, retired 31 Jan 2027); replaced by Deployment Stacks and template specs. Do not expect it as a correct answer on the current outline.

## 3.3 Managing and deploying resources

| Tool | What it is |
| --- | --- |
| Azure portal | Web GUI; dashboards; good for one-off tasks |
| Azure Cloud Shell | Browser shell (Bash or PowerShell), already authenticated, tools preinstalled |
| Azure CLI | Cross-platform command line (`az ...`), Bash-friendly |
| Azure PowerShell | PowerShell module (`New-AzVM ...`), cross-platform |
| Azure Arc | Extends Azure management (Policy, RBAC, monitoring) to on-premises and other-cloud servers, Kubernetes, data services |
| Infrastructure as code | Define infrastructure in files, deploy repeatably, version in Git |
| Azure Resource Manager (ARM) | The deployment and management layer behind every tool: authenticates, authorises (RBAC), applies policy, locks, tags |
| ARM templates / Bicep | Declarative JSON (ARM) or simpler Bicep language describing desired state; idempotent, parallel deployment |

## 3.4 Monitoring

| Tool | Answers |
| --- | --- |
| Azure Advisor | "How can I improve?" Personalised recommendations: reliability, security, performance, cost, operational excellence |
| Azure Service Health | "Is Azure itself having a problem that affects me?" Azure status (global), service health (your services and regions: incidents, planned maintenance), resource health (one resource) |
| Azure Monitor | Collects metrics and logs from Azure, on-premises and other clouds |
| Log Analytics | Monitor tool to query logs with KQL |
| Azure Monitor alerts | Notify or act (action groups) when a metric or log condition is met |
| Application Insights | Application performance monitoring: requests, failures, dependencies, response times |

## SLAs and composite SLA

- **SLA:** Microsoft's uptime commitment per service, with service credits if missed. Free and preview services usually have none.
- Illustrative examples (check current figures on the [Microsoft SLA site](https://www.microsoft.com/licensing/docs/view/Service-Level-Agreements-SLA-for-Online-Services)): single VM with premium SSD 99.9%; availability set 99.95%; VMs across zones 99.99%. Figures in the questions below are illustrative too.
- **Composite SLA:** for services that all must work, **multiply**: App Service 99.95% x SQL Database 99.99% = 0.9995 x 0.9999 = about **99.94%**, lower than either. Adding redundancy (independent fallbacks) raises it.

## Commonly confused

- **Azure Policy vs RBAC vs resource locks:** Policy = what resources may look like (properties). RBAC = what a user may do. Locks = prevent delete/change for everyone, including Owners.
- **Blueprints status:** legacy, being retired; current answers use Policy, ARM/Bicep, Deployment Stacks.
- **Pricing calculator vs TCO calculator vs Cost Management:** estimate new Azure costs vs compare on-premises with Azure vs track actual spend and budgets.
- **SLA vs composite SLA:** one service vs the product of dependent services' SLAs.
- **Advisor vs Service Health vs Monitor:** recommendations vs Azure-side incidents and maintenance vs your own telemetry.
- **Service Health vs Resource Health:** your services/regions vs a single resource.
- **Log Analytics vs Application Insights:** query any logs vs app performance telemetry.
- **Azure CLI vs PowerShell vs Cloud Shell:** two command tools vs the browser host for both.
- **ARM vs ARM templates:** the management layer vs the declarative files it deploys.
- **Tags vs resource groups:** metadata across groups vs a container; tags are not inherited.
- **Purview vs Policy:** data governance and compliance vs resource configuration rules.

## Practice questions

**Q1.** (Multiple choice) Ensure nobody deploys resources outside Switzerland North and West Europe. Use:
A. RBAC  B. Azure Policy  C. Resource lock  D. Tags
<details><summary>Answer</summary>B. Policy restricts allowed locations.</details>

**Q2.** (Yes/No)
1. A ReadOnly lock lets an Owner change the resource.
2. Locks are inherited by child resources.
3. A CanNotDelete lock allows modifying a resource.
<details><summary>Answer</summary>1 No: locks override roles until removed. 2 Yes. 3 Yes.</details>

**Q3.** (Drag-match) Match Pricing calculator, TCO calculator, Cost Management to: (a) last month's actual spend by tag, (b) estimate a planned deployment, (c) compare on-premises with Azure over 3 years.
<details><summary>Answer</summary>a Cost Management, b Pricing calculator, c TCO calculator.</details>

**Q4.** (Multiple choice) Which tool notifies you about a planned Azure maintenance affecting your region?
A. Azure Advisor  B. Azure Service Health  C. Log Analytics  D. Azure Policy
<details><summary>Answer</summary>B. Service Health reports incidents and planned maintenance.</details>

**Q5.** (Multiple choice) Recommendations to resize underused VMs come from:
A. Azure Advisor  B. Azure Monitor alerts  C. Purview  D. Arc
<details><summary>Answer</summary>A. Advisor gives cost, security, reliability, performance and operational recommendations.</details>

**Q6.** (Yes/No)
1. Tags applied to a resource group are inherited by its resources automatically.
2. Tags can be used to group costs by department.
<details><summary>Answer</summary>1 No: use Policy to inherit. 2 Yes.</details>

**Q7.** (Multiple choice) Manage on-premises Linux servers with Azure Policy and RBAC. Use:
A. Azure Arc  B. Cloud Shell  C. ExpressRoute  D. Service Trust Portal
<details><summary>Answer</summary>A. Arc projects non-Azure resources into ARM.</details>

**Q8.** (Multiple choice) An app uses App Service (99.95%) and SQL Database (99.99%), both required. The composite SLA is about:
A. 99.99%  B. 99.97%  C. 99.94%  D. 99.95%
<details><summary>Answer</summary>C. Multiply: 0.9995 x 0.9999 is about 0.9994.</details>

**Q9.** (Multiple choice) Which describes infrastructure as a repeatable declarative file?
A. Azure portal  B. Bicep file  C. Service Health  D. Resource lock
<details><summary>Answer</summary>B. Bicep and ARM templates are IaC.</details>

**Q10.** (Yes/No)
1. Cloud Shell requires installing the Azure CLI locally.
2. Every deployment, from portal, CLI or templates, goes through Azure Resource Manager.
3. Azure PowerShell runs on Linux and macOS.
<details><summary>Answer</summary>1 No: it runs in the browser. 2 Yes. 3 Yes.</details>

**Q11.** (Multiple choice) Find slow dependencies and failed requests in a web application. Use:
A. Application Insights  B. Advisor  C. Purview  D. Pricing calculator
<details><summary>Answer</summary>A. Application Insights is the APM feature of Azure Monitor.</details>

**Q12.** (Multiple choice) Classify sensitive data across Azure and on-premises and track lineage. Use:
A. Azure Policy  B. Microsoft Purview  C. Defender for Cloud  D. Tags
<details><summary>Answer</summary>B. Purview handles data governance and classification.</details>

**Q13.** (Multiple choice) Which factor typically does NOT increase an Azure bill?
A. Outbound data transfer  B. Inbound data transfer  C. Larger VM size  D. GRS instead of LRS
<details><summary>Answer</summary>B. Inbound data transfer is generally free.</details>

**Q14.** (Yes/No) Is each of these an Azure Advisor recommendation category?
1. Cost  2. Security  3. Licensing  4. Operational excellence
<details><summary>Answer</summary>1 Yes 2 Yes 3 No 4 Yes. Advisor categories are reliability, security, performance, cost and operational excellence.</details>

**Q15.** (Multiple choice) A team wants to package policies, role assignments and templates for new subscriptions today. What is the current recommendation?
A. Create a new Azure Blueprint  B. Use Deployment Stacks and template specs with Azure Policy  C. Use resource locks only  D. Use Service Health
<details><summary>Answer</summary>B. Azure Blueprints is legacy and retiring (no new definitions since 31 Jul 2026); Deployment Stacks and template specs replace it.</details>
