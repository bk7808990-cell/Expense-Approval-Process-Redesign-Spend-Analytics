# Requirements Traceability Matrix (RTM)

This matrix links business objectives to functional requirements, user stories, and UAT test cases to ensure complete coverage.

| Bus. Objective | Functional Req (BRD) | User Story | UAT Test Case |
|---|---|---|---|
| **Reduce TAT** | FR-02: Auto-approve claims < ₹5k | Story 1: Auto-Approval | TC-01: Verify claim < ₹5k approves instantly |
| **Reduce TAT** | FR-03/04/05: Tiered Routing | - | TC-02: Verify routing based on amount |
| **Eliminate Leakage** | FR-07: Mandatory Invoice Number | Story 2: Duplicate Detection | TC-03: Verify same invoice hard block |
| **Eliminate Leakage** | FR-08: Flag Potential Duplicates | Story 2: Duplicate Detection | TC-04: Verify different invoice routes to Finance |
| **Improve Compliance** | FR-09: Missing receipt = "On Hold" | Story 3: Missing Receipt | TC-05: Verify claim without receipt is held |
| **Improve Compliance** | FR-10: Budget check alert | - | TC-06: Verify alert at 90% budget utilization |
| **Reduce TAT** | FR-12: Auto-escalation > 3 days | - | TC-08: Verify manager escalation |
