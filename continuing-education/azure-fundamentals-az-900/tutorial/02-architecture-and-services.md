# Domain 2: Describe Azure architecture and services (35-40%)

Largest domain. Further reading: Cheshire, Exam Ref AZ-900 3rd ed., Ch. 2 (Skills 2.1-2.4); Boyce, Sybex, Ch. 2-4. See also [../cheatsheets/azure-physical-infrastructure.md](../cheatsheets/azure-physical-infrastructure.md).

## 2.1 Core architectural components

- **Datacenter:** physical facility with servers, power, cooling, network. You never pick one directly; you pick a region or zone instead.
- **Region:** one or more nearby datacenters on a low-latency network; you choose a region per resource. Some services are global (Microsoft Entra ID, Azure DNS, Front Door).
- **Availability zones:** physically separate locations in one region with independent power, cooling and network; at least three per enabled region. *Zonal* = pinned to one zone (a VM). *Zone-redundant* = replicated across zones (ZRS storage).
- **Region pairs:** two regions in the same geography, usually 300+ miles apart. Updates roll out to one region of a pair at a time; one of each pair is prioritised in recovery; GRS storage replicates to the pair. Some newer regions have no pair and rely on zones.
- **Sovereign regions:** isolated clouds for compliance: Azure Government (US) and Azure operated by 21Vianet (China).
- **Resource:** a manageable item (VM, storage account, VNet).
- **Resource group:** logical container; each resource is in exactly one; groups do not nest; deleting a group deletes its resources; resources may sit in other regions than their group.
- **Subscription:** billing and access boundary, trusts one Microsoft Entra tenant. Separate environments, departments or limits.
- **Management group:** container above subscriptions, up to six levels below the root group. Policy and RBAC assigned here inherit downward.
- **Hierarchy:** Management groups > Subscriptions > Resource groups > Resources. Inheritance flows down.

## 2.2 Compute and networking

| Compute | What it is | Pick it when |
| --- | --- | --- |
| Virtual Machines | IaaS VM with full OS control | Lift and shift, custom software |
| VM Scale Sets | Identical VMs, autoscale, load balanced | Many identical VMs that grow and shrink |
| Availability sets | VMs spread over fault domains (rack/power) and update domains (patch groups) | HA within one datacenter |
| Azure Virtual Desktop | Hosted Windows desktops/apps, multi-session Windows 11/10 | Remote desktops for staff |
| App Service | PaaS for web apps, APIs, mobile back ends | Host a website without managing servers |
| Container Instances (ACI) | Run a container quickly, no orchestration | Simple or short container jobs |
| Container Apps | Serverless containers with scaling | Microservices without running Kubernetes |
| Kubernetes Service (AKS) | Managed Kubernetes | Many containers, complex orchestration |
| Functions | Serverless event-driven code | Short code triggered by events or timers |

- **VM vs container vs function:** VM virtualizes hardware with its own OS; container shares the host OS kernel, starts in seconds; function is just code, platform-managed.
- **Resources a VM needs:** VNet and subnet, network interface, OS disk (managed disk), optional data disks, public IP and NSG.

| Networking | Purpose |
| --- | --- |
| Virtual network (VNet) | Private, isolated network in one region |
| Subnet | Segment of a VNet; NSGs and route tables apply here |
| VNet peering | Connect VNets (also across regions, "global peering") privately over the Microsoft backbone, no gateway |
| VPN Gateway | Encrypted tunnel over the public internet: site-to-site, point-to-site, VNet-to-VNet |
| ExpressRoute | Private dedicated connection via a connectivity provider; not over the internet |
| Azure DNS | Host DNS zones on Azure name servers (does not sell domain names); private DNS zones for VNets |
| NSG | Stateful layer 3/4 allow/deny rules by source/destination IP, port, protocol, applied per subnet or NIC |
| Azure Firewall | Central managed firewall service (also stateful) for many VNets, with FQDN/application rules and threat intelligence |

- **Public endpoint:** reachable on a public IP. **Private endpoint:** a private IP in your VNet for a PaaS service (via Private Link), traffic stays off the internet.

## 2.3 Storage

- **Services:** Blob (objects), Files (SMB/NFS shares), Queue (messages), Table (NoSQL key-value); managed Disks for VMs.
- **Account types:** Standard general-purpose v2 (default, all services and tiers); Premium block blobs, Premium file shares, Premium page blobs (SSD, low latency). Account names are globally unique (they form the endpoint URL).

| Blob tier | For | Minimum period | Note |
| --- | --- | --- | --- |
| Hot | Frequent access | none | Highest storage, lowest access cost |
| Cool | Infrequent | 30 days | Online |
| Cold | Rare | 90 days | Online |
| Archive | Very rare, latency of hours is fine | 180 days | Offline; rehydrate before reading; set per blob |

| Redundancy | Copies | Where | Survives |
| --- | --- | --- | --- |
| LRS | 3 | One datacenter | Disk or rack failure |
| ZRS | 3 | Three zones, one region | Zone failure |
| GRS | 6 | LRS primary + LRS in secondary region | Region outage (after failover) |
| RA-GRS | 6 | As GRS, secondary readable | Plus read access to secondary |
| GZRS | 6 | ZRS primary + LRS secondary | Zone and region failure |
| RA-GZRS | 6 | As GZRS, secondary readable | Maximum durability and read availability |

- **Moving files:** AzCopy (command-line), Azure Storage Explorer (desktop GUI, uses AzCopy), Azure File Sync (sync and cache Azure Files on on-premises Windows Server, cloud tiering).
- **Migration:** Azure Migrate (hub to discover, assess and migrate servers, databases, web apps); Azure Data Box (physical device shipped for offline transfer of large data).

## 2.4 Identity, access and security

- **Microsoft Entra ID** (formerly Azure AD): cloud identity provider for Azure, Microsoft 365, SaaS apps. **Microsoft Entra Domain Services:** managed domain join, Group Policy, LDAP, Kerberos/NTLM without running domain controllers.
- **Authentication:** SSO (one sign-in, many apps); MFA (two or more of know/have/are); passwordless (Windows Hello for Business, Microsoft Authenticator, FIDO2 keys/passkeys).
- **External identities:** B2B collaboration (partners sign in as guests with their own identity); customer identity for public apps (Azure AD B2C, now succeeded by Microsoft Entra External ID).
- **Conditional Access:** if-then policies on signals (user, group, location, device, app, risk) to allow, block or require MFA. Requires Entra ID P1 or higher.
- **Azure RBAC:** assign a role (Owner, Contributor, Reader or specific) to a user, group or identity at a scope; inherits downward; least privilege.
- **Zero Trust:** verify explicitly, least-privilege access, assume breach.
- **Defense in depth:** layers: physical, identity and access, perimeter, network, compute, application, data.
- **Microsoft Defender for Cloud:** posture management (secure score, recommendations) and threat protection for Azure, on-premises and other clouds.

## Commonly confused

- **Region vs region pair vs availability zone:** location vs two regions for regional disaster and staged updates vs separate datacenters inside one region.
- **Availability set vs zone:** racks in one datacenter (VM SLA 99.95%) vs separate datacenters (VM SLA 99.99%).
- **NSG vs Azure Firewall:** both are stateful. NSG = free layer 3/4 allow/deny rules per subnet or NIC. Azure Firewall = paid central managed firewall with FQDN filtering and threat intelligence.
- **VPN Gateway vs ExpressRoute:** encrypted over internet vs private circuit.
- **VNet peering vs VPN Gateway:** VNet to VNet over backbone without gateway vs tunnel mainly for on-premises.
- **ACI vs Container Apps vs AKS:** single container vs serverless microservices vs full orchestration.
- **App Service vs Functions:** hosted web app vs event-driven code billed per execution.
- **ZRS vs GRS:** other zones in same region vs paired region. "RA-" = secondary readable.
- **Cool vs cold vs archive:** 30 / 90 / 180 days; only archive is offline.
- **AzCopy vs Storage Explorer vs File Sync vs Data Box:** CLI vs GUI vs on-premises sync vs physical device.
- **Authentication vs authorization:** Entra ID proves identity; RBAC grants permissions.
- **Entra ID vs Entra Domain Services:** modern cloud identity vs managed legacy domain features.

## Practice questions

**Q1.** (Multiple choice) You need VMs to survive the failure of an entire datacenter within one region. Use:
A. Availability set  B. Availability zones  C. Region pair  D. Resource group
<details><summary>Answer</summary>B. Zones are separate datacenters in a region; sets only spread racks.</details>

**Q2.** (Yes/No)
1. A resource can belong to two resource groups.
2. Deleting a resource group deletes its resources.
3. Resources in a group must be in the group's region.
<details><summary>Answer</summary>1 No: exactly one. 2 Yes. 3 No: regions can differ.</details>

**Q3.** (Drag-match) Order from top to bottom: subscription, resource, management group, resource group.
<details><summary>Answer</summary>Management group, subscription, resource group, resource.</details>

**Q4.** (Multiple choice) Which network option connects on-premises to Azure without using the public internet?
A. VPN Gateway  B. VNet peering  C. ExpressRoute  D. Azure DNS
<details><summary>Answer</summary>C. ExpressRoute is a private circuit; VPN Gateway uses the internet.</details>

**Q5.** (Multiple choice) You want to run one container for a short batch job with no orchestration. Use:
A. AKS  B. Azure Container Instances  C. VM Scale Sets  D. Azure Virtual Desktop
<details><summary>Answer</summary>B. ACI is the simplest way to run a single container.</details>

**Q6.** (Yes/No)
1. LRS keeps three copies in one datacenter.
2. GRS lets you read from the secondary region at any time.
3. GZRS combines zone redundancy in the primary region with a copy in a secondary region.
<details><summary>Answer</summary>1 Yes. 2 No: that is RA-GRS. 3 Yes.</details>

**Q7.** (Multiple choice) Data is accessed once a year, retrieval may take hours, cost must be minimal. Tier:
A. Hot  B. Cool  C. Cold  D. Archive
<details><summary>Answer</summary>D. Archive is cheapest to store and offline; rehydration takes hours.</details>

**Q8.** (Drag-match) Match AzCopy, Azure File Sync, Azure Data Box to: (a) ship 80 TB over a slow link, (b) script a copy to blob storage, (c) cache a cloud file share on an on-premises file server.
<details><summary>Answer</summary>a Data Box, b AzCopy, c Azure File Sync.</details>

**Q9.** (Multiple choice) Which service gives partners from another company access to your apps using their own credentials?
A. Entra Domain Services  B. B2B collaboration  C. Conditional Access  D. RBAC
<details><summary>Answer</summary>B. B2B invites external users as guests.</details>

**Q10.** (Multiple choice) Require MFA only when users sign in from outside the corporate network. Use:
A. RBAC  B. Conditional Access  C. Azure Policy  D. NSG
<details><summary>Answer</summary>B. Conditional Access applies if-then rules on location and other signals.</details>

**Q11.** (Yes/No)
1. Zero Trust assumes the internal network is safe.
2. Defense in depth uses several layers so one failure does not expose data.
3. Defender for Cloud can assess on-premises and other-cloud resources.
<details><summary>Answer</summary>1 No: assume breach. 2 Yes. 3 Yes.</details>

**Q12.** (Multiple choice) Which filters traffic to a subnet by IP and port at no extra service cost?
A. Azure Firewall  B. Network security group  C. ExpressRoute  D. Private endpoint
<details><summary>Answer</summary>B. NSGs are free stateful layer 3/4 allow/deny rules per subnet or NIC; Azure Firewall is a paid central managed service.</details>

**Q13.** (Multiple choice) A legacy app needs LDAP and domain join, but you do not want to manage domain controllers. Use:
A. Microsoft Entra ID only  B. Microsoft Entra Domain Services  C. Entra External ID  D. Azure Arc
<details><summary>Answer</summary>B. Entra Domain Services provides managed domain features.</details>

**Q14.** (Multiple choice) A storage account should be reachable only from a VNet through a private IP. Use:
A. Public endpoint  B. Private endpoint  C. VPN Gateway  D. Azure DNS
<details><summary>Answer</summary>B. A private endpoint gives the service a private IP in your VNet.</details>

**Q15.** (Yes/No)
1. Azure Government is a sovereign region.
2. All Azure regions have availability zones.
3. During planned maintenance, region pairs are updated one at a time.
<details><summary>Answer</summary>1 Yes. 2 No: only enabled regions. 3 Yes.</details>
