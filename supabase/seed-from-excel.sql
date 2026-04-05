-- Auto-generated seed data from Excel import
-- Review before running!

-- Ensure companies exist
INSERT INTO companies (name) VALUES ('VCDLLP') ON CONFLICT DO NOTHING;
INSERT INTO companies (name) VALUES ('VCDPL') ON CONFLICT DO NOTHING;

-- Project: Mtech Hyd Google RC Design (VCDLLP) — 7 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Mtech Hyd Google RC Design', 'Unknown', 300000, 'active'
  FROM companies c WHERE c.name = 'VCDLLP' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Travel Invoice', 1, 22058.1, '24003', '2025-03-30', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Mtech Hyd Google RC Design' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Preparation and Brief', 2, 928800, '2526002', NULL, 928800, '2025-06-04', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Mtech Hyd Google RC Design' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Concept Design', 3, 696600, '2526025', NULL, 696612, NULL, 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Mtech Hyd Google RC Design' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Developed Design', 4, 696600, '2526053', NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Mtech Hyd Google RC Design' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Technical Design', 5, 696600, '2526070', '2026-03-12', 745212, '2026-02-12', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Mtech Hyd Google RC Design' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Construction', 6, 1075000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Mtech Hyd Google RC Design' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Handover and Closeout', 7, 430000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Mtech Hyd Google RC Design' LIMIT 1;

-- Project: Swiggy- Bundl Technologies (VCDLLP) — 8 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Swiggy- Bundl Technologies', 'Unknown', 875000, 'completed'
  FROM companies c WHERE c.name = 'VCDLLP' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Travel Invoice', 1, 129891, '100201', '2019-02-28', 129891, '2019-03-28', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Swiggy- Bundl Technologies' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Advance', 2, 270000, '100202', '2019-02-28', 265500, '2019-03-28', 'partial'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Swiggy- Bundl Technologies' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Data Collection Stage', 3, 135000, '100205', '2019-03-31', 405000, '2019-05-02', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Swiggy- Bundl Technologies' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Data Analysis Stage', 4, 135000, '100205', '2019-03-31', 276750, '2019-08-05', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Swiggy- Bundl Technologies' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Projection Documentation', 5, 243000, '100205', '2019-03-31', 0, '2019-08-05', 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Swiggy- Bundl Technologies' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Timeline Projections', 6, 86400, '100205', '2019-03-31', 0, '2019-08-05', 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Swiggy- Bundl Technologies' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Fine-tuning with Operations', 7, 37800, '100205', '2019-03-31', 0, '2019-08-05', 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Swiggy- Bundl Technologies' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Final Model Submission', 8, 37800, '100205', '2019-03-31', 0, '2019-08-05', 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Swiggy- Bundl Technologies' LIMIT 1;

-- Project: ITC Narmada- Pan Chinese (VCDLLP) — 4 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'ITC Narmada- Pan Chinese', 'Unknown', 500000, 'completed'
  FROM companies c WHERE c.name = 'VCDLLP' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'On signing the addendum', 1, 108000, '100208', '2019-04-02', 108000, '2019-04-30', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'ITC Narmada- Pan Chinese' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'On finalizing Concept and Schematic', 2, 216000, '100208', '2019-04-02', 216000, '2019-04-30', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'ITC Narmada- Pan Chinese' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Design Development', 3, 108000, '100209', '2019-07-31', 108000, '2019-06-11', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'ITC Narmada- Pan Chinese' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender Documenation & Elevation', 4, 108000, '100210', '2019-07-31', 108000, '2019-08-30', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'ITC Narmada- Pan Chinese' LIMIT 1;

-- Project: The Oberoi Bangalore (VCDLLP) — 7 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'The Oberoi Bangalore', 'Unknown', 500000, 'completed'
  FROM companies c WHERE c.name = 'VCDLLP' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Review of kitchen layout plan, value addition, and optimization in design, suggestions and modifications wherever required.', 1, 216000, '100213', '2019-08-01', 216000, '2019-09-04', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'The Oberoi Bangalore' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Suggest equipment vendors and historical performance analysis of selected vendors', 2, 54000, '100213', '2019-08-01', 54000, '2019-09-04', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'The Oberoi Bangalore' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Costing and Budget of all equipments, review and recommendations for obtaining Executive Chairman approvals', 3, 54000, '100213', '2019-08-01', 54000, '2019-09-04', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'The Oberoi Bangalore' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Assisting in coordinating with MEP consultants for designing kitchen related services', 4, 108000, '100213', '2019-08-01', 108000, '2019-09-04', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'The Oberoi Bangalore' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Visit the Unit and review with General Manager and operating team before concluding the layout plans and recommending the equipment suppliers.', 5, 54000, '100216', '2019-11-14', 54000, '2020-01-21', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'The Oberoi Bangalore' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Visit and inspection of various equipment manufacturers factories for quality parameters and certification for dispatch', 6, 27000, '100216', '2019-11-14', 27000, '2020-01-21', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'The Oberoi Bangalore' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Visit the units as and when required while erection, testing and commissioning and certify.', 7, 27000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'The Oberoi Bangalore' LIMIT 1;

-- Project: TOBL Rim Naam (VCDLLP) — 8 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'TOBL Rim Naam', 'Unknown', 600000, 'completed'
  FROM companies c WHERE c.name = 'VCDLLP' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Upon Commencement of Services', 1, 97200, '100214', '2019-08-01', 97200, '2019-09-04', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'TOBL Rim Naam' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '1.1 Conceptualization Stage', 2, 64800, '100219', '2019-12-02', 64800, '2020-01-21', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'TOBL Rim Naam' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '1.2 Schematic Drawing Stage', 3, 64800, '100219', '2019-12-02', 64800, '2020-01-21', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'TOBL Rim Naam' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '1.3 Equipment Finalization', 4, 97200, '20210407', '2020-11-09', 97200, '2020-12-24', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'TOBL Rim Naam' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '1.4 Design Development Stage', 5, 97200, '20210407', '2020-11-09', 97200, '2020-12-24', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'TOBL Rim Naam' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '1.5 Equipment Specifications Stage', 6, 64800, '20210407', '2020-11-09', 64800, '2020-12-24', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'TOBL Rim Naam' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '1.6 Equipment Evaluation and Shop Drawing Review Stage', 7, 64800, '20210407', '2020-11-09', 64800, '2020-12-24', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'TOBL Rim Naam' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '1.7 Site Coordination and Testing/Commissioning of equipment', 8, 97200, '20210407', '2020-11-09', 106950, '2020-12-24', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'TOBL Rim Naam' LIMIT 1;

-- Project: HYUNDAI MOTOR INDIA LIMITED - MAIN DINING (VCDLLP) — 8 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'HYUNDAI MOTOR INDIA LIMITED - MAIN DINING', 'Unknown', 1150000, 'completed'
  FROM companies c WHERE c.name = 'VCDLLP' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender Documentation', 1, 54000, '2230004', '2022-05-05', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'HYUNDAI MOTOR INDIA LIMITED - MAIN DINING' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'LOI on commencement of Work', 2, 324000, '21220011', NULL, 324000, '2021-08-09', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'HYUNDAI MOTOR INDIA LIMITED - MAIN DINING' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Conceptual Design', 3, 216000, '21220016', '2021-09-07', 216000, '2021-09-27', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'HYUNDAI MOTOR INDIA LIMITED - MAIN DINING' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'MEP Block Loads', 4, 216000, '21220016', '2021-09-07', 216000, '2021-09-27', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'HYUNDAI MOTOR INDIA LIMITED - MAIN DINING' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Area Zoning', 5, 216000, '21220016', '2021-09-07', 216000, '2021-09-27', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'HYUNDAI MOTOR INDIA LIMITED - MAIN DINING' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Equipment layout & Detailed Design', 6, 162000, '21220021', '2021-12-01', 162000, '2022-01-23', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'HYUNDAI MOTOR INDIA LIMITED - MAIN DINING' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Testing & Commissioning', 7, 54000, '23240007', '2023-05-21', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'HYUNDAI MOTOR INDIA LIMITED - MAIN DINING' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Extension', 8, 50000, '23240008', NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'HYUNDAI MOTOR INDIA LIMITED - MAIN DINING' LIMIT 1;

-- Project: Claridges Hotel (VCDLLP) — 9 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Claridges Hotel', 'Unknown', 1200000, 'completed'
  FROM companies c WHERE c.name = 'VCDLLP' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Upon Commencement of Services 2,00,000', 1, 216000, '2230005', '2022-06-12', 216000, NULL, 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Claridges Hotel' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.1 Conceptual Design 2,50,000', 2, 270000, '2230010', '2022-07-01', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Claridges Hotel' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.2 Schematic Design 75% of 2,50,000', 3, 199800, '2230024', '2022-09-15', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Claridges Hotel' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.2 Schematic Design 25% of 2,50,000', 4, 65000, '2230025', '2022-09-20', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Claridges Hotel' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.3 Design Development 50% of 2,50,000', 5, 135000, '2230025', '2022-09-20', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Claridges Hotel' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.3 Design Development 50% of 2,50,000', 6, 135000, '2230026', '2022-10-31', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Claridges Hotel' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.4 Tender Documentation 1,50,000', 7, 162000, '2230031', '2022-12-07', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Claridges Hotel' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.5 Tender Evaluation 50,000', 8, 54000, '2324003', NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Claridges Hotel' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.6 Services Provided during Construction 50,000', 9, 54000, '2324003', NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Claridges Hotel' LIMIT 1;

-- Project: The Oberoi Mumbai - Fenix + Vetro (VCDLLP) — 8 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'The Oberoi Mumbai - Fenix + Vetro', 'Unknown', 700000, 'active'
  FROM companies c WHERE c.name = 'VCDLLP' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Design Development Stage', 1, 151200, '2230006', '2022-07-01', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'The Oberoi Mumbai - Fenix + Vetro' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Equipment Evaluation and Shop Drawing Review', 2, 75600, '2230018', '2022-08-21', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'The Oberoi Mumbai - Fenix + Vetro' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Site Coordination', 3, 75600, '2230030', '2022-12-07', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'The Oberoi Mumbai - Fenix + Vetro' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Upon Commencement of Services', 4, 75600, '21220023', '2021-12-08', 75600, '2022-02-01', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'The Oberoi Mumbai - Fenix + Vetro' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Conceptualization Stage', 5, 75600, '21220023', '2021-12-08', 75600, '2022-02-01', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'The Oberoi Mumbai - Fenix + Vetro' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Schematic Drawing Stage', 6, 75600, '21220029', '2022-02-02', 75600, '2022-03-02', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'The Oberoi Mumbai - Fenix + Vetro' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Equipment Finalization and Tender Documentation', 7, 151200, '21220029', '2022-02-02', 151200, '2022-03-02', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'The Oberoi Mumbai - Fenix + Vetro' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Upon Commissioning of Equipment', 8, 70000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'The Oberoi Mumbai - Fenix + Vetro' LIMIT 1;

-- Project: The Oberoi Rajgarh (VCDLLP) — 6 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'The Oberoi Rajgarh', 'Unknown', 2600000, 'active'
  FROM companies c WHERE c.name = 'VCDLLP' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Conceptualization Stage', 1, 280800, '2230007', '2022-07-01', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'The Oberoi Rajgarh' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Schematic Drawing Stage', 2, 280800, '2230019', '2022-08-21', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'The Oberoi Rajgarh' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Design Development Stage - 80% of 520000', 3, 449280, '2230019', '2022-08-21', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'The Oberoi Rajgarh' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Equipment Finalization and Tender Documentation', 4, 561600, '2230036', '2023-01-16', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'The Oberoi Rajgarh' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Design Development Stage - 20% of 520000', 5, 112320, '2230036', '2023-01-16', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'The Oberoi Rajgarh' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Upon Commencement of Services', 6, 280800, '21220022', NULL, 280800, '2022-01-28', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'The Oberoi Rajgarh' LIMIT 1;

-- Project: HYUNDAI MOTOR INDIA LIMITED - EXTENSION MAIN DINING (VCDLLP) — 3 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'HYUNDAI MOTOR INDIA LIMITED - EXTENSION MAIN DINING', 'Unknown', 300000, 'active'
  FROM companies c WHERE c.name = 'VCDLLP' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Contract Extension', 1, 54000, '2230008', '2022-07-01', 58000, '2022-06-26', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'HYUNDAI MOTOR INDIA LIMITED - EXTENSION MAIN DINING' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Rework- Conceptual Design & Area Zoning', 2, 162000, '2230009', '2022-07-01', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'HYUNDAI MOTOR INDIA LIMITED - EXTENSION MAIN DINING' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Rework – Equipment Layout and Detailed Design', 3, 108000, '2230020', '2022-09-05', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'HYUNDAI MOTOR INDIA LIMITED - EXTENSION MAIN DINING' LIMIT 1;

-- Project: KA Hospitality "J" Restaurant (VCDLLP) — 5 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'KA Hospitality "J" Restaurant', 'Unknown', 600000, 'active'
  FROM companies c WHERE c.name = 'VCDLLP' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Upon Commencement of Services', 1, 259200, '2230012', NULL, 259200, NULL, 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'KA Hospitality "J" Restaurant' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Conceptual Design', 2, 97200, '2230014', '2022-06-24', 97200, '2022-09-05', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'KA Hospitality "J" Restaurant' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Schematic Design', 3, 97200, '2230016', '2022-08-02', 97200, '2022-09-05', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'KA Hospitality "J" Restaurant' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Design Development', 4, 97200, '2230017', '2022-08-19', 97200, NULL, 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'KA Hospitality "J" Restaurant' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender Documentation', 5, 97200, '2230017', '2022-08-19', 97200, NULL, 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'KA Hospitality "J" Restaurant' LIMIT 1;

-- Project: Maisang- Guwahati Enhancement (VCDLLP) — 18 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Maisang- Guwahati Enhancement', 'Unknown', 1500000, 'active'
  FROM companies c WHERE c.name = 'VCDLLP' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'CONTRACT EXTENSION FEE', 1, 324000, '2230021', '2022-09-11', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Maisang- Guwahati Enhancement' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'HOSPITALITY FACILITY DESIGN ADVISORY (PRO-RATED QUATERLY) May 2022 to July 2022)', 2, 81000, '2230027', '2022-10-31', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Maisang- Guwahati Enhancement' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'HOSPITALITY FACILITY DESIGN ADVISORY (PRO-RATED QUATERLY) Aug 2022 to Oct 2022', 3, 81000, '2230027', '2022-10-31', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Maisang- Guwahati Enhancement' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'HOSPITALITY FACILITY DESIGN ADVISORY (PRO-RATED QUATERLY) Nov 2022 to Jan 2023)', 4, 81000, '2324002', NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Maisang- Guwahati Enhancement' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'HOSPITALITY FACILITY DESIGN ADVISORY (PRO-RATED QUATERLY) Feb 2023 to April 2023', 5, 81000, '2324002', NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Maisang- Guwahati Enhancement' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'HOSPITALITY FACILITY DESIGN ADVISORY (PRO-RATED QUATERLY) Feb 2024 to May 2024)', 6, 81000, '2425016', '2024-06-05', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Maisang- Guwahati Enhancement' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'HOSPITALITY FACILITY DESIGN ADVISORY (PRO-RATED QUATERLY) jUNE 2024 to aUG 2024)', 7, 75000, '2425038', '2024-11-25', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Maisang- Guwahati Enhancement' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'HOSPITALITY FACILITY DESIGN ADVISORY (PRO-RATED QUATERLY) Sep 2024 to Nov 2024)', 8, 75000, '2425041', '2024-11-25', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Maisang- Guwahati Enhancement' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'HOSPITALITY FACILITY DESIGN ADVISORY (PRO-RATED QUATERLY) March 2025 to MAy 2025)', 9, 81000, '2526021', '2025-07-17', 81000, '2025-07-27', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Maisang- Guwahati Enhancement' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'HOSPITALITY FACILITY DESIGN ADVISORY (PRO-RATED QUATERLY) Dec 2024 to Feb 2025)', 10, 81000, '2526021', '2025-07-17', 81000, '2025-07-27', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Maisang- Guwahati Enhancement' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'HOSPITALITY FACILITY DESIGN ADVISORY (PRO-RATED QUATERLY) jUNE 2025 to aUG 2025)', 11, 81000, '2526036', '2025-10-07', 81000, '2025-12-11', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Maisang- Guwahati Enhancement' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'HOSPITALITY FACILITY DESIGN ADVISORY (PRO-RATED QUATERLY) May 2023 to July 2023', 12, 81000, '23240033', '2023-10-31', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Maisang- Guwahati Enhancement' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'HOSPITALITY FACILITY DESIGN ADVISORY (PRO-RATED QUATERLY) Aug 2023 to Oct 2023', 13, 81000, '23240033', '2023-10-31', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Maisang- Guwahati Enhancement' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'HOSPITALITY FACILITY DESIGN ADVISORY (PRO-RATED QUATERLY) Nov 2023 to Jan 2024', 14, 81000, '23240044', '2024-02-01', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Maisang- Guwahati Enhancement' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'HOSPITALITY FACILITY DESIGN ADVISORY (PRO-RATED QUATERLY) Sep 2025 to Nov 2025)', 15, 81000, '2526051', '2025-12-01', 81000, '2025-12-11', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Maisang- Guwahati Enhancement' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'HOSPITALITY FACILITY DESIGN ADVISORY (PRO-RATED QUATERLY) Dec 2025 to Feb 2026)', 16, 81000, '2526068', '2026-03-12', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Maisang- Guwahati Enhancement' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'SCHEMATIC DESIGN REVISION (HOTEL BLOCK)', 17, 270000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Maisang- Guwahati Enhancement' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'DETAIL DESIGN REVISION (HOTEL BLOCK)', 18, 378000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Maisang- Guwahati Enhancement' LIMIT 1;

-- Project: Maisang - Arunachal Pradesh Enhancement (VCDLLP) — 19 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Maisang - Arunachal Pradesh Enhancement', 'Unknown', 1500000, 'active'
  FROM companies c WHERE c.name = 'VCDLLP' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'CONTRACT EXTENSION FEE – TWO YEARS', 1, 270000, '2230022', '2022-09-11', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Maisang - Arunachal Pradesh Enhancement' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'HOSPITALITY FACILITY DESIGN ADVISORY (PRO-RATED QUATERLY) May 2022 to July 2022)', 2, 54000, '2230028', '2022-10-31', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Maisang - Arunachal Pradesh Enhancement' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'HOSPITALITY FACILITY DESIGN ADVISORY (PRO-RATED QUATERLY) Aug 2022 to Oct 2022', 3, 54000, '2230028', '2022-10-31', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Maisang - Arunachal Pradesh Enhancement' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'HOSPITALITY FACILITY DESIGN ADVISORY (PRO-RATED QUATERLY) Nov 2022 to Jan 2023)', 4, 54000, '2324001', NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Maisang - Arunachal Pradesh Enhancement' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'HOSPITALITY FACILITY DESIGN ADVISORY (PRO-RATED QUATERLY) Feb 2023 to April 2023', 5, 54000, '2324001', NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Maisang - Arunachal Pradesh Enhancement' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'CONCEPT DESIGN ADDITIONAL AREAS + TWEAKS IN CURRENT DESIGN', 6, 270000, '2324004', NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Maisang - Arunachal Pradesh Enhancement' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'SCHEMATIC DESIGN ADDITIONAL AREAS + TWEAKS IN CURRENT DESIGN', 7, 270000, '2324004', NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Maisang - Arunachal Pradesh Enhancement' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'DETAIL DESIGN – ADDITIONAL AREAS + TWEAKS IN CURRENT DESIGN', 8, 378000, '2324004', NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Maisang - Arunachal Pradesh Enhancement' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'HOSPITALITY FACILITY DESIGN ADVISORY (PRO-RATED QUATERLY) Feb 2024 to May 2024)', 9, 54000, '2425017', '2024-06-05', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Maisang - Arunachal Pradesh Enhancement' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'HOSPITALITY FACILITY DESIGN ADVISORY (PRO-RATED QUATERLY) jUNE 2024 to aUG 2024))', 10, 50000, '2425039', '2024-11-25', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Maisang - Arunachal Pradesh Enhancement' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'HOSPITALITY FACILITY DESIGN ADVISORY (PRO-RATED QUATERLY) Sep 2024 to Nov 2024)', 11, 50000, '2425040', '2024-11-25', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Maisang - Arunachal Pradesh Enhancement' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'HOSPITALITY FACILITY DESIGN ADVISORY (PRO-RATED QUATERLY) Feb 2025 to May 2025)', 12, 54000, '2526022', '2025-07-17', 54000, '2025-07-16', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Maisang - Arunachal Pradesh Enhancement' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'HOSPITALITY FACILITY DESIGN ADVISORY (PRO-RATED QUATERLY) Dec 2024 to Feb 2025)', 13, 54000, '2526022', '2025-07-17', 54000, '2025-07-16', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Maisang - Arunachal Pradesh Enhancement' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'HOSPITALITY FACILITY DESIGN ADVISORY (PRO-RATED QUATERLY) jUNE 2025 to aUG 2025)', 14, 54000, '2526037', '2025-10-07', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Maisang - Arunachal Pradesh Enhancement' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'HOSPITALITY FACILITY DESIGN ADVISORY (PRO-RATED QUATERLY) May 2023 to July 2023', 15, 54000, '23240019', '2023-08-03', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Maisang - Arunachal Pradesh Enhancement' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'HOSPITALITY FACILITY DESIGN ADVISORY (PRO-RATED QUATERLY) Aug 2023 to Oct 2023', 16, 54000, '23240032', NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Maisang - Arunachal Pradesh Enhancement' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'HOSPITALITY FACILITY DESIGN ADVISORY (PRO-RATED QUATERLY) Nov 2023 to Jan 2024', 17, 54000, '23240043', '2024-02-01', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Maisang - Arunachal Pradesh Enhancement' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'HOSPITALITY FACILITY DESIGN ADVISORY (PRO-RATED QUATERLY) Sep 2025 to Nov 2025)', 18, 54000, '2526052', '2025-12-01', 54000, '2026-01-20', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Maisang - Arunachal Pradesh Enhancement' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'HOSPITALITY FACILITY DESIGN ADVISORY (PRO-RATED QUATERLY) Dec 2025 to Feb 2026)', 19, 54000, '2526069', '2026-03-12', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Maisang - Arunachal Pradesh Enhancement' LIMIT 1;

-- Project: Serendipity Arts - Complete Design Services (VCDLLP) — 9 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Serendipity Arts - Complete Design Services', 'Unknown', 1700000, 'active'
  FROM companies c WHERE c.name = 'VCDLLP' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Mobilisation advance on commencement', 1, 183600, '2230029', NULL, 183600, '2022-12-14', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Serendipity Arts - Complete Design Services' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'On submission & approval of Concept Design (50%)', 2, 137700, '2425047', '2024-12-11', 137700, NULL, 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Serendipity Arts - Complete Design Services' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'On submission & approval of Concept Design (50%)', 3, 137700, '23240021', '2023-08-18', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Serendipity Arts - Complete Design Services' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Against completion of Tender Stage / Tender Evaluation', 4, 91800, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Serendipity Arts - Complete Design Services' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Against construction stage (on pro-rate in 8 equal instalments)', 5, 367200, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Serendipity Arts - Complete Design Services' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Against testing and commissioning of the areas', 6, 91800, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Serendipity Arts - Complete Design Services' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Against Tender Documentation', 7, 275400, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Serendipity Arts - Complete Design Services' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'On submission & approval of Detailed Design', 8, 275400, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Serendipity Arts - Complete Design Services' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'On submission & approval of Schematic Design', 9, 275400, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Serendipity Arts - Complete Design Services' LIMIT 1;

-- Project: Serendipity Arts - Advisory Services for Leased Out Areas (VCDLLP) — 4 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Serendipity Arts - Advisory Services for Leased Out Areas', 'Unknown', 800000, 'active'
  FROM companies c WHERE c.name = 'VCDLLP' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Mobilisation advance on commencement', 1, 86400, '2230029', NULL, 86400, '2022-12-14', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Serendipity Arts - Advisory Services for Leased Out Areas' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'On conceptual broad level zoning delivery - complete areas (to be paid on pro-rate in 8 equal installments)  - 50%', 2, 259200, '2425047', '2024-12-11', 259200, NULL, 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Serendipity Arts - Advisory Services for Leased Out Areas' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'MEP Allocation of all areas (to be paid on pro-rate basis', 3, 259200, '2425047', '2024-12-11', 259200, NULL, 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Serendipity Arts - Advisory Services for Leased Out Areas' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'On conceptual broad level zoning delivery - complete areas (to be paid on pro-rate in 8 equal installments)  - 50%', 4, 259200, '23240021', '2023-08-18', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Serendipity Arts - Advisory Services for Leased Out Areas' LIMIT 1;

-- Project: Porbandar Palace Phase 1 (VCDLLP) — 4 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Porbandar Palace Phase 1', 'Unknown', 800000, 'active'
  FROM companies c WHERE c.name = 'VCDLLP' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Upon Commencement of Services', 1, 80000, '2230033', '2022-12-15', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Porbandar Palace Phase 1' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Conceptual Design', 2, 160000, '2324005', '2023-04-03', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Porbandar Palace Phase 1' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Schematic Design', 3, 160000, '23240009', '2023-06-15', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Porbandar Palace Phase 1' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Design Development', 4, 160000, '23240031', '2023-10-31', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Porbandar Palace Phase 1' LIMIT 1;

-- Project: Postcard Kanha (VCDLLP) — 8 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Postcard Kanha', 'Unknown', 1250000, 'active'
  FROM companies c WHERE c.name = 'VCDLLP' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Upon Commencement of Services', 1, 202500, '2230037', NULL, 202500, NULL, 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Postcard Kanha' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.3 Design Development', 2, 270000, '2425014', '2024-06-05', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Postcard Kanha' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.1 Conceptual Design', 3, 202500, '23240035', '2023-11-13', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Postcard Kanha' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.2 Schematic Design', 4, 202500, '23240042', '2024-02-01', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Postcard Kanha' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.7 Testing & Commissioning', 5, 67500, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Postcard Kanha' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.6 Services Provided during Construction', 6, 67500, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Postcard Kanha' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.5 Tender Evaluation', 7, 135000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Postcard Kanha' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.4 Tender Documentation', 8, 202500, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Postcard Kanha' LIMIT 1;

-- Project: Marriott Shoghi (VCDLLP) — 8 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Marriott Shoghi', 'Unknown', 2800000, 'active'
  FROM companies c WHERE c.name = 'VCDLLP' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Upon Commencement of Services', 1, 604800, '2230038', '2023-02-06', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Marriott Shoghi' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Conceptual Design', 2, 453600, '23240052', '2024-03-01', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Marriott Shoghi' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender Documenation', 3, 302400, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Marriott Shoghi' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender Evaluation & Shop Drawing Approval', 4, 151200, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Marriott Shoghi' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Services Provided During Construction', 5, 151200, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Marriott Shoghi' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Testing & Commissioning', 6, 151200, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Marriott Shoghi' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Design Development', 7, 604800, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Marriott Shoghi' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Schematic Design', 8, 604800, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Marriott Shoghi' LIMIT 1;

-- Project: Postcard Ranthambore (VCDLLP) — 8 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Postcard Ranthambore', 'Unknown', 1475000, 'active'
  FROM companies c WHERE c.name = 'VCDLLP' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Upon Commencement of Services', 1, 238950, '2230039', '2023-02-28', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Postcard Ranthambore' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.1 Conceptual Design', 2, 238950, '23240011', '2023-07-02', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Postcard Ranthambore' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.2 Schematic Design', 3, 238950, '23240011', '2023-07-02', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Postcard Ranthambore' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.3 Design Development', 4, 318600, '23240022', '2023-08-18', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Postcard Ranthambore' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.4 Tender Documentation', 5, 238950, '23240027', '2023-10-08', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Postcard Ranthambore' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.5 Tender Evaluation', 6, 159300, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Postcard Ranthambore' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.6 Services Provided during Construction', 7, 79650, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Postcard Ranthambore' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Testing & Commissioning', 8, 79650, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Postcard Ranthambore' LIMIT 1;

-- Project: Porbandar Palace Phase 2 (VCDLLP) — 1 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Porbandar Palace Phase 2', 'Unknown', 825000, 'active'
  FROM companies c WHERE c.name = 'VCDLLP' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Upon Commencement of Services', 1, 80000, '2324006', '2023-04-13', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Porbandar Palace Phase 2' LIMIT 1;

-- Project: DLF Club 4 (VCDLLP) — 9 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'DLF Club 4', 'Unknown', 1735000, 'active'
  FROM companies c WHERE c.name = 'VCDLLP' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Schematic Design', 1, 303625, '2425002', '2024-04-08', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'DLF Club 4' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender Specifications & Construction Documentation  - 40% of stage total of 3,47,000', 2, 138800, '2425034', '2024-10-31', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'DLF Club 4' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Detailed Design', 3, 303625, '2425034', '2024-10-31', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'DLF Club 4' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender Specifications & Construction Documentation  - 60% of stage total of 3,47,000', 4, 208200, '2425053', '2025-01-31', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'DLF Club 4' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Construction Administration 80%', 5, 149904, '2526019', '2025-07-13', 149904, '2025-09-16', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'DLF Club 4' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Upon appointment', 6, 173500, '23240034', '2023-10-31', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'DLF Club 4' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Planning & Design Charrettes', 7, 173500, '23240039', '2025-01-24', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'DLF Club 4' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Concept Design', 8, 260250, '23240046', '2024-02-06', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'DLF Club 4' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Construction Administration 20%', 9, 37476, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'DLF Club 4' LIMIT 1;

-- Project: Asian Paints Nilaya Mumbai Comorin (VCDLLP) — 8 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Asian Paints Nilaya Mumbai Comorin', 'Unknown', 1400000, 'active'
  FROM companies c WHERE c.name = 'VCDLLP' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.2 Schematic Design', 1, 240000, '2425003', '2024-04-08', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Asian Paints Nilaya Mumbai Comorin' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.3 Design Development', 2, 280000, '2425008', '2024-04-30', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Asian Paints Nilaya Mumbai Comorin' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.4 Tender Documentation', 3, 145000, '2425015', '2024-06-05', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Asian Paints Nilaya Mumbai Comorin' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.5 Tender Evaluation', 4, 145000, '2425027', '2024-09-09', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Asian Paints Nilaya Mumbai Comorin' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.6 Services Provided during Construction', 5, 75600, '2526026', '2025-08-04', 75600, '2025-10-31', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Asian Paints Nilaya Mumbai Comorin' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.7 Testing & Commissioning', 6, 75600, '2526026', '2025-08-04', 75600, '2025-08-19', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Asian Paints Nilaya Mumbai Comorin' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Upon Commencement of Services', 7, 210000, '23240040', '2024-01-31', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Asian Paints Nilaya Mumbai Comorin' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.1 Conceptual Design', 8, 240000, '23240047', '2024-02-06', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Asian Paints Nilaya Mumbai Comorin' LIMIT 1;

-- Project: Radisson Blu Kolkatta DS Group (VCDLLP) — 9 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Radisson Blu Kolkatta DS Group', 'Unknown', 2300000, 'active'
  FROM companies c WHERE c.name = 'VCDLLP' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Conceptual Design -80% of 400000', 1, 320000, '2425006', '2024-04-24', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Radisson Blu Kolkatta DS Group' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Conceptual Design -20% of 400000', 2, 80000, '2425009', '2024-05-01', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Radisson Blu Kolkatta DS Group' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Schematic Design', 3, 432000, '2526041', '2025-10-16', 432000, '2025-11-17', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Radisson Blu Kolkatta DS Group' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Upon Commencement of Services', 4, 420000, '23240050', '2024-03-01', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Radisson Blu Kolkatta DS Group' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Design Development', 5, 432000, '2526048', '2025-12-01', 432000, NULL, 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Radisson Blu Kolkatta DS Group' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender Evaluation', 6, 190000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Radisson Blu Kolkatta DS Group' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Services Provided During Construction', 7, 130000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Radisson Blu Kolkatta DS Group' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Testing & Commissioning', 8, 130000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Radisson Blu Kolkatta DS Group' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender Documentation', 9, 230000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Radisson Blu Kolkatta DS Group' LIMIT 1;

-- Project: Radisson MBD (VCDLLP) — 7 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Radisson MBD', 'Unknown', 600000, 'active'
  FROM companies c WHERE c.name = 'VCDLLP' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Conceptual Design- 50%', 1, 60000, '2425013', '2024-05-12', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Radisson MBD' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Schematic Design - 50%', 2, 60000, '2425055', '2025-02-03', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Radisson MBD' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Design Development 50%', 3, 85050, '2526007', NULL, 85050, '2025-05-19', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Radisson MBD' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender Documentation 50%', 4, 36450, '2526007', NULL, 36450, '2025-05-19', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Radisson MBD' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Upon Commencement', 5, 135000, '23240038', '2024-01-07', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Radisson MBD' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Re-engagement Fee', 6, 81000, '2526050', '2025-12-01', 81000, '2025-12-07', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Radisson MBD' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender Evaluation', 7, 25000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Radisson MBD' LIMIT 1;

-- Project: Kuchaman Fort (VCDLLP) — 12 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Kuchaman Fort', 'Unknown', 5500000, 'active'
  FROM companies c WHERE c.name = 'VCDLLP' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Upon Commencement of Services', 1, 1100000, '2425018', '2024-06-09', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Kuchaman Fort' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.1 Conceptual Design 25%', 2, 206250, '2425032', '2024-10-06', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Kuchaman Fort' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.1 Conceptual Design 15%', 3, 133650, '2526023', '2025-06-12', 133650, '2025-07-17', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Kuchaman Fort' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.2 Schematic Design - 40%', 4, 475200, '2526023', '2025-06-12', 475200, '2025-07-17', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Kuchaman Fort' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.4 Tender Documentation', 5, 550000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Kuchaman Fort' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.5 Tender Evaluation', 6, 550000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Kuchaman Fort' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.7 Testing & Commissioning', 7, 275000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Kuchaman Fort' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.6 Services Provided during Construction', 8, 275000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Kuchaman Fort' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.3 Design Development - 60%', 9, 495000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Kuchaman Fort' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.3 Design Development - 40%', 10, 356400, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Kuchaman Fort' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.1 Conceptual Design 60%', 11, 534600, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Kuchaman Fort' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.2 Schematic Design -60%', 12, 712800, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Kuchaman Fort' LIMIT 1;

-- Project: Antara Noida (VCDLLP) — 4 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Antara Noida', 'Unknown', 800000, 'active'
  FROM companies c WHERE c.name = 'VCDLLP' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Against LOI', 1, 80000, '2425019', '2024-02-01', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Antara Noida' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'On Completion of Conceptual Design
Stage Post Sign-off.', 2, 160000, '2425020', '2024-06-11', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Antara Noida' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'On completion of Detailed Design Phase
post Sign-off -', 3, 280000, '2425023', '2024-07-31', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Antara Noida' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender Documentation Phase Post Sign-
off.', 4, 280000, '2425035', '2024-11-01', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Antara Noida' LIMIT 1;

-- Project: Chalet - The Resort - Madh (VCDLLP) — 13 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Chalet - The Resort - Madh', 'Unknown', 3300000, 'active'
  FROM companies c WHERE c.name = 'VCDLLP' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Consultancy Services on submission of Concept', 1, 200000, '2425021', '2024-07-03', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Chalet - The Resort - Madh' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '(15% on submission of Schematic Design', 2, 200000, '2425021', '2024-07-03', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Chalet - The Resort - Madh' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'On Commencement of Revit Model', 3, 432000, '2425058', '2025-02-11', 432000, '2025-04-15', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Chalet - The Resort - Madh' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Additional Fees rework Up to Schematic Stage', 4, 432000, '2425058', '2025-02-11', 432000, '2025-04-15', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Chalet - The Resort - Madh' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Additional Fees on Account of Existing Hotel additional restaurant', 5, 108000, '2425058', '2025-02-11', 108000, '2025-04-15', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Chalet - The Resort - Madh' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Consultancy Services Fees on Appointment', 6, 500000, 'Raised', '2023-10-01', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Chalet - The Resort - Madh' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'On Completion of Schematic Stage Revit Model', 7, 216000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Chalet - The Resort - Madh' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '15% On Submission of Tender Documents', 8, 300000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Chalet - The Resort - Madh' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '15% on 100% DD', 9, 270000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Chalet - The Resort - Madh' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '15% on 50% DD', 10, 270000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Chalet - The Resort - Madh' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Sign off on submittals by Kitchen Vendor / Tender evaluation', 11, 150000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Chalet - The Resort - Madh' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Final Commissioning and Handover Stage', 12, 150000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Chalet - The Resort - Madh' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'On Completion of Design Development stage Revit Model', 13, 216000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Chalet - The Resort - Madh' LIMIT 1;

-- Project: Courtyard Marriott / LM Ahmedabad (VCDLLP) — 11 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Courtyard Marriott / LM Ahmedabad', 'Unknown', 1500000, 'active'
  FROM companies c WHERE c.name = 'VCDLLP' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tendering Stage 15% (65% of stage)', 1, 146250, '2425022', '2024-07-31', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Courtyard Marriott / LM Ahmedabad' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Design Development Stage 15%', 2, 225000, '2425033', '2024-10-14', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Courtyard Marriott / LM Ahmedabad' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender Evaluation Stage 10% (65% of Stage)', 3, 97500, '2425062', NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Courtyard Marriott / LM Ahmedabad' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Construction Stage
a.) Verification of all documents/shop drawings submitted by Vendor or thirty days from Tender Evaluation, whichever is earlier - 10%', 4, 162000, '2526014', '2025-06-12', 162000, '2025-07-24', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Courtyard Marriott / LM Ahmedabad' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender Evaluation Stage 10% (35% of Stage)', 5, 56700, '2526014', '2025-06-12', 56700, '2025-07-24', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Courtyard Marriott / LM Ahmedabad' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tendering Stage 15% (35% of stage)', 6, 85050, '2526014', '2025-06-12', 85050, '2025-07-24', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Courtyard Marriott / LM Ahmedabad' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Construction Stage
b.) Verification of all documents/shop drawings submitted by Vendor or sixty days from Tender Evaluation, whichever is earlier - 10%', 7, 162000, '2526014', '2025-06-12', 162000, '2025-07-24', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Courtyard Marriott / LM Ahmedabad' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'After Handing Over 5%', 8, 81000, '2526034', '2025-09-15', 81000, '2025-10-02', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Courtyard Marriott / LM Ahmedabad' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Advance on Commencement 15%', 9, 225000, '23240016', '2023-07-26', 0, '2023-08-02', 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Courtyard Marriott / LM Ahmedabad' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Conceptual Design 10%', 10, 150000, '23240045', '2023-02-06', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Courtyard Marriott / LM Ahmedabad' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Schematic Design 10%', 11, 150000, '23240045', '2023-02-06', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Courtyard Marriott / LM Ahmedabad' LIMIT 1;

-- Project: RMZ EW20 Design (VCDLLP) — 8 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'RMZ EW20 Design', 'Unknown', 900000, 'active'
  FROM companies c WHERE c.name = 'VCDLLP' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Conceptual Design', 1, 121500, '2425024', '2024-08-07', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'RMZ EW20 Design' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Schematic Design', 2, 145800, '2425054', '2025-02-03', 145800, '2025-06-20', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'RMZ EW20 Design' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Design Development', 3, 145800, '2526009', '2025-06-03', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'RMZ EW20 Design' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Upon Commencement of Services', 4, 180000, '23240048', '2024-02-26', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'RMZ EW20 Design' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender Documentation', 5, 97200, '2526066', '2026-03-12', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'RMZ EW20 Design' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender Evaluation', 6, 97200, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'RMZ EW20 Design' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Services Provided During Construction', 7, 72900, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'RMZ EW20 Design' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Testing & Commissioning', 8, 72900, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'RMZ EW20 Design' LIMIT 1;

-- Project: RMZ EW20 Advisory (VCDLLP) — 3 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'RMZ EW20 Advisory', 'Unknown', 600000, 'active'
  FROM companies c WHERE c.name = 'VCDLLP' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Conceptual Broad level Zoning', 1, 250000, '2425024', '2024-08-07', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'RMZ EW20 Advisory' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'MEP Allocations', 2, 250000, '2425054', '2025-02-03', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'RMZ EW20 Advisory' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Upon Commencement of Services', 3, 100000, '23240048', '2024-02-26', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'RMZ EW20 Advisory' LIMIT 1;

-- Project: RMZ Loft (VCDLLP) — 20 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'RMZ Loft', 'Unknown', 1000000, 'active'
  FROM companies c WHERE c.name = 'VCDLLP' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Upon Commencement of Services', 1, 159494.4, '2425036', NULL, 159494.4, NULL, 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'RMZ Loft' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Upon Commencement of Services', 2, 56505.6, '2425037', NULL, 56505.6, NULL, 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'RMZ Loft' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Travel Invoice', 3, 7063.2, '2425042', '2024-11-30', 7063.2, NULL, 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'RMZ Loft' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Travel Invoice', 4, 19936.8, '2425043', '2024-11-30', 19936.8, NULL, 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'RMZ Loft' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Travel Invoice', 5, 7063.2, '2425044', '2024-11-30', 7063.2, NULL, 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'RMZ Loft' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Travel Invoice', 6, 19936.8, '2425045', '2024-11-30', 19936.8, NULL, 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'RMZ Loft' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.1 Conceptual Design', 7, 42379.2, '2425050', NULL, 42379.2, NULL, 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'RMZ Loft' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.1 Conceptual Design', 8, 119620.8, '2425050', NULL, 119620.8, NULL, 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'RMZ Loft' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.2 Schematic Design', 9, 119620.8, '2425051', NULL, 119620.8, NULL, 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'RMZ Loft' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.2 Schematic Design', 10, 42379.2, '2425051', NULL, 42379.2, NULL, 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'RMZ Loft' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.3 Design Development', 11, 159494.4, '2425056', NULL, 159494.4, NULL, 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'RMZ Loft' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.3 Design Development', 12, 56505.6, '2425057', NULL, 56505.6, NULL, 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'RMZ Loft' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.4 Tender Documentation', 13, 79747.2, '2526003', '2025-05-09', 79747.2, '2025-07-30', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'RMZ Loft' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.4 Tender Documentation', 14, 28252.8, '2526004', '2025-05-09', 28252.8, '2025-07-30', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'RMZ Loft' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.5 Tender Evaluation', 15, 79747.2, '2526043', '2025-11-12', 79747.2, '2025-12-08', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'RMZ Loft' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.5 Tender Evaluation', 16, 28252.8, '2526044', '2025-11-12', 28252.8, '2025-12-08', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'RMZ Loft' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.6 Services Provided during Construction', 17, 39873.6, '2526046', '2025-11-30', 39873.6, '2025-12-08', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'RMZ Loft' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.6 Services Provided during Construction', 18, 14126.4, '2526047', '2025-11-30', 14126.4, '2025-12-08', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'RMZ Loft' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.7 Testing & Commissioning', 19, 14126.4, '2526059', NULL, 14126.4, '2025-01-28', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'RMZ Loft' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.7 Testing & Commissioning', 20, 39873.6, '2526060', NULL, 39873.6, '2025-01-28', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'RMZ Loft' LIMIT 1;

-- Project: HoABL Sarayu Ayodhya (VCDLLP) — 1 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'HoABL Sarayu Ayodhya', 'Unknown', 0, 'active'
  FROM companies c WHERE c.name = 'VCDLLP' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Upon Commencement of Services', 1, 220000, '2425046', '2024-12-01', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'HoABL Sarayu Ayodhya' LIMIT 1;

-- Project: Hyatt Regency Goa (VCDLLP) — 12 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Hyatt Regency Goa', 'Unknown', 3500000, 'active'
  FROM companies c WHERE c.name = 'VCDLLP' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Schematic Design 10% (50% of stage)', 1, 175000, '2425048', '2024-12-11', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Hyatt Regency Goa' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Design Development Stage 15% - 40% of stage', 2, 226800, '2526028', '2025-09-24', 226800, '2025-10-02', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Hyatt Regency Goa' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Schematic Design 10% (50% of stage)', 3, 189000, '2526028', '2025-09-24', 189000, '2025-10-02', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Hyatt Regency Goa' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tendering Stage 15% - 40% of stage', 4, 226800, '2526030', '2025-08-31', 226800, '2026-02-03', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Hyatt Regency Goa' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Advance on Commencement 15%', 5, 525000, '23240017', '2023-07-26', 0, '2023-08-02', 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Hyatt Regency Goa' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Conceptual Design 10%', 6, 350000, '23240023', '2023-09-11', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Hyatt Regency Goa' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Design Development Stage 15% - 60% of stage', 7, 340200, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Hyatt Regency Goa' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tendering Stage 15% - 60% of stage', 8, 315000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Hyatt Regency Goa' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender Evaluation Stage 10%', 9, 350000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Hyatt Regency Goa' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Construction Stage
a.) Verification of all documents/shop drawings submitted by Vendor or thirty days from Tender Evaluation, whichever is earlier - 10%', 10, 350000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Hyatt Regency Goa' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Construction Stage
b.) Verification of all documents/shop drawings submitted by Vendor or sixty days from Tender Evaluation, whichever is earlier - 10%', 11, 350000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Hyatt Regency Goa' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'After Handing Over 5%', 12, 175000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Hyatt Regency Goa' LIMIT 1;

-- Project: Dhun Jaipur (VCDLLP) — 10 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Dhun Jaipur', 'Unknown', 1800000, 'active'
  FROM companies c WHERE c.name = 'VCDLLP' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Upon Commencement of Services', 1, 360000, '2425049', '2024-12-19', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Dhun Jaipur' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.1 Conceptual Design 50%', 2, 180000, '2425049', '2024-12-19', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Dhun Jaipur' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.2 Schematic Design 50%', 3, 135000, '2425049', '2024-12-19', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Dhun Jaipur' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.6 Services Provided during Construction', 4, 90000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Dhun Jaipur' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.7 Testing & Commissioning', 5, 180000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Dhun Jaipur' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.3 Design Development', 6, 291600, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Dhun Jaipur' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.4 Tender Documentation', 7, 194400, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Dhun Jaipur' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.5 Tender Evaluation', 8, 97200, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Dhun Jaipur' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.1 Conceptual Design 50%', 9, 194400, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Dhun Jaipur' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.2 Schematic Design 50%', 10, 145800, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Dhun Jaipur' LIMIT 1;

-- Project: Laxminivas Palace (VCDLLP) — 11 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Laxminivas Palace', 'Unknown', 2600000, 'active'
  FROM companies c WHERE c.name = 'VCDLLP' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.3   Design Development 75%', 1, 390000, '2425052', NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Laxminivas Palace' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.2   Schematic Design (50%)', 2, 195000, '2425052', NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Laxminivas Palace' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.4   Tender Documentation 75%', 3, 315900, '2526011', '2025-06-09', 315900, '2025-07-20', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Laxminivas Palace' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Upon Commencement of Services', 4, 390000, '23240020', '2023-08-10', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Laxminivas Palace' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.1   Conceptual Design', 5, 390000, '23240037', '2023-12-15', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Laxminivas Palace' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.2   Schematic Design (50%)', 6, 195000, '23240037', '2023-12-15', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Laxminivas Palace' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.3   Design Development 25%', 7, 140400, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Laxminivas Palace' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.5   Tender Evaluation', 8, 280800, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Laxminivas Palace' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.6   Services Provided during Construction', 9, 140400, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Laxminivas Palace' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.4   Tender Documentation 25%', 10, 105300, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Laxminivas Palace' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.7   Testing & Commissioning', 11, 140400, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Laxminivas Palace' LIMIT 1;

-- Project: Taj Krish Raipur (VCDLLP) — 8 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Taj Krish Raipur', 'Unknown', 1800000, 'active'
  FROM companies c WHERE c.name = 'VCDLLP' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Upon Commencement of Services', 1, 360000, '2425059', '2025-02-12', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Taj Krish Raipur' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Conceptual Design', 2, 388800, '2526035', '2025-10-07', 388800, '2025-12-10', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Taj Krish Raipur' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender Evaluation', 3, 180000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Taj Krish Raipur' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Services provided during Construction', 4, 90000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Taj Krish Raipur' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Testing and Commissioning', 5, 90000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Taj Krish Raipur' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Design Development', 6, 291600, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Taj Krish Raipur' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender Documentation', 7, 194400, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Taj Krish Raipur' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Schematic Design', 8, 291600, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Taj Krish Raipur' LIMIT 1;

-- Project: Raipur Hotel - Bansal Infra (VCDLLP) — 2 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Raipur Hotel - Bansal Infra', 'Unknown', 2100000, 'active'
  FROM companies c WHERE c.name = 'VCDLLP' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Upon Commencement of Services 4,20,000', 1, 420000, '2425060', '2025-02-12', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Raipur Hotel - Bansal Infra' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.1 Conceptual Design 315000', 2, 315000, '2425061', '2025-02-12', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Raipur Hotel - Bansal Infra' LIMIT 1;

-- Project: Max Estates 360- MEL Clubhouse (VCDLLP) — 8 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Max Estates 360- MEL Clubhouse', 'Unknown', 0, 'active'
  FROM companies c WHERE c.name = 'VCDLLP' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Upon Commencement of Services', 1, 324000, '2425064', '2024-09-19', 324000, NULL, 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Max Estates 360- MEL Clubhouse' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.1   Conceptual Design', 2, 243000, '2526031', '2025-09-01', 243000, '2025-09-24', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Max Estates 360- MEL Clubhouse' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.2   Schematic Design', 3, 324000, '2526055', NULL, 324000, '2026-02-17', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Max Estates 360- MEL Clubhouse' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.5   Tender Evaluation', 4, 150000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Max Estates 360- MEL Clubhouse' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.6   Services Provided during Construction', 5, 75000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Max Estates 360- MEL Clubhouse' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.7   Testing & Commissioning', 6, 75000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Max Estates 360- MEL Clubhouse' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.4   Tender Documentation', 7, 150000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Max Estates 360- MEL Clubhouse' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.3   Design Development', 8, 243000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Max Estates 360- MEL Clubhouse' LIMIT 1;

-- Project: Max Estates 360- ASL Clubhouse (VCDLLP) — 8 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Max Estates 360- ASL Clubhouse', 'Unknown', 0, 'active'
  FROM companies c WHERE c.name = 'VCDLLP' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Upon Commencement of Services', 1, 324000, '2425064', '2024-09-19', 324000, NULL, 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Max Estates 360- ASL Clubhouse' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.1   Conceptual Design', 2, 243000, '2526031', '2025-09-01', 243000, '2025-09-24', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Max Estates 360- ASL Clubhouse' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.2   Schematic Design', 3, 324000, '2526055', NULL, 324000, '2026-02-17', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Max Estates 360- ASL Clubhouse' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.5   Tender Evaluation', 4, 150000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Max Estates 360- ASL Clubhouse' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.6   Services Provided during Construction', 5, 75000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Max Estates 360- ASL Clubhouse' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.7   Testing & Commissioning', 6, 75000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Max Estates 360- ASL Clubhouse' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.4   Tender Documentation', 7, 150000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Max Estates 360- ASL Clubhouse' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.3   Design Development', 8, 56505.6, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Max Estates 360- ASL Clubhouse' LIMIT 1;

-- Project: Max Estates 128 Clubhouse (VCDLLP) — 8 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Max Estates 128 Clubhouse', 'Unknown', 0, 'active'
  FROM companies c WHERE c.name = 'VCDLLP' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Upon Commencement of Services', 1, 324000, '2425065', '2024-09-19', 324000, NULL, 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Max Estates 128 Clubhouse' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.1   Conceptual Design', 2, 243000, '2425067', '2025-03-16', 243000, '2025-04-08', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Max Estates 128 Clubhouse' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.2   Schematic Design', 3, 324000, '2425067', '2025-03-16', 324000, '2025-04-08', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Max Estates 128 Clubhouse' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.3   Design Development', 4, 243000, '2526049', NULL, 243000, NULL, 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Max Estates 128 Clubhouse' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.5   Tender Evaluation', 5, 150000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Max Estates 128 Clubhouse' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.4   Tender Documentation', 6, 162000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Max Estates 128 Clubhouse' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.6   Services Provided during Construction', 7, 75000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Max Estates 128 Clubhouse' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.7   Testing & Commissioning', 8, 75000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Max Estates 128 Clubhouse' LIMIT 1;

-- Project: Max 361 ASL + MEL (VCDLLP) — 8 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Max 361 ASL + MEL', 'Unknown', 3600000, 'active'
  FROM companies c WHERE c.name = 'VCDLLP' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Upon Commencement of Services', 1, 777600, '2425066', '2025-03-16', 777600, NULL, 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Max 361 ASL + MEL' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.1 Conceptual Design', 2, 583200, '2526056', '2025-12-09', 583200, '2025-12-28', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Max 361 ASL + MEL' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.2 Schematic Design', 3, 388800, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Max 361 ASL + MEL' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.4 Tender Documentation', 4, 360000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Max 361 ASL + MEL' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.5 Tender Evaluation', 5, 540000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Max 361 ASL + MEL' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.6 Services Provided during Construction', 6, 540000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Max 361 ASL + MEL' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.7 Testing & Commissioning', 7, 180000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Max 361 ASL + MEL' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.3 Design Development', 8, 388800, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Max 361 ASL + MEL' LIMIT 1;

-- Project: Bhartiya - Coorg Masterplanning (VCDLLP) — 2 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Bhartiya - Coorg Masterplanning', 'Unknown', 1000000, 'active'
  FROM companies c WHERE c.name = 'VCDLLP' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Upon Commencement', 1, 216000, '2425069', '2025-03-30', 216000, '2025-04-15', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Bhartiya - Coorg Masterplanning' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Advisory - prorated monthly- 4 months (April to JuLY)', 2, 432000, '2526054', '2025-12-07', 360000, '2026-01-05', 'partial'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Bhartiya - Coorg Masterplanning' LIMIT 1;

-- Project: Bhartiya - Kabini Resort (VCDLLP) — 8 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Bhartiya - Kabini Resort', 'Unknown', 2000000, 'active'
  FROM companies c WHERE c.name = 'VCDLLP' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Upon Commencement', 1, 216000, '2425070', '2025-03-30', 216000, '2025-04-15', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Bhartiya - Kabini Resort' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Conceptual Design', 2, 216000, '2526057', '2025-12-11', 216000, '2026-02-12', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Bhartiya - Kabini Resort' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Testing & Commissioning', 3, 50000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Bhartiya - Kabini Resort' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender Documentation', 4, 300000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Bhartiya - Kabini Resort' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender Evaluation', 5, 300000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Bhartiya - Kabini Resort' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Services Provided during Construction', 6, 150000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Bhartiya - Kabini Resort' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Schematic Design', 7, 432000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Bhartiya - Kabini Resort' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Design Development', 8, 432000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Bhartiya - Kabini Resort' LIMIT 1;

-- Project: Renaissance Bangalore- DS Group (VCDLLP) — 30 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Renaissance Bangalore- DS Group', 'Unknown', 2100000, 'active'
  FROM companies c WHERE c.name = 'VCDLLP' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Upon commencement', 1, 453600, '2526001', '2025-04-14', 756000, '2025-09-10', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Renaissance Bangalore- DS Group' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Concept design - Phase 1', 2, 226800, '2526017', '2025-07-04', 283500, '2025-08-12', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Renaissance Bangalore- DS Group' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Schematic design - Phase 1 (50% of phase 1 ie 25% of total)', 3, 113400, '2526017', '2025-07-04', 378000, '2025-08-12', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Renaissance Bangalore- DS Group' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Schematic design - Phase 2', 4, 189000, '2526039', NULL, 283500, NULL, 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Renaissance Bangalore- DS Group' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Detailed design (50% of Stage 1 ie 25% of Total)', 5, 70875, '2526039', NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Renaissance Bangalore- DS Group' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender documentation (50% of Stage 1 ie 25% of Total)', 6, 47250, '2526039', NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Renaissance Bangalore- DS Group' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender evaluation (50% of Stage 1 ie 25% of Total)', 7, 47250, '2526039', NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Renaissance Bangalore- DS Group' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Schematic design - Phase 1 (50% of phase 1 ie 25% of total)', 8, 113400, '2526039', NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Renaissance Bangalore- DS Group' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Detailed design (50% of Stage 1 ie 25% of Total)', 9, 78750, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Renaissance Bangalore- DS Group' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Detailed design (Phase 2)', 10, 157500, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Renaissance Bangalore- DS Group' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender documentation (50% of Stage 1 ie 25% of Total)', 11, 52500, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Renaissance Bangalore- DS Group' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender documentation (Phase 2)', 12, 105000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Renaissance Bangalore- DS Group' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender evaluation (50% of Stage 1 ie 25% of Total)', 13, 52500, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Renaissance Bangalore- DS Group' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender evaluation (Phase 2)', 14, 105000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Renaissance Bangalore- DS Group' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Construction administration', 15, 105000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Renaissance Bangalore- DS Group' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Concept design - Phase 2', 16, 210000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Renaissance Bangalore- DS Group' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Upon commencement  - Executive Lounge', 17, 34560, '2526067', '2026-03-12', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Renaissance Bangalore- DS Group' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Concept design - Executive Lounge', 18, 34560, '2526067', '2026-03-12', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Renaissance Bangalore- DS Group' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Schematic design - Executive Lounge', 19, 34560, '2526067', '2026-03-12', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Renaissance Bangalore- DS Group' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Detailed design - Executive Lounge', 20, 25920, '2526067', '2026-03-12', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Renaissance Bangalore- DS Group' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender documentation - Executive Lounge', 21, 17280, '2526067', '2026-03-12', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Renaissance Bangalore- DS Group' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender evaluation - Executive Lounge', 22, 17280, '2526067', '2026-03-12', 39873.6, '2025-12-08', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Renaissance Bangalore- DS Group' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Construction administration - Executive Lounge', 23, 8640, '2526067', '2026-03-12', 14126.4, '2025-12-08', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Renaissance Bangalore- DS Group' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Upon commencement - Chor Bizarre', 24, 116640, '2526067', '2026-03-12', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Renaissance Bangalore- DS Group' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Concept design - Chor Bizarre', 25, 116640, '2526067', '2026-03-12', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Renaissance Bangalore- DS Group' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Schematic design - Chor Bizarre', 26, 116640, '2526067', '2026-03-12', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Renaissance Bangalore- DS Group' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Detailed design - Chor Bizarre', 27, 87480, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Renaissance Bangalore- DS Group' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender documentation - Chor Bizarre', 28, 58320, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Renaissance Bangalore- DS Group' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender evaluation - Chor Bizarre', 29, 54000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Renaissance Bangalore- DS Group' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Construction administration - Chor Bizarre', 30, 27000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Renaissance Bangalore- DS Group' LIMIT 1;

-- Project: Punj Dharamkot Project (VCDLLP) — 8 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Punj Dharamkot Project', 'Unknown', 1250000, 'active'
  FROM companies c WHERE c.name = 'VCDLLP' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Upon Commencement of Services', 1, 270000, '2526008', '2025-06-02', 270000, '2025-06-04', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Punj Dharamkot Project' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.1 Conceptual Design', 2, 162000, '2526024', '2025-07-23', 162000, '2025-08-18', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Punj Dharamkot Project' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.1 Conceptual Design - Balance', 3, 100000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Punj Dharamkot Project' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.2 Schematic Design', 4, 250000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Punj Dharamkot Project' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.3 Design Development', 5, 125000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Punj Dharamkot Project' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.5 Tender Evaluation', 6, 125000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Punj Dharamkot Project' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.6 Services Provided during Construction', 7, 62500, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Punj Dharamkot Project' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.7 Testing & Commissioning', 8, 62500, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Punj Dharamkot Project' LIMIT 1;

-- Project: Tashkent Flight Services (VCDLLP) — 2 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Tashkent Flight Services', 'Unknown', 0, 'active'
  FROM companies c WHERE c.name = 'VCDLLP' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Upon Commencement of Services', 1, 1113580, '2526010', '2025-06-03', 1113580, '2025-06-11', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Tashkent Flight Services' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.1   Conceptual Design', 2, 1131000, '2526032', '2025-09-01', 1146210, '2025-12-28', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Tashkent Flight Services' LIMIT 1;

-- Project: Grand Hyatt Indore (VCDLLP) — 8 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Grand Hyatt Indore', 'Unknown', 3000000, 'active'
  FROM companies c WHERE c.name = 'VCDLLP' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Upon Commencement', 1, 522000, '2526027', '2025-09-24', 522000, '2025-08-10', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Grand Hyatt Indore' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Conceptual Design', 2, 696000, '2526072', '2026-03-14', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Grand Hyatt Indore' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Schematic Design', 3, 696000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Grand Hyatt Indore' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Testing and Commissioning', 4, 174000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Grand Hyatt Indore' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Detailed Design', 5, 522000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Grand Hyatt Indore' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender Documentation', 6, 348000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Grand Hyatt Indore' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender Evaluation', 7, 348000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Grand Hyatt Indore' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Services Provided During Construction', 8, 174000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Grand Hyatt Indore' LIMIT 1;

-- Project: JWM Juhu Phase 1 (VCDLLP) — 8 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'JWM Juhu Phase 1', 'Unknown', 2000000, 'active'
  FROM companies c WHERE c.name = 'VCDLLP' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Advance', 1, 432000, '2526033', '2025-09-08', 432000, '2025-09-24', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'JWM Juhu Phase 1' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Conceptual Design', 2, 324000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'JWM Juhu Phase 1' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Schematic Design', 3, 324000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'JWM Juhu Phase 1' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender Evaluation', 4, 216000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'JWM Juhu Phase 1' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Services Provided During Construction', 5, 108000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'JWM Juhu Phase 1' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Testing and Commissioning', 6, 108000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'JWM Juhu Phase 1' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Design Development', 7, 432000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'JWM Juhu Phase 1' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender Documentation', 8, 216000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'JWM Juhu Phase 1' LIMIT 1;

-- Project: JWM Juhu Phase 2 (VCDLLP) — 8 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'JWM Juhu Phase 2', 'Unknown', 850000, 'active'
  FROM companies c WHERE c.name = 'VCDLLP' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Advance', 1, 183600, '2526033', '2025-09-08', 183600, '2025-09-24', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'JWM Juhu Phase 2' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Conceptual Design', 2, 137700, '2526038', '2025-10-12', 137700, '2025-12-02', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'JWM Juhu Phase 2' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Schematic Design', 3, 137700, '2526038', '2025-10-12', 137700, '2025-12-02', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'JWM Juhu Phase 2' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Design Development', 4, 183600, '2526065', '2026-03-02', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'JWM Juhu Phase 2' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender Documentation', 5, 91800, '2526065', '2026-03-02', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'JWM Juhu Phase 2' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender Evaluation', 6, 91800, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'JWM Juhu Phase 2' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Services Provided During Construction', 7, 45900, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'JWM Juhu Phase 2' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Testing and Commissioning', 8, 45900, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'JWM Juhu Phase 2' LIMIT 1;

-- Project: JWM Juhu Phase 3 (VCDLLP) — 8 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'JWM Juhu Phase 3', 'Unknown', 750000, 'active'
  FROM companies c WHERE c.name = 'VCDLLP' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Advance', 1, 162000, '2526033', '2025-09-08', 162000, '2025-09-24', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'JWM Juhu Phase 3' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Conceptual Design', 2, 121500, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'JWM Juhu Phase 3' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Schematic Design', 3, 121500, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'JWM Juhu Phase 3' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Design Development', 4, 162000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'JWM Juhu Phase 3' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender Documentation', 5, 81000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'JWM Juhu Phase 3' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender Evaluation', 6, 81000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'JWM Juhu Phase 3' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Services Provided During Construction', 7, 40500, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'JWM Juhu Phase 3' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Testing and Commissioning', 8, 40500, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'JWM Juhu Phase 3' LIMIT 1;

-- Project: RMZ Spire (VCDLLP) — 7 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'RMZ Spire', 'Unknown', 800000, 'active'
  FROM companies c WHERE c.name = 'VCDLLP' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Upong Commencement', 1, 172800, '2526042', NULL, 172800, '2025-12-05', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'RMZ Spire' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Conceptual Design', 2, 129600, '2526045', '2025-11-30', 129600, '2026-01-28', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'RMZ Spire' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Schematic Design', 3, 108000, '2526045', '2025-11-30', 108000, '2026-01-28', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'RMZ Spire' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Detailed Design', 4, 172800, '2526058', '2026-01-07', 223200, '2026-01-28', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'RMZ Spire' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender Evaluation', 5, 72000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'RMZ Spire' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Services Provided During Construction', 6, 36000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'RMZ Spire' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Testing and Commissioning', 7, 36000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'RMZ Spire' LIMIT 1;

-- Project: Maisang- Guwahati (VCDLLP) — 8 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Maisang- Guwahati', 'Unknown', 1600000, 'active'
  FROM companies c WHERE c.name = 'VCDLLP' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Upon Commencement of Services', 1, 345600, '20210403', '2020-05-10', 345600, '2020-05-10', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Maisang- Guwahati' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.1   Conceptual Design', 2, 345600, '21220026', '2021-12-08', 377600, '2022-01-03', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Maisang- Guwahati' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.2   Schematic Design', 3, 259200, '21220026', '2021-12-08', 283200, '2022-01-03', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Maisang- Guwahati' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.3   Design Development', 4, 259200, '21220026', '2021-12-08', 283200, '2022-01-03', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Maisang- Guwahati' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.6   Services Provided during Construction', 5, 86400, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Maisang- Guwahati' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.7    Testing & Commissioning', 6, 86400, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Maisang- Guwahati' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.5   Tender Evaluation', 7, 172800, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Maisang- Guwahati' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.4   Tender Documentation', 8, 172800, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Maisang- Guwahati' LIMIT 1;

-- Project: Maisang - Arunachal Pradesh (VCDLLP) — 8 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Maisang - Arunachal Pradesh', 'Unknown', 1400000, 'active'
  FROM companies c WHERE c.name = 'VCDLLP' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Upon Commencement of Services', 1, 302400, '20210404', '2020-05-10', 302400, '2020-05-10', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Maisang - Arunachal Pradesh' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.1   Conceptual Design', 2, 302400, '20210405', '2020-08-04', 330400, '2020-08-06', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Maisang - Arunachal Pradesh' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.2   Schematic Design', 3, 226800, '20210405', '2020-08-04', 247800, '2020-08-06', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Maisang - Arunachal Pradesh' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.3   Design Development', 4, 232050, '20210406', '2020-10-27', 247800, '2020-10-30', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Maisang - Arunachal Pradesh' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.4   Tender Documentation', 5, 151200, '21220017', '2021-09-15', 165200, '2021-10-07', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Maisang - Arunachal Pradesh' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.6   Services Provided during Construction', 6, 75600, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Maisang - Arunachal Pradesh' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.5   Tender Evaluation', 7, 140000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Maisang - Arunachal Pradesh' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.7    Testing & Commissioning', 8, 75600, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Maisang - Arunachal Pradesh' LIMIT 1;

-- Project: HYUNDAI MOTOR INDIA LIMITED (VCDLLP) — 7 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'HYUNDAI MOTOR INDIA LIMITED', 'Unknown', 395000, 'completed'
  FROM companies c WHERE c.name = 'VCDLLP' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'On Signing the agreement / On commencement of Work', 1, 110916, '20210408', '2020-11-10', 113483, '2020-11-30', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'HYUNDAI MOTOR INDIA LIMITED' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Conceptual Design', 2, 110916, '20210409', '2020-12-02', 110916, '2020-12-10', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'HYUNDAI MOTOR INDIA LIMITED' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.2 MEP Block Loads', 3, 51192, '20210409', '2020-12-02', 51192, '2020-12-10', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'HYUNDAI MOTOR INDIA LIMITED' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.3 Area Zoning', 4, 51192, '20210409', '2020-12-02', 51192, '2020-12-10', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'HYUNDAI MOTOR INDIA LIMITED' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.4 Equipment Layouts and Detailed Design', 5, 51192, '20210409', '2020-12-02', 51192, '2020-12-10', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'HYUNDAI MOTOR INDIA LIMITED' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.5 Tender Documentation', 6, 34128, '20210410', '2020-12-22', 34128, '2021-01-21', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'HYUNDAI MOTOR INDIA LIMITED' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Testing And Commissioning', 7, 17064, '21220015', NULL, 16200, NULL, 'partial'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'HYUNDAI MOTOR INDIA LIMITED' LIMIT 1;

-- Project: The Oberoi - Trident Bhuwaneswar (VCDLLP) — 4 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'The Oberoi - Trident Bhuwaneswar', 'Unknown', 250000, 'completed'
  FROM companies c WHERE c.name = 'VCDLLP' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Visit the Unit, review existing facility and discuss operational requirements with the General Manager and Operating Team. Submit Observations and assessment report', 1, 54000, '21220003', '2021-04-04', 54000, '2021-05-30', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'The Oberoi - Trident Bhuwaneswar' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Review kitchen layout plans, design optimization, make suggestions wherever required and provide revised layout plans incorporating recommended modifications', 2, 135000, '21220003', '2021-04-04', 135000, '2021-05-30', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'The Oberoi - Trident Bhuwaneswar' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'As required, suggest equipment specifications and historical performance analysis of manufacturers', 3, 81000, '21220030', '2022-02-11', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'The Oberoi - Trident Bhuwaneswar' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Review budget and equipment costs. Recomment value engineering solutions as applicable', 4, 54000, '21220030', '2022-02-11', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'The Oberoi - Trident Bhuwaneswar' LIMIT 1;

-- Project: The Oberoi Cecil (VCDLLP) — 4 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'The Oberoi Cecil', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDLLP' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Visit the Unit, review existing facility and discuss operational requirements with the General Manager and Operating Team. Submit Observations and assessment report', 1, 54000, '21220004', '2021-04-04', 54000, '2021-05-25', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'The Oberoi Cecil' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Review kitchen layout plans, design optimization, make suggestions wherever required and provide revised layout plans incorporating recommended modifications', 2, 108000, '21220004', '2021-04-04', 108000, '2021-05-25', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'The Oberoi Cecil' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'As required, suggest equipment specifications and historical performance analysis of manufacturers', 3, 54000, '21220031', '2022-02-24', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'The Oberoi Cecil' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Review budget and equipment costs. Recomment value engineering solutions as applicable', 4, 54000, '21220031', '2022-02-24', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'The Oberoi Cecil' LIMIT 1;

-- Project: Ranata Havelock (VCDLLP) — 3 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Ranata Havelock', 'Unknown', 1000000, 'active'
  FROM companies c WHERE c.name = 'VCDLLP' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Upon Commencemet', 1, 150000, '23240013', '2023-07-09', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Ranata Havelock' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.1   Conceptual Design', 2, 150000, '23240024', '2023-10-01', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Ranata Havelock' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.2   Schematic Design', 3, 150000, '23240051', '2024-03-01', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Ranata Havelock' LIMIT 1;

-- Project: Shillim Retreat - Writer Lifestyle (VCDLLP) — 2 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Shillim Retreat - Writer Lifestyle', 'Unknown', 1400000, 'active'
  FROM companies c WHERE c.name = 'VCDLLP' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Upon Commencement of Services', 1, 210000, '23240018', '2023-08-01', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Shillim Retreat - Writer Lifestyle' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.1 Conceptual Design', 2, 210000, '23240028', '2023-10-13', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Shillim Retreat - Writer Lifestyle' LIMIT 1;

-- Project: Bhartiya Leela (VCDLLP) — 3 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Bhartiya Leela', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDLLP' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Construction Administration Phase (Hotel)', 1, 670680, NULL, '2019-08-18', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Bhartiya Leela' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Construction Administration Phase (Branded Residence and Retail)', 2, 270000, NULL, '2019-08-18', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Bhartiya Leela' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Construction Administration Phase  (Convention Centre)', 3, 67500, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Bhartiya Leela' LIMIT 1;

-- Project: Mtech Hyd Google RC Design- Travel (VCDLLP) — 1 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Mtech Hyd Google RC Design- Travel', 'Unknown', 300000, 'active'
  FROM companies c WHERE c.name = 'VCDLLP' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Travel', 1, 21165.84, NULL, NULL, 21165.84, NULL, 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDLLP'
  WHERE p.project_name = 'Mtech Hyd Google RC Design- Travel' LIMIT 1;

-- Project: Antara Purukul Senior  Living Ltd (VCDPL) — 11 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Antara Purukul Senior  Living Ltd', 'Mr Tarun Sejwal', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'SCHEMATIC DESIGN PHASE 25% OF TOTAL FEES + BALANCE SERVICE TAX ( NOT PAID WHEN ADVANCE WAS PAID)', 1, 644934, '10003', '2013-06-30', 486441, '2013-10-10', 'partial'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Antara Purukul Senior  Living Ltd' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Phase - II DESIGN DEV ( 25% OF TOTAL FEES OF 23,50,000', 2, 601365, '10032', '2013-12-01', 447229, '2014-01-20', 'partial'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Antara Purukul Senior  Living Ltd' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Travel Expenses', 3, 8640, '10047', '2014-02-19', 8640, '2014-04-07', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Antara Purukul Senior  Living Ltd' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'PHASE 1 ADDITIONAL FEES SCHEMATIC 35 % OF TOTAL FEES RS 5,50,000', 4, 197043, '10088', '2017-08-20', 0, '2015-04-05', 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Antara Purukul Senior  Living Ltd' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'ADDITIONAL FEES DESIGN DEVELOPMENT RS 5,50,000', 5, 197043, '10089', '2017-08-20', 0, '2015-04-21', 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Antara Purukul Senior  Living Ltd' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'PHASE- III TENDERING STATE ( 15% OF TOTAL FEES OF RS. 2350000', 6, 420744, '10094', '2015-06-16', 360819, '2015-06-16', 'partial'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Antara Purukul Senior  Living Ltd' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'PHASE- III TENDERING STATE ( 15% OF TOTAL FEES OF RS. 2350000 = INR 352500)
Advance Adjustment ADD- INR 399500)', 7, 769747.2, '10094', '2017-08-20', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Antara Purukul Senior  Living Ltd' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'ADDITIONAL FEES TENDERING STAGE 30 % OF RS 550000', 8, 168894, '10095', '2017-08-20', 0, '2015-05-22', 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Antara Purukul Senior  Living Ltd' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'CONTRACT DOCUMENT PHASE', 9, 397800, '10108', '2014-07-23', 221529, '2015-08-23', 'partial'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Antara Purukul Senior  Living Ltd' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Advance Adjustments', 10, 475200, '10212', '2017-09-13', 475200, '2018-03-27', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Antara Purukul Senior  Living Ltd' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Advance (20% of INR 2350000)', 11, 471410, '21/ 10012012', '2012-01-09', 423000, '2012-02-03', 'partial'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Antara Purukul Senior  Living Ltd' LIMIT 1;

-- Project: R & H SPACES PVT LTD- Courtyard Andheri (VCDPL) — 4 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'R & H SPACES PVT LTD- Courtyard Andheri', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'ADVANCE 10% OF RS.11,50,000( TOTAL FEES)', 1, 117714, '10008', '2013-08-25', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'R & H SPACES PVT LTD- Courtyard Andheri' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Travel Expenses', 2, 61865, '10019', '2013-09-10', 61865, '2013-10-24', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'R & H SPACES PVT LTD- Courtyard Andheri' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Travel Expenses', 3, 63871, '10048', '2014-02-16', 63871, '2014-03-04', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'R & H SPACES PVT LTD- Courtyard Andheri' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Travel Expenses', 4, 37595, '10065', '2014-07-08', 37596, '2014-07-23', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'R & H SPACES PVT LTD- Courtyard Andheri' LIMIT 1;

-- Project: KA Hospitality- Yauatcha Bangalore (VCDPL) — 4 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'KA Hospitality- Yauatcha Bangalore', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'STAGE D (20% OF TOTAL CONTRACT AMOUNT : RS.4,25,000/- )', 1, 87006, '10009', '2013-08-16', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'KA Hospitality- Yauatcha Bangalore' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'STAGE -E ( 5% OF TOTAL CONTRACT OF RS. 4,25,000/-)', 2, 21751.5, '10010', '2013-09-03', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'KA Hospitality- Yauatcha Bangalore' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'STAGE - F ( 10% OF TOTAL CONTRACT OF RS. 4,25,000/-)', 3, 43503, '10011', '2013-09-05', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'KA Hospitality- Yauatcha Bangalore' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'STAGE - G ( 10% OF TOTAL CONTRACT OF RS. 4,25,000/-)', 4, 43503, '10012', '2013-09-09', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'KA Hospitality- Yauatcha Bangalore' LIMIT 1;

-- Project: KA Hospitality- Yauatcha Delhi (VCDPL) — 5 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'KA Hospitality- Yauatcha Delhi', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'STAGE - G ( 10% OF TOTAL CONTRACT OF RS. 4,25,000/-)', 1, 65254.5, '10013', '2013-08-31', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'KA Hospitality- Yauatcha Delhi' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'STAGE - D ( 20 % OF THE TOTAL CONTRACT OF RS. 4,25,000/-)', 2, 87006, '10014', '2013-09-27', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'KA Hospitality- Yauatcha Delhi' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'STAGE - E ( 5% OF THE TOTAL CONTRACT OF RS. 4,25,000/-)', 3, 21751.5, '10015', '2013-11-08', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'KA Hospitality- Yauatcha Delhi' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'STAGE - F ( 10% OF TOTAL CONTRACT OF RS. 4,25,000/-)', 4, 43503, '10016', '2013-11-14', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'KA Hospitality- Yauatcha Delhi' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'STAGE - G ( 10% OF TOTAL CONTRACT OF RS. 4,25,000/-)', 5, 43503, '10017', '2013-11-15', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'KA Hospitality- Yauatcha Delhi' LIMIT 1;

-- Project: Malsi Estates- Max (VCDPL) — 3 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Malsi Estates- Max', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'PHASE- IV CONSTRUCTION PHASE (20% OF BALANCE FEES OF RS. 15,72,000)', 1, 321819.84, '10020', '2013-09-08', 353259, NULL, 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Malsi Estates- Max' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'PHASE- IV CONSTRUCTION PHASE (20% OF BALANCE FEES OF RS. 15,72,000)
BALANCE 50,000', 2, 51180, '10027', '2013-11-08', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Malsi Estates- Max' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Project closeout', 3, 51180, '10043', '2014-01-29', 56180, NULL, 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Malsi Estates- Max' LIMIT 1;

-- Project: RESIDENCY RESORTS MALE PVT LTD (VCDPL) — 7 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'RESIDENCY RESORTS MALE PVT LTD', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Phase-1, SCHEMATIC DESIGN PHASE, Phase - II, DESIGN DEVELOPMENT STAGE ( PRO RATE OF USD 7000 )', 1, 0, '10021', '2013-09-11', 0, '2013-11-17', 'pending'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RESIDENCY RESORTS MALE PVT LTD' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Pending payment', 2, 0, '10044', '2014-01-29', 0, NULL, 'pending'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RESIDENCY RESORTS MALE PVT LTD' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'PHASE- III TENDERING STATE ( 20% OF OF USD 4000, PHASE- IV TENDER EVALUATION STAGE (50% OF FEES USD 4000, PHASE- V CONSTRUCTION STAGE 50 % OF 4000', 3, 0, '10045', '2014-01-14', 0, '2014-01-29', 'pending'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RESIDENCY RESORTS MALE PVT LTD' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender Documentation Stage', 4, 0, '10091', '2015-04-18', 0, NULL, 'pending'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RESIDENCY RESORTS MALE PVT LTD' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Requested Fee Enhancement', 5, 0, '10092', '2015-04-18', 0, NULL, 'pending'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RESIDENCY RESORTS MALE PVT LTD' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'DESIGN DEVELOPMENT BALANCE DUE  PHASE- III TENDERING STATE BALANCE
PHASE- IV TENDER EVALUATION BALANCE DUE', 6, 0, '10100', '2015-06-07', 0, NULL, 'pending'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RESIDENCY RESORTS MALE PVT LTD' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Construction and Post Construction Phase- 5% of Total USD 40000
Testing and Commissioning- 10% of Total USD 40000', 7, 6000, '10171', '2017-05-03', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RESIDENCY RESORTS MALE PVT LTD' LIMIT 1;

-- Project: SAS HOTELS AND ENTERPRISES- Madurai (VCDPL) — 3 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'SAS HOTELS AND ENTERPRISES- Madurai', 'Gopinath', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Phase-1, SCHEMATIC DESIGN PHASE 20% OF TOTAL FEES', 1, 409440, '10023', '2013-09-23', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'SAS HOTELS AND ENTERPRISES- Madurai' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Travel Expenses', 2, 7157, '10076', '2014-10-10', 7157, '2014-11-30', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'SAS HOTELS AND ENTERPRISES- Madurai' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Travel Expenses', 3, 5570, '10082', '2015-01-15', 5570, NULL, 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'SAS HOTELS AND ENTERPRISES- Madurai' LIMIT 1;

-- Project: Welham Girl's School (VCDPL) — 6 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Welham Girl''s School', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'ADVANCE 20% & SCHEMATIC DESIGN 25 % OF TOTAL FEES', 1, 230310, '10025', '2013-10-27', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Welham Girl''s School' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'ADVANCE 30% OF TOTAL FEES RS 5 LAKHS', 2, 153540, '10028', '2013-10-11', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Welham Girl''s School' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Travel Expenses', 3, 5495, '10029', '2013-11-07', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Welham Girl''s School' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Phase - II ( 20% OF TOTAL FEES OF 500,000/- )', 4, 102360, '10031', '2013-11-24', 126405, '2014-02-14', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Welham Girl''s School' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'PHASE- III CONTRACT DOCUMENT PHASE 15% OF TOTAL FEES', 5, 76770, '10038', '2013-12-26', 75843, '2014-03-17', 'partial'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Welham Girl''s School' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'PHASE- IV CONSTRUCTION & IMPLEMENTATION PHASE 10 % OF TOTAL FEES
(RS5,00,000)', 6, 51180, '10052', '2014-03-28', 50562, '2014-04-08', 'partial'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Welham Girl''s School' LIMIT 1;

-- Project: Pallazio Hotels and Leisure Limited (VCDPL) — 2 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Pallazio Hotels and Leisure Limited', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'ADVANCE 25% PHASE 1 = 25%,PHASE 2 20%, PHASE 3= 15%: TOTAL 85%', 1, 522036, '10033', '2013-12-01', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Pallazio Hotels and Leisure Limited' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'ADVANCE 30% & SCHEMATIC DESIGN 30 % OF TOTAL FEES', 2, 214956, '10042', '2014-01-28', 235956, NULL, 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Pallazio Hotels and Leisure Limited' LIMIT 1;

-- Project: DIANA BUILDWELL LIMITED (VCDPL) — 5 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'DIANA BUILDWELL LIMITED', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'ADVANCE 25% OF TOTAL FEES', 1, 588570, '10034', '2013-12-23', 581463, '2014-06-06', 'partial'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'DIANA BUILDWELL LIMITED' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'SCHEMATIC DESIGN 25 % OF TOTAL FEES', 2, 588570, '10055', '2014-04-18', 646000, NULL, 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'DIANA BUILDWELL LIMITED' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'DESIGN DEVELOPMENT 20% OF TOTAL FEES', 3, 470856, '10078', '2014-12-21', 465170, '2015-01-08', 'partial'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'DIANA BUILDWELL LIMITED' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'PHASE- III FINAL PLANS & TENDERING STAGE ( 20% OF TOTAL FEES OF RS. 23,00,000)', 4, 470856, '10087', '2015-04-05', 470856, '2015-06-08', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'DIANA BUILDWELL LIMITED' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Travel Expenses', 5, 1359, '10097', '2015-05-20', 1359, NULL, 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'DIANA BUILDWELL LIMITED' LIMIT 1;

-- Project: Bright Enterprises (VCDPL) — 1 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Bright Enterprises', 'Tarun Mishra- VP', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'ENHANCED FEES', 1, 562980, '10037', '2013-12-31', 225000, '2014-01-31', 'partial'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Bright Enterprises' LIMIT 1;

-- Project: Prestige Estates and Projects (VCDPL) — 2 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Prestige Estates and Projects', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'travel Expenses', 1, 41709, '10039', '2013-12-23', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Prestige Estates and Projects' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Travel Expenses', 2, 48679, '10061', '2014-07-07', 48679, '2014-07-13', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Prestige Estates and Projects' LIMIT 1;

-- Project: C&C Hotel Venture Pvt Ltd- ALOFT BANGALORE (VCDPL) — 2 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'C&C Hotel Venture Pvt Ltd- ALOFT BANGALORE', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'ADVANCE 15% OF TOTAL FEES RS 14,00,000.', 1, 214956, '10040', '2014-01-24', 235956, NULL, 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'C&C Hotel Venture Pvt Ltd- ALOFT BANGALORE' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'SCHEMATIC DESIGN FEES FOR ALOFT BANGALORE PROJECT 30 % OF TOTAL
CONTRACT VALUE RS 14,00,000', 2, 429912, '10073', NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'C&C Hotel Venture Pvt Ltd- ALOFT BANGALORE' LIMIT 1;

-- Project: Interglobe Hotels (VCDPL) — 1 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Interglobe Hotels', 'Ajay Arora', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'ADVANCE 10% OF TOTAL FEES', 1, 127950, '10041', '2014-01-24', 140450, NULL, 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Interglobe Hotels' LIMIT 1;

-- Project: THE IMPERIAL HOTEL (VCDPL) — 2 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'THE IMPERIAL HOTEL', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'MOBILISATION ADVANCE 20% OF RS 7,00,000', 1, 143304, '10046', '2014-01-17', 157304, NULL, 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'THE IMPERIAL HOTEL' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'SCHEMATIC DESIGN 25 % OF TOTAL FEES RS.7,00,000/', 2, 179130, '10080', '2015-02-05', 179130, '2015-03-04', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'THE IMPERIAL HOTEL' LIMIT 1;

-- Project: HOTEL EXCELSIOR LIMITED (VCDPL) — 11 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'HOTEL EXCELSIOR LIMITED', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'ADVANCE 20% OF TOTAL FEES OF RS 650,000 FIRST FLOOR', 1, 133068, '10050', '2014-03-17', 133068, '2014-07-11', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'HOTEL EXCELSIOR LIMITED' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'ADVANCE 20% OF TOTAL FEES RS 650,000 GROUND FLOOR', 2, 133068, '10051', '2014-04-01', 133068, '2014-06-03', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'HOTEL EXCELSIOR LIMITED' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'FIRST FLOOR CONCEPT SCHEMATIC DESIGN 20 % OF TOTAL FEES', 3, 133068, '10058', '2014-08-21', 146068, NULL, 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'HOTEL EXCELSIOR LIMITED' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Travel Expenses', 4, 26197, '10062', '2014-06-06', 26197, '2014-06-18', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'HOTEL EXCELSIOR LIMITED' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'DESIGN DEVELOPMENT 20% OF TOTAL FEES', 5, 133068, '10069', '2014-07-24', 133068, '2014-08-18', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'HOTEL EXCELSIOR LIMITED' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'CONTRACT DOCUMENT PHASE 20 % OF TOTAL FEES', 6, 133068, '10070', '2014-08-15', 146068, '2014-08-27', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'HOTEL EXCELSIOR LIMITED' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'CONSTRUCTION & IMPLEMENTATION PHASE 15% OF TOTAL FEES OF RS 6,50,000
BALANCE ON COMMENCEMENT OF OPERATIONS 5 % OF TOTAL FEES OF RS 6,50,000', 7, 133068, '10083', '2015-02-23', 146068, NULL, 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'HOTEL EXCELSIOR LIMITED' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'SCHEMATIC DESIGN 20 % OF TOTAL FEES OF RS 6,50,000', 8, 133068, '10090', '2015-06-01', 146068, NULL, 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'HOTEL EXCELSIOR LIMITED' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'DESIGN DEVELOPMENT STAGE 20% OF TOTAL FEES RS 6,50,000', 9, 133068, '10093', '2015-06-01', 146068, NULL, 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'HOTEL EXCELSIOR LIMITED' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'CONTRACT DOCUMENT PHASE 20 % OF TOTAL FEES', 10, 133068, '10115', '2015-11-30', 148200, NULL, 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'HOTEL EXCELSIOR LIMITED' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'CONSTRUCTION & IMPLEMENTATION PHASE 15% OF TOTAL FEES OF RS 6,50,000
BALANCE ON COMMENCEMENT OF OPERATIONS 5 % OF TOTAL FEES OF RS 6,50,000', 11, 135850, '10129', '2016-04-21', 148850, NULL, 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'HOTEL EXCELSIOR LIMITED' LIMIT 1;

-- Project: MS.MONIKA BATRA (VCDPL) — 5 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'MS.MONIKA BATRA', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'ADVANCE 30% OF TOTAL FEES RS 210000', 1, 64486.8, '10053', '2014-04-03', 63708, '2014-04-11', 'partial'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'MS.MONIKA BATRA' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Schematic - 30% of total
DD- 25% of Total', 2, 53986.8, '10056', '2014-04-07', 53090, '2014-04-18', 'partial'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'MS.MONIKA BATRA' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'DESIGN DEVELOPMENT 25% OF TOTAL FEES', 3, 53739, '10057', '2014-04-13', 53739, '2014-07-07', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'MS.MONIKA BATRA' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'CONTRACT DOCUMENT PHASE 10 % OF TOTAL FEES RS 210000
REVIEW PHASE DURING CONSTRUCTION 5 % OF TOTAL FEES RS 210000', 4, 32243.4, '10072', '2014-11-07', 32243, '2014-11-19', 'partial'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'MS.MONIKA BATRA' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Concept Stage 30% of Total Fee of INR 210000', 5, 64486.8, '10178', '2014-04-03', 63708, '2014-04-11', 'partial'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'MS.MONIKA BATRA' LIMIT 1;

-- Project: Kanakia Hotels & Resorts Pvt Ltd (VCDPL) — 1 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Kanakia Hotels & Resorts Pvt Ltd', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'DESIGN CONSULTANCY FEES COURTYARD BY MARRIOTT ANDHERI MUMBAI
SPORTS BAR & KITCHEN', 1, 184248, '10054', '2014-07-07', 202248, NULL, 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Kanakia Hotels & Resorts Pvt Ltd' LIMIT 1;

-- Project: R & H SPACES PVT LTD- Courtyard Andheri/ Hyatt Place (VCDPL) — 4 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'R & H SPACES PVT LTD- Courtyard Andheri/ Hyatt Place', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'SCHEMATIC DESIGN 20% OF11,50,000 TOTAL FEES', 1, 235428, '10059', '2014-05-23', 235428, '2014-06-02', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'R & H SPACES PVT LTD- Courtyard Andheri/ Hyatt Place' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'PHASE- IV CONSTRUCTION SUPPORT PHASE 15% OF TOTAL FEES RS. 11,50,000)', 2, 176571, '10086', '2015-04-06', 193821, NULL, 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'R & H SPACES PVT LTD- Courtyard Andheri/ Hyatt Place' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Travel Expenses', 3, 40531, '10120', '2015-12-14', 40531, NULL, 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'R & H SPACES PVT LTD- Courtyard Andheri/ Hyatt Place' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'POST WORK SUBMISSION 10% OF INR 11,50,000', 4, 120175, '10127', '2016-03-31', 121321, '2016-03-30', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'R & H SPACES PVT LTD- Courtyard Andheri/ Hyatt Place' LIMIT 1;

-- Project: THE DUET INDIA HOTELS (VCDPL) — 1 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'THE DUET INDIA HOTELS', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Phase - II ( 25% OF TOTAL FEES OF 12,50,000/- )', 1, 319875, '10060', '2014-05-23', 351125, NULL, 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'THE DUET INDIA HOTELS' LIMIT 1;

-- Project: UFLEX LIMITED (VCDPL) — 1 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'UFLEX LIMITED', 'Sanjeev Oberoi', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'SCHEMATIC STAGE 50% OF TOTAL FEES RS 200000
DESIGN DEVELOPMENT STAGE 50% OF TOTAL FEES RS 200000', 1, 204720, '10063', '2014-06-15', 204720, '2014-06-22', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'UFLEX LIMITED' LIMIT 1;

-- Project: RIL DAICEC (VCDPL) — 23 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'RIL DAICEC', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'SCHEMATIC STAGE (20% OF TOTAL FEES RS 61,50,000)', 1, 1259028, '10064', '2014-07-15', 1259028, '2014-07-30', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Travel Expenses', 2, 81809.915, '10134', '2016-04-25', 81810, '2016-06-13', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Travel Expenses', 3, 19733, '10135', '2016-09-03', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Travel Expenses', 4, 20719.65, '10153', '2016-08-24', 20720, '2016-11-10', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Travel Expenses', 5, 63323, '10203', '2017-08-09', 0, '2018-05-10', 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Travel Sep', 6, 128954.02260000001, '10234', '2018-01-24', 0, '2018-05-10', 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Schematics', 7, 2275803, '10236', '2018-01-31', 2729950, '2018-05-10', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Travel Feb', 8, 107978.26, '10238', '2018-03-05', 0, '2018-05-10', 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Design Dev', 9, 1587600, '10246', '2018-04-05', 1587600, '2018-08-15', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Completion of Construction Document', 10, 1706670, '10247', '2018-04-05', 1706670, '2018-08-15', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Travel Invoice', 11, 67942.8, '10273', '2018-08-20', 0, '2019-12-28', 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Completion of Tender Documents and Tender Review', 12, 1706670, '10274', '2018-08-20', 0, '2019-01-22', 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Travel Invoice', 13, 80762.4, '10275', '2018-09-03', 0, '2019-12-28', 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Travel Invoice', 14, 51697.439999999995, '10279', '2018-09-19', 0, '2019-12-28', 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Travel Invoice', 15, 67021.56, '10297', '2019-04-08', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Travel Invoice June 2019', 16, 57479.759999999995, '10299', '2019-06-12', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Completion of Construction Administration 50%', 17, 2335000, '10305', NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Completion of Construction Administration 90%', 18, 1500000, '10314', '2021-03-09', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Completion of Construction Administration Final', 19, 183900, '10331', NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Initial Fee Balance', 20, 609644, '2023034', '2024-03-10', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Travel Expenses', 21, 53639, '31102341', '2015-10-04', 48934, '2015-10-05', 'partial'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender Documentation/Partial', 22, 334950, '10502/1', '2017-03-31', 334950, '2017-05-14', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Completion of Construction Administration Total', 23, 5043600, 'raised', NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC' LIMIT 1;

-- Project: THE DUET INDIA HOTELS (CHENNAI OMR) PVT LTD (VCDPL) — 3 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'THE DUET INDIA HOTELS (CHENNAI OMR) PVT LTD', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'DESIGN DEVELOPMENT STAGE 25% OF TOTAL FEES RS 600000, SCHEMATIC DESIGN PENDING', 1, 170791.7544, '10066', '2014-07-17', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'THE DUET INDIA HOTELS (CHENNAI OMR) PVT LTD' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'PHASE- III TENDERING STATE ( 10% OF TOTAL FEES OF RS. 6,00,000', 2, 61416, '10074', '2014-09-19', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'THE DUET INDIA HOTELS (CHENNAI OMR) PVT LTD' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'TENDER STAGE 10 % OF RS 6,00,000', 3, 61416, '10075', '2014-09-19', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'THE DUET INDIA HOTELS (CHENNAI OMR) PVT LTD' LIMIT 1;

-- Project: SHARMA LIMITED (VCDPL) — 1 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'SHARMA LIMITED', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'SCHEMATIC DESIGN 15 % OF TOTAL FEES USD 32500', 1, 0, '10068', '2014-11-27', 0, '2014-12-04', 'pending'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'SHARMA LIMITED' LIMIT 1;

-- Project: Lavender InfraproJects Pvt. Ltd.- COURT YARD MARRIOTT NEHRU
PLACE (VCDPL) — 1 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Lavender InfraproJects Pvt. Ltd.- COURT YARD MARRIOTT NEHRU
PLACE', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'SCHEMATIC DESIGN 30 % OF TOTAL FEES RS. 18,00,000', 1, 552744, '10071', '2014-07-23', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Lavender InfraproJects Pvt. Ltd.- COURT YARD MARRIOTT NEHRU
PLACE' LIMIT 1;

-- Project: Dasaprakash (VCDPL) — 2 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Dasaprakash', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'DESIGN PACKAGE FOR UNDER RAMP KITCHEN, FOUR WALKWAY MODULES,AND
BUS BAY BOULEVARD COUNTER ALL LAYOUTS SERVICES CIVIL, INTERIOR
STRUCTURE, SERVICES AND EQUIPMENT COORDINATION & ALL SPECIFICATIONS', 1, 1023600, '10077', '2014-11-26', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Dasaprakash' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'DESIGN PACKAGE BUS BAY BOULEVARD COUNTER ALL LAYOUTS SERVICES CIVIL,
INTERIOR STRUCTURE, SERVICES AND EQUIPMENT COORDINATION & ALL
SPECIFICATIONS.', 2, 307080, '10079', '2014-12-22', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Dasaprakash' LIMIT 1;

-- Project: AIZAIBA HOTEL MUSCAT (VCDPL) — 2 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'AIZAIBA HOTEL MUSCAT', 'P.J Mammen', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'PHASE- IV CONSTRUCTION PHASE', 1, 224720, '10081', '2015-06-10', 224720, '2015-06-15', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'AIZAIBA HOTEL MUSCAT' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Project closeout', 2, 224720, '10147', '2015-06-25', 224720, NULL, 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'AIZAIBA HOTEL MUSCAT' LIMIT 1;

-- Project: MAGMA CONSULTANTS (VCDPL) — 5 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'MAGMA CONSULTANTS', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Travel Expenses', 1, 0, '10084', '2015-02-20', 0, NULL, 'pending'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'MAGMA CONSULTANTS' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Retainer Fee', 2, 0, '10085', '2013-02-24', 0, NULL, 'pending'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'MAGMA CONSULTANTS' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'SCHEMATIC DESIGN 12,000 USD', 3, 0, '10116', '2015-09-28', 0, NULL, 'pending'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'MAGMA CONSULTANTS' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'DESIGN DEVELOPMENT STAGE USD 12000', 4, 0, '10136', '2016-07-15', 0, '2016-07-25', 'pending'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'MAGMA CONSULTANTS' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'CONCEPTUAL DESIGN PHASE 15% OF TOTAL FEES USD 81,000', 5, 0, '10162', '2017-02-17', 0, '2017-02-27', 'pending'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'MAGMA CONSULTANTS' LIMIT 1;

-- Project: Heritage River Journeys Private Limited. (VCDPL) — 1 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Heritage River Journeys Private Limited.', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Advance', 1, 102360, '10096', '2015-05-07', 112360, NULL, 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Heritage River Journeys Private Limited.' LIMIT 1;

-- Project: BODYSCULPT BANGALORE (VCDPL) — 6 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'BODYSCULPT BANGALORE', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Mobilization 50% of Rs.16,00,000', 1, 818880, '10098', '2015-05-21', 898880, '2015-05-21', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'BODYSCULPT BANGALORE' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Travel Expenses', 2, 35186, '10107', '2015-06-29', 35186, '2015-08-13', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'BODYSCULPT BANGALORE' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'SCHEMATIC DESIGN 15 % OF TOTAL FEES', 3, 245664, '10112', '2015-08-06', 249600, '2015-08-13', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'BODYSCULPT BANGALORE' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Travel Expenses', 4, 28335, '10113', '2015-08-11', 28335, '2015-08-13', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'BODYSCULPT BANGALORE' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'DESIGN DEVELOPMENT STAGE 20% OF TOTAL FEES RS 16,00,000
EQUIPMENTS SPECIFICATIONS STAGE 10% OF TOTAL FEES RS 16,00,000', 5, 491328, '10117', '2015-10-05', 499200, '2015-11-24', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'BODYSCULPT BANGALORE' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Construction and review phase @ 5% of 16L
Additional areas redisign- INR 680000', 6, 798000, '10179', '2017-04-17', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'BODYSCULPT BANGALORE' LIMIT 1;

-- Project: Heritage River Cruises (VCDPL) — 2 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Heritage River Cruises', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'SCHEMATIC & DESIGN DEVELOPMENT FEES', 1, 122832, '10099', '2015-06-05', 134832, NULL, 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Heritage River Cruises' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'SERVICES INCORPORATION STAGE
EQUIPMENT SELECTION REVIEW PHASE 
ONE NUMBER AFTER 2 REVISIONS MAIN DECK', 2, 125400, '10128', '2016-02-21', 160300, NULL, 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Heritage River Cruises' LIMIT 1;

-- Project: COSMOS BUILDWELL PVT LTD- Barwara (VCDPL) — 5 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'COSMOS BUILDWELL PVT LTD- Barwara', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Mobilization Advance', 1, 204720, '10105', '2015-06-01', 208000, '2015-06-10', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'COSMOS BUILDWELL PVT LTD- Barwara' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'SD, DD (HOH)', 2, 557812.2, '10118', NULL, 557812, '2015-12-14', 'partial'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'COSMOS BUILDWELL PVT LTD- Barwara' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Phase 2- Schematic Stage', 3, 103439.55000000002, '10175', '2017-05-08', 103439, '2017-09-03', 'partial'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'COSMOS BUILDWELL PVT LTD- Barwara' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'DD (FOH)', 4, 169204.68, '10214', '2017-09-17', 169199, '2017-12-29', 'partial'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'COSMOS BUILDWELL PVT LTD- Barwara' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'SCHEMATIC DESIGN FEES @ 25% OF RS.14,00,000 (Duplicate??)', 5, 353934, '92PI 15012013', '2013-01-14', 353934, '2013-04-09', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'COSMOS BUILDWELL PVT LTD- Barwara' LIMIT 1;

-- Project: RUPAL R.KANAKIA- Laundry (VCDPL) — 3 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'RUPAL R.KANAKIA- Laundry', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'DD Total', 1, 255900, '10106', '2015-06-14', 205000, NULL, 'partial'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RUPAL R.KANAKIA- Laundry' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Design Development', 2, 128000.08, '10149', '2015-08-20', 140308, NULL, 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RUPAL R.KANAKIA- Laundry' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'DESIGN DEVELOPMENT-2', 3, 79999.92, '10150', '2015-10-09', 87692, NULL, 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RUPAL R.KANAKIA- Laundry' LIMIT 1;

-- Project: ITC LIMITED- Narmada (VCDPL) — 5 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'ITC LIMITED- Narmada', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'ON SIGNING AGREEMENT 10% OF INR 20,64,000/', 1, 211271.04, '10109', '2015-09-21', 211766, '2015-09-30', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'ITC LIMITED- Narmada' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'CONCEPT DESIGN PHASE 25% OF TOTAL FEES INR 20,64,000', 2, 215688, '10124', '2016-01-02', 212695, '2016-01-10', 'partial'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'ITC LIMITED- Narmada' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Schematic Design (10%)', 3, 222912, '10209', '2017-08-30', 222912, '2017-09-27', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'ITC LIMITED- Narmada' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Design Development (20%)', 4, 445824, '10218', '2017-11-01', 445824, '2017-12-20', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'ITC LIMITED- Narmada' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender Documentation (25%)', 5, 557280, '10254', '2018-04-30', 557280, '2018-08-27', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'ITC LIMITED- Narmada' LIMIT 1;

-- Project: Lemon Tree Premier (VCDPL) — 4 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Lemon Tree Premier', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'SCHEMATIC/PRELIMNARY DESIGN STAGE 25 % OF TOTAL FEES', 1, 401763, '10110', '2015-08-07', 447450, NULL, 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Lemon Tree Premier' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'DESIGN & DEVELOPMENT PACKAGE 40 % OF TOTAL FEES', 2, 642820.8, '10111', '2015-08-13', 715920, NULL, 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Lemon Tree Premier' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'TENDERING STAGE 15 % OF TOTAL FEES', 3, 241057.8, '10114', '2015-09-12', 268470, NULL, 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Lemon Tree Premier' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'TENDER EVALUATION 10 % OF TOTAL FEES INR 15,70,000
BALANCE COMMISSIONING 10 % OF TOTAL FEES OF RS 15,70,000', 4, 328130, '10130', '2016-02-28', 359530, NULL, 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Lemon Tree Premier' LIMIT 1;

-- Project: INFOSYS POCHARAM HYDERABAD (VCDPL) — 4 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'INFOSYS POCHARAM HYDERABAD', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Advance', 1, 675000, '10119', '2015-11-26', 675000, '2015-11-29', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'INFOSYS POCHARAM HYDERABAD' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'SCHEMATIC DESIGN 25 % OF TOTAL FEES', 2, 562500, '10123', '2016-01-02', 393750, '2016-01-17', 'partial'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'INFOSYS POCHARAM HYDERABAD' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'DESIGN DEVELOPMENT STAGE 20% OF TOTAL FEES RS 25,00,000
SERVICES INCORPORATION STAGE 10 % OF TOTAL FEES RS 25,00,000', 3, 783750, '10125', '2016-02-13', 541012, '2016-03-30', 'partial'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'INFOSYS POCHARAM HYDERABAD' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Equipment Review and Coordination, Mobilzation Pending', 4, 838875, '10141', '2016-09-12', 586743, '2017-07-16', 'partial'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'INFOSYS POCHARAM HYDERABAD' LIMIT 1;

-- Project: Prestige Estates & Construction 1 (VCDPL) — 1 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Prestige Estates & Construction 1', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Travel Expenses', 1, 50851, '10121', '2015-12-07', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Prestige Estates & Construction 1' LIMIT 1;

-- Project: K.RAHEJA CORP PVT LTD- The Resort (VCDPL) — 5 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'K.RAHEJA CORP PVT LTD- The Resort', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'ADVANCE MOBILIZATION FEES 20% OF TOTAL FEES INR 17,00,000/=', 1, 355300, '10133', '2016-04-20', 389300, NULL, 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'K.RAHEJA CORP PVT LTD- The Resort' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'DESIGN DEVELOPMENT 25 % OF TOTAL FEES', 2, 444125, '10137', '2017-02-24', 446250, '2017-05-05', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'K.RAHEJA CORP PVT LTD- The Resort' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'REVISED ADDITIONAL AIR FARE MUMBAI DELHI 22ND DECEMBER 2016 PRATEEK &
RAMVITTAL RAO', 3, 4000, '10159', '2016-12-22', 4000, '2017-05-05', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'K.RAHEJA CORP PVT LTD- The Resort' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Phase 3- Final Plans and Tender stage- 20%', 4, 357000, '10174', '2017-05-04', 351000, '2017-07-05', 'partial'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'K.RAHEJA CORP PVT LTD- The Resort' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Phase 4- Construction (10% of Total Fee of INR 17,00,000)', 5, 183600, '10222', '2017-11-19', 183600, '2018-02-07', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'K.RAHEJA CORP PVT LTD- The Resort' LIMIT 1;

-- Project: DIANA BUILDWELL LIMITED- To be cancelled (VCDPL) — 1 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'DIANA BUILDWELL LIMITED- To be cancelled', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Construction and Implementation', 1, 120175, '10138', '2016-07-22', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'DIANA BUILDWELL LIMITED- To be cancelled' LIMIT 1;

-- Project: THEOBROMA FOODS PVT LTD MUMBAI- TCPK (VCDPL) — 16 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'THEOBROMA FOODS PVT LTD MUMBAI- TCPK', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'On signing the agreement 10 % of INR 20,00,000', 1, 209000, '10139', '2016-09-14', 210000, '2016-09-14', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'THEOBROMA FOODS PVT LTD MUMBAI- TCPK' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Travel Expenses', 2, 10436, '10140', '2016-09-04', 10436, '2016-10-18', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'THEOBROMA FOODS PVT LTD MUMBAI- TCPK' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Concept Design 10% OF TOTAL FEES INR 20,00,000
Schematic Design 10 % OF TOTAL FEES INR 20,00,000', 3, 420000, '10168', '2017-02-17', 420000, '2017-04-18', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'THEOBROMA FOODS PVT LTD MUMBAI- TCPK' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'DD and TD', 4, 420000, '10172', '2017-05-03', 420000, '2017-05-24', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'THEOBROMA FOODS PVT LTD MUMBAI- TCPK' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'DD and TD-Remainder of 10% and 5 %', 5, 315000, '10180', '2017-05-24', 315000, '2017-05-28', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'THEOBROMA FOODS PVT LTD MUMBAI- TCPK' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Travel Expenses', 6, 33742, '10186', '2017-06-25', 33743, '2017-06-29', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'THEOBROMA FOODS PVT LTD MUMBAI- TCPK' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Travel Expenses', 7, 37033, '10193', '2017-07-10', 37033, '2017-07-17', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'THEOBROMA FOODS PVT LTD MUMBAI- TCPK' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Travel Expenses', 8, 34172, '10194', '2017-07-17', 30839, '2017-08-06', 'partial'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'THEOBROMA FOODS PVT LTD MUMBAI- TCPK' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'For Works post completion of contract in  April- July 2017 (2.5L pm)', 9, 1080000, '10195', '2017-07-17', 1080000, '2017-09-06', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'THEOBROMA FOODS PVT LTD MUMBAI- TCPK' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Approval of Shop Drawings, Fabrication and Other Drawings- 10%', 10, 216000, '10206', '2017-08-13', 216000, '2017-08-21', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'THEOBROMA FOODS PVT LTD MUMBAI- TCPK' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'For Works post completion of contract in  Aug 2017', 11, 270000, '10210', '2017-08-30', 270000, '2017-11-28', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'THEOBROMA FOODS PVT LTD MUMBAI- TCPK' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Completion of Construction (10%)', 12, 216000, '10227', '2017-12-20', 216000, '2018-01-29', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'THEOBROMA FOODS PVT LTD MUMBAI- TCPK' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Travel Invoice', 13, 47353, '10230', '2018-01-11', 47353, '2018-01-18', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'THEOBROMA FOODS PVT LTD MUMBAI- TCPK' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Testing, Commissioning and Hand Over 10%', 14, 216000, '10257', '2018-05-14', 216000, '2018-05-16', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'THEOBROMA FOODS PVT LTD MUMBAI- TCPK' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '60 days after Handover- 5%', 15, 108000, '10267', '2018-07-03', 108000, '2018-07-24', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'THEOBROMA FOODS PVT LTD MUMBAI- TCPK' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Travel Invoice', 16, 76408, '10268', '2018-07-08', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'THEOBROMA FOODS PVT LTD MUMBAI- TCPK' LIMIT 1;

-- Project: CHALET HOTELS ( P ) LTD- Renaissance Mumbai (VCDPL) — 12 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'CHALET HOTELS ( P ) LTD- Renaissance Mumbai', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'COMMENCEMENT OF SERVICES 10 % OF INR 25,00,000', 1, 262500, '10142', '2016-09-12', 262500, '2015-10-14', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'CHALET HOTELS ( P ) LTD- Renaissance Mumbai' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Travel Expenses', 2, 10814, '10143', '2016-09-12', 10814, '2016-09-30', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'CHALET HOTELS ( P ) LTD- Renaissance Mumbai' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Stage 2- Conceptual Design (15% of INR 2500000)
Phase 3- Schematic Designs (15% of INR 2500000)', 3, 787500, '10176', '2017-05-09', 787500, '2017-07-02', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'CHALET HOTELS ( P ) LTD- Renaissance Mumbai' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Travel Expenses', 4, 39119, '10197', '2017-07-17', 39119, '2017-08-18', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'CHALET HOTELS ( P ) LTD- Renaissance Mumbai' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Phase 4- Design Development (20% of INR 25,00,000)', 5, 540000, '10219', '2017-11-01', 540000, '2017-12-11', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'CHALET HOTELS ( P ) LTD- Renaissance Mumbai' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender Documentation Stage (15% of INR 25,00,000)', 6, 405000, '10219', '2017-11-01', 405000, '2017-12-11', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'CHALET HOTELS ( P ) LTD- Renaissance Mumbai' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender Evaluation Stage (10% of INR 25,00,000)', 7, 270000, '10242', '2018-04-05', 270000, '2018-05-09', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'CHALET HOTELS ( P ) LTD- Renaissance Mumbai' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Services Provided during Construction (50%) (10% of INR 25,00,000)', 8, 135000, '10242', '2018-04-05', 135000, '2018-05-09', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'CHALET HOTELS ( P ) LTD- Renaissance Mumbai' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Travel', 9, 48199, '10264', '2018-06-15', 0, '2018-08-03', 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'CHALET HOTELS ( P ) LTD- Renaissance Mumbai' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Services Provided during Construction (50%) (10% of INR 25,00,000)', 10, 135000, '10265', '2018-06-30', 135000, '2018-08-03', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'CHALET HOTELS ( P ) LTD- Renaissance Mumbai' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Travel Invoice', 11, 14551, '10271', '2018-08-02', 14551, '2018-09-04', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'CHALET HOTELS ( P ) LTD- Renaissance Mumbai' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Testing and Commissioning (5% of INR 25,00,000)', 12, 135000, '10276', '2018-09-10', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'CHALET HOTELS ( P ) LTD- Renaissance Mumbai' LIMIT 1;

-- Project: VOMMULLI MALDIVES PROJECTS RESIDENCY GROUP (VCDPL) — 1 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'VOMMULLI MALDIVES PROJECTS RESIDENCY GROUP', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'DESIGN DEVELOPMENT STAGE', 1, 374345, '10144', '2015-06-14', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'VOMMULLI MALDIVES PROJECTS RESIDENCY GROUP' LIMIT 1;

-- Project: R & H SPACES PVT LTD- Courtyard Andheri/ Hyatt Place- Stilt-  remaining 2 L raised as raised as 10190, Reraised as 10213 (VCDPL) — 1 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'R & H SPACES PVT LTD- Courtyard Andheri/ Hyatt Place- Stilt-  remaining 2 L raised as raised as 10190, Reraised as 10213', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Design Consultancy Fee Stilt and Café Areas', 1, 630000, '10145', '2016-09-05', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'R & H SPACES PVT LTD- Courtyard Andheri/ Hyatt Place- Stilt-  remaining 2 L raised as raised as 10190, Reraised as 10213' LIMIT 1;

-- Project: RUPAL R.KANAKIA- Wine Cellar and Pantry- Cancelled- Reraised as 10189 (VCDPL) — 1 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'RUPAL R.KANAKIA- Wine Cellar and Pantry- Cancelled- Reraised as 10189', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Full', 1, 420000, '10146', '2017-01-19', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RUPAL R.KANAKIA- Wine Cellar and Pantry- Cancelled- Reraised as 10189' LIMIT 1;

-- Project: R & H Spaces Pvt. Ltd (VCDPL) — 1 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'R & H Spaces Pvt. Ltd', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Travel Expenses', 1, 58370, '10148', '2015-04-22', 53117, '2015-04-22', 'partial'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'R & H Spaces Pvt. Ltd' LIMIT 1;

-- Project: CARLSON HOTELS (VCDPL) — 2 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'CARLSON HOTELS', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Finder''s Fee', 1, 44063, '10151', '2015-07-17', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'CARLSON HOTELS' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Finder''s Fee', 2, 84646, '10152', '2015-09-10', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'CARLSON HOTELS' LIMIT 1;

-- Project: THEOBROMA FOODS PVT LTD MUMBAI (VCDPL) — 4 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'THEOBROMA FOODS PVT LTD MUMBAI', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Travel Expenses', 1, 19175, '10155', '2016-10-14', 19175, '2016-11-02', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'THEOBROMA FOODS PVT LTD MUMBAI' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Travel Expenses', 2, 39861, '10156', '2016-10-30', 39861, '2016-11-09', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'THEOBROMA FOODS PVT LTD MUMBAI' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Travel Expenses', 3, 31418, '10166', '2017-02-04', 31418, '2017-02-15', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'THEOBROMA FOODS PVT LTD MUMBAI' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Travel Expenses', 4, 36210, '10166', '2017-05-06', 36210, '2017-05-11', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'THEOBROMA FOODS PVT LTD MUMBAI' LIMIT 1;

-- Project: THEOBROMA FOODS PVT LTD MUMBAI: PROJECT DLF CYBERHUB GURGAON (VCDPL) — 2 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'THEOBROMA FOODS PVT LTD MUMBAI: PROJECT DLF CYBERHUB GURGAON', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'N SIGNING AGREEMENT 15 % OF TOTAL FEES OF INR 6,00,000
CONCEPT DESIGN PHASE 20% OF TOTAL FEES INR 6,00,000/
SCHEMATIC DESIGN 15 % OF TOTAL FEES INR 6,00,000
DESIGN DEVELOPMENT 15% OF TOTAL FEES INR 6,00,000
TENDER DOCUMENTATION STAGE 10% OF TOTAL FEES INR 6,00,000', 1, 472500, '10157', '2016-12-11', 472500, '2016-11-16', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'THEOBROMA FOODS PVT LTD MUMBAI: PROJECT DLF CYBERHUB GURGAON' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Shop Drawings, Construction, Testing Commissioning, Handover period', 2, 157500, '10167', '2017-02-12', 157500, '2017-04-12', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'THEOBROMA FOODS PVT LTD MUMBAI: PROJECT DLF CYBERHUB GURGAON' LIMIT 1;

-- Project: R & H SPACES PVT LTD- Courtyard Andheri/ Hyatt Place- Café Area (VCDPL) — 1 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'R & H SPACES PVT LTD- Courtyard Andheri/ Hyatt Place- Café Area', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Design Consultancy fee café area', 1, 840000, '10158', '2016-11-28', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'R & H SPACES PVT LTD- Courtyard Andheri/ Hyatt Place- Café Area' LIMIT 1;

-- Project: ISHA STEEL TREATMENT PRIVATE LIMITED- Ibis Vikhroli (VCDPL) — 6 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'ISHA STEEL TREATMENT PRIVATE LIMITED- Ibis Vikhroli', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'COMPENSATION OF EXTENDED DURATION : LUMP SUM INR 5,00,000/-', 1, 525000, '10160', '2017-01-09', 525000, '2017-01-16', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'ISHA STEEL TREATMENT PRIVATE LIMITED- Ibis Vikhroli' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'SCHEMATIC DESIGN 15 % OF TOTAL FEES', 2, 196875, '10161', '2017-01-05', 196876, '2017-01-15', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'ISHA STEEL TREATMENT PRIVATE LIMITED- Ibis Vikhroli' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Design Development (30% of Total Fees)', 3, 405000, '10221', '2017-11-19', 405000, '2017-12-29', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'ISHA STEEL TREATMENT PRIVATE LIMITED- Ibis Vikhroli' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender Documentation (25% of Total Fees)', 4, 337500, '10221', '2017-11-19', 337500, '2017-12-29', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'ISHA STEEL TREATMENT PRIVATE LIMITED- Ibis Vikhroli' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'On Completion of Tender Evlauation (15% of Total Fees) (add 10% addendum post 24th Jan 2020)', 5, 227906.25, '10309', '2020-05-10', 227906.25, '2020-09-27', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'ISHA STEEL TREATMENT PRIVATE LIMITED- Ibis Vikhroli' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'On Approval of Shop Drawings (5% of Total Fees)  (add 10% addendum post 24th Jan 2020)', 6, 75968.75, '10309', '2020-05-10', 75968.75, '2020-09-27', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'ISHA STEEL TREATMENT PRIVATE LIMITED- Ibis Vikhroli' LIMIT 1;

-- Project: Kanakia Hotels & Resorts Pvt Ltd- PROJECT COURTYARD MARRIOTT
ANDHERI : INDIAN RESTAURANT (VCDPL) — 5 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Kanakia Hotels & Resorts Pvt Ltd- PROJECT COURTYARD MARRIOTT
ANDHERI : INDIAN RESTAURANT', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Travel Expenses', 1, 28855, '10163', '2017-01-09', 28856, '2017-03-07', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Kanakia Hotels & Resorts Pvt Ltd- PROJECT COURTYARD MARRIOTT
ANDHERI : INDIAN RESTAURANT' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Schematic design- 250000
Design Development- 250000 (Should be 200000)', 2, 525000, '10188', '2017-06-27', 525000, '2017-09-17', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Kanakia Hotels & Resorts Pvt Ltd- PROJECT COURTYARD MARRIOTT
ANDHERI : INDIAN RESTAURANT' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Travel Expenses', 3, 62126, '10192', '2017-06-27', 62126, '2017-08-06', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Kanakia Hotels & Resorts Pvt Ltd- PROJECT COURTYARD MARRIOTT
ANDHERI : INDIAN RESTAURANT' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender Documentation- INR 100000
Tender Evaluation- INR 120000', 4, 237600, '10202', '2017-08-24', 237600, '2017-11-06', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Kanakia Hotels & Resorts Pvt Ltd- PROJECT COURTYARD MARRIOTT
ANDHERI : INDIAN RESTAURANT' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Testing and Commissioning', 5, 118800, '10229', '2018-01-09', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Kanakia Hotels & Resorts Pvt Ltd- PROJECT COURTYARD MARRIOTT
ANDHERI : INDIAN RESTAURANT' LIMIT 1;

-- Project: ITC Limited- Fabelle (VCDPL) — 3 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'ITC Limited- Fabelle', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'On Signing of agreement', 1, 94500, '10165', '2017-02-23', 93150, '2017-03-02', 'partial'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'ITC Limited- Fabelle' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Concept Design and Equiment Selection', 2, 105000, '10177', '2017-05-12', 103500, '2017-06-15', 'partial'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'ITC Limited- Fabelle' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Coordination for first module', 3, 10800, '10198', '2017-07-20', 10800, '2017-08-31', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'ITC Limited- Fabelle' LIMIT 1;

-- Project: Halton UK Travel Reimburseables (VCDPL) — 1 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Halton UK Travel Reimburseables', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Travel Expenses', 1, 369167, '10167', '2017-04-22', 369167, '2017-05-15', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Halton UK Travel Reimburseables' LIMIT 1;

-- Project: CARLSON HOTELS CDMA (VCDPL) — 2 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'CARLSON HOTELS CDMA', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Finder''s Fee', 1, 210000, '10169', '2017-01-26', 208940, '2017-02-02', 'partial'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'CARLSON HOTELS CDMA' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Finder''s Fee', 2, 250232.84999999998, '10181', '2017-05-19', 250232.85, '2017-05-29', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'CARLSON HOTELS CDMA' LIMIT 1;

-- Project: EIH Ltd- OFS (VCDPL) — 8 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'EIH Ltd- OFS', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Upon commencement of services', 1, 367500, '10170', '2017-04-11', 367500, '2017-04-23', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'EIH Ltd- OFS' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'CD', 2, 378000, '10184', '2017-07-31', 378000, '2017-08-01', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'EIH Ltd- OFS' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'SD', 3, 378000, '10199', '2017-07-31', 378000, '2017-08-22', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'EIH Ltd- OFS' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'DD', 4, 567000, '10200', '2017-07-31', 567000, '2017-09-04', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'EIH Ltd- OFS' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'TD', 5, 378000, '10201', '2017-07-31', 378000, '2017-09-18', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'EIH Ltd- OFS' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'TE', 6, 378000, '10287', '2019-01-08', 378000, '2019-02-07', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'EIH Ltd- OFS' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Services Provided During Construction', 7, 945000, '10295', '2019-04-02', 945000, '2019-04-28', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'EIH Ltd- OFS' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Testing and Commissioning', 8, 378000, '10305', '2020-02-11', 378000, '2020-02-14', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'EIH Ltd- OFS' LIMIT 1;

-- Project: Kanakia Hotels & Resorts Pvt Ltd- PROJECT COURTYARD MARRIOTT
ANDHERI : INDIAN RESTAURANT- Cancelled- Reraised as 10185 (VCDPL) — 1 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Kanakia Hotels & Resorts Pvt Ltd- PROJECT COURTYARD MARRIOTT
ANDHERI : INDIAN RESTAURANT- Cancelled- Reraised as 10185', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Upon commencement of services
Conceptual Design', 1, 388500, '10171', '2017-04-23', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Kanakia Hotels & Resorts Pvt Ltd- PROJECT COURTYARD MARRIOTT
ANDHERI : INDIAN RESTAURANT- Cancelled- Reraised as 10185' LIMIT 1;

-- Project: Reach Promoters Pvt Ltd (VCDPL) — 1 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Reach Promoters Pvt Ltd', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Developing detailed block loads
Design for food courts dish and pot wash, janitor''s closet and advise on food court service ops', 1, 514500, '10173', '2017-05-03', 514255, '2017-07-06', 'partial'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Reach Promoters Pvt Ltd' LIMIT 1;

-- Project: Kanakia Hotels & Resorts Pvt Ltd- PROJECT COURTYARD MARRIOTT
ANDHERI : INDIAN RESTAURANT (Reraised 10171) (VCDPL) — 1 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Kanakia Hotels & Resorts Pvt Ltd- PROJECT COURTYARD MARRIOTT
ANDHERI : INDIAN RESTAURANT (Reraised 10171)', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Commencement-120000
Conceptual Design- 250000', 1, 388500, '10185', '2017-04-23', 388500, '2017-07-03', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Kanakia Hotels & Resorts Pvt Ltd- PROJECT COURTYARD MARRIOTT
ANDHERI : INDIAN RESTAURANT (Reraised 10171)' LIMIT 1;

-- Project: DIANA BUILDWELL LIMITED- Regenerated Invoice 10138 (VCDPL) — 1 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'DIANA BUILDWELL LIMITED- Regenerated Invoice 10138', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Construction and Implementation', 1, 120750, '10187', '2017-06-25', 120750, '2017-08-18', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'DIANA BUILDWELL LIMITED- Regenerated Invoice 10138' LIMIT 1;

-- Project: RUPAL R.KANAKIA- Royal Manor F&B Design (VCDPL) — 2 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'RUPAL R.KANAKIA- Royal Manor F&B Design', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Design Consultancy Fees (50% of Total of INR 4,00,000)', 1, 209000, '10189', '2017-06-27', 210000, '2017-07-28', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RUPAL R.KANAKIA- Royal Manor F&B Design' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Design Consultancy Fees (50% of Total of INR 4,00,000)', 2, 216000, '10220', '2017-11-03', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RUPAL R.KANAKIA- Royal Manor F&B Design' LIMIT 1;

-- Project: R & H SPACES PVT LTD-Hyatt Place- (VCDPL) — 1 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'R & H SPACES PVT LTD-Hyatt Place-', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Design Consultancy Fee Hyatt Stilt Area', 1, 209000, '10190', '2017-06-27', 210000, '2017-07-28', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'R & H SPACES PVT LTD-Hyatt Place-' LIMIT 1;

-- Project: R & H SPACES PVT LTD-Hyatt Place- to be cancelled as sum of INR 8L raised between 10145 and 10190 (VCDPL) — 1 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'R & H SPACES PVT LTD-Hyatt Place- to be cancelled as sum of INR 8L raised between 10145 and 10190', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Design Consultancy Fee Hyatt Café Area', 1, 418000, '10191', '2017-06-27', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'R & H SPACES PVT LTD-Hyatt Place- to be cancelled as sum of INR 8L raised between 10145 and 10190' LIMIT 1;

-- Project: Belgravia (VCDPL) — 6 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Belgravia', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Advance', 1, 216000, '10196', '2017-07-13', 216000, '2017-08-16', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Belgravia' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Schematic Design', 2, 216000, '10207', '2017-08-22', 216000, '2017-09-21', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Belgravia' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Design Development', 3, 324000, '10215', '2017-09-17', 324000, NULL, 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Belgravia' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender Documentation', 4, 216000, '10215', '2017-09-17', 216000, '2017-10-17', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Belgravia' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender Evaluation    1,00,000
Service during Construction-   1,00,000', 5, 216000, '10256', '2018-05-13', 216000, '2018-06-04', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Belgravia' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Testing and Commissioning', 6, 108000, '10284', '2018-12-14', 108000, '2019-01-10', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Belgravia' LIMIT 1;

-- Project: Antara Purukul Senior  Living Ltd- Cancelled (VCDPL) — 2 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Antara Purukul Senior  Living Ltd- Cancelled', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Shorpayment for Tender Evaluation and Construction (Invoice 10108)', 1, 50552.64, '10204', '2017-08-20', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Antara Purukul Senior  Living Ltd- Cancelled' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Advance Adjustments', 2, 507600, '10205', '2017-08-20', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Antara Purukul Senior  Living Ltd- Cancelled' LIMIT 1;

-- Project: Bhartiya Leela (VCDPL) — 28 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Bhartiya Leela', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Schematic Design Stage (15% of INR 12,00,000)', 1, 194400, '10208', '2017-08-30', 194400, '2017-12-20', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Bhartiya Leela' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Design Development Stage (Hotel)', 2, 513000, '10277', '2018-09-19', 513000, '2018-11-19', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Bhartiya Leela' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Design Development Stage (Convention Centre)', 3, 243000, '10277', '2018-09-19', 243000, '2018-11-19', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Bhartiya Leela' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Design Development Stage (Branded Residence and Retail)', 4, 540000, '10277', '2018-09-19', 540000, '2018-11-19', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Bhartiya Leela' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Design Development (Black Swan)', 5, 270000, '10277', '2018-09-19', 270000, '2018-11-19', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Bhartiya Leela' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Construction Document (Hotel)', 6, 405000, '10288', '2019-01-10', 405000, '2019-02-25', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Bhartiya Leela' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Construction Documentation  (Convention Centre)', 7, 135000, '10288', '2019-01-10', 135000, '2019-02-25', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Bhartiya Leela' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Construction Administration Phase (Branded Residence and Retail)', 8, 270000, '10303', '2019-09-09', 270000, '2019-09-11', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Bhartiya Leela' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Construction Administration Phase (Branded Residence and Retail)', 9, 202500, '10303', '2019-09-09', 202500, '2019-09-11', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Bhartiya Leela' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Advance', 10, 226800, '10304', '2020-01-05', 453600, '2020-03-10', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Bhartiya Leela' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Updated Tender Drawings and Details', 11, 226800, '10304', '2020-01-05', 0, '2020-03-10', 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Bhartiya Leela' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Shop Drawing Approval Stage', 12, 151200, '10306', '2020-02-17', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Bhartiya Leela' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Construction Administration Phase  (Convention Centre)', 13, 67500, '10307', '2020-02-17', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Bhartiya Leela' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Construction Administration Stage', 14, 75600, '10327', '2021-10-31', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Bhartiya Leela' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Testing and Commissioning', 15, 75600, '10339', '2022-02-24', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Bhartiya Leela' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender Documentation Stage (Hotel)', 16, 267300, '10289-A', '2019-03-30', 267300, '2019-05-12', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Bhartiya Leela' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender Documentation  (Convention Centre)', 17, 89100, '10289-A', '2019-03-30', 89100, '2019-05-12', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Bhartiya Leela' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Construction Documentation (Branded Residence)', 18, 540000, '10289-A', '2019-03-30', 540000, '2019-05-12', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Bhartiya Leela' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender Documentation (Branded Residence and Retail)', 19, 356400, '10289-A', '2019-03-30', 356400, '2019-05-12', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Bhartiya Leela' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Construction Documentation (Black Swan)', 20, 270000, '10289-A', '2019-03-30', 270000, '2019-05-12', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Bhartiya Leela' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender Documentation (Black Swan)', 21, 178200, '10289-A', '2019-03-30', 178200, '2019-05-12', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Bhartiya Leela' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Construction Administration Phase (Black Swan)', 22, 135000, '10289-A', '2019-03-30', 135000, '2019-05-12', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Bhartiya Leela' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'ADVANCE FEES HOTEL & CONVENTION CENTRE @ 10% OF RS.43,00,000 = INR 430000
ADVANCE FEES BLACK SWAN @ 10% OF RS 12,00,000 = INR 120000', 23, 562980, '103/PI 24092012', '2012-09-23', 556182, '2012-10-03', 'partial'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Bhartiya Leela' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'SCHEMATIC Design Stage 15% BRANDED RESIDENCES of INR 4300000 (Part 1/3)', 24, 344758.716, '103PI100214', '2014-02-13', 652250, '2014-03-23', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Bhartiya Leela' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'SCHEMATIC Design Stage 15% HOTEL (4300000) (part 2/3)', 25, 242276.9076, '103PI100214 Repeat', '2014-02-13', 0, '2014-03-23', 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Bhartiya Leela' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Schematic Design 15% of Convention Centre (INR 4300000) (Part 3/3)', 26, 73168.1, '103PI100214 Repeat', '2014-02-13', 0, '2014-03-23', 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Bhartiya Leela' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Concept Design Stage 15% of INR 12,00,000', 27, 184248, '103PI180420131', '2013-04-07', 834273, '2013-05-15', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Bhartiya Leela' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Concept Design Stage 15% of INR 4300000', 28, 660222, '103PI180420132', '2013-04-07', 0, '2013-05-15', 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Bhartiya Leela' LIMIT 1;

-- Project: BAS House- The Delhi Guest Houses Pvt. Ltd (VCDPL) — 2 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'BAS House- The Delhi Guest Houses Pvt. Ltd', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Advance- INR 37500
Scematics- INR 37500', 1, 81000, '10211', '2017-09-14', 81000, '2017-09-25', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'BAS House- The Delhi Guest Houses Pvt. Ltd' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Design Development- INR 37500
Tender Documentation- INR 37500', 2, 81000, '10216', '2017-10-02', 81000, '2017-10-11', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'BAS House- The Delhi Guest Houses Pvt. Ltd' LIMIT 1;

-- Project: R & H SPACES PVT LTD- Courtyard Andheri/ Hyatt Place- Stilt- 10145 Reraised (VCDPL) — 1 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'R & H SPACES PVT LTD- Courtyard Andheri/ Hyatt Place- Stilt- 10145 Reraised', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Design Consultancy Fee Stilt and Café Areas', 1, 648000, '10213', '2017-09-13', 648000, NULL, 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'R & H SPACES PVT LTD- Courtyard Andheri/ Hyatt Place- Stilt- 10145 Reraised' LIMIT 1;

-- Project: EXXPEDYT INTEGRATED AMENITIES
PRIVATE LIMITED (VCDPL) — 2 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'EXXPEDYT INTEGRATED AMENITIES
PRIVATE LIMITED', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Advance', 1, 270000, '10217', '2017-10-24', 270000, '2017-11-01', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'EXXPEDYT INTEGRATED AMENITIES
PRIVATE LIMITED' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Design Consultancy- Part 2', 2, 270000, '10223', '2017-11-22', 270000, '2017-11-30', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'EXXPEDYT INTEGRATED AMENITIES
PRIVATE LIMITED' LIMIT 1;

-- Project: Kunal Structure India Pvt. Ltd- Leela Gandhinagar (VCDPL) — 3 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Kunal Structure India Pvt. Ltd- Leela Gandhinagar', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'On Commencement', 1, 810000, '10224', '2017-12-02', 810000, '2018-01-17', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Kunal Structure India Pvt. Ltd- Leela Gandhinagar' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Stage 1', 2, 810000, '10228', '2018-01-03', 810000, '2018-02-21', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Kunal Structure India Pvt. Ltd- Leela Gandhinagar' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender Documentation', 3, 1080000, '10259', '2018-05-31', 1080000, '2018-07-17', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Kunal Structure India Pvt. Ltd- Leela Gandhinagar' LIMIT 1;

-- Project: Belgravia Cancelled (VCDPL) — 3 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Belgravia Cancelled', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender Evaluation', 1, 108000, '10225', '2017-12-06', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Belgravia Cancelled' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Services Provided during Construction', 2, 108000, '10225', '2017-12-06', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Belgravia Cancelled' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Testing and Commissioning', 3, 108000, '10235', '2018-01-29', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Belgravia Cancelled' LIMIT 1;

-- Project: COSMOS BUILDWELL PVT LTD- Barwara- Cancelled (VCDPL) — 2 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'COSMOS BUILDWELL PVT LTD- Barwara- Cancelled', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Final Plans and Tender (HOH+FOH) (=314663+ 125337)', 1, 475200, '10231', '2018-01-10', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'COSMOS BUILDWELL PVT LTD- Barwara- Cancelled' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Construction Support (HOH+FOH) (78666+31334)', 2, 118800, '10231', '2018-01-10', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'COSMOS BUILDWELL PVT LTD- Barwara- Cancelled' LIMIT 1;

-- Project: THEOBROMA FOODS PVT LTD MUMBAI- TCPK- Cancelled (VCDPL) — 1 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'THEOBROMA FOODS PVT LTD MUMBAI- TCPK- Cancelled', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Testing, Commissioning and Hand Over 10%', 1, 216000, '10232', '2018-01-11', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'THEOBROMA FOODS PVT LTD MUMBAI- TCPK- Cancelled' LIMIT 1;

-- Project: Oberoi Bandhavgarh (VCDPL) — 6 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Oberoi Bandhavgarh', 'Unknown', 0, 'active'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Upon Commencement of Services', 1, 162000, '10233', '2018-01-22', 162000, '2018-02-06', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Oberoi Bandhavgarh' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Conceptual Design', 2, 108000, '10240', '2018-03-31', 108000, '2018-04-04', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Oberoi Bandhavgarh' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Schematic Design', 3, 162000, '10266', '2018-07-02', 162000, '2018-07-15', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Oberoi Bandhavgarh' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Design Development', 4, 324000, '10280', '2018-10-05', 324000, '2018-10-14', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Oberoi Bandhavgarh' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender Documentation', 5, 162000, '10294', '2019-04-02', 162000, '2019-04-24', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Oberoi Bandhavgarh' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender Evlauation', 6, 162000, '10312', '2020-11-22', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Oberoi Bandhavgarh' LIMIT 1;

-- Project: Espire Resorts Fort Barwada (VCDPL) — 7 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Espire Resorts Fort Barwada', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender Documentation- A', 1, 540000, '10241', '2018-03-31', 540000, '2018-04-19', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Espire Resorts Fort Barwada' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender Documentation- B', 2, 378000, '10253', '2018-04-15', 0, '2018-05-18', 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Espire Resorts Fort Barwada' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender Documentation- C', 3, 54000, '10255', '2018-05-04', 0, '2018-05-16', 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Espire Resorts Fort Barwada' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender Documentation- D', 4, 27000, '10258', '2018-05-16', 0, '2018-08-12', 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Espire Resorts Fort Barwada' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender Documentation- E', 5, 27000, '10258', '2018-05-16', 0, '2018-08-12', 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Espire Resorts Fort Barwada' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Construction Support- FOH', 6, 27000, NULL, '2018-08-20', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Espire Resorts Fort Barwada' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Construction Support- HOH', 7, 27000, NULL, '2018-08-20', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Espire Resorts Fort Barwada' LIMIT 1;

-- Project: DLF YPCC (VCDPL) — 4 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'DLF YPCC', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender Evaluation (5%)', 1, 162000, '10269', '2018-07-08', 162000, '2018-07-05', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'DLF YPCC' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Completion of Construction (5%)', 2, 162000, '10269', '2018-07-08', 162000, '2018-07-05', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'DLF YPCC' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Receipt of Occupation Certificate (5%)', 3, 162000, '10269', '2018-07-08', 162000, '2018-07-05', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'DLF YPCC' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Construction Document', 4, 472500, '10005/17/02/17', '2017-02-16', 472050, '2017-04-24', 'partial'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'DLF YPCC' LIMIT 1;

-- Project: Oberoi Bandhavgarh - Cancelled (VCDPL) — 1 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Oberoi Bandhavgarh - Cancelled', 'Unknown', 0, 'active'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender Documentation', 1, 0, '10270', '2018-07-17', 0, NULL, 'pending'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Oberoi Bandhavgarh - Cancelled' LIMIT 1;

-- Project: RIL DAICEC L05 and Clubhouse (VCDPL) — 10 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'RIL DAICEC L05 and Clubhouse', 'Unknown', 0, 'active'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Completion of Schematic Design (25% of INR 81,28,590)', 1, 2193639.8400000003, '10278', '2018-09-10', 0, '2019-01-22', 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC L05 and Clubhouse' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Completion of Design Development 30% (20% of 8128590)', 2, 526732.632, '10332', '2021-12-16', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC L05 and Clubhouse' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Completion of Design Development 70% (20% of 8128590)', 3, 1229042.16, '2023005', '2023-04-20', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC L05 and Clubhouse' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Completion of Tender Documents (10%)', 4, 877887.72, '2023017', '2023-07-10', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC L05 and Clubhouse' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Completion of Construction Document -50% (15% of INR 8128590)', 5, 658415.7899999999, '2023025', '2023-11-01', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC L05 and Clubhouse' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Completion of Construction Document -50% (15% of INR 8128590)', 6, 609644.25, '2024019', '2024-12-10', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC L05 and Clubhouse' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Completion of Tender Review (15% of 8128590)', 7, 1316831.5799999998, '2024021', '2024-12-10', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC L05 and Clubhouse' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Completion of Shop Drawing Review 5%', 8, 438943.86, '2024022', '2024-12-10', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC L05 and Clubhouse' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Completion of Construction Administration 10% (90% of stage)', 9, 1107908.3879999998, '26017', '2025-10-30', 923255, '2025-12-16', 'partial'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC L05 and Clubhouse' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Completion of Construction Administration 10%', 10, 81285.90000000001, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC L05 and Clubhouse' LIMIT 1;

-- Project: The Park Hyatt Goa, Daffodil Hotels (VCDPL) — 7 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'The Park Hyatt Goa, Daffodil Hotels', 'Unknown', 0, 'active'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Upon Commencement of Services', 1, 464100, '10311', '2020-08-03', 464100, '2020-08-06', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'The Park Hyatt Goa, Daffodil Hotels' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Schematic Design 50%', 2, 302400, '10317', '2021-05-04', 302400, '2021-05-26', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'The Park Hyatt Goa, Daffodil Hotels' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Schematic Design 50%', 3, 280000, '2023006', '2023-04-24', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'The Park Hyatt Goa, Daffodil Hotels' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Design Development', 4, 756000, '2023021', '2023-09-12', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'The Park Hyatt Goa, Daffodil Hotels' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Award of Tender', 5, 302400, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'The Park Hyatt Goa, Daffodil Hotels' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Commissioning and Hand Over', 6, 302400, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'The Park Hyatt Goa, Daffodil Hotels' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender Documentation', 7, 604800, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'The Park Hyatt Goa, Daffodil Hotels' LIMIT 1;

-- Project: RIL DAICEC New Areas 2020 (VCDPL) — 3 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'RIL DAICEC New Areas 2020', 'Unknown', 0, 'active'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Part Invoice (80%)', 1, 908000, '10315', '2021-03-09', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC New Areas 2020' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Total', 2, 1135186, 'raised', NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC New Areas 2020' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Balance', 3, 227186, '2024023', '2024-12-10', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC New Areas 2020' LIMIT 1;

-- Project: Khanseng Central Laundry (VCDPL) — 8 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Khanseng Central Laundry', 'Unknown', 0, 'active'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Upon Commencement of Services', 1, 176800, '10318', '2021-06-24', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Khanseng Central Laundry' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.1   Conceptual Design', 2, 176800, '10323', '2021-09-15', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Khanseng Central Laundry' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.2   Schematic Design', 3, 132600, '10323', '2021-09-15', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Khanseng Central Laundry' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.3   Design Development', 4, 132600, '10323', '2021-09-15', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Khanseng Central Laundry' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.4   Tender Documentation', 5, 88400, '220014', '2022-10-31', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Khanseng Central Laundry' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.5   Tender Evaluation', 6, 88400, '2023013', '2023-06-16', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Khanseng Central Laundry' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.6   Services Provided during Construction', 7, 44200, '2024006', '2024-05-12', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Khanseng Central Laundry' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.7    Testing & Commissioning', 8, 44200, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Khanseng Central Laundry' LIMIT 1;

-- Project: Anaiah Constructions - Devanya Hills (VCDPL) — 4 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Anaiah Constructions - Devanya Hills', 'Unknown', 0, 'active'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Upon Commencement of Services', 1, 309400, '10320', '2021-08-17', 302400, '2021-08-19', 'partial'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Anaiah Constructions - Devanya Hills' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.1   Conceptual Design - 75% of 140000', 2, 116025, '10336', '2022-02-13', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Anaiah Constructions - Devanya Hills' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.2   Schematic Design - 75% of 140000', 3, 800405.2913999999, '220010', '2022-08-19', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Anaiah Constructions - Devanya Hills' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.3   Design Development - 75% of INR 2,80,000', 4, 232050, '220013', '2022-10-05', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Anaiah Constructions - Devanya Hills' LIMIT 1;

-- Project: RIL DAICEC A3 Indian Accent (VCDPL) — 10 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'RIL DAICEC A3 Indian Accent', 'Unknown', 0, 'active'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '1.      Concept Stage', 1, 149281.8200625, '10337', '2022-02-17', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC A3 Indian Accent' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'a.       Schematic Stage', 2, 149281.8200625, '220002', '2022-04-01', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC A3 Indian Accent' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'b.      Detailed Design Stage', 3, 199042.42675, '220003', '2022-04-19', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC A3 Indian Accent' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'c.       Tender Documentation Stage', 4, 199042.42675, '220008', '2022-07-01', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC A3 Indian Accent' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'a.       Tender Evaluation & Shop Drawing Approval', 5, 149281.8200625, '2023004', '2023-04-20', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC A3 Indian Accent' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'a.       Coordination & Construction Support', 6, 74640.91003125, '2023004', '2023-04-20', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC A3 Indian Accent' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'b. Testing & Commissioning', 7, 74640.91003125, '2023016', '2023-07-03', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC A3 Indian Accent' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '2.      Design Stage', 8, 0, NULL, NULL, 0, NULL, 'pending'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC A3 Indian Accent' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.      Pre construction & Coordination Stage', 9, 0, NULL, NULL, 0, NULL, 'pending'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC A3 Indian Accent' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '4.      Construction Phase', 10, 0, NULL, NULL, 0, NULL, 'pending'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC A3 Indian Accent' LIMIT 1;

-- Project: RIL DAICEC A4 FOI (VCDPL) — 8 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'RIL DAICEC A4 FOI', 'Unknown', 0, 'active'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '1.      Concept Stage', 1, 782296.5743999998, '10338', '2022-02-17', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC A4 FOI' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'a.       Schematic Stage', 2, 724348.6799999998, '220009', '2022-07-01', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC A4 FOI' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'b.      Detailed Design Stage', 3, 1043062.0991999998, '220012', '2022-09-05', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC A4 FOI' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Revit', 4, 950000, '2023002', '2023-04-20', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC A4 FOI' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'c.       Tender Documentation Stage', 5, 1043062.0991999998, '2023010', '2023-05-31', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC A4 FOI' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '2.      Design Stage', 6, 0, NULL, NULL, 0, NULL, 'pending'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC A4 FOI' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.      Pre construction & Coordination Stage', 7, 0, NULL, NULL, 0, NULL, 'pending'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC A4 FOI' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '4.      Construction Phase', 8, 0, NULL, NULL, 0, NULL, 'pending'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC A4 FOI' LIMIT 1;

-- Project: Delhi Golf Club  M/S Juneja (VCDPL) — 1 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Delhi Golf Club  M/S Juneja', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Upon Commencement', 1, 110500, '10321', '2021-08-31', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Delhi Golf Club  M/S Juneja' LIMIT 1;

-- Project: RIL DAICEC A1 - VIP Lounge Pantry, Mall Mgt Office Canteen, Personal Shopper, 3rd Floor Grab and Go, Arts Café) (VCDPL) — 14 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'RIL DAICEC A1 - VIP Lounge Pantry, Mall Mgt Office Canteen, Personal Shopper, 3rd Floor Grab and Go, Arts Café)', 'Unknown', 0, 'active'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '1.      Concept Stage', 1, 196940.1280117333, '220004', '2022-04-30', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC A1 - VIP Lounge Pantry, Mall Mgt Office Canteen, Personal Shopper, 3rd Floor Grab and Go, Arts Café)' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'a.       Schematic Stage', 2, 196940.1280117333, '220004', '2022-04-30', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC A1 - VIP Lounge Pantry, Mall Mgt Office Canteen, Personal Shopper, 3rd Floor Grab and Go, Arts Café)' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'b.      Detailed Design Stage', 3, 262586.8373489777, '220004', '2022-04-30', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC A1 - VIP Lounge Pantry, Mall Mgt Office Canteen, Personal Shopper, 3rd Floor Grab and Go, Arts Café)' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'c.       Tender Documentation Stage without 3rd floor café', 4, 139171.02379495834, '2023011', '2023-05-31', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC A1 - VIP Lounge Pantry, Mall Mgt Office Canteen, Personal Shopper, 3rd Floor Grab and Go, Arts Café)' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'a.       Tender Evaluation & Shop Drawing Approval- without third floor café', 5, 104378.2678462185, '2023026', '2023-11-01', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC A1 - VIP Lounge Pantry, Mall Mgt Office Canteen, Personal Shopper, 3rd Floor Grab and Go, Arts Café)' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'a.       Coordination & Construction Support- without third floor café', 6, 52189.1339231093, '2023026', '2023-11-01', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC A1 - VIP Lounge Pantry, Mall Mgt Office Canteen, Personal Shopper, 3rd Floor Grab and Go, Arts Café)' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'b. Testing & Commissioning - Without third floor café', 7, 52189.1339231093, '2023026', '2023-11-01', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC A1 - VIP Lounge Pantry, Mall Mgt Office Canteen, Personal Shopper, 3rd Floor Grab and Go, Arts Café)' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'c.       Tender Documentation Stage- third floor café', 8, 123416, '204024', '2024-12-10', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC A1 - VIP Lounge Pantry, Mall Mgt Office Canteen, Personal Shopper, 3rd Floor Grab and Go, Arts Café)' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'a.       Tender Evaluation & Shop Drawing Approval- third floor café', 9, 92562, '204024', '2024-12-10', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC A1 - VIP Lounge Pantry, Mall Mgt Office Canteen, Personal Shopper, 3rd Floor Grab and Go, Arts Café)' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'a.       Coordination & Construction Support- third floor café', 10, 46281, '204024', '2024-12-10', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC A1 - VIP Lounge Pantry, Mall Mgt Office Canteen, Personal Shopper, 3rd Floor Grab and Go, Arts Café)' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'b. Testing & Commissioning - Third Floor Café', 11, 46281, '204024', '2024-12-10', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC A1 - VIP Lounge Pantry, Mall Mgt Office Canteen, Personal Shopper, 3rd Floor Grab and Go, Arts Café)' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '2.      Design Stage', 12, 0, NULL, NULL, 0, NULL, 'pending'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC A1 - VIP Lounge Pantry, Mall Mgt Office Canteen, Personal Shopper, 3rd Floor Grab and Go, Arts Café)' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.      Pre construction & Coordination Stage', 13, 0, NULL, NULL, 0, NULL, 'pending'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC A1 - VIP Lounge Pantry, Mall Mgt Office Canteen, Personal Shopper, 3rd Floor Grab and Go, Arts Café)' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '4.      Construction Phase', 14, 0, NULL, NULL, 0, NULL, 'pending'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC A1 - VIP Lounge Pantry, Mall Mgt Office Canteen, Personal Shopper, 3rd Floor Grab and Go, Arts Café)' LIMIT 1;

-- Project: Delhi Golf Club (VCDPL) — 5 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Delhi Golf Club', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Conceptual & Schematic Design', 1, 88400, '10324', '2021-09-30', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Delhi Golf Club' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Design development', 2, 55250, '10324', '2021-09-30', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Delhi Golf Club' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Testing & Commissioning', 3, 22100, '10324', '2021-09-30', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Delhi Golf Club' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender Documentation & Tender Evaluation', 4, 55250, '10325', '2021-09-30', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Delhi Golf Club' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Upon Commencement of Services', 5, 110500, '10328', '2021-12-11', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Delhi Golf Club' LIMIT 1;

-- Project: Anantam Residence (VCDPL) — 5 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Anantam Residence', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'a) Completion of Schematic Design - Rs. 5.7 Lakh + GST', 1, 629850, '10329', '2021-10-15', 855000, '2021-11-17', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Anantam Residence' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'b) Completion of Design Development - Rs. 3.8 Lakh + GST', 2, 419900, '10329', '2021-10-15', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Anantam Residence' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'c) Completion of Construction Document - Rs. 3.8 Lakh + GST', 3, 419900, '10330', '2021-12-08', 439432, '2021-12-20', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Anantam Residence' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'd) Completion of Tender Document & Tender Review - Rs. 3.8 Lakh + GST', 4, 419900, '10335', '2022-02-11', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Anantam Residence' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'e) Completion of Construction Administation & As built Drawing - Rs. 1.9 Lakh + GST', 5, 209950, '220006', '2022-07-01', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Anantam Residence' LIMIT 1;

-- Project: Holymont Udaipur- Maya Hill Resorts (VCDPL) — 8 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Holymont Udaipur- Maya Hill Resorts', 'Unknown', 0, 'active'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Upon Commencement of Services', 1, 604800, '10313', '2020-12-23', 604800, '2020-12-29', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Holymont Udaipur- Maya Hill Resorts' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Conceptual Design', 2, 604800, '10316', '2021-03-22', 604800, '2021-03-23', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Holymont Udaipur- Maya Hill Resorts' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Schematic Design', 3, 453600, '10316', '2021-03-22', 453600, '2021-03-23', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Holymont Udaipur- Maya Hill Resorts' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Design Development', 4, 464100, '10326-1  Cancelled', '2021-10-31', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Holymont Udaipur- Maya Hill Resorts' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender Documentation', 5, 309400, '10326-1  Cancelled', '2021-10-31', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Holymont Udaipur- Maya Hill Resorts' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender Evaluation', 6, 309400, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Holymont Udaipur- Maya Hill Resorts' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Services Provided during Construction', 7, 154700, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Holymont Udaipur- Maya Hill Resorts' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Testing & Commissioning', 8, 154700, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Holymont Udaipur- Maya Hill Resorts' LIMIT 1;

-- Project: RIL DAICEC A2 Shimmer (VCDPL) — 4 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'RIL DAICEC A2 Shimmer', 'Unknown', 0, 'active'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '1.      Concept Stage', 1, 838069.6401423094, '220005', '2022-05-03', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC A2 Shimmer' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '2.      Design Stage', 2, 0, NULL, NULL, 0, NULL, 'pending'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC A2 Shimmer' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.      Pre construction & Coordination Stage', 3, 0, NULL, NULL, 0, NULL, 'pending'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC A2 Shimmer' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '4.      Construction Phase', 4, 0, NULL, NULL, 0, NULL, 'pending'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL DAICEC A2 Shimmer' LIMIT 1;

-- Project: Anantam Residence- Reworks (VCDPL) — 1 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Anantam Residence- Reworks', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Reworks', 1, 1215500, '220001', '2022-04-01', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Anantam Residence- Reworks' LIMIT 1;

-- Project: Suryagarh Phase 1 (VCDPL) — 12 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Suryagarh Phase 1', 'Unknown', 0, 'active'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Upon Commencement of Services', 1, 315000, '220017', '2023-02-12', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Suryagarh Phase 1' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '15.1 Conceptual Design', 2, 315000, '2023012', '2023-06-15', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Suryagarh Phase 1' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '15.2 Schematic Design', 3, 315000, '2023012', '2023-06-15', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Suryagarh Phase 1' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '15.3 Design Development', 4, 420000, '2023019', '2023-09-06', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Suryagarh Phase 1' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '15.6 Services Provided during Construction (25% - Laundry)', 5, 28350, '26025', '2026-03-15', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Suryagarh Phase 1' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '15.7 Testing & Commissioning (25% - Laundry)', 6, 28350, '26025', '2026-03-15', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Suryagarh Phase 1' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '15.4 Tender Documentation (25% - Laundry)', 7, 85050, '26025', '2026-03-15', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Suryagarh Phase 1' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '15.5 Tender Evaluation (25% - Laundry)', 8, 56700, '26025', '2026-03-15', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Suryagarh Phase 1' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '15.4 Tender Documentation (75% Balance)', 9, 236250, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Suryagarh Phase 1' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '15.5 Tender Evaluation (75% Balance)', 10, 157500, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Suryagarh Phase 1' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '15.6 Services Provided during Construction (75% Balance)', 11, 78750, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Suryagarh Phase 1' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '15.7 Testing & Commissioning (75% Balance)', 12, 78750, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Suryagarh Phase 1' LIMIT 1;

-- Project: Suryagarh Phase 2 (VCDPL) — 3 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Suryagarh Phase 2', 'Unknown', 0, 'active'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Upon Commencement of Services', 1, 255000, '220017', '2023-02-12', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Suryagarh Phase 2' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '15.1 Conceptual Design', 2, 255000, '2023012', '2023-06-15', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Suryagarh Phase 2' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '15.2 Schematic Design', 3, 275400, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Suryagarh Phase 2' LIMIT 1;

-- Project: RIL 2022 Areas Charges for providing additional Consultancy services IOC Pantry,Wedding
Concierge, Fountain of Joy- Food Carts Experience Centre,Arts Café Additional
Areas,Theatre Café Pantry & Support (VCDPL) — 1 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'RIL 2022 Areas Charges for providing additional Consultancy services IOC Pantry,Wedding
Concierge, Fountain of Joy- Food Carts Experience Centre,Arts Café Additional
Areas,Theatre Café Pantry & Support', 'Unknown', 0, 'active'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Comprehensive', 1, 262920, '2023003', '2023-04-20', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL 2022 Areas Charges for providing additional Consultancy services IOC Pantry,Wedding
Concierge, Fountain of Joy- Food Carts Experience Centre,Arts Café Additional
Areas,Theatre Café Pantry & Support' LIMIT 1;

-- Project: Anantam Residence - Offsite Laundry (VCDPL) — 5 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Anantam Residence - Offsite Laundry', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Schematic Layouts & Lists', 1, 82875, '220011', '2022-09-05', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Anantam Residence - Offsite Laundry' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Detailed Design', 2, 82875, '220011', '2022-09-05', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Anantam Residence - Offsite Laundry' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Construction Documenation', 3, 82875, '220011', '2022-09-05', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Anantam Residence - Offsite Laundry' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender Review', 4, 55250, '2023015', '2023-07-03', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Anantam Residence - Offsite Laundry' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Construction Administration', 5, 27625, '2023015', '2023-07-03', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Anantam Residence - Offsite Laundry' LIMIT 1;

-- Project: Cravin by Andy (VCDPL) — 4 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Cravin by Andy', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Upon Commencement of Services', 1, 225000, '220016', '2023-01-16', 0, '2023-01-17', 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Cravin by Andy' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Conceptual Design', 2, 75000, '2023001', '2023-04-20', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Cravin by Andy' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Schematic Design', 3, 100000, '2023001', '2023-04-20', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Cravin by Andy' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Design Development & Specifications Document', 4, 100000, '2023009', NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Cravin by Andy' LIMIT 1;

-- Project: Gangaram Hospital (VCDPL) — 6 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Gangaram Hospital', 'Unknown', 0, 'active'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'On submission of Project Brief for Kitchen planning & MEP', 1, 300000, '2023014', '2023-07-02', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Gangaram Hospital' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Schematic Design', 2, 300000, '2023018', '2023-08-02', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Gangaram Hospital' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Design Development and MEP Drawing Phase', 3, 450000, '2023022', '2023-10-01', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Gangaram Hospital' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender Documentation', 4, 250000, '2023023', '2023-10-22', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Gangaram Hospital' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Services Provided During Construction: Prorated monthly within 3 months post evaluation', 5, 75000, '2024030', '2025-02-12', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Gangaram Hospital' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender Evlauation', 6, 200000, '2024030', '2025-02-12', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Gangaram Hospital' LIMIT 1;

-- Project: Armani Café Reliance Brands (VCDPL) — 8 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Armani Café Reliance Brands', 'Unknown', 0, 'active'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Upon Commencement of Services', 1, 120000, '2023020', '2023-09-06', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Armani Café Reliance Brands' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.1 Conceptual Design', 2, 120000, '2023020', '2023-09-06', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Armani Café Reliance Brands' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.2 Schematic Design', 3, 160000, '2023020', '2023-09-06', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Armani Café Reliance Brands' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.3 Design Development', 4, 160000, '2023020', '2023-09-06', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Armani Café Reliance Brands' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.4 Tender Documentation', 5, 80000, '2023020', '2023-09-06', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Armani Café Reliance Brands' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.5 Tender Evaluation', 6, 80000, '2023030', '2024-02-01', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Armani Café Reliance Brands' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.6 Services Provided during Construction', 7, 40000, '2023030', '2024-02-01', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Armani Café Reliance Brands' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.7 Testing & Commissioning', 8, 40000, '2024013', '2024-09-09', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Armani Café Reliance Brands' LIMIT 1;

-- Project: Anantam Phase 2 (VCDPL) — 5 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Anantam Phase 2', 'Unknown', 0, 'active'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Completion and approval of concept design', 1, 240603, '2023024', '2023-10-31', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Anantam Phase 2' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Completion and approval of Detailed design', 2, 160402, '2023024', '2023-10-31', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Anantam Phase 2' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'On completion of tender document and tender
review', 3, 32080, '2024003', '2024-04-09', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Anantam Phase 2' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Completion and approval of Construction documents', 4, 160402, '2024003', '2024-04-09', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Anantam Phase 2' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'On completion of construction administration and as
built drawings', 5, 86617.07999999999, '26015', '2025-10-13', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Anantam Phase 2' LIMIT 1;

-- Project: ACSA (VCDPL) — 5 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'ACSA', 'Unknown', 0, 'active'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Upon Commencement of Services', 1, 436397, '2023027', '2023-11-13', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'ACSA' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Pre-Concept Stage- On submission of as built drawing', 2, 436397, '2023029', '2024-01-17', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'ACSA' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'On submission of three options of Conceptual Design', 3, 872794, '2023029', '2024-01-17', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'ACSA' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Schematic Design', 4, 1309242, '2023033', '2024-02-20', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'ACSA' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'On submission of final revisions', 5, 436397, '2024010', '2024-07-31', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'ACSA' LIMIT 1;

-- Project: EL&N Reliance Brands (VCDPL) — 5 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'EL&N Reliance Brands', 'Unknown', 0, 'active'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Upon Commencement of Services', 1, 112500, '2023028', '2023-12-15', 0, '2024-01-22', 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'EL&N Reliance Brands' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.1   Conceptual Design', 2, 112500, '2023028', '2023-12-15', 0, '2024-01-22', 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'EL&N Reliance Brands' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.2   Schematic Design', 3, 112500, '2023028', '2023-12-15', 0, '2024-01-22', 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'EL&N Reliance Brands' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.3   Design Development', 4, 150000, '2023028', '2023-12-15', 0, '2024-01-22', 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'EL&N Reliance Brands' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.4   Tender Documentation', 5, 112500, '2023028', '2023-12-15', 0, '2024-01-22', 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'EL&N Reliance Brands' LIMIT 1;

-- Project: Suryagarh Enhancement (VCDPL) — 10 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Suryagarh Enhancement', 'Unknown', 0, 'active'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'CONCEPTUAL DESIGN 1,75,000', 1, 175000, '2023032', '2024-02-18', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Suryagarh Enhancement' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'SCHEMATIC DESIGN 1,75,000', 2, 175000, '2024004', '2024-04-30', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Suryagarh Enhancement' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'DETAILED DESIGN 2,50,000 (50% for Roma)', 3, 125000, '2024004', '2024-04-30', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Suryagarh Enhancement' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'TENDER DOCUMENTATION 1,75,000 (50% for Roma)', 4, 87500, '2024004', '2024-04-30', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Suryagarh Enhancement' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'TENDER EVALUATION 1,25,000 (50% for Roma)', 5, 62500, '2024011', '2024-07-31', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Suryagarh Enhancement' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'DETAILED DESIGN 2,50,000 (50% for Granary)', 6, 125000, '2024014', '2024-11-01', 0, '2025-02-18', 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Suryagarh Enhancement' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'TENDER DOCUMENTATION 1,75,000 (50% for Granary)', 7, 87500, '2024014', '2024-11-01', 0, '2025-02-18', 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Suryagarh Enhancement' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'TENDER EVALUATION 1,25,000  (50% for Granary)', 8, 67500, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Suryagarh Enhancement' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'SERVICES PROVIDED DURING CONSTRUCTION 50,000', 9, 54000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Suryagarh Enhancement' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'TESTING & COMMISSIONING 50,000', 10, 54000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Suryagarh Enhancement' LIMIT 1;

-- Project: Veer Health Services (VCDPL) — 2 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Veer Health Services', 'Unknown', 0, 'completed'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Phase 1 Schematic Design @25% of INR 25L
Phase 2 Preliminary Design @ 20% of INR 25L', 1, 1128375, '85/05032012', '2012-03-04', 1116787, '2012-04-15', 'partial'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Veer Health Services' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Invoice for Advance', 2, 626875, '85/12012011', '2011-01-11', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Veer Health Services' LIMIT 1;

-- Project: Anantam Phase 3 (VCDPL) — 5 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Anantam Phase 3', 'Unknown', 0, 'active'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'On approval of Schematic Layouts & Lists', 1, 97000, '2024002', '2024-04-09', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Anantam Phase 3' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'On approval of Detailed Design', 2, 97000, '2024002', '2024-04-09', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Anantam Phase 3' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'On approval of Construction Documentation', 3, 97000, '2024002', '2024-04-09', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Anantam Phase 3' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'On completion of Tender Review', 4, 58200, '2024002', '2024-04-09', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Anantam Phase 3' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'On completion of Construction Administration', 5, 41904, '26016', '2025-10-13', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Anantam Phase 3' LIMIT 1;

-- Project: Andvel Hotel Congo (VCDPL) — 4 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Andvel Hotel Congo', 'Unknown', 0, 'active'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.1   Conceptual Design', 1, 243540, '2024007', '2023-05-12', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Andvel Hotel Congo' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.2   Schematic Design', 2, 243540, '2024012', '2024-09-09', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Andvel Hotel Congo' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Upon Commencement of Services', 3, 270600, 'raised', NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Andvel Hotel Congo' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.3   Design Development', 4, 287100, 'raised', NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Andvel Hotel Congo' LIMIT 1;

-- Project: Andvel Hotel Congo Enhancement (VCDPL) — 2 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Andvel Hotel Congo Enhancement', 'Unknown', 0, 'active'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Conceptual Design (Redesign Works)', 1, 108750, '2024012', '2024-09-09', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Andvel Hotel Congo Enhancement' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Schematic Design', 2, 30450, '2024012', '2024-09-09', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Andvel Hotel Congo Enhancement' LIMIT 1;

-- Project: Citrus Cunningham (VCDPL) — 9 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Citrus Cunningham', 'Unknown', 0, 'active'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Upon Commencement of Services', 1, 280000, '2024015', '2024-11-08', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Citrus Cunningham' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Schematic Design - 50%', 2, 113400, '26008', '2025-06-22', 193500, '2025-07-29', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Citrus Cunningham' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Conceptual Design', 3, 280000, '2024029', '2025-02-11', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Citrus Cunningham' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Design Development', 4, 226800, '26022', '2026-02-09', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Citrus Cunningham' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Schematic Design - 50%', 5, 113400, '26022', '2026-02-09', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Citrus Cunningham' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender Documentation', 6, 151200, '26023', '2026-03-02', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Citrus Cunningham' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender Evaluation', 7, 151200, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Citrus Cunningham' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Services provided during construction', 8, 75600, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Citrus Cunningham' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Testing & Commissioning', 9, 75600, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Citrus Cunningham' LIMIT 1;

-- Project: Ananda Portugal (VCDPL) — 9 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Ananda Portugal', 'Unknown', 0, 'active'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.1 Conceptual Design', 1, 583200, '26001', '2025-04-10', 583200, '2025-04-16', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Ananda Portugal' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.2 Schematic Design', 2, 437400, '26005', '2025-04-30', 437400, '2025-05-14', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Ananda Portugal' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Upon Commencement of Services', 3, 405000, '2024032', '2024-02-19', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Ananda Portugal' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.3 Design Development', 4, 437400, '26014', '2025-09-04', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Ananda Portugal' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'DD Balance', 5, 14868, '26017', '2025-10-12', 13608, '2025-12-14', 'partial'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Ananda Portugal' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.4 Tender Documentation', 6, 405000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Ananda Portugal' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.5 Tender Evaluation', 7, 270000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Ananda Portugal' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.6 Services Provided during Construction', 8, 135000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Ananda Portugal' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.7 Testing & Commissioning', 9, 135000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Ananda Portugal' LIMIT 1;

-- Project: Durlabh Niwas (VCDPL) — 8 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Durlabh Niwas', 'Unknown', 0, 'active'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.1 Conceptual Design', 1, 140400, '26002', '2025-04-11', 140400, '2025-07-20', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Durlabh Niwas' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Upon Commencement of Services', 2, 130000, '2024026', '2025-01-01', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Durlabh Niwas' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.2 Schematic Design', 3, 105300, '26010', '2025-07-04', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Durlabh Niwas' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.3 Design Development', 4, 105300, '26015', '2025-09-10', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Durlabh Niwas' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.4 Tender Documentation', 5, 70200, '26018', '2025-12-01', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Durlabh Niwas' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.5 Tender Evaluation', 6, 35100, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Durlabh Niwas' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.6 Services Provided during Construction', 7, 35100, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Durlabh Niwas' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.7 Testing & Commissioning', 8, 70200, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Durlabh Niwas' LIMIT 1;

-- Project: Bokkapatana Hotel (VCDPL) — 8 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Bokkapatana Hotel', 'Unknown', 0, 'active'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Upon Commencement of Services', 1, 360000, '2024015', '2024-11-08', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Bokkapatana Hotel' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Conceptual Design', 2, 360000, '2024025', '2024-12-20', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Bokkapatana Hotel' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Design Development', 3, 291600, '26006', '2025-05-09', 291600, '2025-07-22', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Bokkapatana Hotel' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Schematic Design', 4, 270000, '2024031', NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Bokkapatana Hotel' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender Evaluation', 5, 180000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Bokkapatana Hotel' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Services provided during construction', 6, 90000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Bokkapatana Hotel' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Testing & Commissioning', 7, 90000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Bokkapatana Hotel' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender Documentation', 8, 194400, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Bokkapatana Hotel' LIMIT 1;

-- Project: RIL Central Laundry (VCDPL) — 7 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'RIL Central Laundry', 'Unknown', 0, 'active'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Upon Commencement of Services- 70000.00', 1, 70000, '2024017', '2024-11-25', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL Central Laundry' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '1. Conceptual Design- 52500.00', 2, 52500, '2024017', '2024-11-25', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL Central Laundry' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '2. Schematic Design- 52500.00', 3, 52500, '2024018', '2024-11-25', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL Central Laundry' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3. Design Development- 70000.00', 4, 70000, '2024018', '2024-11-25', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL Central Laundry' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Enhancement', 5, 162000, '26008', '2025-07-22', 0, '2025-09-16', 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL Central Laundry' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '5. Tender Evaluation- 35000.00', 6, 37800, '26009', '2025-07-22', 0, '2025-09-16', 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL Central Laundry' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '4. Tender Documentation- 35000.00', 7, 37800, '26009', '2025-07-22', 0, '2025-09-21', 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL Central Laundry' LIMIT 1;

-- Project: The Park Hyatt Goa, Daffodil Hotels- Enhancement (VCDPL) — 4 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'The Park Hyatt Goa, Daffodil Hotels- Enhancement', 'Unknown', 0, 'active'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'On Extenstion', 1, 540000, '26003', '2025-04-11', 540000, '2025-04-17', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'The Park Hyatt Goa, Daffodil Hotels- Enhancement' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'On Award of Tender', 2, 100000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'The Park Hyatt Goa, Daffodil Hotels- Enhancement' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Handover and Commissioning', 3, 100000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'The Park Hyatt Goa, Daffodil Hotels- Enhancement' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Aproval of Tender Documentation', 4, 540000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'The Park Hyatt Goa, Daffodil Hotels- Enhancement' LIMIT 1;

-- Project: DSP Google SIGB (VCDPL) — 4 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'DSP Google SIGB', 'Unknown', 0, 'active'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Stage 1', 1, 118800, '26004', NULL, 118800, NULL, 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'DSP Google SIGB' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Stage 2-Concept Design - 20%', 2, 237600, '26016', '2025-10-12', 237600, '2026-01-13', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'DSP Google SIGB' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Stage 3-Developed Design and Authority Approvals - 25%', 3, 297000, '26016', '2025-10-12', 297000, '2026-01-13', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'DSP Google SIGB' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Stage 4- Technical Design & Procurement - 15%', 4, 178200, '26016', '2025-10-12', 178200, '2026-01-13', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'DSP Google SIGB' LIMIT 1;

-- Project: Total Environment (VCDPL) — 1 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Total Environment', 'Unknown', 0, 'active'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Upon Commencement of Services', 1, 480000, 'Raised', NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Total Environment' LIMIT 1;

-- Project: Trident Bhubaneshwar (VCDPL) — 8 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Trident Bhubaneshwar', 'Unknown', 0, 'active'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Concept Design - Balance', 1, 45360, '26010', '2025-08-24', 45360, '2025-08-29', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Trident Bhubaneshwar' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'CONCEPT DESIGN', 2, 243000, 'Raised', '2024-05-03', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Trident Bhubaneshwar' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'SCHEMATIC DESIGN', 3, 307800, '26021', '2026-03-01', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Trident Bhubaneshwar' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'CONSTRUCTION SUPPORT', 4, 95000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Trident Bhubaneshwar' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'TESTING & COMMISSIONING', 5, 95000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Trident Bhubaneshwar' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'TENDER DOCUMENTATION', 6, 410400, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Trident Bhubaneshwar' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'TENDER EVALUATION', 7, 410400, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Trident Bhubaneshwar' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'DETAILED DESIGN', 8, 410400, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Trident Bhubaneshwar' LIMIT 1;

-- Project: Aditya Birla Mumbai Restaurant (VCDPL) — 2 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Aditya Birla Mumbai Restaurant', 'Unknown', 0, 'active'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Advance', 1, 140400, '26011', '2025-07-23', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Aditya Birla Mumbai Restaurant' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Completion of Conceptual Design', 2, 140400, '26011', '2025-07-23', 163800, '2025-12-15', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Aditya Birla Mumbai Restaurant' LIMIT 1;

-- Project: RIL Serviced Apartment (VCDPL) — 9 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'RIL Serviced Apartment', 'Unknown', 0, 'active'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Upon Site Visit', 1, 270000, '26011', '2025-09-01', 270000, '2025-12-11', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL Serviced Apartment' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Upon approval of Advisory report - 4,00,000', 2, 400000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL Serviced Apartment' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.Upon approval of Conceptual Design -3,00,000', 3, 300000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL Serviced Apartment' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '4.Upon approval of Schematic Design - 4,00,000', 4, 400000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL Serviced Apartment' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '5.Upon approval of Design Development- 2,00,000', 5, 200000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL Serviced Apartment' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '6.Upon approval of Tender Documentation- 150,000', 6, 150000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL Serviced Apartment' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '7.Upon approval of Tender Evaluation -50,000', 7, 50000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL Serviced Apartment' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '8.Upon completion of Services Provided during Construction -50,000', 8, 50000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL Serviced Apartment' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '9.Upon approval of Testing & Commissioning -50,000', 9, 50000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL Serviced Apartment' LIMIT 1;

-- Project: RIL Coffeehouse Clubhouse- MSF/230214474 (VCDPL) — 6 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'RIL Coffeehouse Clubhouse- MSF/230214474', 'Unknown', 0, 'active'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Concept Design', 1, 54000, '26012', '2025-09-10', 45000, '2026-01-20', 'partial'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL Coffeehouse Clubhouse- MSF/230214474' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Schematic design', 2, 54000, '26012', '2025-09-10', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL Coffeehouse Clubhouse- MSF/230214474' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Construction Administration', 3, 50000, '26023', '2026-03-15', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL Coffeehouse Clubhouse- MSF/230214474' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Design development', 4, 22500, '26023', '2026-03-15', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL Coffeehouse Clubhouse- MSF/230214474' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Construction documentation', 5, 56250, '26023', '2026-03-15', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL Coffeehouse Clubhouse- MSF/230214474' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Closeout', 6, 12500, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL Coffeehouse Clubhouse- MSF/230214474' LIMIT 1;

-- Project: Leela Rishikesh (VCDPL) — 8 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Leela Rishikesh', 'Unknown', 0, 'active'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Mobilization', 1, 734400, '26013', '2025-08-05', 734400, '2025-08-18', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Leela Rishikesh' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender Documentation', 2, 340000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Leela Rishikesh' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender Evaluation', 3, 340000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Leela Rishikesh' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Services Provided During Construction', 4, 150000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Leela Rishikesh' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Testing and Commissioning', 5, 90000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Leela Rishikesh' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Schematic Design', 6, 510000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Leela Rishikesh' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Design Development', 7, 510000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Leela Rishikesh' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Conceptual Design', 8, 680000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Leela Rishikesh' LIMIT 1;

-- Project: RIL Cultural Café - - MSF/230214447 (VCDPL) — 6 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'RIL Cultural Café - - MSF/230214447', 'Unknown', 0, 'active'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Concept Design', 1, 43200, '26013', '2025-09-10', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL Cultural Café - - MSF/230214447' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Schematic design', 2, 43200, '26013', '2025-09-10', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL Cultural Café - - MSF/230214447' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Construction Administration', 3, 40000, '26023', '2026-03-15', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL Cultural Café - - MSF/230214447' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Design development', 4, 18000, '26023', '2026-03-15', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL Cultural Café - - MSF/230214447' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Construction documentation', 5, 45000, '26023', '2026-03-15', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL Cultural Café - - MSF/230214447' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Closeout', 6, 10000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL Cultural Café - - MSF/230214447' LIMIT 1;

-- Project: RIL EYC- MSF/230215037 (VCDPL) — 6 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'RIL EYC- MSF/230215037', 'Unknown', 0, 'active'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Concept Design', 1, 43200, '26014', '2025-09-10', 43200, '2026-01-27', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL EYC- MSF/230215037' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Construction Administration', 2, 40000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL EYC- MSF/230215037' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Closeout', 3, 10000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL EYC- MSF/230215037' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Schematic design', 4, 40000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL EYC- MSF/230215037' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Design development', 5, 20000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL EYC- MSF/230215037' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Construction documentation', 6, 50000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL EYC- MSF/230215037' LIMIT 1;

-- Project: Citrus Cunningham Enhancement (VCDPL) — 1 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Citrus Cunningham Enhancement', 'Unknown', 0, 'active'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Enhancement for Redesign Works Delivered', 1, 216000, '26019', '2025-12-07', 216000, '2026-01-05', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Citrus Cunningham Enhancement' LIMIT 1;

-- Project: Bokapatana Enhancement (VCDPL) — 1 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Bokapatana Enhancement', 'Unknown', 0, 'active'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Enhancement for Redesign Works Requested', 1, 324000, '26020', '2025-12-07', 324000, '2026-01-05', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Bokapatana Enhancement' LIMIT 1;

-- Project: Sheraton @ gift City (VCDPL) — 8 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'Sheraton @ gift City', 'Unknown', 0, 'active'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Upon Commencement of Services 4,00,000', 1, 432000, '26021', '2025-12-18', 432000, '2026-01-06', 'paid'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Sheraton @ gift City' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.1 Conceptual Design 4,50,000', 2, 450000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Sheraton @ gift City' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.2 Schematic Design 4,00,000', 3, 400000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Sheraton @ gift City' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Design Development 6,70,000', 4, 670000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Sheraton @ gift City' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Tender Evaluation 3,60,000', 5, 360000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Sheraton @ gift City' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.4 Tender Documentation 3,80,000', 6, 380000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Sheraton @ gift City' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.6 Services Provided during Construction 70,000', 7, 70000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Sheraton @ gift City' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.7 Testing & Commissioning 70,000', 8, 70000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'Sheraton @ gift City' LIMIT 1;

-- Project: RIL Kitchen & Laundry - Thal Alibaug - MOSPC/90 (VCDPL) — 6 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'RIL Kitchen & Laundry - Thal Alibaug - MOSPC/90', 'Unknown', 0, 'active'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Upon Commencement of Services (MK:200000 + L:40000 + SD:30000)', 1, 243000, '26024', '2026-03-15', 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL Kitchen & Laundry - Thal Alibaug - MOSPC/90' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.3 Design Development (MK:150000 + L:30000 + SD:22500)', 2, 202500, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL Kitchen & Laundry - Thal Alibaug - MOSPC/90' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.4 Tender Documentation (MK:100000 + L:20000 + SD:15000)', 3, 135000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL Kitchen & Laundry - Thal Alibaug - MOSPC/90' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.5 Tender Evaluation (MK:50000 + L:10000 + SD:7500)', 4, 67500, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL Kitchen & Laundry - Thal Alibaug - MOSPC/90' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.6 Services during Construction (MK:50000 + L:10000 + SD:7500)', 5, 67500, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL Kitchen & Laundry - Thal Alibaug - MOSPC/90' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.7 Testing & Commissioning (MK:50000 + L:10000 + SD:7500)', 6, 67500, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL Kitchen & Laundry - Thal Alibaug - MOSPC/90' LIMIT 1;

-- Project: RIL Khrishiv Farm Villa- Nathwani Residence Alibaug (VCDPL) — 8 stages
INSERT INTO projects (company_id, project_name, client_name, total_contract_value, status)
  SELECT c.id, 'RIL Khrishiv Farm Villa- Nathwani Residence Alibaug', 'Unknown', 0, 'active'
  FROM companies c WHERE c.name = 'VCDPL' LIMIT 1;

INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, 'Upon Commencement of Services ₹2,00,000 ₹40,000 ₹30,000', 1, 270000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL Khrishiv Farm Villa- Nathwani Residence Alibaug' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.1 Conceptual Design ₹2,00,000 ₹40,000 ₹30,000', 2, 270000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL Khrishiv Farm Villa- Nathwani Residence Alibaug' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.2 Schematic Design ₹2,00,000 ₹40,000 ₹30,000', 3, 270000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL Khrishiv Farm Villa- Nathwani Residence Alibaug' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.3 Design Development ₹1,50,000 ₹30,000 ₹22,500', 4, 202500, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL Khrishiv Farm Villa- Nathwani Residence Alibaug' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.4 Tender Documentation ₹1,00,000 ₹20,000 ₹15,000', 5, 135000, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL Khrishiv Farm Villa- Nathwani Residence Alibaug' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.5 Tender Evaluation ₹50,000 ₹10,000 ₹7,500', 6, 67500, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL Khrishiv Farm Villa- Nathwani Residence Alibaug' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.6 Services Provided during Construction ₹50,000 ₹10,000 ₹7,500', 7, 67500, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL Khrishiv Farm Villa- Nathwani Residence Alibaug' LIMIT 1;
INSERT INTO fee_stages (project_id, stage_name, stage_number, lumpsum_amount, invoice_number, invoice_date, amount_paid, payment_received_date, payment_status)
  SELECT p.id, '3.7 Testing & Commissioning ₹50,000 ₹10,000 ₹7,500', 8, 67500, NULL, NULL, 0, NULL, 'invoiced'
  FROM projects p
  JOIN companies c ON c.id = p.company_id AND c.name = 'VCDPL'
  WHERE p.project_name = 'RIL Khrishiv Farm Villa- Nathwani Residence Alibaug' LIMIT 1;

