-- Para insertar registros para el proveedor con codigo EANPKGR

USE content;

ALTER TABLE `SupplierPayload` MODIFY COLUMN `supplier` VARCHAR(7);