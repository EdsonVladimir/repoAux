package org.esosa.springcloud.msvc.usuarios.modules.user.controllers;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.esosa.springcloud.msvc.usuarios.modules.user.UserDao.UserDao;
import org.esosa.springcloud.msvc.usuarios.modules.user.model.Usuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/api")
public class UserController {
    @Autowired
    UserDao iUserDao;

    @GetMapping(value="/user")
    ResponseEntity<?> usersLis() {
        List<Usuario> datos = null;
        Map<String, Object> mensajes = new HashMap<>();
        try {
            datos = iUserDao.usersLis();
        } catch (DataAccessException e) {
            mensajes.put("mensaje", "Error al realizar la consulta en la Base de Datos");
            mensajes.put("error", e.getMessage().concat(":").concat(e.getMostSpecificCause().getMessage()));
            return new ResponseEntity<Map<String, Object>>(mensajes, HttpStatus.INTERNAL_SERVER_ERROR);
        }
        // return new ResponseEntity<List<Almacenes>>(datos, HttpStatus.OK);
        System.out.println("Hola mundioto"+datos);
        return new ResponseEntity<List<Usuario>>(datos, HttpStatus.OK);
    }
}
