/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mallbit.cookies;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Andres Ramos
 */
public class GestionCookies {

    public static void eliminarCookie(HttpServletResponse response, String entidad) {
        Cookie killMyCookie = new Cookie(entidad, null);
        killMyCookie.setMaxAge(0);
        killMyCookie.setPath("/");
        response.addCookie(killMyCookie);
    }
}
