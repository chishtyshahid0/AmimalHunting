Shader "CameraFilterPack/Colors_Adjust_PreFilters" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 21355
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 glstate_matrix_mvp;
					varying mediump vec2 xlv_TEXCOORD0;
					varying lowp vec4 xlv_COLOR;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  highp vec2 tmpvar_2;
					  tmpvar_2 = _glesMultiTexCoord0.xy;
					  mediump vec2 tmpvar_3;
					  lowp vec4 tmpvar_4;
					  tmpvar_3 = tmpvar_2;
					  tmpvar_4 = tmpvar_1;
					  xlv_TEXCOORD0 = tmpvar_3;
					  gl_Position = (glstate_matrix_mvp * _glesVertex);
					  xlv_COLOR = tmpvar_4;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					uniform highp float _Red_R;
					uniform highp float _Red_G;
					uniform highp float _Red_B;
					uniform highp float _Green_R;
					uniform highp float _Green_G;
					uniform highp float _Green_B;
					uniform highp float _Blue_R;
					uniform highp float _Blue_G;
					uniform highp float _Blue_B;
					uniform highp float _Red_C;
					uniform highp float _Green_C;
					uniform highp float _Blue_C;
					uniform highp float _FadeFX;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 col_1;
					  highp vec2 uv_2;
					  uv_2 = xlv_TEXCOORD0;
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, uv_2);
					  col_1 = tmpvar_3;
					  highp vec3 tmpvar_4;
					  tmpvar_4.x = _Red_R;
					  tmpvar_4.y = _Red_G;
					  tmpvar_4.z = _Red_B;
					  highp vec3 tmpvar_5;
					  tmpvar_5.x = _Green_R;
					  tmpvar_5.y = _Green_G;
					  tmpvar_5.z = _Green_B;
					  highp vec3 tmpvar_6;
					  tmpvar_6.x = _Blue_R;
					  tmpvar_6.y = _Blue_G;
					  tmpvar_6.z = _Blue_B;
					  highp vec3 tmpvar_7;
					  tmpvar_7.x = (dot (col_1.xyz, tmpvar_4) + _Red_C);
					  tmpvar_7.y = (dot (col_1.xyz, tmpvar_5) + _Green_C);
					  tmpvar_7.z = (dot (col_1.xyz, tmpvar_6) + _Blue_C);
					  highp vec4 tmpvar_8;
					  tmpvar_8.w = 0.0;
					  tmpvar_8.xyz = tmpvar_7;
					  highp vec4 tmpvar_9;
					  tmpvar_9.w = 1.0;
					  tmpvar_9.xyz = mix (col_1, tmpvar_8, vec4(_FadeFX)).xyz;
					  gl_FragData[0] = tmpvar_9;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 glstate_matrix_mvp;
					varying mediump vec2 xlv_TEXCOORD0;
					varying lowp vec4 xlv_COLOR;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  highp vec2 tmpvar_2;
					  tmpvar_2 = _glesMultiTexCoord0.xy;
					  mediump vec2 tmpvar_3;
					  lowp vec4 tmpvar_4;
					  tmpvar_3 = tmpvar_2;
					  tmpvar_4 = tmpvar_1;
					  xlv_TEXCOORD0 = tmpvar_3;
					  gl_Position = (glstate_matrix_mvp * _glesVertex);
					  xlv_COLOR = tmpvar_4;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					uniform highp float _Red_R;
					uniform highp float _Red_G;
					uniform highp float _Red_B;
					uniform highp float _Green_R;
					uniform highp float _Green_G;
					uniform highp float _Green_B;
					uniform highp float _Blue_R;
					uniform highp float _Blue_G;
					uniform highp float _Blue_B;
					uniform highp float _Red_C;
					uniform highp float _Green_C;
					uniform highp float _Blue_C;
					uniform highp float _FadeFX;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 col_1;
					  highp vec2 uv_2;
					  uv_2 = xlv_TEXCOORD0;
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, uv_2);
					  col_1 = tmpvar_3;
					  highp vec3 tmpvar_4;
					  tmpvar_4.x = _Red_R;
					  tmpvar_4.y = _Red_G;
					  tmpvar_4.z = _Red_B;
					  highp vec3 tmpvar_5;
					  tmpvar_5.x = _Green_R;
					  tmpvar_5.y = _Green_G;
					  tmpvar_5.z = _Green_B;
					  highp vec3 tmpvar_6;
					  tmpvar_6.x = _Blue_R;
					  tmpvar_6.y = _Blue_G;
					  tmpvar_6.z = _Blue_B;
					  highp vec3 tmpvar_7;
					  tmpvar_7.x = (dot (col_1.xyz, tmpvar_4) + _Red_C);
					  tmpvar_7.y = (dot (col_1.xyz, tmpvar_5) + _Green_C);
					  tmpvar_7.z = (dot (col_1.xyz, tmpvar_6) + _Blue_C);
					  highp vec4 tmpvar_8;
					  tmpvar_8.w = 0.0;
					  tmpvar_8.xyz = tmpvar_7;
					  highp vec4 tmpvar_9;
					  tmpvar_9.w = 1.0;
					  tmpvar_9.xyz = mix (col_1, tmpvar_8, vec4(_FadeFX)).xyz;
					  gl_FragData[0] = tmpvar_9;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 glstate_matrix_mvp;
					varying mediump vec2 xlv_TEXCOORD0;
					varying lowp vec4 xlv_COLOR;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  highp vec2 tmpvar_2;
					  tmpvar_2 = _glesMultiTexCoord0.xy;
					  mediump vec2 tmpvar_3;
					  lowp vec4 tmpvar_4;
					  tmpvar_3 = tmpvar_2;
					  tmpvar_4 = tmpvar_1;
					  xlv_TEXCOORD0 = tmpvar_3;
					  gl_Position = (glstate_matrix_mvp * _glesVertex);
					  xlv_COLOR = tmpvar_4;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					uniform highp float _Red_R;
					uniform highp float _Red_G;
					uniform highp float _Red_B;
					uniform highp float _Green_R;
					uniform highp float _Green_G;
					uniform highp float _Green_B;
					uniform highp float _Blue_R;
					uniform highp float _Blue_G;
					uniform highp float _Blue_B;
					uniform highp float _Red_C;
					uniform highp float _Green_C;
					uniform highp float _Blue_C;
					uniform highp float _FadeFX;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 col_1;
					  highp vec2 uv_2;
					  uv_2 = xlv_TEXCOORD0;
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, uv_2);
					  col_1 = tmpvar_3;
					  highp vec3 tmpvar_4;
					  tmpvar_4.x = _Red_R;
					  tmpvar_4.y = _Red_G;
					  tmpvar_4.z = _Red_B;
					  highp vec3 tmpvar_5;
					  tmpvar_5.x = _Green_R;
					  tmpvar_5.y = _Green_G;
					  tmpvar_5.z = _Green_B;
					  highp vec3 tmpvar_6;
					  tmpvar_6.x = _Blue_R;
					  tmpvar_6.y = _Blue_G;
					  tmpvar_6.z = _Blue_B;
					  highp vec3 tmpvar_7;
					  tmpvar_7.x = (dot (col_1.xyz, tmpvar_4) + _Red_C);
					  tmpvar_7.y = (dot (col_1.xyz, tmpvar_5) + _Green_C);
					  tmpvar_7.z = (dot (col_1.xyz, tmpvar_6) + _Blue_C);
					  highp vec4 tmpvar_8;
					  tmpvar_8.w = 0.0;
					  tmpvar_8.xyz = tmpvar_7;
					  highp vec4 tmpvar_9;
					  tmpvar_9.w = 1.0;
					  tmpvar_9.xyz = mix (col_1, tmpvar_8, vec4(_FadeFX)).xyz;
					  gl_FragData[0] = tmpvar_9;
					}
					
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					in highp vec4 in_POSITION0;
					in highp vec4 in_COLOR0;
					in highp vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					out lowp vec4 vs_COLOR0;
					vec4 u_xlat0;
					void main()
					{
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    vs_COLOR0 = in_COLOR0;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	float _Red_R;
					uniform 	float _Red_G;
					uniform 	float _Red_B;
					uniform 	float _Green_R;
					uniform 	float _Green_G;
					uniform 	float _Green_B;
					uniform 	float _Blue_R;
					uniform 	float _Blue_G;
					uniform 	float _Blue_B;
					uniform 	float _Red_C;
					uniform 	float _Green_C;
					uniform 	float _Blue_C;
					uniform 	float _FadeFX;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					lowp vec3 u_xlat10_1;
					float u_xlat6;
					void main()
					{
					    u_xlat0.x = _Blue_R;
					    u_xlat0.yz = vec2(_Blue_G, _Blue_B);
					    u_xlat10_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat0.x = dot(u_xlat10_1.xyz, u_xlat0.xyz);
					    u_xlat0.z = u_xlat0.x + _Blue_C;
					    u_xlat6 = dot(u_xlat10_1.xyz, vec3(_Red_R, _Red_G, _Red_B));
					    u_xlat0.x = u_xlat6 + _Red_C;
					    u_xlat6 = dot(u_xlat10_1.xyz, vec3(_Green_R, _Green_G, _Green_B));
					    u_xlat0.y = u_xlat6 + _Green_C;
					    u_xlat0.xyz = (-u_xlat10_1.xyz) + u_xlat0.xyz;
					    SV_Target0.xyz = vec3(vec3(_FadeFX, _FadeFX, _FadeFX)) * u_xlat0.xyz + u_xlat10_1.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					in highp vec4 in_POSITION0;
					in highp vec4 in_COLOR0;
					in highp vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					out lowp vec4 vs_COLOR0;
					vec4 u_xlat0;
					void main()
					{
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    vs_COLOR0 = in_COLOR0;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	float _Red_R;
					uniform 	float _Red_G;
					uniform 	float _Red_B;
					uniform 	float _Green_R;
					uniform 	float _Green_G;
					uniform 	float _Green_B;
					uniform 	float _Blue_R;
					uniform 	float _Blue_G;
					uniform 	float _Blue_B;
					uniform 	float _Red_C;
					uniform 	float _Green_C;
					uniform 	float _Blue_C;
					uniform 	float _FadeFX;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					lowp vec3 u_xlat10_1;
					float u_xlat6;
					void main()
					{
					    u_xlat0.x = _Blue_R;
					    u_xlat0.yz = vec2(_Blue_G, _Blue_B);
					    u_xlat10_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat0.x = dot(u_xlat10_1.xyz, u_xlat0.xyz);
					    u_xlat0.z = u_xlat0.x + _Blue_C;
					    u_xlat6 = dot(u_xlat10_1.xyz, vec3(_Red_R, _Red_G, _Red_B));
					    u_xlat0.x = u_xlat6 + _Red_C;
					    u_xlat6 = dot(u_xlat10_1.xyz, vec3(_Green_R, _Green_G, _Green_B));
					    u_xlat0.y = u_xlat6 + _Green_C;
					    u_xlat0.xyz = (-u_xlat10_1.xyz) + u_xlat0.xyz;
					    SV_Target0.xyz = vec3(vec3(_FadeFX, _FadeFX, _FadeFX)) * u_xlat0.xyz + u_xlat10_1.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					in highp vec4 in_POSITION0;
					in highp vec4 in_COLOR0;
					in highp vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					out lowp vec4 vs_COLOR0;
					vec4 u_xlat0;
					void main()
					{
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    vs_COLOR0 = in_COLOR0;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	float _Red_R;
					uniform 	float _Red_G;
					uniform 	float _Red_B;
					uniform 	float _Green_R;
					uniform 	float _Green_G;
					uniform 	float _Green_B;
					uniform 	float _Blue_R;
					uniform 	float _Blue_G;
					uniform 	float _Blue_B;
					uniform 	float _Red_C;
					uniform 	float _Green_C;
					uniform 	float _Blue_C;
					uniform 	float _FadeFX;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					lowp vec3 u_xlat10_1;
					float u_xlat6;
					void main()
					{
					    u_xlat0.x = _Blue_R;
					    u_xlat0.yz = vec2(_Blue_G, _Blue_B);
					    u_xlat10_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat0.x = dot(u_xlat10_1.xyz, u_xlat0.xyz);
					    u_xlat0.z = u_xlat0.x + _Blue_C;
					    u_xlat6 = dot(u_xlat10_1.xyz, vec3(_Red_R, _Red_G, _Red_B));
					    u_xlat0.x = u_xlat6 + _Red_C;
					    u_xlat6 = dot(u_xlat10_1.xyz, vec3(_Green_R, _Green_G, _Green_B));
					    u_xlat0.y = u_xlat6 + _Green_C;
					    u_xlat0.xyz = (-u_xlat10_1.xyz) + u_xlat0.xyz;
					    SV_Target0.xyz = vec3(vec3(_FadeFX, _FadeFX, _FadeFX)) * u_xlat0.xyz + u_xlat10_1.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
			}
			Program "fp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					"!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					"!!GLES3"
				}
			}
		}
	}
}