#Ejemplo sintaxis: ssh username@xx.xx.xx.xx [ -e numero_cedula.jpg ] && echo "si" || echo "no"
#Para usar se debe tener acceso al servidor de fotos como administrador mediante clave rsa (id_rsa)

def verificar_fotos_server(lista):
    """
    Verifica si existe fisicamente la foto en el servidor y coloca en no el atributo foto_url de datos personales en caso de ser necesario
    @param lista Lista de estudiantes
    """
    import os
    dic_tildes = {'á':'a','é':'e','í':'i','ó':'o','ú':'u'}    
    for e in lista:
        inicial = e.apellidos.lower().strip()[0:1].encode('utf-8')
        if inicial in dic_tildes.keys():
            inicial = dic_tildes[inicial]
        p = os.popen('ssh administrador@192.168.112.6 [ -e /home/fotos/%s/%s.jpg ] && echo "si" || echo "no"' % (inicial, e.cedula))
        l = p.readline()
        p.close()
        e, l
        if 'no' in l:
            print "%s - no" % e.cedula
            e.datos_personales.foto_url = u'no'
            session.flush()
        else:
            print "%s - si" % e.cedula


#Modo uso
lista = Estudiante.query.filter(Estudiante.cedula==u'1104285604').all()
verificar_fotos_server(lista)
