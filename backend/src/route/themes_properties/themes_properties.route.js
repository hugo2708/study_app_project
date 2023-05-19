const themespropertiesController = require("../../controller/themes_properties/themes_properties.controller");

module.exports = function (app){
    app.get("/themes_properties/list", themespropertiesController.listar);
    app.get("/themes_properties/actualizar", themespropertiesController.actualizar);
    app.get("/themes_properties/buscarporCodigo", themespropertiesController.buscarPorCodigo);
    app.get("/themes_properties/eliminar", themespropertiesController.eliminar);
}