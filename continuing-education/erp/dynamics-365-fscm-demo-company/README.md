# Kuettel Labs AG (KLAB) - Dynamics 365 Finance & Operations Manufacturing Demo Setup

## Objective

Create a new Swiss manufacturing legal entity:
```text
Legal Entity ID : KLAB
Name            : Kuettel Labs AG
Country         : Switzerland
Currency        : CHF
Industry        : Manufacturing
```

```mermaid
flowchart TD

    A[KLAB Legal Entity] --> B[Fiscal Calendar]
    B --> C[Ledger Setup]

    subgraph Fiscal Calendar
        B1[KLAB Calendar]
        B2[Fiscal Year 2026]
        B3[Periods 0-13]
        B1 --> B2 --> B3
    end

    C --> D[Chart of Accounts]
    C --> E[Accounting Currency CHF]
    C --> F[Reporting Currency CHF]

    subgraph Ledger Configuration
        D[Standard COA]
        E[CHF]
        F[CHF]
    end

    C --> G[Account Structures]

    subgraph Account Structures
        G1[Manufacturing B/S]
        G2[Manufacturing P&L]
    end

    G --> G1
    G --> G2

    G1 --> H[Financial Dimensions]
    G2 --> H

    subgraph Financial Dimensions
        H1[BusinessUnit]
        H2[Department]
        H3[CostCenter]
        H4[ItemGroup]
    end

    H --> H1
    H --> H2
    H --> H3
    H --> H4

    H --> I[Journal Configuration]

    subgraph Journal Setup
        I1[Journal Name GEN]
        I2[Journal Type Daily]
        I3[Voucher Series Gene_704]
        I4[Posting Layer Current]
    end

    I --> I1
    I --> I2
    I --> I3
    I --> I4

    I --> J[Test Financial Posting]

    subgraph Validation
        J1[Create General Journal]
        J2[KLAB-000001 Created]
        J3[Voucher Sequence Works]
        J4[Ledger Operational]
    end

    J --> J1 --> J2 --> J3 --> J4

    J4 --> K[Manufacturing Foundation Ready]

    subgraph Next Steps
        K1[Site CH01]
        K2[Warehouse MAIN]
        K3[Vendors]
        K4[Customers]
        K5[Released Products]
        K6[BOM]
        K7[Production Orders]
    end

    K --> K1
    K1 --> K2 --> K3 --> K4 --> K5 --> K6 --> K7

    style A fill:#107C10,color:#fff
    style J4 fill:#107C10,color:#fff
    style K fill:#0078D4,color:#fff
    style G1 fill:#D83B01,color:#fff
    style G2 fill:#D83B01,color:#fff
```