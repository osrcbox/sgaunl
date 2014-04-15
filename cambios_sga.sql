--Cambios plan estudio: 14-04-2014
ALTER TABLE sga_model_planestudio ADD COLUMN egresar boolean NOT NULL DEFAULT FALSE;
COMMENT ON COLUMN sga_model_planestudio.egresar IS 'Indica si este plan de estudio es para el último módulo de la promoción con la finalidad de identificar los egresados';
