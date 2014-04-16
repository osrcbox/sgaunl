def print_acreditaciones(matricula):
    """
    Imprime los registros de acreditaciones con sus docentes y fecha-hora(sacado del log) de asignación
    """
    e = matricula.expediente
    if matricula.paralelo and matricula.paralelo.plan_estudio:
        for u in matricula.paralelo.plan_estudio.unidades:
            ac = e.get_acreditacion(matricula, u)
            if ac:
                lg_msg = '%%Creación de nota ---> Cédula:---->%s----Unidad:---->%s%%' % (e.estudiante_cedula.encode('utf8'), u.nombre.encode('utf-8'))        
                if ac.horario_semana.docente:
                    lg = Log.query.filter(and_(Log.mensaje.like(lg_msg), Log.usuario == ac.horario_semana.docente.usuario)).first()
                else:
                    lg = Log.query.filter(Log.mensaje.like(lg_msg)).first()
                us = ac.horario_semana.docente.usuario if ac.horario_semana.docente else lg.usuario
                print 'Unidad: %s - Docente: %s (%s%s) - Fecha: %s, Fecha Log: %s' % (ac.horario_semana.unidad.nombre, us.display_name, '' if ac.horario_semana.docente else 'Sec Abg: ', us.user_name, ac.fecha, lg.fecha)
            else:
                print 'No existe acreditación para la unidad: %s' % u.nombre
    else:
        print 'Matrícula sin plan de estudio'

def print_max_fecha_asistencias(matricula):
    """
    Imprime la máxima fecha de asifnación de asistencias por unidad
    """
    e = matricula.expediente
    if matricula.paralelo and matricula.paralelo.plan_estudio:
        for u in matricula.paralelo.jornadas[0].horarios_semana:
            ras=RegistroAsistencia.query.join('estudiante').filter_by(estudiante=matricula.estudiante).join(['periodo_clase']).filter(and_(PeriodoClase.horario_semana==u,PeriodoClase.no_laborado==None)).order_by(RegistroAsistencia.fecha.desc()).first()
            print "Unidad: %s, Fecha: %s" % (u.unidad.nombre, ras.fecha if ras else '--Sin fecha--')
    else:
         print 'Matrícula sin plan de estudio'
