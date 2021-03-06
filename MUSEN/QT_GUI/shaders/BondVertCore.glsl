/* Copyright (c) 2013-2020, MUSEN Development Team. All rights reserved.
   This file is part of MUSEN framework http://msolids.net/musen.
   See LICENSE file for license and warranty information. */

#version 330

uniform highp mat3 u_matrix_normal;	// normal matrix from model-view transformation
uniform highp mat4 u_matrix_mvp;	// model-view-projection matrix
uniform highp mat4 u_matrix_mv;		// model-view matrix

in highp vec3 a_position;			// position of vertex
in highp vec3 a_normal;				// normal vector for vertex
in highp vec4 a_color;				// color of vertex

out highp vec3 v_position;			// vertex coordinates for fragment shader
out highp vec3 v_normal;			// normal vector for vertex
out highp vec4 v_color;				// color of vertex for fragment shader

void main()
{
	v_position = vec3(u_matrix_mv * vec4(a_position, 1.0));
	v_normal   = u_matrix_normal * a_normal;
	v_color    = a_color;

	gl_Position = u_matrix_mvp * vec4(a_position, 1.0);
}
