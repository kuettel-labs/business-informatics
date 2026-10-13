# AZ-900 mixed mock exam

40 new questions, not repeated from the domain files. **Timing: 45 minutes**, matching the Fundamentals exam duration on [Microsoft Learn](https://learn.microsoft.com/en-us/credentials/support/exam-duration-exam-experience) (seat time 65 minutes). No notes. Write your answers down, then check the key at the end. Pass mark to aim for: 32 of 40 (80%). Weighting follows the outline: domain 1 about 11, domain 2 about 15, domain 3 about 14 questions.

## Questions

1. Which cost model lets you stop paying for a resource the moment you delete it? A. CapEx  B. Consumption-based  C. Lease  D. Reservation
2. Yes/No: (a) Private cloud removes the need for any hardware. (b) Hybrid cloud can keep sensitive data on-premises. (c) Public cloud is multi-tenant.
3. A company replaces its email server with Microsoft 365. Service type? A. IaaS  B. PaaS  C. SaaS
4. Who is responsible for configuring firewall rules inside a VM's operating system in IaaS? A. Microsoft  B. Customer  C. Shared equally
5. A shop adds web servers during a sale and removes them afterwards, automatically. Which two terms apply? A. Elasticity  B. Horizontal scaling  C. Vertical scaling  D. CapEx
6. Which benefit is shown by a 99.95% uptime commitment? A. High availability  B. Agility  C. Governance  D. Elasticity
7. Which pricing option suits a fault-tolerant batch job that can be interrupted at any time? A. Reservation  B. Spot VMs  C. Savings plan  D. Pay-as-you-go
8. Drag-match: own datacenter only / Azure only / both connected, to Private, Public, Hybrid.
9. Which is a characteristic of serverless computing? A. You choose the VM size  B. You pay per execution  C. You patch the OS  D. It needs a reservation
10. A developer wants a managed database without managing the database server. Type? A. IaaS  B. PaaS  C. SaaS
11. Yes/No: (a) Cloud spending is generally OpEx. (b) OpEx is depreciated over several years.
12. What is the smallest unit you can move between resource groups? A. Subscription  B. Resource  C. Management group  D. Tenant
13. A service available in every region automatically, not region-specific, is called: A. Zonal  B. Global (non-regional)  C. Sovereign  D. Paired
14. Which needs at least three zones? A. LRS  B. ZRS  C. GRS  D. Archive tier
15. Yes/No: (a) Subscriptions are billing boundaries. (b) A management group can contain other management groups. (c) A resource group can contain another resource group.
16. You need 100 identical VMs that scale with CPU load. Use: A. Availability set  B. VM Scale Sets  C. Azure Virtual Desktop  D. ACI
17. Which service runs code triggered by a new file in blob storage, billed per execution? A. App Service  B. Azure Functions  C. AKS  D. Virtual Machines
18. Drag-match: name resolution for your domain / connect two VNets privately / encrypted tunnel from a branch office, to VNet peering, Azure DNS, VPN Gateway.
19. Which statement about ExpressRoute is true? A. It uses the public internet  B. It is a private connection through a connectivity provider  C. It replaces VNets  D. It is a DNS service
20. Users must reach a storage account only via a private IP from their VNet. Use: A. Service endpoint policy  B. Private endpoint  C. Public IP  D. NSG on the storage account
21. Which account type supports blobs, files, queues and tables with hot/cool/cold/archive tiers? A. Premium block blobs  B. Standard general-purpose v2  C. Premium file shares  D. Premium page blobs
22. Data is read every few weeks and kept at least 30 days; lowest cost while staying online. A. Hot  B. Cool  C. Archive
23. Which replication keeps data readable in a secondary region at all times, with zone redundancy in the primary? A. GRS  B. RA-GRS  C. GZRS  D. RA-GZRS
24. You need to discover on-premises VMware servers and estimate Azure sizing. Use: A. Azure Data Box  B. Azure Migrate  C. AzCopy  D. Azure Arc
25. Yes/No: (a) Passwordless sign-in can use FIDO2 keys. (b) SSO means users need a separate password per app. (c) MFA combines at least two factor types.
26. Which principle states "assume breach"? A. Defense in depth  B. Zero Trust  C. Shared responsibility  D. Least cost
27. Which tool gives a secure score with hardening recommendations? A. Microsoft Defender for Cloud  B. Azure Advisor cost tab  C. Purview  D. Pricing calculator
28. A user must manage VMs in one resource group but nothing else. Use: A. Azure Policy  B. RBAC role at resource group scope  C. Lock  D. Tag
29. Which factor most likely increases cost? A. Moving data into Azure  B. Moving data out of Azure to the internet  C. Applying tags  D. Creating an empty resource group
30. Which tool sets a monthly budget with an alert at 80%? A. Pricing calculator  B. Cost Management  C. Service Health  D. Arc
31. Yes/No: (a) Azure Policy can deny creation of resources without a required tag. (b) Azure Policy grants users permissions. (c) Policy compliance can be viewed in the portal.
32. Production resource group must not be deleted by accident, but changes must still be possible. Lock? A. ReadOnly  B. CanNotDelete
33. Which service catalogs and classifies data across your estate? A. Microsoft Purview  B. Azure Monitor  C. Azure Firewall  D. Microsoft Entra ID
34. Which tool runs in the browser and offers both Bash and PowerShell? A. Azure CLI on a laptop  B. Azure Cloud Shell  C. Storage Explorer
35. Drag-match: declarative template language / layer that processes every deployment request / extend management to on-premises servers, to Azure Resource Manager, Bicep, Azure Arc.
36. You want an email when CPU on a VM exceeds 90% for 10 minutes. Use: A. Azure Monitor alert  B. Advisor  C. Service Health  D. Purview
37. Which tool tells you whether a specific VM is unavailable because of an Azure platform issue? A. Resource Health (in Service Health)  B. Pricing calculator  C. Application Insights  D. Cost Management
38. Two services in series have 99.9% and 99.95% SLAs (illustrative). Composite SLA? A. 99.95%  B. 99.9%  C. About 99.85%  D. 99.99%
39. Yes/No: (a) Infrastructure as code makes deployments repeatable. (b) ARM templates are imperative scripts. (c) Bicep compiles to ARM JSON.
40. Which query language does Log Analytics use? A. SQL  B. KQL  C. GraphQL  D. PowerShell

## Answer key

| # | Answer | Why |
| --- | --- | --- |
| 1 | B | Pay only while you use it |
| 2 | No, Yes, Yes | Private cloud still needs hardware; hybrid keeps data local; public is shared |
| 3 | C | Finished software consumed as a service |
| 4 | B | The guest OS is the customer's in IaaS |
| 5 | A, B | Automatic both ways = elasticity; more instances = horizontal |
| 6 | A | An SLA expresses availability |
| 7 | B | Spot is cheapest and can be evicted |
| 8 | Private, Public, Hybrid | In that order |
| 9 | B | Billing per execution, no servers to manage |
| 10 | B | Managed database such as Azure SQL Database is PaaS |
| 11 | Yes, No | CapEx is depreciated, not OpEx |
| 12 | B | Resources move between groups; groups hold resources |
| 13 | B | Global services such as Entra ID are not tied to a region |
| 14 | B | ZRS spreads copies over three zones |
| 15 | Yes, Yes, No | Groups do not nest; management groups do |
| 16 | B | Scale sets manage identical autoscaling VMs |
| 17 | B | Event-driven, per execution |
| 18 | Azure DNS, VNet peering, VPN Gateway | In that order |
| 19 | B | Private circuit, not over the internet |
| 20 | B | Private endpoint gives a private IP in your VNet |
| 21 | B | General-purpose v2 supports all services and tiers |
| 22 | B | Cool: 30-day minimum, online |
| 23 | D | RA = readable secondary, GZ = zone plus geo |
| 24 | B | Migrate discovers and assesses |
| 25 | Yes, No, Yes | SSO = one sign-in for many apps |
| 26 | B | Zero Trust: verify explicitly, least privilege, assume breach |
| 27 | A | Defender for Cloud provides secure score |
| 28 | B | RBAC role scoped to the resource group |
| 29 | B | Egress is billed; ingress is generally free |
| 30 | B | Budgets live in Cost Management |
| 31 | Yes, No, Yes | Policy governs properties; RBAC grants permissions |
| 32 | B | CanNotDelete still allows changes |
| 33 | A | Purview handles data governance |
| 34 | B | Cloud Shell offers Bash and PowerShell in the browser |
| 35 | Bicep, Azure Resource Manager, Azure Arc | In that order |
| 36 | A | Metric alert with an action group |
| 37 | A | Resource Health reports per-resource platform issues |
| 38 | C | 0.999 x 0.9995 is about 0.9985 |
| 39 | Yes, No, Yes | ARM templates are declarative |
| 40 | B | Kusto Query Language |
