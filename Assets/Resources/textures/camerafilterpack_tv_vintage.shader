Shader "CameraFilterPack/TV_Vintage" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(1, 10)) = 1
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 42610
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
					uniform highp float _Distortion;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 col_1;
					  highp vec2 tmpvar_2;
					  tmpvar_2 = (0.5 + ((xlv_TEXCOORD0 - 0.5) * (0.9 + 
					    (0.1 * sin((0.1 * _TimeX)))
					  )));
					  highp vec2 tmpvar_3;
					  highp float tmpvar_4;
					  tmpvar_4 = (0.003 * _Distortion);
					  tmpvar_3.x = (tmpvar_2.x + tmpvar_4);
					  tmpvar_3.y = tmpvar_2.y;
					  lowp vec4 tmpvar_5;
					  tmpvar_5 = texture2D (_MainTex, tmpvar_3);
					  col_1.x = tmpvar_5.x;
					  lowp vec4 tmpvar_6;
					  tmpvar_6 = texture2D (_MainTex, tmpvar_2);
					  col_1.y = tmpvar_6.y;
					  highp vec2 tmpvar_7;
					  tmpvar_7.x = (tmpvar_2.x - tmpvar_4);
					  tmpvar_7.y = tmpvar_2.y;
					  lowp vec4 tmpvar_8;
					  tmpvar_8 = texture2D (_MainTex, tmpvar_7);
					  col_1.z = tmpvar_8.z;
					  col_1 = (clamp ((
					    (col_1 * 0.5)
					   + 
					    ((0.6 * col_1) * col_1)
					  ), vec3(0.0, 0.0, 0.0), vec3(1.0, 1.0, 1.0)) * (0.5 + (
					    (((8.0 * tmpvar_2.x) * tmpvar_2.y) * (1.0 - tmpvar_2.x))
					   * 
					    (1.0 - tmpvar_2.y)
					  )));
					  col_1 = (col_1 * vec3(0.95, 1.05, 0.95));
					  col_1 = (col_1 * (0.9 + (0.1 * 
					    sin(((10.0 * _TimeX) + (tmpvar_2.y * 1000.0)))
					  )));
					  col_1 = (col_1 * (0.99 + (0.01 * 
					    sin((110.0 * _TimeX))
					  )));
					  highp vec4 tmpvar_9;
					  tmpvar_9.w = 1.0;
					  tmpvar_9.xyz = col_1;
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
					uniform highp float _TimeX;
					uniform highp float _Distortion;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 col_1;
					  highp vec2 tmpvar_2;
					  tmpvar_2 = (0.5 + ((xlv_TEXCOORD0 - 0.5) * (0.9 + 
					    (0.1 * sin((0.1 * _TimeX)))
					  )));
					  highp vec2 tmpvar_3;
					  highp float tmpvar_4;
					  tmpvar_4 = (0.003 * _Distortion);
					  tmpvar_3.x = (tmpvar_2.x + tmpvar_4);
					  tmpvar_3.y = tmpvar_2.y;
					  lowp vec4 tmpvar_5;
					  tmpvar_5 = texture2D (_MainTex, tmpvar_3);
					  col_1.x = tmpvar_5.x;
					  lowp vec4 tmpvar_6;
					  tmpvar_6 = texture2D (_MainTex, tmpvar_2);
					  col_1.y = tmpvar_6.y;
					  highp vec2 tmpvar_7;
					  tmpvar_7.x = (tmpvar_2.x - tmpvar_4);
					  tmpvar_7.y = tmpvar_2.y;
					  lowp vec4 tmpvar_8;
					  tmpvar_8 = texture2D (_MainTex, tmpvar_7);
					  col_1.z = tmpvar_8.z;
					  col_1 = (clamp ((
					    (col_1 * 0.5)
					   + 
					    ((0.6 * col_1) * col_1)
					  ), vec3(0.0, 0.0, 0.0), vec3(1.0, 1.0, 1.0)) * (0.5 + (
					    (((8.0 * tmpvar_2.x) * tmpvar_2.y) * (1.0 - tmpvar_2.x))
					   * 
					    (1.0 - tmpvar_2.y)
					  )));
					  col_1 = (col_1 * vec3(0.95, 1.05, 0.95));
					  col_1 = (col_1 * (0.9 + (0.1 * 
					    sin(((10.0 * _TimeX) + (tmpvar_2.y * 1000.0)))
					  )));
					  col_1 = (col_1 * (0.99 + (0.01 * 
					    sin((110.0 * _TimeX))
					  )));
					  highp vec4 tmpvar_9;
					  tmpvar_9.w = 1.0;
					  tmpvar_9.xyz = col_1;
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
					uniform highp float _TimeX;
					uniform highp float _Distortion;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 col_1;
					  highp vec2 tmpvar_2;
					  tmpvar_2 = (0.5 + ((xlv_TEXCOORD0 - 0.5) * (0.9 + 
					    (0.1 * sin((0.1 * _TimeX)))
					  )));
					  highp vec2 tmpvar_3;
					  highp float tmpvar_4;
					  tmpvar_4 = (0.003 * _Distortion);
					  tmpvar_3.x = (tmpvar_2.x + tmpvar_4);
					  tmpvar_3.y = tmpvar_2.y;
					  lowp vec4 tmpvar_5;
					  tmpvar_5 = texture2D (_MainTex, tmpvar_3);
					  col_1.x = tmpvar_5.x;
					  lowp vec4 tmpvar_6;
					  tmpvar_6 = texture2D (_MainTex, tmpvar_2);
					  col_1.y = tmpvar_6.y;
					  highp vec2 tmpvar_7;
					  tmpvar_7.x = (tmpvar_2.x - tmpvar_4);
					  tmpvar_7.y = tmpvar_2.y;
					  lowp vec4 tmpvar_8;
					  tmpvar_8 = texture2D (_MainTex, tmpvar_7);
					  col_1.z = tmpvar_8.z;
					  col_1 = (clamp ((
					    (col_1 * 0.5)
					   + 
					    ((0.6 * col_1) * col_1)
					  ), vec3(0.0, 0.0, 0.0), vec3(1.0, 1.0, 1.0)) * (0.5 + (
					    (((8.0 * tmpvar_2.x) * tmpvar_2.y) * (1.0 - tmpvar_2.x))
					   * 
					    (1.0 - tmpvar_2.y)
					  )));
					  col_1 = (col_1 * vec3(0.95, 1.05, 0.95));
					  col_1 = (col_1 * (0.9 + (0.1 * 
					    sin(((10.0 * _TimeX) + (tmpvar_2.y * 1000.0)))
					  )));
					  col_1 = (col_1 * (0.99 + (0.01 * 
					    sin((110.0 * _TimeX))
					  )));
					  highp vec4 tmpvar_9;
					  tmpvar_9.w = 1.0;
					  tmpvar_9.xyz = col_1;
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
					uniform 	float _TimeX;
					uniform 	float _Distortion;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					mediump vec2 u_xlat16_0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					float u_xlat5;
					void main()
					{
					    u_xlat16_0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat1.xyz = vec3(_TimeX) * vec3(0.100000001, 10.0, 110.0);
					    u_xlat1.xz = sin(u_xlat1.xz);
					    u_xlat1.xz = u_xlat1.xz * vec2(0.100000001, 0.00999999978) + vec2(0.899999976, 0.99000001);
					    u_xlat0.zw = u_xlat16_0.xy * u_xlat1.xx + vec2(0.5, 0.5);
					    u_xlat0.y = _Distortion * 0.00300000003 + u_xlat0.z;
					    u_xlat2.x = texture(_MainTex, u_xlat0.yw).x;
					    u_xlat0.x = (-_Distortion) * 0.00300000003 + u_xlat0.z;
					    u_xlat2.z = texture(_MainTex, u_xlat0.xw).z;
					    u_xlat2.y = texture(_MainTex, u_xlat0.zw).y;
					    u_xlat3.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat2.xyz = u_xlat2.xyz * u_xlat3.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(1.20000005, 1.20000005, 1.20000005) + u_xlat3.xyz;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
					#else
					    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
					#endif
					    u_xlat1.x = u_xlat0.z * u_xlat0.w;
					    u_xlat1.x = u_xlat1.x * 8.0;
					    u_xlat3.xy = vec2((-u_xlat0.z) + float(1.0), (-u_xlat0.w) + float(1.0));
					    u_xlat5 = u_xlat0.w * 1000.0 + u_xlat1.y;
					    u_xlat5 = sin(u_xlat5);
					    u_xlat5 = u_xlat5 * 0.100000001 + 0.899999976;
					    u_xlat1.x = u_xlat1.x * u_xlat3.x;
					    u_xlat1.x = u_xlat1.x * u_xlat3.y + 0.5;
					    u_xlat2.xyz = u_xlat1.xxx * u_xlat2.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(0.949999988, 1.04999995, 0.949999988);
					    u_xlat1.xyw = vec3(u_xlat5) * u_xlat2.xyz;
					    SV_Target0.xyz = u_xlat1.zzz * u_xlat1.xyw;
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
					uniform 	float _Distortion;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					mediump vec2 u_xlat16_0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					float u_xlat5;
					void main()
					{
					    u_xlat16_0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat1.xyz = vec3(_TimeX) * vec3(0.100000001, 10.0, 110.0);
					    u_xlat1.xz = sin(u_xlat1.xz);
					    u_xlat1.xz = u_xlat1.xz * vec2(0.100000001, 0.00999999978) + vec2(0.899999976, 0.99000001);
					    u_xlat0.zw = u_xlat16_0.xy * u_xlat1.xx + vec2(0.5, 0.5);
					    u_xlat0.y = _Distortion * 0.00300000003 + u_xlat0.z;
					    u_xlat2.x = texture(_MainTex, u_xlat0.yw).x;
					    u_xlat0.x = (-_Distortion) * 0.00300000003 + u_xlat0.z;
					    u_xlat2.z = texture(_MainTex, u_xlat0.xw).z;
					    u_xlat2.y = texture(_MainTex, u_xlat0.zw).y;
					    u_xlat3.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat2.xyz = u_xlat2.xyz * u_xlat3.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(1.20000005, 1.20000005, 1.20000005) + u_xlat3.xyz;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
					#else
					    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
					#endif
					    u_xlat1.x = u_xlat0.z * u_xlat0.w;
					    u_xlat1.x = u_xlat1.x * 8.0;
					    u_xlat3.xy = vec2((-u_xlat0.z) + float(1.0), (-u_xlat0.w) + float(1.0));
					    u_xlat5 = u_xlat0.w * 1000.0 + u_xlat1.y;
					    u_xlat5 = sin(u_xlat5);
					    u_xlat5 = u_xlat5 * 0.100000001 + 0.899999976;
					    u_xlat1.x = u_xlat1.x * u_xlat3.x;
					    u_xlat1.x = u_xlat1.x * u_xlat3.y + 0.5;
					    u_xlat2.xyz = u_xlat1.xxx * u_xlat2.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(0.949999988, 1.04999995, 0.949999988);
					    u_xlat1.xyw = vec3(u_xlat5) * u_xlat2.xyz;
					    SV_Target0.xyz = u_xlat1.zzz * u_xlat1.xyw;
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
					uniform 	float _Distortion;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					mediump vec2 u_xlat16_0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					float u_xlat5;
					void main()
					{
					    u_xlat16_0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat1.xyz = vec3(_TimeX) * vec3(0.100000001, 10.0, 110.0);
					    u_xlat1.xz = sin(u_xlat1.xz);
					    u_xlat1.xz = u_xlat1.xz * vec2(0.100000001, 0.00999999978) + vec2(0.899999976, 0.99000001);
					    u_xlat0.zw = u_xlat16_0.xy * u_xlat1.xx + vec2(0.5, 0.5);
					    u_xlat0.y = _Distortion * 0.00300000003 + u_xlat0.z;
					    u_xlat2.x = texture(_MainTex, u_xlat0.yw).x;
					    u_xlat0.x = (-_Distortion) * 0.00300000003 + u_xlat0.z;
					    u_xlat2.z = texture(_MainTex, u_xlat0.xw).z;
					    u_xlat2.y = texture(_MainTex, u_xlat0.zw).y;
					    u_xlat3.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat2.xyz = u_xlat2.xyz * u_xlat3.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(1.20000005, 1.20000005, 1.20000005) + u_xlat3.xyz;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
					#else
					    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
					#endif
					    u_xlat1.x = u_xlat0.z * u_xlat0.w;
					    u_xlat1.x = u_xlat1.x * 8.0;
					    u_xlat3.xy = vec2((-u_xlat0.z) + float(1.0), (-u_xlat0.w) + float(1.0));
					    u_xlat5 = u_xlat0.w * 1000.0 + u_xlat1.y;
					    u_xlat5 = sin(u_xlat5);
					    u_xlat5 = u_xlat5 * 0.100000001 + 0.899999976;
					    u_xlat1.x = u_xlat1.x * u_xlat3.x;
					    u_xlat1.x = u_xlat1.x * u_xlat3.y + 0.5;
					    u_xlat2.xyz = u_xlat1.xxx * u_xlat2.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(0.949999988, 1.04999995, 0.949999988);
					    u_xlat1.xyw = vec3(u_xlat5) * u_xlat2.xyz;
					    SV_Target0.xyz = u_xlat1.zzz * u_xlat1.xyw;
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