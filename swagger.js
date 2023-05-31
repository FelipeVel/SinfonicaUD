const swaggerJsDoc = require("swagger-jsdoc");
const swaggerUi = require("swagger-ui-express");

const swaggerOptions = {
    definition: {
        openapi: "3.0.0",
        info: {
            title: "API de la Filarmonica UD",
        },
        components: {
            schemas: {
                Actividad: {
                    type: "object",
                    properties: {
                        IDPERIODO: {
                            type: "integer",
                            example: 1
                        },
                        CODACTIVIDAD: {
                            type: "integer",
                            example: 1
                        },
                        DESCACTIVIDAD: {
                            type: "string",
                            example: "Concierto de apertura"
                        },
                        VALORHORA: {
                            type: "integer",
                            example: 10000
                        },
                        MAXHORAS: {
                            type: "integer",
                            example: 10
                        }
                    }
                },
                Calendario: {
                    type: "object",
                    properties: {
                        IDOBRA: {
                            type: "string",
                            example: 1
                        },
                        IDTIPOCALEN: {
                            type: "string",
                            example: 1
                        },
                        CONSECALENDARIO: {
                            type: "integer",
                            example: 1
                        },
                        IDESTADO: {
                            type: "string",
                            example: 1
                        },
                        FECHAINICIO: {
                            type: "string",
                            example: "2023-02-01 05:00:00"
                        },
                        FECHAFIN: {
                            type: "string",
                            example: "2023-02-01 05:00:00"
                        }
                    }
                },
                Empleado: {
                    type: "object",
                    properties: {
                        ROL_PK: {
                            type: "integer",
                            example: 1
                        },
                        CODUNIDAD: {
                            type: "string",
                            example: "1"
                        },
                        CODEMPLEADO: {
                            type: "string",
                            example: "1"
                        },
                        NOMBRE: {
                            type: "string",
                            example: "Juan"
                        },
                        APELLIDO: {
                            type: "string",
                            example: "Perez"
                        },
                        CEDULA: {
                            type: "string",
                            example: "123456789"
                        },
                        CELULAR: {
                            type: "string",
                            example: "123456789"
                        },
                        CORREO: {
                            type: "string",
                            example: "ejemplo@correo.com"
                        }
                    }
                },
                Estudiante: {
                    type: "object",
                    properties: {
                        CODESTUDIANTE: {
                            type: "string",
                            example: "1"
                        },
                        CODUNIDAD: {
                            type: "string",
                            example: "1"
                        },
                        NOMBRE: {
                            type: "string",
                            example: "Juan"
                        },
                        APELLIDO: {
                            type: "string",
                            example: "Perez"
                        },
                        FECHAINSCRIPCION: {
                            type: "string",
                            example: "2023-02-01 05:00:00"
                        },
                        FECHANACIMIENTO: {
                            type: "string",
                            example: "2023-02-01 05:00:00"
                        },
                        CORREO: {
                            type: "string",
                            example: "correo@prueba.com"
                        }
                    }
                },
                LiquidacionViaticos: {
                    type: "array",
                    items: {
                        type: "object",
                        properties: {
                            IDPERIODO: {
                                type: "integer",
                                example: 1
                            },
                            NOMBRE: {
                                type: "string",
                                example: "Juan"
                            },
                            APELLIDO: {
                                type: "string",
                                example: "Perez"
                            },
                            CEDULA: {
                                type: "string",
                                example: "123456789"
                            },
                            CODUNIDAD: {
                                type: "string",
                                example: "1"
                            },
                            NOMUNIDAD: {
                                type: "string",
                                example: "Unidad de prueba"
                            },
                            NOHORAS: {
                                type: "integer",
                                example: 1
                            }
                        }
                    }
                },
                LiquidacionElectivas: {
                    type: "array",
                    items: {
                        type: "object",
                        properties: {
                            CODESTUDIANTE: {
                                type: "string",
                                example: "1"
                            },
                            NOMBRE: {
                                type: "string",
                                example: "Juan"
                            },
                            APELLIDO: {
                                type: "string",
                                example: "Perez"
                            },
                            HORASASISTIDAS: {
                                type: "integer",
                                example: 1
                            },
                        }
                    }
                },
                ParticipacionObra: {
                    type: "array",
                    items: {
                        type: "object",
                        properties: {
                            CONSECASIS: {
                                type: "integer",
                                example: 1
                            },
                            IDOBRA: {
                                type: "string",
                                example: "1"
                            },
                            IDTIPOCALEN: {
                                type: "string",
                                example: "1"
                            },
                            CONSECALENDARIO: {
                                type: "integer",
                                example: 1
                            },
                            CODESTUDIANTE: {
                                type: "string",
                                example: "1"
                            },
                            NOMBRE: {
                                type: "string",
                                example: "Juan"
                            },
                            APELLIDO: {
                                type: "string",
                                example: "Perez"
                            },
                            FECHAINSCRIPCION: {
                                type: "string",
                                example: "2023-02-01 05:00:00"
                            },
                            FECHANACIMIENTO: {
                                type: "string",
                                example: "2023-02-01 05:00:00"
                            },
                            CORREO: {
                                type: "string",
                                example: "correo@prueba.com"
                            }
                        }
                    }
                },
                ListaParticipacion: {
                    type: "object",
                    properties: {
                        idEstudiantes: {
                            type: "array",
                            items: {
                                type: "string",
                                example: "1"
                            }
                        },
                        idObra: {
                            type: "string",
                            example: "1"
                        },
                        idTipoCalen: {
                            type: "string",
                            example: "1"
                        },
                        conseCalendario: {
                            type: "integer",
                            example: 1
                        }
                    }
                },
                Obra: {
                    type: "object",
                    properties: {
                        IDOBRA: {
                            type: "string",
                            example: "1"
                        },
                        IDCOMPOSITOR: {
                            type: "string",
                            example: "1"
                        },
                        IDCODPAIS: {
                            type: "string",
                            example: "1"
                        },
                        IDGENEROOBRA: {
                            type: "string",
                            example: "1"
                        },
                        IDPERIODO: {
                            type: "integer",
                            example: 1
                        },
                        FECHAOBRA: {
                            type: "string",
                            example: "2023-02-01 05:00:00"
                        },
                        TITULO: {
                            type: "string",
                            example: "Titulo de prueba"
                        },
                        ESTADO: {
                            type: "string",
                            example: "1"
                        }
                    }
                },
                OkInsert: {
                    type: "object",
                    properties: {
                        lastRowId: {
                            type: "string",
                            example: "AAAAAAAAAAAAAAAAAAAAAA"
                        },
                        rowsAffected: {
                            type: "integer",
                            example: 1
                        },
                        response: {
                            type: "string",
                            example: "OK"
                        }
                    }
                }
            }
        }
    },
    apis: ["./controllers/*.controller.js", "./routes/*.routes.js"]
};

const swaggerDocs = swaggerJsDoc(swaggerOptions);

module.exports = (app) => {
    app.use("/api-docs", swaggerUi.serve, swaggerUi.setup(swaggerDocs));
}