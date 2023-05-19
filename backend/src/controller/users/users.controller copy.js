const {sequelize} = require("../../connection");

const listar = async function(req, res) {
    console.log("listar usuarios");

    try {
        const users = await sequelize.query("SELECT * FROM users WHERE deleted IS false");

        console.log("users", users);
        if (users && users[0]){
            res.json({
                success : true,
                usuarios : users[0]
            });
        } else {
            res.json({
                success : true,
                usuarios : []
            });
        }
    } catch (error) {
        res.json({
            success : false,
            error : error.message
        });
    }

    //res.json(users);
};

const consultarPorCodigo = async function(req, res) {
    console.log("listar usuarios");

    try {
        const users = await sequelize.query(`SELECT * FROM users WHERE id = ${req.params.id} AND deleted IS false`);

        console.log("users", users);
        if (users && users[0] && users[0][0]){
            res.json({
                success : true,
                usuario : users[0][0]
            });
        } else {
            res.json({
                success : false,
                usuario : null
            });
        }
    } catch (error) {
        console.log(error);
        res.json({
            success : false,
            error : error.message
        });
    }

    //res.json(users);
};

const actualizar = async function(req, res) {
    console.log("actualizar usuarios");
    //res.send("actualizar de usuarios");
    //Variables
    let usuarioRetorno = null; //Guardará el usuario que se va a incluir o editar
    const data = req.body; //Se obtiene los datos del cuerpo de la petición.
    const id = req.body.id;

    let usrExiste = null;
    if(id){
        usrExiste = await sequelize.query("SELECT * FROM users WHERE id = " + id); //Buscar usuario por id pasado.
    }
    if(usrExiste && usrExiste[0] && usrExiste[0][0] && usrExiste[0][0].id){
        //Asegurar que el usuario existe, entonces actualizar
        const retornoUpdate = await sequelize.query(`UPDATE users SET 
                                                name = '${data.name}',
                                                last_name = '${data.last_name}',
                                                avatar = '${data.avatar}',
                                                email = '${data.email}',
                                                password = '${data.password}',
                                                delete = '${data.deleted}'
                                            WHERE id = ${id}`);
        usuarioRetorno = await sequelize.query("SELECT * FROM users WHERE id = " + usrExiste[0][0].id);
        usuarioRetorno = usuarioRetorno[0][0];
    } else{
        //Incluir
        const retornoInsert = await sequelize.query(`INSERT INTO users (name, last_name, avatar, email, password, deleted) VALUES ('${data.name}', '${data.last_name}', '${data.avatar}', '${data.email}', '${data.password}', false) RETURNING id;`);
        usuarioRetorno = await sequelize.query("SELECT * FROM users WHERE id = " + retornoInsert[0][0].id);
        usuarioRetorno = usuarioRetorno[0][0];
    }
    res.json({
        success : true,
        user : usuarioRetorno
    });
};

const eliminar = async function(req, res) {
    console.log("eliminar usuarios");
    //res.send("eliminar de usuarios");
    await sequelize.query("UPDATE users SET deleted = true WHERE id = " + req.params.id);
    res.json({
        success : true
    });
};


module.exports = {
    listar, consultarPorCodigo, actualizar, eliminar
};