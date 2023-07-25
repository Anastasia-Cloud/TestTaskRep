CREATE VIEW dbo.vw_SKUPrice
AS
select id,
	code,
	name,
	dbo.udf_GetSKUPrice(id) as Price
from SKU;