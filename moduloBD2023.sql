/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     24/05/2023 17:43:01                          */
/*==============================================================*/


alter table CALENDARIO
   drop constraint FK_CALENDAR_ESTADOCAL_ESTADO;

alter table CALENDARIO
   drop constraint FK_CALENDAR_OBRACALEN_OBRA;

alter table CALENDARIO
   drop constraint FK_CALENDAR_TIPOCALEN_TIPOCALE;

alter table COMPOSITOR
   drop constraint FK_COMPOSIT_PAISCOMPO_PAIS;

alter table CONVOCATORIAESTUDIANTE
   drop constraint FK_CONVOCAT_ESTUDIANT_ESTUDIAN;

alter table CONVOCATORIAESTUDIANTE
   drop constraint FK_CONVOCAT_INSTRUMEN_INSTRUME;

alter table CONVOCATORIAESTUDIANTE
   drop constraint FK_CONVOCAT_OBRACONVO_OBRA;

alter table EMPLEADO
   drop constraint FK_EMPLEADO_ROLEMPLEA_ROL;

alter table EMPLEADO
   drop constraint FK_EMPLEADO_UNIDADEMP_UNIDAD;

alter table ESTUDIANTE
   drop constraint FK_ESTUDIAN_UNIDADEST_UNIDAD;

alter table GASTOOBRA
   drop constraint FK_GASTOOBR_LISTAGAST_LISTAGAS;

alter table GASTOOBRA
   drop constraint FK_GASTOOBR_OBRAGASTO_OBRA;

alter table INVENTARIOINSTRUMENTO
   drop constraint FK_INVENTAR_ESTADOINS_ESTADOIN;

alter table INVENTARIOINSTRUMENTO
   drop constraint FK_INVENTAR_INSTRUMEN_INSTRUME;

alter table LABORPERSONALOBRA
   drop constraint FK_LABORPER_CALENDARI_CALENDAR;

alter table LABORPERSONALOBRA
   drop constraint FK_LABORPER_LISTALABO_LISTAACT;

alter table LABORPERSONALOBRA
   drop constraint FK_LABORPER_PERSONALL_PERSONAL;

alter table LISTAACTIVIDADUD
   drop constraint FK_LISTAACT_PERIODOLI_PERIODO;

alter table LISTAGASTOUD
   drop constraint FK_LISTAGAS_PERIODOLI_PERIODO;

alter table OBRA
   drop constraint FK_OBRA_COMPOSITO_COMPOSIT;

alter table OBRA
   drop constraint FK_OBRA_GENEROOBR_GENEROOB;

alter table OBRA
   drop constraint FK_OBRA_PAISOBRA_PAIS;

alter table OBRA
   drop constraint FK_OBRA_PERIODOOB_PERIODO;

alter table OBRAINSTRUMENTO
   drop constraint FK_OBRAINST_OBRAINSTR_INSTRUME;

alter table OBRAINSTRUMENTO
   drop constraint FK_OBRAINST_OBRAINSTR_OBRA;

alter table PARTICIPACIONESTUDIANTE
   drop constraint FK_PARTICIP_CALENDARI_CALENDAR;

alter table PARTICIPACIONESTUDIANTE
   drop constraint FK_PARTICIP_ESTUDIANT_ESTUDIAN;

alter table PERSONALOBRA
   drop constraint FK_PERSONAL_EMPLEADOP_EMPLEADO;

alter table PERSONALOBRA
   drop constraint FK_PERSONAL_OBRAPERSO_OBRA;

alter table UNIDAD
   drop constraint FK_UNIDAD_TIPOUNIDA_TIPOUNID;

alter table UNIDAD
   drop constraint FK_UNIDAD_UNIDADUNI_UNIDAD;

drop index ESTADOCALENDARIO_FK;

drop index OBRACALENDARIO_FK;

drop index TIPOCALENDARIOCALENDARIO_FK;

drop table CALENDARIO cascade constraints;

drop index PAISCOMPOSITOR_FK;

drop table COMPOSITOR cascade constraints;

drop index ESTUDIANTECONVOCATORIA_FK;

drop index INSTRUMENTOCONVOCATORIA_FK;

drop index OBRACONVOCATORIA_FK;

drop table CONVOCATORIAESTUDIANTE cascade constraints;

drop index ROLEMPLEADO_FK;

drop index UNIDADEMPLEADO_FK;

drop table EMPLEADO cascade constraints;

drop table ESTADO cascade constraints;

drop table ESTADOINSTRUMENTO cascade constraints;

drop index UNIDADESTUDIANTE_FK;

drop table ESTUDIANTE cascade constraints;

drop index OBRAGASTOOBRA_FK;

drop index LISTAGASTOOBRA_FK;

drop table GASTOOBRA cascade constraints;

drop table GENEROOBRA cascade constraints;

drop table INSTRUMENTO cascade constraints;

drop index INSTRUMENTOINVENTARIO_FK;

drop index ESTADOINSTRUMENTOINVENTARIO_FK;

drop table INVENTARIOINSTRUMENTO cascade constraints;

drop index PERSONALLABOROBRA_FK;

drop index CALENDARIOLABOR_FK;

drop index LISTALABOR_FK;

drop table LABORPERSONALOBRA cascade constraints;

drop index PERIODOLISTAACTIVIDAD_FK;

drop table LISTAACTIVIDADUD cascade constraints;

drop index PERIODOLISTAGASTO_FK;

drop table LISTAGASTOUD cascade constraints;

drop index PERIODOOBRA_FK;

drop index GENEROOBRAOBRA_FK;

drop index PAISOBRA_FK;

drop index COMPOSITOROBRA_FK;

drop table OBRA cascade constraints;

drop index OBRAINSTRUMENTO_FK;

drop index OBRAINSTRUMENTO2_FK;

drop table OBRAINSTRUMENTO cascade constraints;

drop table PAIS cascade constraints;

drop index CALENDARIOPARTICIPACION_FK;

drop index ESTUDIANTEPARTICIPACION_FK;

drop table PARTICIPACIONESTUDIANTE cascade constraints;

drop table PERIODO cascade constraints;

drop index EMPLEADOPERSONAL_FK;

drop index OBRAPERSONALOBRA_FK;

drop table PERSONALOBRA cascade constraints;

drop table ROL cascade constraints;

drop table TIPOCALENDARIO cascade constraints;

drop table TIPOUNIDAD cascade constraints;

drop index UNIDADUNIDAD_FK;

drop index TIPOUNIDADUNIDAD_FK;

drop table UNIDAD cascade constraints;

/*==============================================================*/
/* Table: CALENDARIO                                            */
/*==============================================================*/
create table CALENDARIO 
(
   IDOBRA               VARCHAR2(4)          not null,
   IDTIPOCALEN          VARCHAR2(2)          not null,
   CONSECALENDARIO      NUMBER(4,0)          not null,
   IDESTADO             VARCHAR2(10)         not null,
   FECHAINICIO          DATE                 not null,
   FECHAFIN             DATE                 not null,
   constraint PK_CALENDARIO primary key (IDOBRA, IDTIPOCALEN, CONSECALENDARIO)
);

create index TIPOCALENDARIOCALENDARIO_FK on CALENDARIO (
   IDTIPOCALEN ASC
);

create index OBRACALENDARIO_FK on CALENDARIO (
   IDOBRA ASC
);

create index ESTADOCALENDARIO_FK on CALENDARIO (
   IDESTADO ASC
);

/*==============================================================*/
/* Table: COMPOSITOR                                            */
/*==============================================================*/
create table COMPOSITOR 
(
   IDCOMPOSITOR         VARCHAR2(3)          not null,
   CODPAIS              VARCHAR2(3)          not null,
   NOMCOMPOSITOR        VARCHAR2(30)         not null,
   constraint PK_COMPOSITOR primary key (IDCOMPOSITOR)
);

create index PAISCOMPOSITOR_FK on COMPOSITOR (
   CODPAIS ASC
);

/*==============================================================*/
/* Table: CONVOCATORIAESTUDIANTE                                */
/*==============================================================*/
create table CONVOCATORIAESTUDIANTE 
(
   IDOBRA               VARCHAR2(4)          not null,
   CONSEC               NUMBER(3,0)          not null,
   IDINSTRUMENTO        VARCHAR2(4)          not null,
   CODESTUDIANTE        VARCHAR2(10)         not null,
   FECHAINICIO          DATE                 not null,
   FECHAFIN             DATE                 not null,
   CALIFICACION         NUMBER(3,1)          not null,
   constraint PK_CONVOCATORIAESTUDIANTE primary key (IDOBRA, CONSEC)
);

create index OBRACONVOCATORIA_FK on CONVOCATORIAESTUDIANTE (
   IDOBRA ASC
);

create index INSTRUMENTOCONVOCATORIA_FK on CONVOCATORIAESTUDIANTE (
   IDINSTRUMENTO ASC
);

create index ESTUDIANTECONVOCATORIA_FK on CONVOCATORIAESTUDIANTE (
   CODESTUDIANTE ASC
);

/*==============================================================*/
/* Table: EMPLEADO                                              */
/*==============================================================*/
create table EMPLEADO 
(
   ROL_PK               NUMBER(4,0)          not null,
   CODUNIDAD            VARCHAR2(5)          not null,
   CODEMPLEADO          VARCHAR2(4)          not null,
   NOMBRE               VARCHAR2(30)         not null,
   APELLIDO             VARCHAR2(30)         not null,
   CEDULA               VARCHAR2(15)         not null,
   CELULAR              VARCHAR2(15)         not null,
   CORREO               VARCHAR2(40)         not null,
   constraint PK_EMPLEADO primary key (ROL_PK, CODUNIDAD, CODEMPLEADO)
);

create index UNIDADEMPLEADO_FK on EMPLEADO (
   CODUNIDAD ASC
);

create index ROLEMPLEADO_FK on EMPLEADO (
   ROL_PK ASC
);

/*==============================================================*/
/* Table: ESTADO                                                */
/*==============================================================*/
create table ESTADO 
(
   IDESTADO             VARCHAR2(10)         not null,
   constraint PK_ESTADO primary key (IDESTADO)
);

/*==============================================================*/
/* Table: ESTADOINSTRUMENTO                                     */
/*==============================================================*/
create table ESTADOINSTRUMENTO 
(
   IDESTADOINSTRUMENTO  VARCHAR2(3)          not null,
   DESCESTADOINSTRU     VARCHAR2(15)         not null,
   constraint PK_ESTADOINSTRUMENTO primary key (IDESTADOINSTRUMENTO)
);

/*==============================================================*/
/* Table: ESTUDIANTE                                            */
/*==============================================================*/
create table ESTUDIANTE 
(
   CODESTUDIANTE        VARCHAR2(10)         not null,
   CODUNIDAD            VARCHAR2(5)          not null,
   NOMBRE               VARCHAR2(30)         not null,
   APELLIDO             VARCHAR2(30)         not null,
   FECHAINSCRIPCION     DATE                 not null,
   FECHANACIMIENTO      DATE                 not null,
   CORREO               VARCHAR2(40)         not null,
   constraint PK_ESTUDIANTE primary key (CODESTUDIANTE)
);

create index UNIDADESTUDIANTE_FK on ESTUDIANTE (
   CODUNIDAD ASC
);

/*==============================================================*/
/* Table: GASTOOBRA                                             */
/*==============================================================*/
create table GASTOOBRA 
(
   IDPERIODO            NUMBER(6)            not null,
   CODGASTO             VARCHAR2(5)          not null,
   CONSECGASTO          NUMBER(5,0)          not null,
   IDOBRA               VARCHAR2(4)          not null,
   FECHAGASTO           DATE                 not null,
   constraint PK_GASTOOBRA primary key (IDPERIODO, CODGASTO, CONSECGASTO)
);

create index LISTAGASTOOBRA_FK on GASTOOBRA (
   IDPERIODO ASC,
   CODGASTO ASC
);

create index OBRAGASTOOBRA_FK on GASTOOBRA (
   IDOBRA ASC
);

/*==============================================================*/
/* Table: GENEROOBRA                                            */
/*==============================================================*/
create table GENEROOBRA 
(
   IDGENEROOBRA         VARCHAR2(2)          not null,
   DESCGENERO           VARCHAR2(30)         not null,
   constraint PK_GENEROOBRA primary key (IDGENEROOBRA)
);

/*==============================================================*/
/* Table: INSTRUMENTO                                           */
/*==============================================================*/
create table INSTRUMENTO 
(
   IDINSTRUMENTO        VARCHAR2(4)          not null,
   NOMINSTRUMENTO       VARCHAR2(40)         not null,
   constraint PK_INSTRUMENTO primary key (IDINSTRUMENTO)
);

/*==============================================================*/
/* Table: INVENTARIOINSTRUMENTO                                 */
/*==============================================================*/
create table INVENTARIOINSTRUMENTO 
(
   CONSECINVENTARIO     NUMBER(4,0)          not null,
   IDESTADOINSTRUMENTO  VARCHAR2(3)          not null,
   IDINSTRUMENTO        VARCHAR2(4)          not null,
   FECHAINGRESO         DATE                 not null,
   constraint PK_INVENTARIOINSTRUMENTO primary key (CONSECINVENTARIO)
);

create index ESTADOINSTRUMENTOINVENTARIO_FK on INVENTARIOINSTRUMENTO (
   IDESTADOINSTRUMENTO ASC
);

create index INSTRUMENTOINVENTARIO_FK on INVENTARIOINSTRUMENTO (
   IDINSTRUMENTO ASC
);

/*==============================================================*/
/* Table: LABORPERSONALOBRA                                     */
/*==============================================================*/
create table LABORPERSONALOBRA 
(
   CONSCELABOR          NUMBER(4,0)          not null,
   IDPERIODO            NUMBER(6)            not null,
   CODACTIVIDAD         VARCHAR2(5)          not null,
   IDOBRA               VARCHAR2(4),
   IDTIPOCALEN          VARCHAR2(2),
   CONSECALENDARIO      NUMBER(4,0),
   ROL_PK               NUMBER(4,0),
   CODUNIDAD            VARCHAR2(5),
   CODEMPLEADO          VARCHAR2(4),
   IDPERSONALOBRA       NUMBER(4,0),
   NOHORAS              NUMBER(2,0)          not null,
   constraint PK_LABORPERSONALOBRA primary key (CONSCELABOR)
);

create index LISTALABOR_FK on LABORPERSONALOBRA (
   IDPERIODO ASC,
   CODACTIVIDAD ASC
);

create index CALENDARIOLABOR_FK on LABORPERSONALOBRA (
   IDOBRA ASC,
   IDTIPOCALEN ASC,
   CONSECALENDARIO ASC
);

create index PERSONALLABOROBRA_FK on LABORPERSONALOBRA (
   ROL_PK ASC,
   CODUNIDAD ASC,
   CODEMPLEADO ASC,
   IDPERSONALOBRA ASC
);

/*==============================================================*/
/* Table: LISTAACTIVIDADUD                                      */
/*==============================================================*/
create table LISTAACTIVIDADUD 
(
   IDPERIODO            NUMBER(6)            not null,
   CODACTIVIDAD         VARCHAR2(5)          not null,
   DESCACTIVIDAD        VARCHAR2(40)         not null,
   VALORHORA            NUMBER(6,0)          not null,
   MAXHORAS             NUMBER(3,0)          not null,
   constraint PK_LISTAACTIVIDADUD primary key (IDPERIODO, CODACTIVIDAD)
);

create index PERIODOLISTAACTIVIDAD_FK on LISTAACTIVIDADUD (
   IDPERIODO ASC
);

/*==============================================================*/
/* Table: LISTAGASTOUD                                          */
/*==============================================================*/
create table LISTAGASTOUD 
(
   IDPERIODO            NUMBER(6)            not null,
   CODGASTO             VARCHAR2(5)          not null,
   constraint PK_LISTAGASTOUD primary key (IDPERIODO, CODGASTO)
);

create index PERIODOLISTAGASTO_FK on LISTAGASTOUD (
   IDPERIODO ASC
);

/*==============================================================*/
/* Table: OBRA                                                  */
/*==============================================================*/
create table OBRA 
(
   IDOBRA               VARCHAR2(4)          not null,
   IDCOMPOSITOR         VARCHAR2(3)          not null,
   CODPAIS              VARCHAR2(3)          not null,
   IDGENEROOBRA         VARCHAR2(2)          not null,
   IDPERIODO            NUMBER(6),
   FECHAOBRA            DATE                 not null,
   TITULO               VARCHAR2(30)         not null,
   ESTADO               VARCHAR2(1)          not null,
   constraint PK_OBRA primary key (IDOBRA)
);

create index COMPOSITOROBRA_FK on OBRA (
   IDCOMPOSITOR ASC
);

create index PAISOBRA_FK on OBRA (
   CODPAIS ASC
);

create index GENEROOBRAOBRA_FK on OBRA (
   IDGENEROOBRA ASC
);

create index PERIODOOBRA_FK on OBRA (
   IDPERIODO ASC
);

/*==============================================================*/
/* Table: OBRAINSTRUMENTO                                       */
/*==============================================================*/
create table OBRAINSTRUMENTO 
(
   IDINSTRUMENTO        VARCHAR2(4)          not null,
   IDOBRA               VARCHAR2(4)          not null,
   constraint PK_OBRAINSTRUMENTO primary key (IDINSTRUMENTO, IDOBRA)
);

create index OBRAINSTRUMENTO2_FK on OBRAINSTRUMENTO (
   IDOBRA ASC
);

create index OBRAINSTRUMENTO_FK on OBRAINSTRUMENTO (
   IDINSTRUMENTO ASC
);

/*==============================================================*/
/* Table: PAIS                                                  */
/*==============================================================*/
create table PAIS 
(
   CODPAIS              VARCHAR2(3)          not null,
   NOMPAIS              VARCHAR2(30)         not null,
   constraint PK_PAIS primary key (CODPAIS)
);

/*==============================================================*/
/* Table: PARTICIPACIONESTUDIANTE                               */
/*==============================================================*/
create table PARTICIPACIONESTUDIANTE 
(
   CONSECASIS           NUMBER(4,0)          not null,
   CODESTUDIANTE        VARCHAR2(10)         not null,
   IDOBRA               VARCHAR2(4)          not null,
   IDTIPOCALEN          VARCHAR2(2)          not null,
   CONSECALENDARIO      NUMBER(4,0)          not null,
   constraint PK_PARTICIPACIONESTUDIANTE primary key (CONSECASIS)
);

create index ESTUDIANTEPARTICIPACION_FK on PARTICIPACIONESTUDIANTE (
   CODESTUDIANTE ASC
);

create index CALENDARIOPARTICIPACION_FK on PARTICIPACIONESTUDIANTE (
   IDOBRA ASC,
   IDTIPOCALEN ASC,
   CONSECALENDARIO ASC
);

/*==============================================================*/
/* Table: PERIODO                                               */
/*==============================================================*/
create table PERIODO 
(
   IDPERIODO            NUMBER(6)            not null,
   constraint PK_PERIODO primary key (IDPERIODO)
);

/*==============================================================*/
/* Table: PERSONALOBRA                                          */
/*==============================================================*/
create table PERSONALOBRA 
(
   ROL_PK               NUMBER(4,0)          not null,
   CODUNIDAD            VARCHAR2(5)          not null,
   CODEMPLEADO          VARCHAR2(4)          not null,
   IDPERSONALOBRA       NUMBER(4,0)          not null,
   IDOBRA               VARCHAR2(4)          not null,
   FECHAINICIO          DATE                 not null,
   FECHAFIN             DATE                 not null,
   constraint PK_PERSONALOBRA primary key (ROL_PK, CODUNIDAD, CODEMPLEADO, IDPERSONALOBRA)
);

create index OBRAPERSONALOBRA_FK on PERSONALOBRA (
   IDOBRA ASC
);

create index EMPLEADOPERSONAL_FK on PERSONALOBRA (
   ROL_PK ASC,
   CODUNIDAD ASC,
   CODEMPLEADO ASC
);

/*==============================================================*/
/* Table: ROL                                                   */
/*==============================================================*/
create table ROL 
(
   ROL_PK               NUMBER(4,0)          not null,
   DESCROL              VARCHAR2(15)         not null,
   constraint PK_ROL primary key (ROL_PK)
);

/*==============================================================*/
/* Table: TIPOCALENDARIO                                        */
/*==============================================================*/
create table TIPOCALENDARIO 
(
   IDTIPOCALEN          VARCHAR2(2)          not null,
   DESCTIPOCALENDARIO   VARCHAR2(40)         not null,
   constraint PK_TIPOCALENDARIO primary key (IDTIPOCALEN)
);

/*==============================================================*/
/* Table: TIPOUNIDAD                                            */
/*==============================================================*/
create table TIPOUNIDAD 
(
   TIPOUNIDAD           VARCHAR2(2)          not null,
   DESCTIPOUNI          VARCHAR2(20)          not null,
   constraint PK_TIPOUNIDAD primary key (TIPOUNIDAD)
);

/*==============================================================*/
/* Table: UNIDAD                                                */
/*==============================================================*/
create table UNIDAD 
(
   CODUNIDAD            VARCHAR2(5)          not null,
   TIPOUNIDAD           VARCHAR2(2)          not null,
   UNI_CODUNIDAD        VARCHAR2(5),
   NOMUNIDAD            VARCHAR2(40)         not null,
   constraint PK_UNIDAD primary key (CODUNIDAD)
);

create index TIPOUNIDADUNIDAD_FK on UNIDAD (
   TIPOUNIDAD ASC
);

create index UNIDADUNIDAD_FK on UNIDAD (
   UNI_CODUNIDAD ASC
);

/*==============================================================*/
/*                       ALTER TABLES                           */
/*==============================================================*/

alter table CALENDARIO
   add constraint FK_CALENDAR_ESTADOCAL_ESTADO foreign key (IDESTADO)
      references ESTADO (IDESTADO);

alter table CALENDARIO
   add constraint FK_CALENDAR_OBRACALEN_OBRA foreign key (IDOBRA)
      references OBRA (IDOBRA);

alter table CALENDARIO
   add constraint FK_CALENDAR_TIPOCALEN_TIPOCALE foreign key (IDTIPOCALEN)
      references TIPOCALENDARIO (IDTIPOCALEN);

alter table COMPOSITOR
   add constraint FK_COMPOSIT_PAISCOMPO_PAIS foreign key (CODPAIS)
      references PAIS (CODPAIS);

alter table CONVOCATORIAESTUDIANTE
   add constraint FK_CONVOCAT_ESTUDIANT_ESTUDIAN foreign key (CODESTUDIANTE)
      references ESTUDIANTE (CODESTUDIANTE);

alter table CONVOCATORIAESTUDIANTE
   add constraint FK_CONVOCAT_INSTRUMEN_INSTRUME foreign key (IDINSTRUMENTO)
      references INSTRUMENTO (IDINSTRUMENTO);

alter table CONVOCATORIAESTUDIANTE
   add constraint FK_CONVOCAT_OBRACONVO_OBRA foreign key (IDOBRA)
      references OBRA (IDOBRA);

alter table EMPLEADO
   add constraint FK_EMPLEADO_ROLEMPLEA_ROL foreign key (ROL_PK)
      references ROL (ROL_PK);

alter table EMPLEADO
   add constraint FK_EMPLEADO_UNIDADEMP_UNIDAD foreign key (CODUNIDAD)
      references UNIDAD (CODUNIDAD);

alter table ESTUDIANTE
   add constraint FK_ESTUDIAN_UNIDADEST_UNIDAD foreign key (CODUNIDAD)
      references UNIDAD (CODUNIDAD);

alter table GASTOOBRA
   add constraint FK_GASTOOBR_LISTAGAST_LISTAGAS foreign key (IDPERIODO, CODGASTO)
      references LISTAGASTOUD (IDPERIODO, CODGASTO);

alter table GASTOOBRA
   add constraint FK_GASTOOBR_OBRAGASTO_OBRA foreign key (IDOBRA)
      references OBRA (IDOBRA);

alter table INVENTARIOINSTRUMENTO
   add constraint FK_INVENTAR_ESTADOINS_ESTADOIN foreign key (IDESTADOINSTRUMENTO)
      references ESTADOINSTRUMENTO (IDESTADOINSTRUMENTO);

alter table INVENTARIOINSTRUMENTO
   add constraint FK_INVENTAR_INSTRUMEN_INSTRUME foreign key (IDINSTRUMENTO)
      references INSTRUMENTO (IDINSTRUMENTO);

alter table LABORPERSONALOBRA
   add constraint FK_LABORPER_CALENDARI_CALENDAR foreign key (IDOBRA, IDTIPOCALEN, CONSECALENDARIO)
      references CALENDARIO (IDOBRA, IDTIPOCALEN, CONSECALENDARIO);

alter table LABORPERSONALOBRA
   add constraint FK_LABORPER_LISTALABO_LISTAACT foreign key (IDPERIODO, CODACTIVIDAD)
      references LISTAACTIVIDADUD (IDPERIODO, CODACTIVIDAD);

alter table LABORPERSONALOBRA
   add constraint FK_LABORPER_PERSONALL_PERSONAL foreign key (ROL_PK, CODUNIDAD, CODEMPLEADO, IDPERSONALOBRA)
      references PERSONALOBRA (ROL_PK, CODUNIDAD, CODEMPLEADO, IDPERSONALOBRA);

alter table LISTAACTIVIDADUD
   add constraint FK_LISTAACT_PERIODOLI_PERIODO foreign key (IDPERIODO)
      references PERIODO (IDPERIODO);

alter table LISTAGASTOUD
   add constraint FK_LISTAGAS_PERIODOLI_PERIODO foreign key (IDPERIODO)
      references PERIODO (IDPERIODO);

alter table OBRA
   add constraint FK_OBRA_COMPOSITO_COMPOSIT foreign key (IDCOMPOSITOR)
      references COMPOSITOR (IDCOMPOSITOR);

alter table OBRA
   add constraint FK_OBRA_GENEROOBR_GENEROOB foreign key (IDGENEROOBRA)
      references GENEROOBRA (IDGENEROOBRA);

alter table OBRA
   add constraint FK_OBRA_PAISOBRA_PAIS foreign key (CODPAIS)
      references PAIS (CODPAIS);

alter table OBRA
   add constraint FK_OBRA_PERIODOOB_PERIODO foreign key (IDPERIODO)
      references PERIODO (IDPERIODO);

alter table OBRAINSTRUMENTO
   add constraint FK_OBRAINST_OBRAINSTR_INSTRUME foreign key (IDINSTRUMENTO)
      references INSTRUMENTO (IDINSTRUMENTO);

alter table OBRAINSTRUMENTO
   add constraint FK_OBRAINST_OBRAINSTR_OBRA foreign key (IDOBRA)
      references OBRA (IDOBRA);

alter table PARTICIPACIONESTUDIANTE
   add constraint FK_PARTICIP_CALENDARI_CALENDAR foreign key (IDOBRA, IDTIPOCALEN, CONSECALENDARIO)
      references CALENDARIO (IDOBRA, IDTIPOCALEN, CONSECALENDARIO);

alter table PARTICIPACIONESTUDIANTE
   add constraint FK_PARTICIP_ESTUDIANT_ESTUDIAN foreign key (CODESTUDIANTE)
      references ESTUDIANTE (CODESTUDIANTE);

alter table PERSONALOBRA
   add constraint FK_PERSONAL_EMPLEADOP_EMPLEADO foreign key (ROL_PK, CODUNIDAD, CODEMPLEADO)
      references EMPLEADO (ROL_PK, CODUNIDAD, CODEMPLEADO);

alter table PERSONALOBRA
   add constraint FK_PERSONAL_OBRAPERSO_OBRA foreign key (IDOBRA)
      references OBRA (IDOBRA);

alter table UNIDAD
   add constraint FK_UNIDAD_TIPOUNIDA_TIPOUNID foreign key (TIPOUNIDAD)
      references TIPOUNIDAD (TIPOUNIDAD);

alter table UNIDAD
   add constraint FK_UNIDAD_UNIDADUNI_UNIDAD foreign key (UNI_CODUNIDAD)
      references UNIDAD (CODUNIDAD);

/*==============================================================*/
/*                          INSERTS                             */
/*==============================================================*/

/*==================*/
/*       1.2        */
/*==================*/

INSERT ALL INTO GENEROOBRA (IDGENEROOBRA,DESCGENERO) VALUES
	 ('1','MUSICA CULTA') INTO GENEROOBRA (IDGENEROOBRA,DESCGENERO) VALUES
	 ('2','MUSICA FOLCLORICA') INTO GENEROOBRA (IDGENEROOBRA,DESCGENERO) VALUES
	 ('3','MUSICA POPULAR') SELECT * FROM dual;

/*==================*/
/*       1.5        */
/*==================*/

INSERT ALL INTO PERIODO (IDPERIODO) VALUES
	 (202301) INTO PERIODO (IDPERIODO) VALUES
	 (202202) INTO PERIODO (IDPERIODO) VALUES
	 (202201) SELECT * FROM dual;

/*==================*/
/*       1.3        */
/*==================*/

INSERT ALL INTO PAIS (CODPAIS,NOMPAIS) VALUES
	 ('1','COLOMBIA') INTO PAIS (CODPAIS,NOMPAIS) VALUES
	 ('2','ARGENTINA') INTO PAIS (CODPAIS,NOMPAIS) VALUES
	 ('3','BOLIVIA') INTO PAIS (CODPAIS,NOMPAIS) VALUES
	 ('4','BRASIL') INTO PAIS (CODPAIS,NOMPAIS) VALUES
	 ('5','CHILE') INTO PAIS (CODPAIS,NOMPAIS) VALUES
	 ('6','COSTA RICA') INTO PAIS (CODPAIS,NOMPAIS) VALUES
	 ('7','CUBA') INTO PAIS (CODPAIS,NOMPAIS) VALUES
	 ('8','ECUADOR') INTO PAIS (CODPAIS,NOMPAIS) VALUES
	 ('9','EL SALVADOR') INTO PAIS (CODPAIS,NOMPAIS) VALUES
	 ('10','GUATEMALA') INTO PAIS (CODPAIS,NOMPAIS) VALUES 
	 ('11','HONDURAS')INTO PAIS (CODPAIS,NOMPAIS) VALUES 
	 ('12','MEXICO') INTO PAIS (CODPAIS,NOMPAIS) VALUES
	 ('13','NICARAGUA') INTO PAIS (CODPAIS,NOMPAIS) VALUES
	 ('14','PANAMA') INTO PAIS (CODPAIS,NOMPAIS) VALUES
	 ('15','PARAGUAY') INTO PAIS (CODPAIS,NOMPAIS) VALUES
	 ('16','PERU') INTO PAIS (CODPAIS,NOMPAIS) VALUES
	 ('17','REP. DOMINICANA') INTO PAIS (CODPAIS,NOMPAIS) VALUES
	 ('18','PUERTO RICO') INTO PAIS (CODPAIS,NOMPAIS) VALUES
	 ('19','URUGUAY') INTO PAIS (CODPAIS,NOMPAIS) VALUES
	 ('20','VENEZUELA') SELECT * FROM dual;

INSERT ALL INTO COMPOSITOR (IDCOMPOSITOR,CODPAIS,NOMCOMPOSITOR) VALUES
	('1','2','ALBERTO GINASTERA') INTO COMPOSITOR (IDCOMPOSITOR,CODPAIS,NOMCOMPOSITOR) VALUES
	('2','19','GERARDO MATOS') INTO COMPOSITOR (IDCOMPOSITOR,CODPAIS,NOMCOMPOSITOR) VALUES
	('3','4','HEITOR VILLALOBOS') INTO COMPOSITOR (IDCOMPOSITOR,CODPAIS,NOMCOMPOSITOR) VALUES
	('4','2','CARLOS GARDEL') INTO COMPOSITOR (IDCOMPOSITOR,CODPAIS,NOMCOMPOSITOR) VALUES
	('5','12','JOSE MONCAYO') SELECT * FROM dual;

INSERT ALL INTO OBRA (IDOBRA,IDCOMPOSITOR,CODPAIS,IDGENEROOBRA,IDPERIODO,FECHAOBRA,TITULO,ESTADO) VALUES
	('1','1','2','1',202301,TO_DATE('2023-06-20','YYYY-MM-DD'),'ESTANCIA','1') INTO OBRA (IDOBRA,IDCOMPOSITOR,CODPAIS,IDGENEROOBRA,IDPERIODO,FECHAOBRA,TITULO,ESTADO) VALUES
	('2','2','19','3',202301,TO_DATE('2023-06-18','YYYY-MM-DD'),'LA CUMPARSITA','1') INTO OBRA (IDOBRA,IDCOMPOSITOR,CODPAIS,IDGENEROOBRA,IDPERIODO,FECHAOBRA,TITULO,ESTADO) VALUES
	('3','3','4','1',202202,TO_DATE('2022-12-11','YYYY-MM-DD'),'BACHIANAS BRASILEIRAS','0') INTO OBRA (IDOBRA,IDCOMPOSITOR,CODPAIS,IDGENEROOBRA,IDPERIODO,FECHAOBRA,TITULO,ESTADO) VALUES
	('4','4','2','3',202301,TO_DATE('2023-06-19','YYYY-MM-DD'),'EL DIA QUE ME QUIERAS','1') INTO OBRA (IDOBRA,IDCOMPOSITOR,CODPAIS,IDGENEROOBRA,IDPERIODO,FECHAOBRA,TITULO,ESTADO) VALUES
	('5','5','12','2',202201,TO_DATE('2022-06-15','YYYY-MM-DD'),'HUAPANGO','0') SELECT * FROM dual;

/*==================*/
/*       1.4        */
/*==================*/

INSERT ALL INTO INSTRUMENTO (IDINSTRUMENTO,NOMINSTRUMENTO) VALUES
	('1','PIANO') INTO INSTRUMENTO (IDINSTRUMENTO,NOMINSTRUMENTO) VALUES
	('2','GUITARRA') INTO INSTRUMENTO (IDINSTRUMENTO,NOMINSTRUMENTO) VALUES
	('3','VIOLIN') INTO INSTRUMENTO (IDINSTRUMENTO,NOMINSTRUMENTO) VALUES
	('4','CONTRABAJO') INTO INSTRUMENTO (IDINSTRUMENTO,NOMINSTRUMENTO) VALUES
	('5','CLARINETE') INTO INSTRUMENTO (IDINSTRUMENTO,NOMINSTRUMENTO) VALUES
	('6','TROMPETAS') INTO INSTRUMENTO (IDINSTRUMENTO,NOMINSTRUMENTO) VALUES
	('7','ARPA') INTO INSTRUMENTO (IDINSTRUMENTO,NOMINSTRUMENTO) VALUES
	('8','BANDONEON') INTO INSTRUMENTO (IDINSTRUMENTO,NOMINSTRUMENTO) VALUES
	('9','VOZ') INTO INSTRUMENTO (IDINSTRUMENTO,NOMINSTRUMENTO) VALUES
	('10','SAXOFON') INTO INSTRUMENTO (IDINSTRUMENTO,NOMINSTRUMENTO) VALUES
	('11','JARANA') SELECT * FROM dual;

INSERT ALL INTO OBRAINSTRUMENTO (IDINSTRUMENTO,IDOBRA) VALUES
   /*OBRA 1*/
	('1','1') INTO OBRAINSTRUMENTO (IDINSTRUMENTO,IDOBRA) VALUES
	('2','1') INTO OBRAINSTRUMENTO (IDINSTRUMENTO,IDOBRA) VALUES
	('7','1') INTO OBRAINSTRUMENTO (IDINSTRUMENTO,IDOBRA) VALUES
	('3','1') INTO OBRAINSTRUMENTO (IDINSTRUMENTO,IDOBRA) VALUES
	('6','1') INTO OBRAINSTRUMENTO (IDINSTRUMENTO,IDOBRA) VALUES
	('5','1') INTO OBRAINSTRUMENTO (IDINSTRUMENTO,IDOBRA) VALUES
   /*OBRA 2*/
	('8','2') INTO OBRAINSTRUMENTO (IDINSTRUMENTO,IDOBRA) VALUES
	('3','2') INTO OBRAINSTRUMENTO (IDINSTRUMENTO,IDOBRA) VALUES
	('1','2') INTO OBRAINSTRUMENTO (IDINSTRUMENTO,IDOBRA) VALUES
	('4','2') INTO OBRAINSTRUMENTO (IDINSTRUMENTO,IDOBRA) VALUES
	('2','2') INTO OBRAINSTRUMENTO (IDINSTRUMENTO,IDOBRA) VALUES
	('10','2') INTO OBRAINSTRUMENTO (IDINSTRUMENTO,IDOBRA) VALUES
   /*OBRA 3*/
	('3','3') INTO OBRAINSTRUMENTO (IDINSTRUMENTO,IDOBRA) VALUES
	('4','3') INTO OBRAINSTRUMENTO (IDINSTRUMENTO,IDOBRA) VALUES
	('9','3') INTO OBRAINSTRUMENTO (IDINSTRUMENTO,IDOBRA) VALUES
	('2','3') INTO OBRAINSTRUMENTO (IDINSTRUMENTO,IDOBRA) VALUES
	('5','3') INTO OBRAINSTRUMENTO (IDINSTRUMENTO,IDOBRA) VALUES
	('6','3') INTO OBRAINSTRUMENTO (IDINSTRUMENTO,IDOBRA) VALUES
   /*OBRA 4*/
	('9','4') INTO OBRAINSTRUMENTO (IDINSTRUMENTO,IDOBRA) VALUES
	('2','4') INTO OBRAINSTRUMENTO (IDINSTRUMENTO,IDOBRA) VALUES
	('8','4') INTO OBRAINSTRUMENTO (IDINSTRUMENTO,IDOBRA) VALUES
	('3','4') INTO OBRAINSTRUMENTO (IDINSTRUMENTO,IDOBRA) VALUES
	('4','4') INTO OBRAINSTRUMENTO (IDINSTRUMENTO,IDOBRA) VALUES
	('1','4') INTO OBRAINSTRUMENTO (IDINSTRUMENTO,IDOBRA) VALUES
   /*OBRA 5*/
	('2','5') INTO OBRAINSTRUMENTO (IDINSTRUMENTO,IDOBRA) VALUES
	('11','5') INTO OBRAINSTRUMENTO (IDINSTRUMENTO,IDOBRA) VALUES
	('7','5') INTO OBRAINSTRUMENTO (IDINSTRUMENTO,IDOBRA) VALUES
	('3','5') INTO OBRAINSTRUMENTO (IDINSTRUMENTO,IDOBRA) VALUES
	('4','5') INTO OBRAINSTRUMENTO (IDINSTRUMENTO,IDOBRA) VALUES
	('6','5') SELECT * FROM dual;

/*==================*/
/*       1.6        */
/*==================*/

INSERT ALL INTO LISTAACTIVIDADUD (IDPERIODO,CODACTIVIDAD,DESCACTIVIDAD,VALORHORA,MAXHORAS) VALUES
	(202301,'1','DIRECCION MUSICAL',150000,40) INTO LISTAACTIVIDADUD (IDPERIODO,CODACTIVIDAD,DESCACTIVIDAD,VALORHORA,MAXHORAS) VALUES
	(202301,'2','EVALUADOR MUSICAL',80000,40) INTO LISTAACTIVIDADUD (IDPERIODO,CODACTIVIDAD,DESCACTIVIDAD,VALORHORA,MAXHORAS) VALUES
	(202301,'3','COORDINADOR SINFONICA',100000,40) INTO LISTAACTIVIDADUD (IDPERIODO,CODACTIVIDAD,DESCACTIVIDAD,VALORHORA,MAXHORAS) VALUES
	(202301,'4','AUXILIAR GENERAL',25000,40) INTO LISTAACTIVIDADUD (IDPERIODO,CODACTIVIDAD,DESCACTIVIDAD,VALORHORA,MAXHORAS) VALUES
	(202301,'5','AUXILIAR INSTRUMENTOS',45000,40) SELECT * FROM dual;

/*==================*/
/*       1.7        */
/*==================*/

INSERT ALL INTO TIPOCALENDARIO (IDTIPOCALEN,DESCTIPOCALENDARIO) VALUES
	('1','PLANEACION') INTO TIPOCALENDARIO (IDTIPOCALEN,DESCTIPOCALENDARIO) VALUES
	('2','CONVOCATORIA') INTO TIPOCALENDARIO (IDTIPOCALEN,DESCTIPOCALENDARIO) VALUES
	('3','SELECCION') INTO TIPOCALENDARIO (IDTIPOCALEN,DESCTIPOCALENDARIO) VALUES
	('4','ENSAYO') INTO TIPOCALENDARIO (IDTIPOCALEN,DESCTIPOCALENDARIO) VALUES
	('5','FUNCION') INTO TIPOCALENDARIO (IDTIPOCALEN,DESCTIPOCALENDARIO) VALUES
   ('6','REPORTE ESTUDIANTES') INTO TIPOCALENDARIO (IDTIPOCALEN,DESCTIPOCALENDARIO) VALUES
   ('7','LIQUIDACION EMPLEADOS') INTO TIPOCALENDARIO (IDTIPOCALEN,DESCTIPOCALENDARIO) VALUES
   ('8','LIQUIDACION GASTOS') SELECT * FROM dual;

/*==================*/
/*       1.8        */
/*==================*/

INSERT ALL INTO TIPOUNIDAD (TIPOUNIDAD,DESCTIPOUNI) VALUES
	('1','ACADEMICA') INTO TIPOUNIDAD (TIPOUNIDAD,DESCTIPOUNI) VALUES
	('2','ADMINISTRATIVA') SELECT * FROM dual;

INSERT ALL INTO UNIDAD (CODUNIDAD,TIPOUNIDAD,UNI_CODUNIDAD,NOMUNIDAD) VALUES
	('1','2',NULL,'RECTORIA') INTO UNIDAD (CODUNIDAD,TIPOUNIDAD,UNI_CODUNIDAD,NOMUNIDAD) VALUES
	('2','2','1','VICERRECTORIA') INTO UNIDAD (CODUNIDAD,TIPOUNIDAD,UNI_CODUNIDAD,NOMUNIDAD) VALUES
	('3','1','1','FACULTAD ARTES') INTO UNIDAD (CODUNIDAD,TIPOUNIDAD,UNI_CODUNIDAD,NOMUNIDAD) VALUES
	('4','1','1','FACULTAD CIENCIAS') INTO UNIDAD (CODUNIDAD,TIPOUNIDAD,UNI_CODUNIDAD,NOMUNIDAD) VALUES
	('5','1','3','ARTE MUSICAL') INTO UNIDAD (CODUNIDAD,TIPOUNIDAD,UNI_CODUNIDAD,NOMUNIDAD) VALUES
	('6','1','3','ARTE PLASTICO') INTO UNIDAD (CODUNIDAD,TIPOUNIDAD,UNI_CODUNIDAD,NOMUNIDAD) VALUES
	('7','1','3','ARTE DANZARIO') INTO UNIDAD (CODUNIDAD,TIPOUNIDAD,UNI_CODUNIDAD,NOMUNIDAD) VALUES
	('8','1','4','MATEMATICAS') INTO UNIDAD (CODUNIDAD,TIPOUNIDAD,UNI_CODUNIDAD,NOMUNIDAD) VALUES
	('9','1','4','FISICA') INTO UNIDAD (CODUNIDAD,TIPOUNIDAD,UNI_CODUNIDAD,NOMUNIDAD) VALUES
	('10','1','4','QUIMICA') SELECT * FROM dual;

/*==================*/
/*       1.9        */
/*==================*/

INSERT ALL INTO ESTUDIANTE (CODESTUDIANTE,CODUNIDAD,NOMBRE,APELLIDO,FECHAINSCRIPCION,FECHANACIMIENTO,CORREO) VALUES
   ('1','5','FELIPE','VELANDIA',TO_DATE('2023-02-01','YYYY-MM-DD'),TO_DATE('2001-02-15','YYYY-MM-DD'),'FVELANDIA@GMAIL.COM')
      INTO ESTUDIANTE (CODESTUDIANTE,CODUNIDAD,NOMBRE,APELLIDO,FECHAINSCRIPCION,FECHANACIMIENTO,CORREO) VALUES
   ('2','8','YOUSSEF','ORTIZ',TO_DATE('2023-02-01','YYYY-MM-DD'),TO_DATE('2002-03-22','YYYY-MM-DD'),'YORTIZ@GMAIL.COM')
      INTO ESTUDIANTE (CODESTUDIANTE,CODUNIDAD,NOMBRE,APELLIDO,FECHAINSCRIPCION,FECHANACIMIENTO,CORREO) VALUES
   ('3','10','DANIEL','RUBIANO',TO_DATE('2023-02-01','YYYY-MM-DD'),TO_DATE('2002-06-01','YYYY-MM-DD'),'DRUBIANO@GMAIL.COM')
      INTO ESTUDIANTE (CODESTUDIANTE,CODUNIDAD,NOMBRE,APELLIDO,FECHAINSCRIPCION,FECHANACIMIENTO,CORREO) VALUES
   ('4','6','KEVIN','PARKER',TO_DATE('2023-02-01','YYYY-MM-DD'),TO_DATE('2001-01-05','YYYY-MM-DD'),'KPARKER@GMAIL.COM')
      INTO ESTUDIANTE (CODESTUDIANTE,CODUNIDAD,NOMBRE,APELLIDO,FECHAINSCRIPCION,FECHANACIMIENTO,CORREO) VALUES
   ('5','9','MATT','HELDERS',TO_DATE('2023-02-01','YYYY-MM-DD'),TO_DATE('2001-10-26','YYYY-MM-DD'),'MHELDERS@GMAIL.COM')
      INTO ESTUDIANTE (CODESTUDIANTE,CODUNIDAD,NOMBRE,APELLIDO,FECHAINSCRIPCION,FECHANACIMIENTO,CORREO) VALUES
   ('6','7','CONOR','MASON',TO_DATE('2023-02-01','YYYY-MM-DD'),TO_DATE('2002-09-11','YYYY-MM-DD'),'CMASON@GMAIL.COM')
      INTO ESTUDIANTE (CODESTUDIANTE,CODUNIDAD,NOMBRE,APELLIDO,FECHAINSCRIPCION,FECHANACIMIENTO,CORREO) VALUES
   ('7','6','THOM','YORKE',TO_DATE('2022-08-01','YYYY-MM-DD'),TO_DATE('2001-08-17','YYYY-MM-DD'),'TYORKE@GMAIL.COM')
      INTO ESTUDIANTE (CODESTUDIANTE,CODUNIDAD,NOMBRE,APELLIDO,FECHAINSCRIPCION,FECHANACIMIENTO,CORREO) VALUES
   ('8','10','TYLER','JOSEPH',TO_DATE('2022-08-01','YYYY-MM-DD'),TO_DATE('2002-03-19','YYYY-MM-DD'),'TJOSEPH@GMAIL.COM')
      INTO ESTUDIANTE (CODESTUDIANTE,CODUNIDAD,NOMBRE,APELLIDO,FECHAINSCRIPCION,FECHANACIMIENTO,CORREO) VALUES
   ('9','5','JOSHUA','DUN',TO_DATE('2023-02-01','YYYY-MM-DD'),TO_DATE('2002-05-13','YYYY-MM-DD'),'JDUN@GMAIL.COM')
      INTO ESTUDIANTE (CODESTUDIANTE,CODUNIDAD,NOMBRE,APELLIDO,FECHAINSCRIPCION,FECHANACIMIENTO,CORREO) VALUES
   ('10','9','DAN','REYNOLDS',TO_DATE('2023-02-01','YYYY-MM-DD'),TO_DATE('2001-01-02','YYYY-MM-DD'),'DREYNOLDS@GMAIL.COM')
      INTO ESTUDIANTE (CODESTUDIANTE,CODUNIDAD,NOMBRE,APELLIDO,FECHAINSCRIPCION,FECHANACIMIENTO,CORREO) VALUES
   ('11','7','MAY','KERSHAW',TO_DATE('2023-02-01','YYYY-MM-DD'),TO_DATE('2002-12-22','YYYY-MM-DD'),'MKERSHAW@GMAIL.COM')
      INTO ESTUDIANTE (CODESTUDIANTE,CODUNIDAD,NOMBRE,APELLIDO,FECHAINSCRIPCION,FECHANACIMIENTO,CORREO) VALUES
   ('12','9','TYLER','HYDE',TO_DATE('2023-02-01','YYYY-MM-DD'),TO_DATE('2001-09-25','YYYY-MM-DD'),'THYDE@GMAIL.COM')
      INTO ESTUDIANTE (CODESTUDIANTE,CODUNIDAD,NOMBRE,APELLIDO,FECHAINSCRIPCION,FECHANACIMIENTO,CORREO) VALUES
   ('13','5','GEORGIA','ELLERY',TO_DATE('2022-02-01','YYYY-MM-DD'),TO_DATE('2002-03-15','YYYY-MM-DD'),'GELLERY@GMAIL.COM')
      INTO ESTUDIANTE (CODESTUDIANTE,CODUNIDAD,NOMBRE,APELLIDO,FECHAINSCRIPCION,FECHANACIMIENTO,CORREO) VALUES
   ('14','8','ISAAC','WOOD',TO_DATE('2022-02-01','YYYY-MM-DD'),TO_DATE('2001-06-18','YYYY-MM-DD'),'IWOOD@GMAIL.COM')
      INTO ESTUDIANTE (CODESTUDIANTE,CODUNIDAD,NOMBRE,APELLIDO,FECHAINSCRIPCION,FECHANACIMIENTO,CORREO) VALUES
   ('15','8','CHARLIE','WAYNE',TO_DATE('2022-02-01','YYYY-MM-DD'),TO_DATE('2001-04-05','YYYY-MM-DD'),'CWAYNE@GMAIL.COM') SELECT * FROM dual;

INSERT ALL INTO CONVOCATORIAESTUDIANTE (IDOBRA,CONSEC,IDINSTRUMENTO,CODESTUDIANTE,FECHAINICIO,FECHAFIN,CALIFICACION) VALUES
   /*OBRA 1*/
   ('1',1,'1','1',TO_DATE('2023-02-01','YYYY-MM-DD'),TO_DATE('2023-06-20','YYYY-MM-DD'),3.8)
      INTO CONVOCATORIAESTUDIANTE (IDOBRA,CONSEC,IDINSTRUMENTO,CODESTUDIANTE,FECHAINICIO,FECHAFIN,CALIFICACION) VALUES
   ('1',2,'2','2',TO_DATE('2023-02-01','YYYY-MM-DD'),TO_DATE('2023-06-20','YYYY-MM-DD'),3.7)
      INTO CONVOCATORIAESTUDIANTE (IDOBRA,CONSEC,IDINSTRUMENTO,CODESTUDIANTE,FECHAINICIO,FECHAFIN,CALIFICACION) VALUES
   ('1',3,'7','3',TO_DATE('2023-02-01','YYYY-MM-DD'),TO_DATE('2023-06-20','YYYY-MM-DD'),4.5)
      INTO CONVOCATORIAESTUDIANTE (IDOBRA,CONSEC,IDINSTRUMENTO,CODESTUDIANTE,FECHAINICIO,FECHAFIN,CALIFICACION) VALUES
   /*OBRA 2*/ 
   ('2',4,'1','4',TO_DATE('2023-02-01','YYYY-MM-DD'),TO_DATE('2023-06-18','YYYY-MM-DD'),5.0)
      INTO CONVOCATORIAESTUDIANTE (IDOBRA,CONSEC,IDINSTRUMENTO,CODESTUDIANTE,FECHAINICIO,FECHAFIN,CALIFICACION) VALUES
   ('2',5,'3','5',TO_DATE('2023-02-01','YYYY-MM-DD'),TO_DATE('2023-06-18','YYYY-MM-DD'),4.8)
      INTO CONVOCATORIAESTUDIANTE (IDOBRA,CONSEC,IDINSTRUMENTO,CODESTUDIANTE,FECHAINICIO,FECHAFIN,CALIFICACION) VALUES
   ('2',6,'8','6',TO_DATE('2023-02-01','YYYY-MM-DD'),TO_DATE('2023-06-18','YYYY-MM-DD'),4.2)
      INTO CONVOCATORIAESTUDIANTE (IDOBRA,CONSEC,IDINSTRUMENTO,CODESTUDIANTE,FECHAINICIO,FECHAFIN,CALIFICACION) VALUES
   /*OBRA 3*/
   ('3',7,'4','7',TO_DATE('2022-08-01','YYYY-MM-DD'),TO_DATE('2022-12-11','YYYY-MM-DD'),3.5)
      INTO CONVOCATORIAESTUDIANTE (IDOBRA,CONSEC,IDINSTRUMENTO,CODESTUDIANTE,FECHAINICIO,FECHAFIN,CALIFICACION) VALUES
   ('3',8,'9','8',TO_DATE('2022-08-01','YYYY-MM-DD'),TO_DATE('2022-12-11','YYYY-MM-DD'),4.8)
      INTO CONVOCATORIAESTUDIANTE (IDOBRA,CONSEC,IDINSTRUMENTO,CODESTUDIANTE,FECHAINICIO,FECHAFIN,CALIFICACION) VALUES
   /*OBRA 4*/
   ('4',9,'2','9',TO_DATE('2023-02-01','YYYY-MM-DD'),TO_DATE('2023-06-19','YYYY-MM-DD'),4.7)
      INTO CONVOCATORIAESTUDIANTE (IDOBRA,CONSEC,IDINSTRUMENTO,CODESTUDIANTE,FECHAINICIO,FECHAFIN,CALIFICACION) VALUES
   ('4',10,'3','10',TO_DATE('2023-02-01','YYYY-MM-DD'),TO_DATE('2023-06-19','YYYY-MM-DD'),4.3)
      INTO CONVOCATORIAESTUDIANTE (IDOBRA,CONSEC,IDINSTRUMENTO,CODESTUDIANTE,FECHAINICIO,FECHAFIN,CALIFICACION) VALUES
   ('4',11,'8','11',TO_DATE('2023-02-01','YYYY-MM-DD'),TO_DATE('2023-06-19','YYYY-MM-DD'),4.6)
      INTO CONVOCATORIAESTUDIANTE (IDOBRA,CONSEC,IDINSTRUMENTO,CODESTUDIANTE,FECHAINICIO,FECHAFIN,CALIFICACION) VALUES
   ('4',12,'9','12',TO_DATE('2023-02-01','YYYY-MM-DD'),TO_DATE('2023-06-19','YYYY-MM-DD'),4.9)
      INTO CONVOCATORIAESTUDIANTE (IDOBRA,CONSEC,IDINSTRUMENTO,CODESTUDIANTE,FECHAINICIO,FECHAFIN,CALIFICACION) VALUES
   /*OBRA 5*/
   ('5',13,'2','13',TO_DATE('2022-02-01','YYYY-MM-DD'),TO_DATE('2022-06-15','YYYY-MM-DD'),5.0)
      INTO CONVOCATORIAESTUDIANTE (IDOBRA,CONSEC,IDINSTRUMENTO,CODESTUDIANTE,FECHAINICIO,FECHAFIN,CALIFICACION) VALUES
   ('5',14,'7','14',TO_DATE('2022-02-01','YYYY-MM-DD'),TO_DATE('2022-06-15','YYYY-MM-DD'),3.6)
      INTO CONVOCATORIAESTUDIANTE (IDOBRA,CONSEC,IDINSTRUMENTO,CODESTUDIANTE,FECHAINICIO,FECHAFIN,CALIFICACION) VALUES
   ('5',15,'11','15',TO_DATE('2022-02-01','YYYY-MM-DD'),TO_DATE('2022-06-15','YYYY-MM-DD'),4.2) SELECT * FROM dual;

/*==================*/
/*       1.10       */
/*==================*/

INSERT ALL INTO ROL (ROL_PK,DESCROL) VALUES
   (1,'DOCENTE') INTO ROL (ROL_PK,DESCROL) VALUES
   (2,'DIRECTOR') INTO ROL (ROL_PK,DESCROL) VALUES
   (3,'EVALUADOR') INTO ROL (ROL_PK,DESCROL) VALUES
   (4,'COORDINADOR') INTO ROL (ROL_PK,DESCROL) VALUES
   (5,'AUX. GENERAL') INTO ROL (ROL_PK,DESCROL) VALUES
   (6,'AUX. INSTRUM.') SELECT * FROM dual;

INSERT ALL INTO EMPLEADO (ROL_PK,CODUNIDAD,CODEMPLEADO,NOMBRE,APELLIDO,CEDULA,CELULAR,CORREO) VALUES
   (1,'5','1','OMAR','PEREZ','1029120982','3112039485','OPEREZ@GMAIL.COM') INTO EMPLEADO (ROL_PK,CODUNIDAD,CODEMPLEADO,NOMBRE,APELLIDO,CEDULA,CELULAR,CORREO) VALUES
   (1,'6','2','DAVID','XENEIZE','182948291','310993485','DXENEIXE@GMAIL.COM') INTO EMPLEADO (ROL_PK,CODUNIDAD,CODEMPLEADO,NOMBRE,APELLIDO,CEDULA,CELULAR,CORREO) VALUES
   (1,'7','3','SAMUEL','LUQUE','128937485','300194738','SLUQUE@GMAIL.COM') INTO EMPLEADO (ROL_PK,CODUNIDAD,CODEMPLEADO,NOMBRE,APELLIDO,CEDULA,CELULAR,CORREO) VALUES
   (2,'8','4','GUILLERMO','DIAZ','199023447','309288475','GDIAZ@GMAIL.COM') INTO EMPLEADO (ROL_PK,CODUNIDAD,CODEMPLEADO,NOMBRE,APELLIDO,CEDULA,CELULAR,CORREO) VALUES
   (3,'9','5','GERMAN','CANO','100992347','302188463','GCANO@GMAIL.COM') INTO EMPLEADO (ROL_PK,CODUNIDAD,CODEMPLEADO,NOMBRE,APELLIDO,CEDULA,CELULAR,CORREO) VALUES
   (4,'10','6','BRAYAN','ASCANIO','102237845','3110947589','BASCANIO@GMAIL.COM') INTO EMPLEADO (ROL_PK,CODUNIDAD,CODEMPLEADO,NOMBRE,APELLIDO,CEDULA,CELULAR,CORREO) VALUES
   (5,'2','7','JUAN','RODRIGUEZ','108649903','3192033889','JRODRIGUEZ@GMAIL.COM') INTO EMPLEADO (ROL_PK,CODUNIDAD,CODEMPLEADO,NOMBRE,APELLIDO,CEDULA,CELULAR,CORREO) VALUES
   (5,'2','8','ALICIA','ROJAS','122305485','300298487','AROJAS@GMAIL.COM') INTO EMPLEADO (ROL_PK,CODUNIDAD,CODEMPLEADO,NOMBRE,APELLIDO,CEDULA,CELULAR,CORREO) VALUES
   (6,'2','9','AURA','PULIDO','102289453','311994385','APULIDO@GMAIL.COM') INTO EMPLEADO (ROL_PK,CODUNIDAD,CODEMPLEADO,NOMBRE,APELLIDO,CEDULA,CELULAR,CORREO) VALUES
   (6,'2','10','MARTA','MARTINEZ','108747758','3102464855','MMARTINEZ@GMAIL.COM') SELECT * FROM dual;

/*==================*/
/*       2.3.1      */
/*==================*/

INSERT ALL INTO ESTADO (IDESTADO) VALUES
   ('ACTIVO') INTO ESTADO (IDESTADO) VALUES
   ('INACTIVO') SELECT * FROM dual;

INSERT ALL INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   /*OBRA 1*/
   ('1','1',1,'ACTIVO',TO_DATE('2023-02-01','YYYY-MM-DD'),TO_DATE('2023-02-28','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('1','2',2,'ACTIVO',TO_DATE('2023-03-01','YYYY-MM-DD'),TO_DATE('2022-03-31','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('1','3',3,'ACTIVO',TO_DATE('2023-04-01','YYYY-MM-DD'),TO_DATE('2023-04-10','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('1','4',4,'ACTIVO',TO_DATE('2023-04-18','YYYY-MM-DD'),TO_DATE('2023-04-18','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('1','4',5,'ACTIVO',TO_DATE('2023-04-20','YYYY-MM-DD'),TO_DATE('2023-04-20','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('1','4',6,'ACTIVO',TO_DATE('2023-04-25','YYYY-MM-DD'),TO_DATE('2023-04-25','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('1','4',7,'ACTIVO',TO_DATE('2023-04-27','YYYY-MM-DD'),TO_DATE('2023-04-27','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('1','4',8,'ACTIVO',TO_DATE('2023-05-02','YYYY-MM-DD'),TO_DATE('2023-05-02','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('1','4',9,'ACTIVO',TO_DATE('2023-05-04','YYYY-MM-DD'),TO_DATE('2023-05-04','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('1','4',10,'ACTIVO',TO_DATE('2023-05-09','YYYY-MM-DD'),TO_DATE('2023-05-09','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('1','4',11,'ACTIVO',TO_DATE('2023-05-11','YYYY-MM-DD'),TO_DATE('2023-05-11','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('1','4',12,'ACTIVO',TO_DATE('2023-05-16','YYYY-MM-DD'),TO_DATE('2023-05-16','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('1','4',13,'ACTIVO',TO_DATE('2023-05-18','YYYY-MM-DD'),TO_DATE('2023-05-18','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('1','4',14,'ACTIVO',TO_DATE('2023-05-23','YYYY-MM-DD'),TO_DATE('2023-05-23','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('1','4',15,'ACTIVO',TO_DATE('2023-05-25','YYYY-MM-DD'),TO_DATE('2023-05-25','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('1','4',16,'ACTIVO',TO_DATE('2023-05-30','YYYY-MM-DD'),TO_DATE('2023-05-30','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('1','4',17,'ACTIVO',TO_DATE('2023-06-01','YYYY-MM-DD'),TO_DATE('2023-06-01','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('1','4',18,'ACTIVO',TO_DATE('2023-06-06','YYYY-MM-DD'),TO_DATE('2023-06-06','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('1','4',19,'ACTIVO',TO_DATE('2023-06-08','YYYY-MM-DD'),TO_DATE('2023-06-08','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('1','5',20,'ACTIVO',TO_DATE('2023-06-09','YYYY-MM-DD'),TO_DATE('2023-06-09','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('1','5',21,'ACTIVO',TO_DATE('2023-06-10','YYYY-MM-DD'),TO_DATE('2023-06-10','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('1','5',22,'ACTIVO',TO_DATE('2023-06-11','YYYY-MM-DD'),TO_DATE('2023-06-11','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('1','6',23,'ACTIVO',TO_DATE('2023-06-12','YYYY-MM-DD'),TO_DATE('2023-06-16','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('1','7',24,'ACTIVO',TO_DATE('2023-06-19','YYYY-MM-DD'),TO_DATE('2023-06-23','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('1','8',25,'ACTIVO',TO_DATE('2023-06-26','YYYY-MM-DD'),TO_DATE('2023-06-30','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   /*OBRA 2*/
   ('2','1',26,'ACTIVO',TO_DATE('2023-02-01','YYYY-MM-DD'),TO_DATE('2023-02-28','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('2','2',27,'ACTIVO',TO_DATE('2023-03-01','YYYY-MM-DD'),TO_DATE('2022-03-31','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('2','3',28,'ACTIVO',TO_DATE('2023-04-01','YYYY-MM-DD'),TO_DATE('2023-04-10','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('2','4',29,'ACTIVO',TO_DATE('2023-04-18','YYYY-MM-DD'),TO_DATE('2023-04-18','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('2','4',30,'ACTIVO',TO_DATE('2023-04-20','YYYY-MM-DD'),TO_DATE('2023-04-20','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('2','4',31,'ACTIVO',TO_DATE('2023-04-25','YYYY-MM-DD'),TO_DATE('2023-04-25','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('2','4',32,'ACTIVO',TO_DATE('2023-04-27','YYYY-MM-DD'),TO_DATE('2023-04-27','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('2','4',33,'ACTIVO',TO_DATE('2023-05-02','YYYY-MM-DD'),TO_DATE('2023-05-02','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('2','4',34,'ACTIVO',TO_DATE('2023-05-04','YYYY-MM-DD'),TO_DATE('2023-05-04','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('2','4',35,'ACTIVO',TO_DATE('2023-05-09','YYYY-MM-DD'),TO_DATE('2023-05-09','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('2','4',36,'ACTIVO',TO_DATE('2023-05-11','YYYY-MM-DD'),TO_DATE('2023-05-11','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('2','4',37,'ACTIVO',TO_DATE('2023-05-16','YYYY-MM-DD'),TO_DATE('2023-05-16','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('2','4',38,'ACTIVO',TO_DATE('2023-05-18','YYYY-MM-DD'),TO_DATE('2023-05-18','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('2','4',39,'ACTIVO',TO_DATE('2023-05-23','YYYY-MM-DD'),TO_DATE('2023-05-23','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('2','4',40,'ACTIVO',TO_DATE('2023-05-25','YYYY-MM-DD'),TO_DATE('2023-05-25','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('2','4',41,'ACTIVO',TO_DATE('2023-05-30','YYYY-MM-DD'),TO_DATE('2023-05-30','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('2','4',42,'ACTIVO',TO_DATE('2023-06-01','YYYY-MM-DD'),TO_DATE('2023-06-01','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('2','4',43,'ACTIVO',TO_DATE('2023-06-06','YYYY-MM-DD'),TO_DATE('2023-06-06','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('2','4',44,'ACTIVO',TO_DATE('2023-06-08','YYYY-MM-DD'),TO_DATE('2023-06-08','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('2','5',45,'ACTIVO',TO_DATE('2023-06-09','YYYY-MM-DD'),TO_DATE('2023-06-09','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('2','5',46,'ACTIVO',TO_DATE('2023-06-10','YYYY-MM-DD'),TO_DATE('2023-06-10','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('2','5',47,'ACTIVO',TO_DATE('2023-06-11','YYYY-MM-DD'),TO_DATE('2023-06-11','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('2','6',48,'ACTIVO',TO_DATE('2023-06-12','YYYY-MM-DD'),TO_DATE('2023-06-16','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('2','7',49,'ACTIVO',TO_DATE('2023-06-19','YYYY-MM-DD'),TO_DATE('2023-06-23','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('2','8',50,'ACTIVO',TO_DATE('2023-06-26','YYYY-MM-DD'),TO_DATE('2023-06-30','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   /*OBRA 4*/
   ('4','1',51,'ACTIVO',TO_DATE('2023-02-01','YYYY-MM-DD'),TO_DATE('2023-02-28','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('4','2',52,'ACTIVO',TO_DATE('2023-03-01','YYYY-MM-DD'),TO_DATE('2022-03-31','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('4','3',53,'ACTIVO',TO_DATE('2023-04-01','YYYY-MM-DD'),TO_DATE('2023-04-10','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('4','4',54,'ACTIVO',TO_DATE('2023-04-18','YYYY-MM-DD'),TO_DATE('2023-04-18','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('4','4',55,'ACTIVO',TO_DATE('2023-04-20','YYYY-MM-DD'),TO_DATE('2023-04-20','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('4','4',56,'ACTIVO',TO_DATE('2023-04-25','YYYY-MM-DD'),TO_DATE('2023-04-25','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('4','4',57,'ACTIVO',TO_DATE('2023-04-27','YYYY-MM-DD'),TO_DATE('2023-04-27','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('4','4',58,'ACTIVO',TO_DATE('2023-05-02','YYYY-MM-DD'),TO_DATE('2023-05-02','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('4','4',59,'ACTIVO',TO_DATE('2023-05-04','YYYY-MM-DD'),TO_DATE('2023-05-04','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('4','4',60,'ACTIVO',TO_DATE('2023-05-09','YYYY-MM-DD'),TO_DATE('2023-05-09','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('4','4',61,'ACTIVO',TO_DATE('2023-05-11','YYYY-MM-DD'),TO_DATE('2023-05-11','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('4','4',62,'ACTIVO',TO_DATE('2023-05-16','YYYY-MM-DD'),TO_DATE('2023-05-16','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('4','4',63,'ACTIVO',TO_DATE('2023-05-18','YYYY-MM-DD'),TO_DATE('2023-05-18','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('4','4',64,'ACTIVO',TO_DATE('2023-05-23','YYYY-MM-DD'),TO_DATE('2023-05-23','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('4','4',65,'ACTIVO',TO_DATE('2023-05-25','YYYY-MM-DD'),TO_DATE('2023-05-25','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('4','4',66,'ACTIVO',TO_DATE('2023-05-30','YYYY-MM-DD'),TO_DATE('2023-05-30','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('4','4',67,'ACTIVO',TO_DATE('2023-06-01','YYYY-MM-DD'),TO_DATE('2023-06-01','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('4','4',68,'ACTIVO',TO_DATE('2023-06-06','YYYY-MM-DD'),TO_DATE('2023-06-06','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('4','4',69,'ACTIVO',TO_DATE('2023-06-08','YYYY-MM-DD'),TO_DATE('2023-06-08','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('4','5',70,'ACTIVO',TO_DATE('2023-06-09','YYYY-MM-DD'),TO_DATE('2023-06-09','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('4','5',71,'ACTIVO',TO_DATE('2023-06-10','YYYY-MM-DD'),TO_DATE('2023-06-10','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('4','5',72,'ACTIVO',TO_DATE('2023-06-11','YYYY-MM-DD'),TO_DATE('2023-06-11','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('4','6',73,'ACTIVO',TO_DATE('2023-06-12','YYYY-MM-DD'),TO_DATE('2023-06-16','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('4','7',74,'ACTIVO',TO_DATE('2023-06-19','YYYY-MM-DD'),TO_DATE('2023-06-23','YYYY-MM-DD'))
      INTO CALENDARIO (IDOBRA,IDTIPOCALEN,CONSECALENDARIO,IDESTADO,FECHAINICIO,FECHAFIN) VALUES
   ('4','8',75,'ACTIVO',TO_DATE('2023-06-26','YYYY-MM-DD'),TO_DATE('2023-06-30','YYYY-MM-DD')) SELECT * FROM dual;

/*==================*/
/*       2.5.2      */
/*==================*/

INSERT ALL INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   /*OBRA 1*/
      /*ESTUDIANTE 1*/
   (1,'1','1','3',3) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (2,'1','1','4',4) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (3,'1','1','4',5) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (4,'1','1','4',6) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (5,'1','1','4',7) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (6,'1','1','4',8) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (7,'1','1','4',9) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (8,'1','1','4',10) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (9,'1','1','4',11) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (10,'1','1','4',12) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (11,'1','1','4',13) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (12,'1','1','4',14) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (13,'1','1','4',15) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (14,'1','1','4',16) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (15,'1','1','4',17) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (16,'1','1','4',18) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (17,'1','1','4',19) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (18,'1','1','5',20) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (19,'1','1','5',21) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (20,'1','1','5',22) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
      /*ESTUDIANTE 2*/
   (21,'2','1','3',3) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (22,'2','1','4',4) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (23,'2','1','4',5) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (24,'2','1','4',6) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (25,'2','1','4',7) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (26,'2','1','4',8) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (27,'2','1','4',9) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (28,'2','1','4',10) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (29,'2','1','4',11) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (30,'2','1','4',12) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (31,'2','1','4',13) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (33,'2','1','4',15) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (34,'2','1','4',16) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (35,'2','1','4',17) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (36,'2','1','4',18) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (37,'2','1','4',19) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (38,'2','1','5',20) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (39,'2','1','5',21) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (40,'2','1','5',22) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
      /*ESTUDIANTE 3*/
   (41,'3','1','3',3) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (42,'3','1','4',4) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (43,'3','1','4',5) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (44,'3','1','4',6) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (45,'3','1','4',7) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (46,'3','1','4',8) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (47,'3','1','4',9) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (48,'3','1','4',10) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (49,'3','1','4',11) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (50,'3','1','4',12) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (51,'3','1','4',13) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (52,'3','1','4',14) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (53,'3','1','4',15) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (54,'3','1','4',16) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (55,'3','1','4',17) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (56,'3','1','4',18) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (58,'3','1','5',20) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (59,'3','1','5',21) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (60,'3','1','5',22) SELECT * FROM dual;
   
   /*
   OBRA 2
      ESTUDIANTE 4
   (61,'4','2','3',28) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (62,'4','2','4',29) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (63,'4','2','4',30) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (64,'4','2','4',31) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (65,'4','2','4',32) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (66,'4','2','4',33) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (67,'4','2','4',34) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (68,'4','2','4',35) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (69,'4','2','4',36) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (70,'4','2','4',37) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (71,'4','2','4',38) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (72,'4','2','4',39) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (73,'4','2','4',40) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (74,'4','2','4',41) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (75,'4','2','4',42) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (76,'4','2','4',43) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (77,'4','2','4',44) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (78,'4','2','5',45) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (79,'4','2','5',46) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (80,'4','2','5',47) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
      ESTUDIANTE 5
   (81,'5','2','3',28) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (82,'5','2','4',29) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (83,'5','2','4',30) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (84,'5','2','4',31) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (85,'5','2','4',32) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (86,'5','2','4',33) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (87,'5','2','4',34) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (88,'5','2','4',35) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (89,'5','2','4',36) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (90,'5','2','4',37) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (91,'5','2','4',38) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (92,'5','2','4',39) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (93,'5','2','4',40) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (94,'5','2','4',41) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (95,'5','2','4',42) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (96,'5','2','4',43) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (97,'5','2','4',44) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (98,'5','2','5',45) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (99,'5','2','5',46) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (100,'5','2','5',47) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
      ESTUDIANTE 6
   (101,'6','2','3',28) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (102,'6','2','4',29) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (103,'6','2','4',30) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (104,'6','2','4',31) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (105,'6','2','4',32) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (106,'6','2','4',33) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (107,'6','2','4',34) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (108,'6','2','4',35) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (109,'6','2','4',36) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (110,'6','2','4',37) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (111,'6','2','4',38) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (112,'6','2','4',39) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (113,'6','2','4',40) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (114,'6','2','4',41) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (115,'6','2','4',42) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (116,'6','2','4',43) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (117,'6','2','4',44) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (118,'6','2','5',45) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (119,'6','2','5',46) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (120,'6','2','5',47) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES

   OBRA 3 (SIN PLANEAR)
      ESTUDIANTE 7
   (121,'7','3','3',3) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (122,'7','1','4',4) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (123,'7','1','4',5) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (124,'7','1','4',6) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (125,'7','1','4',7) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (126,'7','1','4',8) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (127,'7','1','4',9) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (128,'7','1','4',10) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (129,'7','1','4',11) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (130,'7','1','4',12) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (131,'7','1','4',13) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (132,'7','1','4',14) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (133,'7','1','4',15) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (134,'7','1','4',16) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (135,'7','1','4',17) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (136,'7','1','4',18) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (137,'7','1','4',19) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (138,'7','1','5',20) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (139,'7','1','5',21) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (140,'7','1','5',22) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
      ESTUDIANTE 8
   (141,'8','1','3',3) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (142,'8','1','4',4) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (143,'8','1','4',5) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (144,'8','1','4',6) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (145,'8','1','4',7) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (146,'8','1','4',8) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (147,'8','1','4',9) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (148,'8','1','4',10) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (149,'8','1','4',11) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (150,'8','1','4',12) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (151,'8','1','4',13) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (152,'8','1','4',14) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (153,'8','1','4',15) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (154,'8','1','4',16) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (155,'8','1','4',17) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (156,'8','1','4',18) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (157,'8','1','4',19) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (158,'8','1','5',20) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (159,'8','1','5',21) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (160,'8','1','5',22) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES

   OBRA 4
      ESTUDIANTE 9
   (161,'9','4','3',53) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (162,'9','4','4',54) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (163,'9','4','4',55) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (164,'9','4','4',56) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (165,'9','4','4',57) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (166,'9','4','4',58) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (167,'9','4','4',59) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (168,'9','4','4',60) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (169,'9','4','4',61) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (170,'9','4','4',62) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (171,'9','4','4',63) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (172,'9','4','4',64) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (173,'9','4','4',65) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (174,'9','4','4',66) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (175,'9','4','4',67) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (176,'9','4','4',68) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (177,'9','4','4',69) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (178,'9','4','5',70) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (179,'9','4','5',71) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (180,'9','4','5',72) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
      ESTUDIANTE 10
   (181,'10','4','3',53) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (182,'10','4','4',54) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (183,'10','4','4',55) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (184,'10','4','4',56) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (185,'10','4','4',57) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (186,'10','4','4',58) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (187,'10','4','4',59) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (188,'10','4','4',60) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (189,'10','4','4',61) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (190,'10','4','4',62) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (191,'10','4','4',63) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (192,'10','4','4',64) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (193,'10','4','4',65) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (194,'10','4','4',66) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (195,'10','4','4',67) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (196,'10','4','4',68) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (197,'10','4','4',69) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (198,'10','4','5',70) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (199,'10','4','5',71) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (200,'10','4','5',72) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUE
      ESTUDIANTE 11
   (201,'11','4','3',53) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (202,'11','4','4',54) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (203,'11','4','4',55) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (204,'11','4','4',56) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (205,'11','4','4',57) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (206,'11','4','4',58) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (207,'11','4','4',59) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (208,'11','4','4',60) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (209,'11','4','4',61) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (210,'11','4','4',62) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (211,'11','4','4',63) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (212,'11','4','4',64) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (213,'11','4','4',65) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (214,'11','4','4',66) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (215,'11','4','4',67) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (216,'11','4','4',68) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (217,'11','4','4',69) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (218,'11','4','5',70) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (219,'11','4','5',71) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (220,'11','4','5',72) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
      ESTUDIANTE 12
   (221,'12','4','3',53) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (222,'12','4','4',54) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (223,'12','4','4',55) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (224,'12','4','4',56) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (225,'12','4','4',57) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (226,'12','4','4',58) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (227,'12','4','4',59) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (228,'12','4','4',60) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (229,'12','4','4',61) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (230,'12','4','4',62) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (231,'12','4','4',63) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (232,'12','4','4',64) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (233,'12','4','4',65) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (234,'12','4','4',66) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (235,'12','4','4',67) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (236,'12','4','4',68) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (237,'12','4','4',69) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (238,'12','4','5',70) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (239,'12','4','5',71) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (240,'12','4','5',72) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   
   OBRA 5 (SIN PLANEAR)
      ESTUDIANTE 13
   (241,'13','1','3',3) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (242,'13','1','4',4) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (243,'13','1','4',5) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (244,'13','1','4',6) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (245,'13','1','4',7) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (246,'13','1','4',8) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (247,'13','1','4',9) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (248,'13','1','4',10) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (249,'13','1','4',11) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (250,'13','1','4',12) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (251,'13','1','4',13) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (252,'13','1','4',14) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (253,'13','1','4',15) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (254,'13','1','4',16) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (255,'13','1','4',17) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (256,'13','1','4',18) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (257,'13','1','4',19) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (258,'13','1','5',20) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (259,'13','1','5',21) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (260,'13','1','5',22) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
      ESTUDIANTE 14
   (261,'14','1','3',3) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (262,'14','1','4',4) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (263,'14','1','4',5) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (264,'14','1','4',6) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (265,'14','1','4',7) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (266,'14','1','4',8) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (267,'14','1','4',9) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (268,'14','1','4',10) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (269,'14','1','4',11) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (270,'14','1','4',12) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (271,'14','1','4',13) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (272,'14','1','4',14) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (273,'14','1','4',15) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (274,'14','1','4',16) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (275,'14','1','4',17) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (276,'14','1','4',18) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (277,'14','1','5',20) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (278,'14','1','5',21) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (279,'14','1','5',22) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
      ESTUDIANTE 15
   (280,'15','1','3',3) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (281,'15','1','4',4) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (282,'15','1','4',5) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (283,'15','1','4',6) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (284,'15','1','4',7) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (285,'15','1','4',8) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (286,'15','1','4',9) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (287,'15','1','4',10) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (288,'15','1','4',11) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (289,'15','1','4',12) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (290,'15','1','4',13) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (291,'15','1','4',14) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (292,'15','1','4',15) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (293,'15','1','4',16) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (294,'15','1','4',17) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (295,'15','1','4',19) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (296,'15','1','5',20) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (297,'15','1','5',21) INTO PARTICIPACIONESTUDIANTE (CONSECASIS,CODESTUDIANTE,IDOBRA,IDTIPOCALEN,CONSECALENDARIO) VALUES
   (298,'15','1','5',22) SELECT * FROM dual;
   */