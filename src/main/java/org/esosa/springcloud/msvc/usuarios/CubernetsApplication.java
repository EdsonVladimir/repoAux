package org.esosa.springcloud.msvc.usuarios;
import org.mybatis.spring.annotation.MapperScan;
import org.mybatis.spring.annotation.MapperScans;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;


@MapperScans({
		@MapperScan("org.esosa.springcloud.msvc.usuarios.modules.user.UserDao"),
})
@SpringBootApplication
public class CubernetsApplication {

	public static void main(String[] args) {
		SpringApplication.run(CubernetsApplication.class, args);
		System.out.println("Hola Mundo");
	}


}
