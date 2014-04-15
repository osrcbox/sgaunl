--Cambios en el estudiante y datos personales: 10-04-2013
--Agrega atributos adicionales
ALTER TABLE sga_model_estudiante ADD COLUMN documento_identificacion character varying(10);
ALTER TABLE sga_model_estudiante ALTER COLUMN documento_identificacion SET NOT NULL;
ALTER TABLE sga_model_estudiante ALTER COLUMN documento_identificacion SET DEFAULT 'Cedula'::character varying;

ALTER TABLE sga_model_datospersonales ADD COLUMN etnia character varying(20);
ALTER TABLE sga_model_datospersonales ALTER COLUMN etnia SET DEFAULT 'Mestizo'::character varying;
ALTER TABLE sga_model_datospersonales ADD COLUMN email_institucional character varying(50);
ALTER TABLE sga_model_datospersonales ADD COLUMN telefono_trabajo_madre character varying(50);
ALTER TABLE sga_model_datospersonales ADD COLUMN telefono_trabajo_padre character varying(50);
ALTER TABLE sga_model_datospersonales ADD COLUMN fecha_nacimiento_madre date;
ALTER TABLE sga_model_datospersonales ADD COLUMN fecha_nacimiento_padre date;
ALTER TABLE sga_model_datospersonales ADD COLUMN sector_procedencia character varying(10);
ALTER TABLE sga_model_datospersonales ALTER COLUMN sector_procedencia SET DEFAULT 'Urbano'::character varying;
ALTER TABLE sga_model_datospersonales ADD COLUMN ciudad_procedencia character varying(255);
ALTER TABLE sga_model_datospersonales ADD COLUMN ciudad_actual character varying(255);

--Cambios carrera programa: 12-04-2013
--Agrega atributos adicionales
ALTER TABLE sga_model_carreraprograma ADD COLUMN codigo character varying(10);
COMMENT ON COLUMN sga_model_carreraprograma.codigo IS 'codigo senecyt';
ALTER TABLE sga_model_carreraprograma ADD COLUMN nombre_anterior character varying(255);
COMMENT ON COLUMN sga_model_carreraprograma.nombre_anterior IS 'nombre de respaldo, ya que ahora tienen otros nombres';

--Cambios FichaSocioEconomica: 17-04-2013
--Agrega atributo
ALTER TABLE sga_model_fichasocioeconomica ADD COLUMN trabajo_realiza character varying(255);

--Cambios en el banco de preguntas: 31-05-2013
--Agrega atributos
ALTER TABLE sga_model_bancopreguntas ADD COLUMN estado character varying(10);
ALTER TABLE sga_model_bancopreguntas ADD COLUMN autor character varying(255);
ALTER TABLE sga_model_bancopreguntas ALTER COLUMN autor SET DEFAULT ''::character varying;
ALTER TABLE sga_model_pregunta ADD COLUMN codigo character varying(10);
ALTER TABLE sga_model_pregunta ALTER COLUMN codigo SET NOT NULL;
ALTER TABLE sga_model_pregunta ALTER COLUMN codigo SET DEFAULT ''::character varying;
ALTER TABLE sga_model_pregunta ADD COLUMN dificultad character varying(10);
ALTER TABLE sga_model_pregunta ALTER COLUMN dificultad SET NOT NULL;
ALTER TABLE sga_model_pregunta ALTER COLUMN dificultad SET DEFAULT 'bajo'::character varying;
ALTER TABLE sga_model_pregunta ADD COLUMN tema character varying(1024);
ALTER TABLE sga_model_pregunta ADD COLUMN subtema character varying(1024);
ALTER TABLE sga_model_pregunta ADD COLUMN referencia_bibliografica character varying(1024);

--Cambios examen admision: 31-05-2013
--Agrega campos calificacion_maxima y tiempo_examen al ExamenAdmision para mantener histórico
ALTER TABLE sga_model_examenadmision ADD COLUMN calificacion_maxima numeric(10,2);
ALTER TABLE sga_model_examenadmision ADD COLUMN tiempo_examen numeric(10,2);

--Cambios docente: 27-06-2013
--Agrega atributos adicionales
ALTER TABLE sga_model_docente ADD COLUMN documento_identificacion character varying(10) NOT NULL DEFAULT 'cedula';
ALTER TABLE sga_model_docente ADD COLUMN fecha_nacimiento date;
ALTER TABLE sga_model_docente ADD COLUMN genero character varying(10) NOT NULL DEFAULT 'masculino';
ALTER TABLE sga_model_docente ADD COLUMN nacionalidad character varying(255) NOT NULL DEFAULT 'ecuatoriana';
ALTER TABLE sga_model_docente ADD COLUMN email_institucional character varying(50);

--Cambios para el arrastre: 23-01-2014
ALTER TABLE sga_model_unidad ADD COLUMN arrastrable boolean;
ALTER TABLE sga_model_unidad ALTER COLUMN arrastrable SET DEFAULT false;
COMMENT ON COLUMN sga_model_unidad.arrastrable IS 'Indica si una unidad es arrastrable';
ALTER TABLE sga_model_unidad ADD COLUMN referencias character varying(40);
COMMENT ON COLUMN sga_model_unidad.referencias IS 'Indica la(s) referencia(s) a las unidades de ciclos anteriores a la que pertenece el arrastre';
ALTER TABLE sga_model_matricula ADD COLUMN matricula_arrastra_id integer;
COMMENT ON COLUMN sga_model_matricula.matricula_arrastra_id IS 'Referencia a la matrícula del ciclo anterior de donde arrastró alguna asignatura';
ALTER TABLE sga_model_matricula ADD COLUMN unidad_arrastra_id integer;
COMMENT ON COLUMN sga_model_matricula.unidad_arrastra_id IS 'Referencia a que unidad arrastré en la matrícula de éste ciclo';

--Cambios en la papeleta: 25-02-2014
--Agrega fecha de pago
ALTER TABLE sga_model_papeleta ADD COLUMN fecha_pago timestamp without time zone;

--Cambios plan estudio: 11-04-2014
--Agrega atributo para identificar los egresados
ALTER TABLE sga_model_planestudio ADD COLUMN egresar boolean NOT NULL DEFAULT FALSE;
COMMENT ON COLUMN sga_model_planestudio.egresar IS 'Indica si este plan de estudio es para el último módulo de la promoción con la finalidad de identificar los egresados';
