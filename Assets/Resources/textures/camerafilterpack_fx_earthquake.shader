Shader "CameraFilterPack/FX_EarthQuake" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 42339
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
					uniform highp float _TimeX;
					uniform highp float _Value;
					uniform highp float _Value2;
					uniform highp float _Value3;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 col_1;
					  highp vec2 suv_2;
					  highp vec2 uv_3;
					  uv_3 = xlv_TEXCOORD0;
					  highp float tmpvar_4;
					  tmpvar_4 = float(int((_TimeX * _Value)));
					  suv_2.x = (uv_3.x + (_Value2 * fract(
					    (sin(dot (vec2(tmpvar_4), vec2(12.9898, 78.233))) * 43758.55)
					  )));
					  suv_2.y = (uv_3.y + (_Value3 * fract(
					    (sin(dot (vec2((tmpvar_4 + 23.0)), vec2(12.9898, 78.233))) * 43758.55)
					  )));
					  suv_2.x = (suv_2.x - (_Value2 / 2.0));
					  suv_2.y = (suv_2.y - (_Value3 / 2.0));
					  lowp vec3 tmpvar_5;
					  tmpvar_5 = texture2D (_MainTex, suv_2).xyz;
					  col_1 = tmpvar_5;
					  highp vec4 tmpvar_6;
					  tmpvar_6.w = 1.0;
					  tmpvar_6.xyz = col_1;
					  gl_FragData[0] = tmpvar_6;
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
					uniform highp float _TimeX;
					uniform highp float _Value;
					uniform highp float _Value2;
					uniform highp float _Value3;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 col_1;
					  highp vec2 suv_2;
					  highp vec2 uv_3;
					  uv_3 = xlv_TEXCOORD0;
					  highp float tmpvar_4;
					  tmpvar_4 = float(int((_TimeX * _Value)));
					  suv_2.x = (uv_3.x + (_Value2 * fract(
					    (sin(dot (vec2(tmpvar_4), vec2(12.9898, 78.233))) * 43758.55)
					  )));
					  suv_2.y = (uv_3.y + (_Value3 * fract(
					    (sin(dot (vec2((tmpvar_4 + 23.0)), vec2(12.9898, 78.233))) * 43758.55)
					  )));
					  suv_2.x = (suv_2.x - (_Value2 / 2.0));
					  suv_2.y = (suv_2.y - (_Value3 / 2.0));
					  lowp vec3 tmpvar_5;
					  tmpvar_5 = texture2D (_MainTex, suv_2).xyz;
					  col_1 = tmpvar_5;
					  highp vec4 tmpvar_6;
					  tmpvar_6.w = 1.0;
					  tmpvar_6.xyz = col_1;
					  gl_FragData[0] = tmpvar_6;
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
					uniform highp float _TimeX;
					uniform highp float _Value;
					uniform highp float _Value2;
					uniform highp float _Value3;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 col_1;
					  highp vec2 suv_2;
					  highp vec2 uv_3;
					  uv_3 = xlv_TEXCOORD0;
					  highp float tmpvar_4;
					  tmpvar_4 = float(int((_TimeX * _Value)));
					  suv_2.x = (uv_3.x + (_Value2 * fract(
					    (sin(dot (vec2(tmpvar_4), vec2(12.9898, 78.233))) * 43758.55)
					  )));
					  suv_2.y = (uv_3.y + (_Value3 * fract(
					    (sin(dot (vec2((tmpvar_4 + 23.0)), vec2(12.9898, 78.233))) * 43758.55)
					  )));
					  suv_2.x = (suv_2.x - (_Value2 / 2.0));
					  suv_2.y = (suv_2.y - (_Value3 / 2.0));
					  lowp vec3 tmpvar_5;
					  tmpvar_5 = texture2D (_MainTex, suv_2).xyz;
					  col_1 = tmpvar_5;
					  highp vec4 tmpvar_6;
					  tmpvar_6.w = 1.0;
					  tmpvar_6.xyz = col_1;
					  gl_FragData[0] = tmpvar_6;
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
					uniform 	float _TimeX;
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform 	float _Value3;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					float u_xlat0;
					lowp vec3 u_xlat10_0;
					vec2 u_xlat1;
					float u_xlat2;
					void main()
					{
					    u_xlat0 = _Value * _TimeX;
					    u_xlat0 = trunc(u_xlat0);
					    u_xlat2 = u_xlat0 + 23.0;
					    u_xlat0 = dot(vec2(u_xlat0), vec2(12.9898005, 78.2330017));
					    u_xlat0 = sin(u_xlat0);
					    u_xlat0 = u_xlat0 * 43758.5469;
					    u_xlat0 = fract(u_xlat0);
					    u_xlat0 = _Value2 * u_xlat0 + vs_TEXCOORD0.x;
					    u_xlat1.x = (-_Value2) * 0.5 + u_xlat0;
					    u_xlat0 = dot(vec2(u_xlat2), vec2(12.9898005, 78.2330017));
					    u_xlat0 = sin(u_xlat0);
					    u_xlat0 = u_xlat0 * 43758.5469;
					    u_xlat0 = fract(u_xlat0);
					    u_xlat0 = _Value3 * u_xlat0 + vs_TEXCOORD0.y;
					    u_xlat1.y = (-_Value3) * 0.5 + u_xlat0;
					    u_xlat10_0.xyz = texture(_MainTex, u_xlat1.xy).xyz;
					    SV_Target0.xyz = u_xlat10_0.xyz;
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
					uniform 	float _TimeX;
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform 	float _Value3;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					float u_xlat0;
					lowp vec3 u_xlat10_0;
					vec2 u_xlat1;
					float u_xlat2;
					void main()
					{
					    u_xlat0 = _Value * _TimeX;
					    u_xlat0 = trunc(u_xlat0);
					    u_xlat2 = u_xlat0 + 23.0;
					    u_xlat0 = dot(vec2(u_xlat0), vec2(12.9898005, 78.2330017));
					    u_xlat0 = sin(u_xlat0);
					    u_xlat0 = u_xlat0 * 43758.5469;
					    u_xlat0 = fract(u_xlat0);
					    u_xlat0 = _Value2 * u_xlat0 + vs_TEXCOORD0.x;
					    u_xlat1.x = (-_Value2) * 0.5 + u_xlat0;
					    u_xlat0 = dot(vec2(u_xlat2), vec2(12.9898005, 78.2330017));
					    u_xlat0 = sin(u_xlat0);
					    u_xlat0 = u_xlat0 * 43758.5469;
					    u_xlat0 = fract(u_xlat0);
					    u_xlat0 = _Value3 * u_xlat0 + vs_TEXCOORD0.y;
					    u_xlat1.y = (-_Value3) * 0.5 + u_xlat0;
					    u_xlat10_0.xyz = texture(_MainTex, u_xlat1.xy).xyz;
					    SV_Target0.xyz = u_xlat10_0.xyz;
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
					uniform 	float _TimeX;
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform 	float _Value3;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					float u_xlat0;
					lowp vec3 u_xlat10_0;
					vec2 u_xlat1;
					float u_xlat2;
					void main()
					{
					    u_xlat0 = _Value * _TimeX;
					    u_xlat0 = trunc(u_xlat0);
					    u_xlat2 = u_xlat0 + 23.0;
					    u_xlat0 = dot(vec2(u_xlat0), vec2(12.9898005, 78.2330017));
					    u_xlat0 = sin(u_xlat0);
					    u_xlat0 = u_xlat0 * 43758.5469;
					    u_xlat0 = fract(u_xlat0);
					    u_xlat0 = _Value2 * u_xlat0 + vs_TEXCOORD0.x;
					    u_xlat1.x = (-_Value2) * 0.5 + u_xlat0;
					    u_xlat0 = dot(vec2(u_xlat2), vec2(12.9898005, 78.2330017));
					    u_xlat0 = sin(u_xlat0);
					    u_xlat0 = u_xlat0 * 43758.5469;
					    u_xlat0 = fract(u_xlat0);
					    u_xlat0 = _Value3 * u_xlat0 + vs_TEXCOORD0.y;
					    u_xlat1.y = (-_Value3) * 0.5 + u_xlat0;
					    u_xlat10_0.xyz = texture(_MainTex, u_xlat1.xy).xyz;
					    SV_Target0.xyz = u_xlat10_0.xyz;
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