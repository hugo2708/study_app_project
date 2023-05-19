const { sequelize } = require("../connection");
const { themepropertiesModel} = require("../model/themes_properties.model");

const listar = async function (textoBuscar) {
    console.log("listar themes properties");
    try {
        const themesproperties = await sequelize.query(`SELECT * FROM themes_properties WHERE  
                                            UPPER(theme_id) LIKE UPPER('%${textoBuscar}%') 
                                            AND deleted IS false
                                            ORDER BY id`);

        if (themesproperties && themesproperties[0]) {
            return themesproperties[0];
        } else {
            return []
        }
    } catch (error) {
        throw error;
    }
};

const consultarPorCodigo = async function (id) {
    console.log("consultar themes properties");

    try {
        const themespropertiesModelResult = await themepropertiesModel.findByPk(id);
        if (themepropertiesModelResult) {
            return themepropertiesModelResult;
        } else {
            return null;
        }
    } catch (error) {
        console.log(error);
        throw error;
    }
};

const actualizar = async function (id, theme_id, property_name, property_value) {
    console.log("actualizar theme properties");
    let themepropertiesRetorno = null; 
    const data = {id, theme_id, property_name, property_value};
    
    try {
        let themepropertiesModelResult = null;
        if (id) {
            themepropertiesModelResult = await themepropertiesModel.findByPk(id);
        }
        if (themepropertiesModelResult) {
            
            themepropertiesRetorno = await themepropertiesModel.update({data}, { where: { id: id } });
            themepropertiesRetorno = data;
        } else {
           
            themepropertiesRetorno = await themepropertiesModel.create(data);
        }
        
        return themepropertiesRetorno;

    } catch (error) {
        console.log(error);
        throw error;
    }
};

const eliminar = async function (id) {
    console.log("eliminar themes properties");
    
    try {
        const retorno = await sequelize.query(`UPDATE themes_properties SET deleted = true WHERE id = ${id}`);
        return retorno;
    } catch (error) {
        console.log(error);
        throw error;
    }
};

module.exports = {
    listar, consultarPorCodigo, actualizar, eliminar
};