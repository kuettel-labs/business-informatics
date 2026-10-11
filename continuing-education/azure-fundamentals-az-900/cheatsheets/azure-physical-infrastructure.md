# ⚡ Azure Physical Infrastructure — Condensed Cheat Sheet (AZ‑900)

This cheat sheet summarizes the *physical infrastructure* of Azure as described in the Microsoft Learn module.

---

## 🏢 Datacenters
Azure datacenters are large facilities containing servers in racks with dedicated power, cooling, and networking.
You **never interact with individual datacenters directly**; Azure abstracts them into regions and availability zones.

---

## 🌍 Regions
A **region** is a geographical area containing one or more nearby datacenters connected by low‑latency networks.

Key points:
- Azure balances workloads intelligently inside each region
- You choose a region when deploying most resources
- Some services are **global** (e.g., Entra ID, Traffic Manager, DNS)
- Some VM sizes or storage types are **region‑specific**

---

## 🧱 Availability Zones
Availability Zones = **physically separate datacenters** inside a region.

Characteristics:
- Independent power, cooling, networking
- Designed as isolation boundaries
- Connected via high‑speed private fiber
- Zone‑enabled regions have **minimum three zones**

Use cases:
- Spread workloads across zones for resiliency
- Replicate VMs, storage, databases across zones
- Data transfer between zones may incur cost

Service categories:
- **Zonal** (pinned to a zone)
- **Zone‑redundant** (platform replicates across zones)
- **Non‑regional** (resilient to zone/region outages)

---

## 🌐 Region Pairs
Most Azure regions are paired with another region **300+ miles away** in the same geography.

Benefits:
- Reduces risk from natural disasters, civil unrest, power/network outages
- Automatic failover between paired regions
- Not all services replicate automatically — customer may need to configure
- Examples: West US ↔ East US, Southeast Asia ↔ East Asia

Additional advantages:
- One region in each pair is prioritized during large outages
- Updates roll out to paired regions sequentially
- Data stays within the same geography (except Brazil South)

Special cases:
- Some regions have **one‑direction pairing** (e.g., Brazil South → South Central US)
- Some regions have **no traditional pair** (Italy North, Poland Central, Israel Central)

---

## 🛡️ Sovereign Regions
Sovereign regions are **isolated instances of Azure** for compliance/legal requirements.

Examples:
- **US Gov** regions (operated by screened U.S. personnel)
- **China** regions (operated by 21Vianet)

---

## 🧭 Quick Memory Lines (Exam‑Ready)
- Datacenters → Regions → Availability Zones → Region Pairs
- Zones = isolated datacenters with independent power/cooling/networking
- Region pairs = 300+ miles apart, failover + sequential updates
- Sovereign regions = isolated Azure instances for compliance
- Some services are global (Entra ID, DNS, Traffic Manager)

---

## 📘 Source
Microsoft Learn — *Describe Azure physical infrastructure*
