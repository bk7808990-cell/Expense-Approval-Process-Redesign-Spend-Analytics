# UI/UX Wireframes (Screen Mockups)

Basic layout for the new system, focusing on ease of use and quick approvals.

## 1. Employee Claim Submission

```text
[ ======================================================== ]
[  NEW EXPENSE CLAIM                                      ]
[ ======================================================== ]
[  Employee: EMP001 (John Doe)          Dept: Delivery     ]
[ -------------------------------------------------------- ]
[  Expense Date: [ YYYY-MM-DD ]                            ]
[  Amount (INR): [ 0.00       ]                            ]
[  Category:     [ Dropdown: Travel, Meals, etc.        v] ]
[  Invoice No:   [ INV-12345  ] *(Mandatory)*              ]
[ -------------------------------------------------------- ]
[  Business Purpose:                                      ]
[  [ Text Box for typing reason...                      ] ]
[  [ Upload Receipt:  [ Choose File ]                   ] ]
[ -------------------------------------------------------- ]
[  [ Cancel ]                             [ Submit Claim ] ]
[ ======================================================== ]
2. Manager Approval Dashboard
text
[ ======================================================== ]
[  MANAGER DASHBOARD - PENDING CLAIMS                     ]
[ ======================================================== ]
[  Total Pending: 5  |  Flagged: 1  |  Overdue (SLA): 2   ]
[ -------------------------------------------------------- ]
[  Claim ID | Emp   | Amount | Category | Status          ]
[  CLM0012  | EMP05 | ₹12,000| Travel   | [ Approve ]      ]
[  CLM0020  | EMP45 | ₹85,000| Software | ⚠️ DUP FLAG      ]
[           |       |        |          | [ Review ]       ]
[ ======================================================== ]
3. Finance Review Screen
text
[ ======================================================== ]
[  FINANCE EXCEPTION REVIEW - CLM0020                     ]
[ ======================================================== ]
[  Amount: ₹85,000   |  Category: Software                ]
[  Receipt: [ View Receipt ]  |  Invoice: INV-12345       ]
[ -------------------------------------------------------- ]
[  ⚠️ SYSTEM FLAGS:                                       ]
[  - Potential Duplicate detected (Invoice matches CLM0019)]
[  - Missing Business Purpose                             ]
[ -------------------------------------------------------- ]
[  [ Reject Claim ]       [ Request More Info ]           ]
[ ======================================================== ]
