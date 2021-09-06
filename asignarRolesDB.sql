-- administrador
GRANT SELECT, UPDATE, INSERT, DELETE ON bd_sive.* TO administrador;

-- vendedor
GRANT SELECT ON bd_sive.* TO vendedor;
-- funciona de a una
GRANT UPDATE, INSERT, DELETE ON Usuario TO vendedor;
GRANT UPDATE, INSERT, DELETE ON Producto TO vendedor;
GRANT UPDATE, INSERT, DELETE ON Catalogo TO vendedor;
GRANT UPDATE, INSERT, DELETE ON CentroDePagos TO vendedor;
GRANT UPDATE, INSERT, DELETE ON Carrito TO vendedor;
GRANT UPDATE, INSERT, DELETE ON MetodoDePago TO vendedor;

-- cliente
GRANT SELECT ON Usuario TO cliente;
GRANT SELECT ON Cliente TO cliente;
GRANT SELECT ON Producto TO cliente;
GRANT SELECT ON Catalogo TO cliente;
GRANT SELECT ON Categoria TO cliente;
GRANT SELECT ON Compras TO cliente;
GRANT SELECT ON Despacho TO cliente;
GRANT SELECT ON CentroDePagos TO cliente;
GRANT SELECT ON Carrito TO cliente;
GRANT SELECT ON MetodoDePago TO cliente;
GRANT SELECT ON PayPal TO cliente;
GRANT SELECT ON Tarjeta TO cliente;
GRANT UPDATE, INSERT ON Usuario TO cliente;
GRANT UPDATE, INSERT ON Cliente TO cliente;
GRANT UPDATE, INSERT ON Carrito TO cliente;
GRANT UPDATE, INSERT ON Compras TO cliente;
GRANT UPDATE, INSERT ON Tarjeta TO cliente;
GRANT UPDATE, INSERT ON PayPal TO cliente;
GRANT DELETE ON Usuario TO cliente;
GRANT DELETE ON Carrito TO cliente;
GRANT DELETE ON Tarjeta TO cliente;
