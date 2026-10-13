# Domain 1: Describe cloud concepts (25-30%)

Further reading: Cheshire, Exam Ref AZ-900 3rd ed., Ch. 1 (Skills 1.1-1.3); Boyce, Sybex AZ-900 Study Guide, Ch. 1.

## Summary in outline order

### 1.1 Cloud computing

- **Cloud computing:** renting compute, storage, networking and services over the internet, on demand, paying for what you use instead of owning a datacenter.
- **Shared responsibility model:** the provider always owns the physical layer (datacenter, hosts, physical network). The customer always owns **data, devices, accounts and identities**. The middle shifts with the service type:

| Layer | On-premises | IaaS | PaaS | SaaS |
| --- | --- | --- | --- | --- |
| Information and data | Customer | Customer | Customer | Customer |
| Devices (PCs, mobiles) | Customer | Customer | Customer | Customer |
| Accounts and identities | Customer | Customer | Customer | Customer |
| Identity and directory infrastructure | Customer | Customer | Shared | Shared |
| Applications | Customer | Customer | Shared | Provider |
| Network controls | Customer | Customer | Shared | Provider |
| Operating system | Customer | Customer | Provider | Provider |
| Physical hosts, network, datacenter | Customer | Provider | Provider | Provider |

- **Cloud models and use cases:**
  - *Public:* provider-owned, multi-tenant, no CapEx, fast scaling. Most new or variable workloads.
  - *Private:* dedicated to one organization (own or hosted datacenter). Full control, highest cost. Strict regulation or legacy constraints.
  - *Hybrid:* public and private connected. Keep sensitive data on-premises, burst to cloud, gradual migration.
  - *Multi-cloud:* several public providers; Azure Arc can manage across them.
- **Consumption-based model:** no upfront cost, pay only for what you use, stop paying when you stop using.
- **Pricing models:** pay-as-you-go; reservations (1 or 3 years, large discount); savings plan for compute (1 or 3 year hourly spend commitment that applies flexibly across VM sizes, regions and several compute services, unlike reservations, which are tied to a specific resource type and region); spot VMs (cheap, evictable); Azure Hybrid Benefit (reuse Windows Server/SQL Server licences).
- **Serverless:** you deploy code or workflows; the platform runs, scales and bills per execution (Azure Functions, Logic Apps). Event-driven, no server management.

### 1.2 Benefits of cloud services

| Benefit | Meaning |
| --- | --- |
| High availability | Stays up despite failures; expressed as an SLA (for example 99.9%) |
| Scalability | Handle more load. Vertical = bigger resource (scale up). Horizontal = more instances (scale out) |
| Elasticity | Scaling automatically in both directions with demand |
| Reliability | Recover from failures: global footprint, zones, backups |
| Predictability | Performance (autoscale, load balancing) and cost (calculators, budgets, forecasts) |
| Security and governance | Policies, compliance offerings, provider patching in PaaS/SaaS, DDoS protection |
| Manageability | *Of* the cloud: autoscale, monitoring, templates. *In* the cloud: portal, CLI, PowerShell, APIs |

### 1.3 Cloud service types

| Type | You manage | Provider manages | Azure examples | Use case |
| --- | --- | --- | --- | --- |
| IaaS | OS, runtime, apps, data | Hardware, virtualization | Virtual Machines, disks, VNets | Lift and shift, full OS control, test/dev |
| PaaS | Apps and data | OS, patching, runtime | App Service, Azure SQL Database, Functions | Build apps without managing servers |
| SaaS | Data, users, settings | Everything else | Microsoft 365, Dynamics 365 | Ready-made software |

## Commonly confused

- **CapEx vs OpEx:** CapEx = upfront spend on physical assets, depreciated over years (buying servers). OpEx = ongoing spend on services, expensed in the period (cloud bill). Cloud moves CapEx to OpEx.
- **IaaS vs PaaS vs SaaS:** ask "who patches the OS?" You = IaaS. Provider, but you deploy code = PaaS. You only use the app = SaaS.
- **Scalability vs elasticity:** scalability is the capability; elasticity is doing it automatically, up and down.
- **High availability vs disaster recovery:** HA keeps running through a component failure; DR restores after a large outage, often in another region.
- **Hybrid vs multi-cloud:** on-premises plus cloud vs several public clouds.
- **Data responsibility:** never moves to the provider, not even in SaaS.

## Practice questions

**Q1.** (Multiple choice) A company buys servers that it depreciates over five years. What kind of expense is this?
A. OpEx  B. CapEx  C. Consumption-based  D. Reserved
<details><summary>Answer</summary>B. Upfront purchase of physical assets is capital expenditure.</details>

**Q2.** (Yes/No) For each statement, answer Yes or No.
1. In SaaS, the provider is responsible for your data.
2. In IaaS, the customer patches the operating system.
3. In PaaS, the provider manages the physical hosts.
<details><summary>Answer</summary>1 No: data is always the customer's. 2 Yes: the OS is yours in IaaS. 3 Yes: physical layers are always the provider's.</details>

**Q3.** (Multiple choice) Which service type fits a team that wants to deploy a web app without managing operating systems?
A. IaaS  B. PaaS  C. SaaS  D. On-premises
<details><summary>Answer</summary>B. PaaS hosts your code while the provider runs the OS and runtime.</details>

**Q4.** (Drag-match) Match each model to the scenario: Public, Private, Hybrid.
a. Regulator requires data on own hardware; web front end runs in Azure.
b. Startup with no datacenter wants to launch quickly.
c. Bank runs everything in its own dedicated datacenter.
<details><summary>Answer</summary>a Hybrid, b Public, c Private. Hybrid mixes both; public needs no hardware; private is dedicated.</details>

**Q5.** (Multiple choice) An app automatically adds instances at peak and removes them at night. This is:
A. Fault tolerance  B. Elasticity  C. Vertical scaling  D. Predictability
<details><summary>Answer</summary>B. Automatic scaling in both directions is elasticity.</details>

**Q6.** (Multiple choice) Moving a VM from 2 to 8 vCPUs is:
A. Scaling out  B. Scaling up  C. Elasticity  D. Load balancing
<details><summary>Answer</summary>B. Making one resource bigger is vertical scaling (scale up).</details>

**Q7.** (Yes/No)
1. Serverless means no servers exist.
2. Azure Functions bills per execution in the Consumption plan.
3. Serverless suits event-driven code.
<details><summary>Answer</summary>1 No: servers exist but are abstracted. 2 Yes. 3 Yes.</details>

**Q8.** (Multiple choice) Which pricing option gives the largest discount for a VM that runs 24/7 for three years?
A. Pay-as-you-go  B. Spot  C. Reservation  D. Free account
<details><summary>Answer</summary>C. A 3-year reservation is designed for steady long-running workloads; spot can be evicted.</details>

**Q9.** (Multiple choice) Which benefit describes being able to forecast monthly cloud spend?
A. Cost predictability  B. Elasticity  C. High availability  D. Agility
<details><summary>Answer</summary>A. Predictability covers both performance and cost.</details>

**Q10.** (Drag-match) Match: IaaS, PaaS, SaaS to Microsoft 365, Azure Virtual Machines, Azure App Service.
<details><summary>Answer</summary>SaaS = Microsoft 365, IaaS = Virtual Machines, PaaS = App Service.</details>

**Q11.** (Yes/No)
1. The consumption-based model requires upfront payment.
2. Under the shared responsibility model, accounts and identities stay with the customer for every service type.
<details><summary>Answer</summary>1 No: you pay as you use. 2 Yes.</details>

**Q12.** (Multiple choice) Which statement about manageability is correct?
A. It only means the Azure portal.  B. It includes autoscaling and monitoring of resources.  C. It is only relevant for SaaS.
<details><summary>Answer</summary>B. Management of the cloud includes autoscale, monitoring and templates.</details>
