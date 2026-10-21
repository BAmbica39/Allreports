# Microsoft Dynamics 365 Business Central – Custom Reports

## 📌 Project Overview

This repository contains custom report development for **Microsoft Dynamics 365 Business Central**, using AL programming and RDLC layouts. The project focuses on generating structured, professional, and user-friendly PDF reports based on Business Central data.

The reports are developed and tested in a Business Central sandbox environment, with a focus on data accuracy, document formatting, and practical business requirements.

## 🛠️ Technologies Used

- **Microsoft Dynamics 365 Business Central** – ERP platform
- **AL Language** – Report development and dataset definition
- **Visual Studio Code** – AL development and publishing
- **Microsoft Report Builder** – RDLC layout design
- **RDLC** – Report formatting and rendering
- **Git & GitHub** – Version control and collaboration
- **PDF** – Report output and validation

## 📂 Project Contents

This repository includes AL source code and RDLC layouts for the following reports:

- **Student List Report Extension** – Extends the student report with additional profile information.
- **Customer List Report** – Generates a structured customer information report.
- **Payment Terms Report** – Displays payment terms information.
- **Sales Order Report** – Generates sales order documents with order-specific details and formatted layouts.
- **Additional Custom Reports** – Supporting AL objects and report layouts developed according to business requirements.

Refer to the repository files for the implementation details of each report.

## ⚙️ Key Features

# 1.0.0.3 Fill Gen. Prod. Posting Group – Purchase & Sales Lines

Two processing-only reports for Microsoft Dynamics 365 Business Central. They fill in a blank **Gen. Prod. Posting Group** on G/L Account lines in open purchase and sales documents, using the line's **No.** (the G/L account number) as the value.

| Object | ID    | Name                            | File                                       |
| ------ | ----- | ------------------------------- | ------------------------------------------ |
| Report | 50100 | Fill Purch. Gen. Prod. Post Grp | `FillGenProdPostingGroup.Report.al`      |
| Report | 50101 | Fill Sales Gen. Prod. Post Grp  | `FillSalesGenProdPostingGroup.Report.al` |

Both reports are `ProcessingOnly = true`. They have no layout and only change data.

---

## What the reports do

For each **Purchase Line** (report 50100) or **Sales Line** (report 50101) that matches all of these conditions:

* `Type` = **G/L Account**
* `Gen. Prod. Posting Group` is **blank**
* `No.` is **not blank**

the report:

1. Checks that the document header (`Purchase Header` / `Sales Header`) has  **Status = Open** . Otherwise the line is skipped.
2. Checks that a **Gen. Product Posting Group** exists with a code equal to the line's `No.`.
   * If it doesn't exist and **Create Missing Posting Groups** is on, the report creates it. The code is the line's No. and the description comes from the line.
   * If it doesn't exist and the option is off, the line is skipped.
3. Runs `Validate("Gen. Prod. Posting Group", "No.")` so the field's standard OnValidate logic runs, including the VAT Prod. Posting Group default.
4. Saves the line with `Modify(true)`.

At the end, a summary message shows:

* Lines updated
* Posting groups created
* Lines skipped because the document was not Open
* Lines skipped because no matching posting group existed

---

## Running the reports

1. Search for the report in Business Central ("Fill Gen. Prod. Posting Group on Purchase Lines" or "... on Sales Lines"). Both are listed under  **Tasks** .
2. On the request page you can optionally:
   * Set filters on  **Document Type** , **Document No.** and **No.** (G/L account).
   * Turn on  **Create Missing Posting Groups** .
3. Confirm the prompt. The progress dialog shows the document being processed.
4. Review the summary message.

The request page remembers its settings between runs (`SaveValues = true`).

### Filters applied in code (cannot be changed by the user)

| Field                    | Filter      |
| ------------------------ | ----------- |
| Type                     | G/L Account |
| Gen. Prod. Posting Group | blank       |
| No.                      | not blank   |

---

## Things to know before running

* **Released documents are not changed.** Validating the field calls `TestStatusOpen`. Reopen the documents first if their lines need updating.
* **Posting groups are matched by code.** The value written is the G/L account number. A Gen. Product Posting Group with that same code must exist, or be created by the report.
* **New posting groups need setup.** Groups the report creates have no  **Def. VAT Prod. Posting Group** . You may also need to add **General Posting Setup** entries for them before posting.
* **Changes are committed.** Test in a sandbox first, and filter by document to limit how much is changed.

---

## Change history

| Change                 | Detail                                                                                                 |
| ---------------------- | ------------------------------------------------------------------------------------------------------ |
| Initial version        | Report on the Item table, filling Gen. Prod. Posting Group from Item No.                               |
| Moved to Purchase Line | Target table changed to`Purchase Line`. Added the Open-status check and the counts of skipped lines. |
| G/L Account filter     | Purchase lines limited to`Type = G/L Account`. Type removed from the request filters.                |
| Sales Line report      | Added report 50101 with the same logic for`Sales Line`.                                              |

---

## 🚀 Development Workflow

1. Develop or extend report objects using AL in Visual Studio Code.
2. Define datasets using the required Business Central tables and fields.
3. Design and customize RDLC layouts in Microsoft Report Builder.
4. Compile and publish the AL extension to the Business Central sandbox.
5. Execute the reports and validate the generated PDF output.
6. Refine layouts and resolve dataset or rendering issues as required.
7. Commit and push changes to GitHub for version control and collaboration.

## 📋 Prerequisites

- Access to a Microsoft Dynamics 365 Business Central development or sandbox environment.
- Visual Studio Code.
- Microsoft AL Language extension.
- Microsoft Report Builder.
- Appropriate permissions to develop and publish extensions in the target environment.

## 🔧 Setup Instructions

1. Clone the repository:

   ```bash
   git clone https://github.com/BAmbica39/Allreports.git
   ```
2. Open the project folder in Visual Studio Code.
3. Ensure the AL Language extension is installed.
4. Verify the `app.json` configuration and `launch.json` environment settings for your Business Central sandbox.
5. Download the required symbols and compile the AL project.
6. Publish the extension to the configured sandbox and test the reports.

**Note:** Update the environment configuration and dependencies according to your Business Central setup before publishing.

## 🔄 Version Control and Collaboration

GitHub is used to maintain the AL source files and RDLC layouts, track changes, and support collaboration.

Recommended workflow:

- Create a separate branch for each feature or report update.
- Commit changes with meaningful messages.
- Push the branch to GitHub.
- Review and merge changes through pull requests.

## 🎯 Project Objective

The objective of this project is to develop reliable, maintainable, and professionally formatted reports in Microsoft Dynamics 365 Business Central while improving practical experience in AL development, RDLC report design, ERP data handling, debugging, deployment, and collaborative software development.

## 👩‍💻 Author

**Ambica Bejagama**

Microsoft Dynamics 365 Business Central | AL Development | RDLC Reporting

## 📄 License

This repository is intended for development and collaboration. A license has not been specified; usage and redistribution are subject to the repository owner's terms until a license is added.
