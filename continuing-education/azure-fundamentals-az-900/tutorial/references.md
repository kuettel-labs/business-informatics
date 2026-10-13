# References

Primary source (wins over books): [Microsoft Learn AZ-900 study guide](https://learn.microsoft.com/en-us/credentials/certifications/resources/study-guides/az-900) and the [AZ-900 learning paths](https://learn.microsoft.com/en-us/training/courses/az-900t00).

Books for further reading (newest first). Page numbers refer to the PDF edition.

| Author | Title | Edition | Use for |
| --- | --- | --- | --- |
| Jim Cheshire | Exam Ref AZ-900 Microsoft Azure Fundamentals | 3rd ed., Pearson/Microsoft Press, 2023 | Main reference; chapters mirror the current outline |
| Scott Duffy | AZ-900 Microsoft Azure Fundamentals (course slides) | v3, 2022 (exam version May 2022) | Quick visual recap. **Warning:** built for the older May 2022 outline; uses old names (Azure AD) and may miss current items. Check against the study guide |
| Jim Boyce | Microsoft Certified Azure Fundamentals Study Guide: Exam AZ-900 | 1st ed., Sybex/Wiley, 2021 | Older outline; background only |

## Exam Ref 3rd ed. (Cheshire) by domain

| Domain / skill | Chapter and skill | PDF page (approx.) |
| --- | --- | --- |
| 1 Cloud computing | Ch. 1, Skill 1.1 | 23 |
| 1 Benefits of cloud | Ch. 1, Skill 1.2 | 31 |
| 1 Service types | Ch. 1, Skill 1.3 | 42 |
| 2 Core architecture | Ch. 2, Skill 2.1 | 61 |
| 2 Compute and networking | Ch. 2, Skill 2.2 | 86 |
| 2 Storage | Ch. 2, Skill 2.3 | 152 |
| 2 Identity, access, security | Ch. 2, Skill 2.4 | 177 |
| 3 Cost management | Ch. 3, Skill 3.1 | 235 |
| 3 Governance and compliance | Ch. 3, Skill 3.2 | 259 |
| 3 Managing and deploying | Ch. 3, Skill 3.3 | 293 |
| 3 Monitoring | Ch. 3, Skill 3.4 | 337 |

## Sybex (Boyce) chapter map

Ch. 1 Cloud Concepts; Ch. 2 Azure Core Services; Ch. 3 Azure Core Networking Services; Ch. 4 Security, Compliance, Privacy, and Trust; Ch. 5 Azure Solutions; Ch. 6 Azure Pricing, Service Levels, and Lifecycle; Ch. 7 Creating and Managing Azure Resources.

## Where the books are outdated (verified on Microsoft Learn, Oct 2026)

| Book says | Current | Source |
| --- | --- | --- |
| Azure Active Directory (Azure AD), Azure AD DS, Azure AD Conditional Access | Microsoft Entra ID, Microsoft Entra Domain Services, Microsoft Entra Conditional Access | Study guide wording |
| Azure Blueprints as a governance tool (Exam Ref Skill 3.2) | Not in the outline. Blueprints (preview) is being retired: no new definitions since 31 Jul 2026, full retirement 31 Jan 2027; replacement is Deployment Stacks and template specs. Legacy only. | [Blueprints retirement](https://learn.microsoft.com/en-us/azure/governance/blueprints/blueprint-retirement) |
| TCO calculator and Service Trust Portal (Exam Ref Skills 3.1, 3.2) | Not named in the current outline (it lists pricing calculator, cost management, tags, Purview, Policy, locks). Know them as background. | Study guide |
| Azure Purview | Microsoft Purview | Study guide |
| Azure AD B2C as the customer identity option | Entra External ID is the current customer (CIAM) offering; Azure AD B2C is no longer sold to new customers. | [External ID overview](https://learn.microsoft.com/en-us/entra/external-id/external-identities-overview) |
| Blob tiers hot/cool/archive (Sybex 2021) | Hot, cool, cold, archive | [Access tiers](https://learn.microsoft.com/en-us/azure/storage/blobs/access-tiers-overview) |
| SLA and lifecycle content (Sybex Ch. 6) | SLAs are not an explicit outline item; still useful for scenario questions | Study guide |
