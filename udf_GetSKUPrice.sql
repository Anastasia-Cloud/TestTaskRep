CREATE FUNCTION dbo.udf_GetSKUPrice(@ID_SKU int)
RETURNS decimal(18, 2)
AS
BEGIN
    DECLARE @sum_v int;
    SELECT @sum_v = SUM(Value)
    FROM Basket
    WHERE ID_SKU = @ID_SKU;
    
    DECLARE @sum_q int;
    SELECT @sum_q = SUM(Quantity)
    FROM Basket
    WHERE ID_SKU = @ID_SKU;
    
    RETURN @sum_v/@sum_q;
END;