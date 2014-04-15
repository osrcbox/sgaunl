--Cambios en el estudiante y datos personales: 
--Agrega atributos adicionales
ALTER TABLE sga_model_estudiante ADD COLUMN documento_identificacion character varying(10);
ALTER TABLE sga_model_estudiante ALTER COLUMN documento_identificacion SET NOT NULL;
ALTER TABLE sga_model_estudiante ALTER COLUMN documento_identificacion SET DEFAULT 'Cdula'::character varying;


--Cambios docente: 27-07-2013
--Agrega atributos adicionales
ALTER TABLE sga_model_docente ADD COLUMN documento_identificacion character varying(10) NOT NULL DEFAULT 'cedula';
ALTER TABLE sga_model_docente ADD COLUMN fecha_nacimiento date;
ALTER TABLE sga_model_docente ADD COLUMN genero character varying(10) NOT NULL DEFAULT 'masculino';
ALTER TABLE sga_model_docente ADD COLUMN nacionalidad character varying(255) NOT NULL DEFAULT 'ecuatoriana';
ALTER TABLE sga_model_docente ADD COLUMN email_institucional character varying(50);

--Cambios plan estudio: 14-04-2014
--Agrega atributo para identificar los egresados
ALTER TABLE sga_model_planestudio ADD COLUMN egresar boolean NOT NULL DEFAULT FALSE;
COMMENT ON COLUMN sga_model_planestudio.egresar IS 'Indica si este plan de estudio es para el último módulo de la promoción con la finalidad de identificar los egresados';
