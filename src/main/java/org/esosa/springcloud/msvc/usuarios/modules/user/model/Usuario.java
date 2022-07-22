package org.esosa.springcloud.msvc.usuarios.modules.user.model;



import java.io.Serializable;
import lombok.Data;
@Data
public class Usuario implements Serializable{
    private static final long serialVersionUID = 1L;
    private Long id_user;
    private String full_name;

}
