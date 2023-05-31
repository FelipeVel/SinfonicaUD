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
                            example: "2021-01-01"
                        },
                        FECHAFIN: {
                            type: "string",
                            example: "2021-01-01"
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
                            example: "2021-01-01"
                        },
                        FECHANACIMIENTO: {
                            type: "string",
                            example: "2021-01-01"
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
                                example: "2021-01-01"
                            },
                            FECHANACIMIENTO: {
                                type: "string",
                                example: "2021-01-01"
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