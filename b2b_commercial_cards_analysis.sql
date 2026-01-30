CREATE DATABASE b2b_sales;
USE b2b_sales;

CREATE TABLE b2b_accounts_pipeline (
    account_id VARCHAR(50),
    industry VARCHAR(100),
    company_size VARCHAR(20),
    annual_revenue VARCHAR(50),
    marketing_spend VARCHAR(50),
    lead_source VARCHAR(100),
    leads_generated INT,
    lead_conversion_rate DECIMAL(5,2),
    region VARCHAR(50),
    city VARCHAR(100),
    existing_product_primary VARCHAR(100),
    existing_product_secondary VARCHAR(100),
    purchase_frequency VARCHAR(50),
    days_since_last_purchase INT,
    contract_status VARCHAR(20),
    total_purchases_last_period INT,
    payment_behavior VARCHAR(50),
    preferred_sales_channel VARCHAR(50),
    relationship_manager VARCHAR(100),
    pipeline_stage VARCHAR(50),
    deal_status VARCHAR(20),
    expected_credit_limit INT,
    expected_card_revenue INT,
    sales_cycle_bucket VARCHAR(20)
);

ALTER TABLE b2b_accounts_pipeline
MODIFY annual_revenue DECIMAL(15,2),
MODIFY marketing_spend DECIMAL(15,2);

DESCRIBE b2b_accounts_pipeline;

SELECT * from b2b_accounts_pipeline;

SELECT COUNT(*) AS total_accounts,
SUM(deal_status = 'Won') AS won_accounts,
SUM(deal_status = 'Open') AS open_accounts,
SUM(deal_status = 'Lost') AS lost_accounts,
ROUND(SUM(deal_status = 'Won') * 100.0 / COUNT(*), 2) AS win_rate_pct
FROM b2b_accounts_pipeline;

SELECT pipeline_stage,
COUNT(*) AS accounts
FROM b2b_accounts_pipeline
GROUP BY pipeline_stage
ORDER BY accounts DESC;

SELECT pipeline_stage,
COUNT(*) AS total_accounts,
SUM(deal_status = 'Won') AS won_accounts,
ROUND(SUM(deal_status = 'Won') * 100.0 / COUNT(*), 2) AS win_rate_pct
FROM b2b_accounts_pipeline
GROUP BY pipeline_stage
ORDER BY win_rate_pct DESC;

SELECT pipeline_stage,
SUM(expected_card_revenue) AS expected_revenue
FROM b2b_accounts_pipeline
GROUP BY pipeline_stage
ORDER BY expected_revenue DESC;

SELECT COUNT(*) AS open_accounts,
SUM(expected_card_revenue) AS open_pipeline_revenue
FROM b2b_accounts_pipeline
WHERE deal_status = 'Open';

SELECT industry,
COUNT(*) AS total_accounts,
SUM(deal_status = 'Won') AS won_accounts,
ROUND(SUM(deal_status = 'Won') * 100.0 / COUNT(*), 2) AS win_rate_pct,
SUM(expected_card_revenue) AS total_revenue
FROM b2b_accounts_pipeline
GROUP BY industry
ORDER BY total_revenue DESC;

SELECT preferred_sales_channel,
COUNT(*) AS accounts,
ROUND(SUM(deal_status = 'Won') * 100.0 / COUNT(*), 2) AS win_rate_pct,
SUM(expected_card_revenue) AS revenue
FROM b2b_accounts_pipeline
GROUP BY preferred_sales_channel
ORDER BY revenue DESC;

SELECT relationship_manager,
COUNT(*) AS accounts,
ROUND(SUM(deal_status = 'Won') * 100.0 / COUNT(*), 2) AS win_rate_pct,
SUM(expected_card_revenue) AS revenue
FROM b2b_accounts_pipeline
GROUP BY relationship_manager
ORDER BY revenue DESC;

SELECT sales_cycle_bucket,
COUNT(*) AS accounts,
ROUND(SUM(deal_status = 'Won') * 100.0 / COUNT(*), 2) AS win_rate_pct
FROM b2b_accounts_pipeline
GROUP BY sales_cycle_bucket
ORDER BY win_rate_pct DESC;

SELECT account_id,
industry,
expected_card_revenue,
sales_cycle_bucket
FROM b2b_accounts_pipeline
WHERE deal_status = 'Open'
ORDER BY expected_card_revenue DESC
LIMIT 10;

SELECT lead_source,
ROUND(SUM(expected_card_revenue) / SUM(marketing_spend), 2) AS revenue_per_spend
FROM b2b_accounts_pipeline
GROUP BY lead_source
ORDER BY revenue_per_spend DESC;

CREATE VIEW kpi_summary AS
SELECT COUNT(*) AS total_accounts,
SUM(deal_status = 'Won') AS won_accounts,
SUM(deal_status = 'Open') AS open_accounts,
SUM(deal_status = 'Lost') AS lost_accounts,
ROUND(SUM(deal_status = 'Won') * 100.0 / COUNT(*), 2) AS win_rate_pct,
SUM(CASE WHEN deal_status = 'Open' THEN expected_card_revenue ELSE 0 END) AS open_pipeline_revenue
FROM b2b_accounts_pipeline;

CREATE VIEW funnel_stage_summary AS
SELECT pipeline_stage,
COUNT(*) AS accounts,
SUM(expected_card_revenue) AS expected_revenue
FROM b2b_accounts_pipeline
GROUP BY pipeline_stage;

CREATE VIEW industry_performance AS
SELECT industry,
COUNT(*) AS accounts,
ROUND(SUM(deal_status = 'Won') * 100.0 / COUNT(*), 2) AS win_rate_pct,
SUM(expected_card_revenue) AS total_revenue
FROM b2b_accounts_pipeline
GROUP BY industry;

CREATE VIEW sales_channel_performance AS
SELECT preferred_sales_channel,
COUNT(*) AS accounts,
ROUND(SUM(deal_status = 'Won') * 100.0 / COUNT(*), 2) AS win_rate_pct,
SUM(expected_card_revenue) AS revenue
FROM b2b_accounts_pipeline
GROUP BY preferred_sales_channel;

CREATE VIEW marketing_roi AS
SELECT lead_source,
ROUND(SUM(expected_card_revenue) / NULLIF(SUM(marketing_spend), 0), 2) AS revenue_per_spend
FROM b2b_accounts_pipeline
GROUP BY lead_source;

SHOW FULL TABLES WHERE Table_type = 'VIEW';

SELECT * FROM kpi_summary;
SELECT * FROM funnel_stage_summary;
SELECT * FROM industry_performance;
SELECT * FROM sales_channel_performance;
SELECT * FROM marketing_roi;

















