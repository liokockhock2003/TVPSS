package com.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import com.service.UserDao;
import com.entity.Users;

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
                return org.springframework.security.core.userdetails.User
                    .withUsername(username)
                    .password(user.getPassword())
                    .roles(user.getRole())
                    .build();
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
                .anyRequest().authenticated()
                .and()
            .formLogin()
                .defaultSuccessUrl("/dashboard")
                .permitAll()
                .and()
            .logout()
                .permitAll()
                .and()
            .csrf();
    }
}// end class