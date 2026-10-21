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

- Custom AL report objects and report extensions.
- Integration of Business Central table data into report datasets.
- RDLC-based report layout customization.
- Professional document formatting, including column alignment, spacing, headers, footers, and page orientation.
- Sales order data organization and document-wise page formatting.
- PDF generation and layout validation.
- Development and testing in a Business Central sandbox environment.
- Git-based version control for collaborative development.

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
