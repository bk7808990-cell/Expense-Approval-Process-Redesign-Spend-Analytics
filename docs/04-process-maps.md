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
