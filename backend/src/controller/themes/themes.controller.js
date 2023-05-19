const { sequelize } = require("../../connection");
const { ThemeModel } = require("../../model/themes.model");

const listar = async function (req, res) {
    console.log("listar temas");
    try {
        const themes = await sequelize.query("SELECT * FROM themes");
        console.log("themes", themes);
        if (themes && themes[0]) {
            res.json({
                succes: true,
                temas: themes[0]
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
    console.log("consultar tema");

    try {
        const themeModelResult = await ThemeModel.findByPk(req.params.id);
        if (themeModelResult) {
            res.json({
                succes: true,
                tema: themeModelResult
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
    let temaRetorno = null;
    const data = req.body;
    const id = req.body.id;

    try {
        let themeModelResult = null;
        if (id) {
            themeModelResult = await ThemeModel.findByPk(id);
        }
        if (themeModelResult) {
            temaRetorno = await ThemeModel.update(data, { where: { id: id } });
            temaRetorno = data;
        } else {
            temaRetorno = await ThemeModel.create(data);
        }
        res.json({
            succes: true,
            tema: temaRetorno
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
    console.log("eliminar tema");

    try {
        //ThemeModel.destroy(req.params.id);
        const themes = await sequelize.query("DELETE FROM themes WHERE id = " + req.params.id);
        console.log("tema eliminado");
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