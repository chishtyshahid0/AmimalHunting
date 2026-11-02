Shader "CameraFilterPack/TV_Chromatical" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.3
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 3889
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
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 col_1;
					  highp float blur_2;
					  highp vec2 uv_3;
					  uv_3 = xlv_TEXCOORD0;
					  highp float tmpvar_4;
					  highp vec2 x_5;
					  x_5 = (uv_3 - vec2(0.5, 0.5));
					  tmpvar_4 = sqrt(dot (x_5, x_5));
					  blur_2 = ((1.0 + sin(
					    (_TimeX * 6.0)
					  )) * 0.5);
					  blur_2 = (blur_2 * (1.0 + (
					    sin((_TimeX * 16.0))
					   * 0.5)));
					  blur_2 = (pow (blur_2, 3.0) * 0.05);
					  blur_2 = (blur_2 * tmpvar_4);
					  highp vec2 tmpvar_6;
					  tmpvar_6.x = (uv_3.x + blur_2);
					  tmpvar_6.y = uv_3.y;
					  lowp vec4 tmpvar_7;
					  tmpvar_7 = texture2D (_MainTex, tmpvar_6);
					  col_1.x = tmpvar_7.x;
					  lowp vec4 tmpvar_8;
					  tmpvar_8 = texture2D (_MainTex, uv_3);
					  col_1.y = tmpvar_8.y;
					  highp vec2 tmpvar_9;
					  tmpvar_9.x = (uv_3.x - blur_2);
					  tmpvar_9.y = uv_3.y;
					  lowp vec4 tmpvar_10;
					  tmpvar_10 = texture2D (_MainTex, tmpvar_9);
					  col_1.z = tmpvar_10.z;
					  col_1 = (col_1 - (sin(
					    (uv_3.y * 800.0)
					  ) * 0.04));
					  col_1 = (col_1 * (1.0 - (tmpvar_4 * 0.5)));
					  highp vec4 tmpvar_11;
					  tmpvar_11.w = 1.0;
					  tmpvar_11.xyz = col_1;
					  gl_FragData[0] = tmpvar_11;
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
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 col_1;
					  highp float blur_2;
					  highp vec2 uv_3;
					  uv_3 = xlv_TEXCOORD0;
					  highp float tmpvar_4;
					  highp vec2 x_5;
					  x_5 = (uv_3 - vec2(0.5, 0.5));
					  tmpvar_4 = sqrt(dot (x_5, x_5));
					  blur_2 = ((1.0 + sin(
					    (_TimeX * 6.0)
					  )) * 0.5);
					  blur_2 = (blur_2 * (1.0 + (
					    sin((_TimeX * 16.0))
					   * 0.5)));
					  blur_2 = (pow (blur_2, 3.0) * 0.05);
					  blur_2 = (blur_2 * tmpvar_4);
					  highp vec2 tmpvar_6;
					  tmpvar_6.x = (uv_3.x + blur_2);
					  tmpvar_6.y = uv_3.y;
					  lowp vec4 tmpvar_7;
					  tmpvar_7 = texture2D (_MainTex, tmpvar_6);
					  col_1.x = tmpvar_7.x;
					  lowp vec4 tmpvar_8;
					  tmpvar_8 = texture2D (_MainTex, uv_3);
					  col_1.y = tmpvar_8.y;
					  highp vec2 tmpvar_9;
					  tmpvar_9.x = (uv_3.x - blur_2);
					  tmpvar_9.y = uv_3.y;
					  lowp vec4 tmpvar_10;
					  tmpvar_10 = texture2D (_MainTex, tmpvar_9);
					  col_1.z = tmpvar_10.z;
					  col_1 = (col_1 - (sin(
					    (uv_3.y * 800.0)
					  ) * 0.04));
					  col_1 = (col_1 * (1.0 - (tmpvar_4 * 0.5)));
					  highp vec4 tmpvar_11;
					  tmpvar_11.w = 1.0;
					  tmpvar_11.xyz = col_1;
					  gl_FragData[0] = tmpvar_11;
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
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 col_1;
					  highp float blur_2;
					  highp vec2 uv_3;
					  uv_3 = xlv_TEXCOORD0;
					  highp float tmpvar_4;
					  highp vec2 x_5;
					  x_5 = (uv_3 - vec2(0.5, 0.5));
					  tmpvar_4 = sqrt(dot (x_5, x_5));
					  blur_2 = ((1.0 + sin(
					    (_TimeX * 6.0)
					  )) * 0.5);
					  blur_2 = (blur_2 * (1.0 + (
					    sin((_TimeX * 16.0))
					   * 0.5)));
					  blur_2 = (pow (blur_2, 3.0) * 0.05);
					  blur_2 = (blur_2 * tmpvar_4);
					  highp vec2 tmpvar_6;
					  tmpvar_6.x = (uv_3.x + blur_2);
					  tmpvar_6.y = uv_3.y;
					  lowp vec4 tmpvar_7;
					  tmpvar_7 = texture2D (_MainTex, tmpvar_6);
					  col_1.x = tmpvar_7.x;
					  lowp vec4 tmpvar_8;
					  tmpvar_8 = texture2D (_MainTex, uv_3);
					  col_1.y = tmpvar_8.y;
					  highp vec2 tmpvar_9;
					  tmpvar_9.x = (uv_3.x - blur_2);
					  tmpvar_9.y = uv_3.y;
					  lowp vec4 tmpvar_10;
					  tmpvar_10 = texture2D (_MainTex, tmpvar_9);
					  col_1.z = tmpvar_10.z;
					  col_1 = (col_1 - (sin(
					    (uv_3.y * 800.0)
					  ) * 0.04));
					  col_1 = (col_1 * (1.0 - (tmpvar_4 * 0.5)));
					  highp vec4 tmpvar_11;
					  tmpvar_11.w = 1.0;
					  tmpvar_11.xyz = col_1;
					  gl_FragData[0] = tmpvar_11;
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
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat2;
					mediump vec2 u_xlat16_2;
					void main()
					{
					    u_xlat0.xy = vec2(_TimeX) * vec2(6.0, 16.0);
					    u_xlat0.xy = sin(u_xlat0.xy);
					    u_xlat0.x = u_xlat0.x + 1.0;
					    u_xlat2 = u_xlat0.y * 0.5 + 1.0;
					    u_xlat0.x = u_xlat0.x * 0.5;
					    u_xlat0.x = u_xlat2 * u_xlat0.x;
					    u_xlat2 = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = u_xlat2 * u_xlat0.x;
					    u_xlat16_2.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat16_2.x = dot(u_xlat16_2.xy, u_xlat16_2.xy);
					    u_xlat16_2.x = sqrt(u_xlat16_2.x);
					    u_xlat0.x = u_xlat16_2.x * u_xlat0.x;
					    u_xlat16_2.x = (-u_xlat16_2.x) * 0.5 + 1.0;
					    u_xlat1.x = u_xlat0.x * 0.0500000007 + vs_TEXCOORD0.x;
					    u_xlat1.z = (-u_xlat0.x) * 0.0500000007 + vs_TEXCOORD0.x;
					    u_xlat1.yw = vs_TEXCOORD0.yy;
					    u_xlat0.x = texture(_MainTex, u_xlat1.xy).x;
					    u_xlat0.w = texture(_MainTex, u_xlat1.zw).z;
					    u_xlat1.x = vs_TEXCOORD0.y * 800.0;
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat0.z = texture(_MainTex, vs_TEXCOORD0.xy).y;
					    u_xlat0.xzw = (-u_xlat1.xxx) * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat0.xzw;
					    SV_Target0.xyz = u_xlat16_2.xxx * u_xlat0.xzw;
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
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat2;
					mediump vec2 u_xlat16_2;
					void main()
					{
					    u_xlat0.xy = vec2(_TimeX) * vec2(6.0, 16.0);
					    u_xlat0.xy = sin(u_xlat0.xy);
					    u_xlat0.x = u_xlat0.x + 1.0;
					    u_xlat2 = u_xlat0.y * 0.5 + 1.0;
					    u_xlat0.x = u_xlat0.x * 0.5;
					    u_xlat0.x = u_xlat2 * u_xlat0.x;
					    u_xlat2 = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = u_xlat2 * u_xlat0.x;
					    u_xlat16_2.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat16_2.x = dot(u_xlat16_2.xy, u_xlat16_2.xy);
					    u_xlat16_2.x = sqrt(u_xlat16_2.x);
					    u_xlat0.x = u_xlat16_2.x * u_xlat0.x;
					    u_xlat16_2.x = (-u_xlat16_2.x) * 0.5 + 1.0;
					    u_xlat1.x = u_xlat0.x * 0.0500000007 + vs_TEXCOORD0.x;
					    u_xlat1.z = (-u_xlat0.x) * 0.0500000007 + vs_TEXCOORD0.x;
					    u_xlat1.yw = vs_TEXCOORD0.yy;
					    u_xlat0.x = texture(_MainTex, u_xlat1.xy).x;
					    u_xlat0.w = texture(_MainTex, u_xlat1.zw).z;
					    u_xlat1.x = vs_TEXCOORD0.y * 800.0;
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat0.z = texture(_MainTex, vs_TEXCOORD0.xy).y;
					    u_xlat0.xzw = (-u_xlat1.xxx) * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat0.xzw;
					    SV_Target0.xyz = u_xlat16_2.xxx * u_xlat0.xzw;
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
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat2;
					mediump vec2 u_xlat16_2;
					void main()
					{
					    u_xlat0.xy = vec2(_TimeX) * vec2(6.0, 16.0);
					    u_xlat0.xy = sin(u_xlat0.xy);
					    u_xlat0.x = u_xlat0.x + 1.0;
					    u_xlat2 = u_xlat0.y * 0.5 + 1.0;
					    u_xlat0.x = u_xlat0.x * 0.5;
					    u_xlat0.x = u_xlat2 * u_xlat0.x;
					    u_xlat2 = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = u_xlat2 * u_xlat0.x;
					    u_xlat16_2.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat16_2.x = dot(u_xlat16_2.xy, u_xlat16_2.xy);
					    u_xlat16_2.x = sqrt(u_xlat16_2.x);
					    u_xlat0.x = u_xlat16_2.x * u_xlat0.x;
					    u_xlat16_2.x = (-u_xlat16_2.x) * 0.5 + 1.0;
					    u_xlat1.x = u_xlat0.x * 0.0500000007 + vs_TEXCOORD0.x;
					    u_xlat1.z = (-u_xlat0.x) * 0.0500000007 + vs_TEXCOORD0.x;
					    u_xlat1.yw = vs_TEXCOORD0.yy;
					    u_xlat0.x = texture(_MainTex, u_xlat1.xy).x;
					    u_xlat0.w = texture(_MainTex, u_xlat1.zw).z;
					    u_xlat1.x = vs_TEXCOORD0.y * 800.0;
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat0.z = texture(_MainTex, vs_TEXCOORD0.xy).y;
					    u_xlat0.xzw = (-u_xlat1.xxx) * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat0.xzw;
					    SV_Target0.xyz = u_xlat16_2.xxx * u_xlat0.xzw;
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