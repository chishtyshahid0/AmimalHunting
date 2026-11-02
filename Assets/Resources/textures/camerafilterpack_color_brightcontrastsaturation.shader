Shader "CameraFilterPack/Color_BrightContrastSaturation" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "blue" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 1
		_Brightness ("_Brightness", Range(0, 1)) = 1.5
		_Saturation ("_Saturation", Range(0, 1)) = 3
		_Contrast ("_Contrast", Range(0, 1)) = 3
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 54015
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
					uniform highp float _Brightness;
					uniform highp float _Saturation;
					uniform highp float _Contrast;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 col_1;
					  col_1.w = 1.0;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  highp vec3 tmpvar_3;
					  tmpvar_3 = (tmpvar_2 * _Brightness).xyz;
					  col_1.xyz = mix (vec3(10.0, 10.0, 0.0), mix (vec3(dot (tmpvar_3, vec3(10.0, 10.0, 30.0))), tmpvar_3, vec3(_Saturation)), vec3(_Contrast));
					  gl_FragData[0] = col_1;
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
					uniform highp float _Brightness;
					uniform highp float _Saturation;
					uniform highp float _Contrast;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 col_1;
					  col_1.w = 1.0;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  highp vec3 tmpvar_3;
					  tmpvar_3 = (tmpvar_2 * _Brightness).xyz;
					  col_1.xyz = mix (vec3(10.0, 10.0, 0.0), mix (vec3(dot (tmpvar_3, vec3(10.0, 10.0, 30.0))), tmpvar_3, vec3(_Saturation)), vec3(_Contrast));
					  gl_FragData[0] = col_1;
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
					uniform highp float _Brightness;
					uniform highp float _Saturation;
					uniform highp float _Contrast;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 col_1;
					  col_1.w = 1.0;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  highp vec3 tmpvar_3;
					  tmpvar_3 = (tmpvar_2 * _Brightness).xyz;
					  col_1.xyz = mix (vec3(10.0, 10.0, 0.0), mix (vec3(dot (tmpvar_3, vec3(10.0, 10.0, 30.0))), tmpvar_3, vec3(_Saturation)), vec3(_Contrast));
					  gl_FragData[0] = col_1;
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
					uniform 	float _Brightness;
					uniform 	float _Saturation;
					uniform 	float _Contrast;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					lowp vec3 u_xlat10_0;
					vec3 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat10_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat1.xyz = u_xlat10_0.xyz * vec3(_Brightness);
					    u_xlat6 = dot(u_xlat1.xyz, vec3(10.0, 10.0, 30.0));
					    u_xlat0.xyz = u_xlat10_0.xyz * vec3(_Brightness) + (-vec3(u_xlat6));
					    u_xlat0.xyz = vec3(vec3(_Saturation, _Saturation, _Saturation)) * u_xlat0.xyz + vec3(u_xlat6);
					    u_xlat0.xyz = u_xlat0.xyz + vec3(-10.0, -10.0, -0.0);
					    SV_Target0.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat0.xyz + vec3(10.0, 10.0, 0.0);
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
					uniform 	float _Brightness;
					uniform 	float _Saturation;
					uniform 	float _Contrast;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					lowp vec3 u_xlat10_0;
					vec3 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat10_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat1.xyz = u_xlat10_0.xyz * vec3(_Brightness);
					    u_xlat6 = dot(u_xlat1.xyz, vec3(10.0, 10.0, 30.0));
					    u_xlat0.xyz = u_xlat10_0.xyz * vec3(_Brightness) + (-vec3(u_xlat6));
					    u_xlat0.xyz = vec3(vec3(_Saturation, _Saturation, _Saturation)) * u_xlat0.xyz + vec3(u_xlat6);
					    u_xlat0.xyz = u_xlat0.xyz + vec3(-10.0, -10.0, -0.0);
					    SV_Target0.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat0.xyz + vec3(10.0, 10.0, 0.0);
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
					uniform 	float _Brightness;
					uniform 	float _Saturation;
					uniform 	float _Contrast;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					lowp vec3 u_xlat10_0;
					vec3 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat10_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat1.xyz = u_xlat10_0.xyz * vec3(_Brightness);
					    u_xlat6 = dot(u_xlat1.xyz, vec3(10.0, 10.0, 30.0));
					    u_xlat0.xyz = u_xlat10_0.xyz * vec3(_Brightness) + (-vec3(u_xlat6));
					    u_xlat0.xyz = vec3(vec3(_Saturation, _Saturation, _Saturation)) * u_xlat0.xyz + vec3(u_xlat6);
					    u_xlat0.xyz = u_xlat0.xyz + vec3(-10.0, -10.0, -0.0);
					    SV_Target0.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat0.xyz + vec3(10.0, 10.0, 0.0);
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