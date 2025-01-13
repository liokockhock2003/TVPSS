package com.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import com.entity.Users;
import com.service.UserDao;

@EnableWebSecurity(debug = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	@Autowired
	private UserDao userDao;

	@Bean
	public BCryptPasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(username -> {
			Users user = userDao.findByUsername(username);
			if (user != null) {
				System.out.println(user.getUsername());
				return org.springframework.security.core.userdetails.User.withUsername(username)
						.password(user.getPassword()).roles(user.getRole()).build();
			} else {
				System.out.println(user != null);
			}
			throw new UsernameNotFoundException("User not found");
		}).passwordEncoder(passwordEncoder());
	}

	@Override
    protected void configure(HttpSecurity http) throws Exception {
        http
            .authorizeRequests()
                .antMatchers("/video-library-student").hasRole("STUDENT")
                .antMatchers("/validate-video").hasRole("ADMIN")
                .antMatchers("/video-upload").hasRole("TEACHER")
                .antMatchers("/resources/**", "/css/**", "/js/**").permitAll()
                .anyRequest().authenticated()
                .and()
            .formLogin()
	            .successHandler((request, response, authentication) -> {
	                String role = authentication.getAuthorities().stream()
	                    .map(GrantedAuthority::getAuthority)
	                    .map(auth -> auth.replace("ROLE_", ""))  // Remove ROLE_ prefix if present
	                    .findFirst()
	                    .orElse("");
	                request.getSession().setAttribute("role", role);
	                response.sendRedirect("/TVPSS-1/home");
	            })
                .permitAll()
                .and()
            .logout()
                .permitAll()
                .and()
            .csrf().disable();
    }
}
// end class