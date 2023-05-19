const { sequelize } = require("../../connection");
const { themespropertiesmodel} = require("../../model/themes_properties.model");

const listar = async function (req, res) {
    console.log("listar temas properties");
    try {
        const themesproperties = await sequelize.query("SELECT * FROM themes_properties");
        console.log("themes_properties", themesproperties);
        if (themesproperties && themesproperties[0]) {
            res.json({
                succes: true,
                temas: themesproperties[0]
            });
        } else {
            res.json({
                succes: true,
                temas: []
            });
        }
    } catch (error) {
        console.log(error);
        res.json({
            succes: false,
            error: error.message
        });
    }
};

const buscarPorCodigo = async function (req, res) {
    console.log("consultar tema properties");

    try {
        const themepropertiesModelResult = await themespropertiesmodel.findByPk(req.params.id);
        if (themepropertiesModelResult) {
            res.json({
                succes: true,
                tema: themepropertiesModelResult
            });
        } else {
            res.json({
                succes: true,
                tema: null
            });
        }
    } catch (error) {
        console.log(error);
        res.json({
            succes: false,
            error: error.message
        });
    }
};

const actualizar = async function (req, res) {
    console.log("actualizar tema");
    let temapropertiesRetorno = null;
    const data = req.body;
    const id = req.body.id;

    try {
        let themepropertiesModelResult = null;
        if (id) {
            themepropertiesModelResult = await themespropertiesmodel.findByPk(id);
        }
        if (themepropertiesModelResult) {
            temapropertiesRetorno = await themespropertiesmodel.update(data, { where: { id: id } });
            temapropertiesRetorno = data;
        } else {
            temapropertiesRetorno = await themespropertiesmodel.create(data);
        }
        res.json({
            succes: true,
            tema: temapropertiesRetorno
        });
    } catch (error) {
        console.log(error);
        res.json({
            succes: false,
            error: error.messages
        });
    }
};

const eliminar = async function (req, res) {
    console.log("eliminar tema properties");

    try {
        const themesproperties = await sequelize.query("DELETE FROM themes_properties WHERE id = " + req.params.id);
        console.log("tema properties eliminado");
        res.json({
            succes: true,
            theme: null
        });
    } catch (error) {
        console.log(error);
        res.json({
            succes: false,
            error: error.message
        });
    }
};

module.exports = {
    listar, buscarPorCodigo, actualizar, eliminar
};