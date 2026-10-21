# Process Maps (AS-IS & TO-BE)

This document visualizes the current manual expense approval process (AS-IS) and the proposed automated workflow (TO-BE). It also highlights how the new process solves current bottlenecks.

---

## 1. AS-IS Process (Current State)
The current process is manual, heavily reliant on emails, and lacks real-time visibility. 

```mermaid
graph TD
    A[Employee spends money] --> B[Collects physical receipt]
    B --> C[Fills Excel claim form]
    C --> D[Emails manager]
    D --> E{Manager Reviews}
    E -->|Rejected| F[Email sent to employee]
    E -->|Approved & Amount > 25k| G[Forwards to Dept Head]
    E -->|Approved & Amount < 25k| H[Forwards to Finance]
    G --> H
    H --> I[Finance manually checks receipt & policy]
    I -->|Missing Receipt| J[Hold & Email Employee]
    I -->|Policy Violation| K[Reject & Email Employee]
    I -->|All Clear| L[Payment Processed]
    L --> M[Manual Data Entry into Monthly Report]
    
    style M fill:#ffcccc,stroke:#333,stroke-width:2px



---

## 2. TO-BE Process (Future State)
The proposed process introduces automated checks and tiered routing to save time and reduce errors.

```mermaid
graph TD
    A[Employee submits claim via App] --> B[System Auto-Checks]
    B -->|Missing Receipt| C[Hold & Alert Employee]
    B -->|Duplicate/Policy Flag| D[Route to Finance for Review]
    B -->|All Clear| E{Amount Check}
    
    E -->|Under 5k| F[Auto-Approved]
    E -->|5k to 25k| G[Manager Approval]
    E -->|25k to 1L| H[Manager + Dept Head]
    E -->|Above 1L| I[Manager + Dept Head + Finance Dir]
    
    D --> J[Finance Decision]
    J -->|Approved| K[Payment]
    J -->|Rejected| L[Alert Employee]
    
    F --> K
    G --> K
    H --> K
    I --> K
    
    K --> M[Real-time Dashboard Updates for Leadership]

    style B fill:#d4edda,stroke:#28a745,stroke-width:2px
    style M fill:#cce5ff,stroke:#007bff,stroke-width:2px
