package org.esosa.springcloud.msvc.usuarios.modules.user.UserDao;


import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.esosa.springcloud.msvc.usuarios.modules.user.model.Usuario;

@Mapper
public interface UserDao {
    @Select("SELECT id_user, full_name FROM core.user")
    List<Usuario> usersLis();
}
