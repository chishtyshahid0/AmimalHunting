Shader "CameraFilterPack/Blend2Camera_Exclusion" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_MainTex2 ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 17381
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
					uniform sampler2D _MainTex2;
					uniform highp float _Value;
					uniform highp float _Value2;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tex2_1;
					  highp vec4 tex_2;
					  highp vec2 uv_3;
					  uv_3 = xlv_TEXCOORD0;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, uv_3);
					  tex_2 = tmpvar_4;
					  lowp vec4 tmpvar_5;
					  tmpvar_5 = texture2D (_MainTex2, uv_3);
					  tex2_1 = tmpvar_5;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = mix (tex_2.xyz, tex2_1.xyz, vec3(_Value2));
					  highp vec3 tmpvar_7;
					  tmpvar_7 = mix (tex_2.xyz, tex2_1.xyz, vec3((1.0 - _Value2)));
					  highp vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = mix (tmpvar_6, ((tmpvar_6 + tmpvar_7) - (
					    (2.0 * tmpvar_6)
					   * tmpvar_7)), vec3(_Value));
					  gl_FragData[0] = tmpvar_8;
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
					uniform sampler2D _MainTex2;
					uniform highp float _Value;
					uniform highp float _Value2;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tex2_1;
					  highp vec4 tex_2;
					  highp vec2 uv_3;
					  uv_3 = xlv_TEXCOORD0;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, uv_3);
					  tex_2 = tmpvar_4;
					  lowp vec4 tmpvar_5;
					  tmpvar_5 = texture2D (_MainTex2, uv_3);
					  tex2_1 = tmpvar_5;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = mix (tex_2.xyz, tex2_1.xyz, vec3(_Value2));
					  highp vec3 tmpvar_7;
					  tmpvar_7 = mix (tex_2.xyz, tex2_1.xyz, vec3((1.0 - _Value2)));
					  highp vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = mix (tmpvar_6, ((tmpvar_6 + tmpvar_7) - (
					    (2.0 * tmpvar_6)
					   * tmpvar_7)), vec3(_Value));
					  gl_FragData[0] = tmpvar_8;
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
					uniform sampler2D _MainTex2;
					uniform highp float _Value;
					uniform highp float _Value2;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tex2_1;
					  highp vec4 tex_2;
					  highp vec2 uv_3;
					  uv_3 = xlv_TEXCOORD0;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, uv_3);
					  tex_2 = tmpvar_4;
					  lowp vec4 tmpvar_5;
					  tmpvar_5 = texture2D (_MainTex2, uv_3);
					  tex2_1 = tmpvar_5;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = mix (tex_2.xyz, tex2_1.xyz, vec3(_Value2));
					  highp vec3 tmpvar_7;
					  tmpvar_7 = mix (tex_2.xyz, tex2_1.xyz, vec3((1.0 - _Value2)));
					  highp vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = mix (tmpvar_6, ((tmpvar_6 + tmpvar_7) - (
					    (2.0 * tmpvar_6)
					   * tmpvar_7)), vec3(_Value));
					  gl_FragData[0] = tmpvar_8;
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
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _MainTex2;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					lowp vec3 u_xlat10_1;
					vec3 u_xlat2;
					mediump vec3 u_xlat16_3;
					lowp vec3 u_xlat10_3;
					void main()
					{
					    u_xlat0.x = (-_Value2) + 1.0;
					    u_xlat10_3.xyz = texture(_MainTex2, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_3.xyz = u_xlat10_3.xyz + (-u_xlat10_1.xyz);
					    u_xlat2.xyz = u_xlat0.xxx * u_xlat16_3.xyz + u_xlat10_1.xyz;
					    u_xlat0.xyz = vec3(vec3(_Value2, _Value2, _Value2)) * u_xlat16_3.xyz + u_xlat10_1.xyz;
					    u_xlat1.xyz = u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2.xyz = u_xlat0.xyz * u_xlat2.xyz;
					    u_xlat1.xyz = (-u_xlat2.xyz) * vec3(2.0, 2.0, 2.0) + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + u_xlat1.xyz;
					    SV_Target0.xyz = vec3(vec3(_Value, _Value, _Value)) * u_xlat1.xyz + u_xlat0.xyz;
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
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _MainTex2;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					lowp vec3 u_xlat10_1;
					vec3 u_xlat2;
					mediump vec3 u_xlat16_3;
					lowp vec3 u_xlat10_3;
					void main()
					{
					    u_xlat0.x = (-_Value2) + 1.0;
					    u_xlat10_3.xyz = texture(_MainTex2, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_3.xyz = u_xlat10_3.xyz + (-u_xlat10_1.xyz);
					    u_xlat2.xyz = u_xlat0.xxx * u_xlat16_3.xyz + u_xlat10_1.xyz;
					    u_xlat0.xyz = vec3(vec3(_Value2, _Value2, _Value2)) * u_xlat16_3.xyz + u_xlat10_1.xyz;
					    u_xlat1.xyz = u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2.xyz = u_xlat0.xyz * u_xlat2.xyz;
					    u_xlat1.xyz = (-u_xlat2.xyz) * vec3(2.0, 2.0, 2.0) + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + u_xlat1.xyz;
					    SV_Target0.xyz = vec3(vec3(_Value, _Value, _Value)) * u_xlat1.xyz + u_xlat0.xyz;
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
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _MainTex2;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					lowp vec3 u_xlat10_1;
					vec3 u_xlat2;
					mediump vec3 u_xlat16_3;
					lowp vec3 u_xlat10_3;
					void main()
					{
					    u_xlat0.x = (-_Value2) + 1.0;
					    u_xlat10_3.xyz = texture(_MainTex2, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_3.xyz = u_xlat10_3.xyz + (-u_xlat10_1.xyz);
					    u_xlat2.xyz = u_xlat0.xxx * u_xlat16_3.xyz + u_xlat10_1.xyz;
					    u_xlat0.xyz = vec3(vec3(_Value2, _Value2, _Value2)) * u_xlat16_3.xyz + u_xlat10_1.xyz;
					    u_xlat1.xyz = u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2.xyz = u_xlat0.xyz * u_xlat2.xyz;
					    u_xlat1.xyz = (-u_xlat2.xyz) * vec3(2.0, 2.0, 2.0) + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + u_xlat1.xyz;
					    SV_Target0.xyz = vec3(vec3(_Value, _Value, _Value)) * u_xlat1.xyz + u_xlat0.xyz;
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