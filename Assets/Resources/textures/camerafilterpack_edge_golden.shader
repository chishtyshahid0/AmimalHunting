Shader "CameraFilterPack/Edge_Golden" {
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
			GpuProgramID 60007
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
					uniform highp vec4 _ScreenResolution;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 texD_1;
					  highp vec3 texC_2;
					  highp vec3 texB_3;
					  highp vec3 texA_4;
					  highp vec2 uv_5;
					  uv_5 = xlv_TEXCOORD0;
					  highp vec2 tmpvar_6;
					  tmpvar_6 = (1.0/(_ScreenResolution.xy));
					  highp vec2 P_7;
					  P_7 = (uv_5 + (-(tmpvar_6) * 1.5));
					  lowp vec3 tmpvar_8;
					  tmpvar_8 = texture2D (_MainTex, P_7).xyz;
					  texA_4 = tmpvar_8;
					  highp vec2 tmpvar_9;
					  tmpvar_9.x = tmpvar_6.x;
					  tmpvar_9.y = -(tmpvar_6.y);
					  highp vec2 P_10;
					  P_10 = (uv_5 + (tmpvar_9 * 1.5));
					  lowp vec3 tmpvar_11;
					  tmpvar_11 = texture2D (_MainTex, P_10).xyz;
					  texB_3 = tmpvar_11;
					  highp vec2 tmpvar_12;
					  tmpvar_12.x = -(tmpvar_6.x);
					  tmpvar_12.y = tmpvar_6.y;
					  highp vec2 P_13;
					  P_13 = (uv_5 + (tmpvar_12 * 1.5));
					  lowp vec3 tmpvar_14;
					  tmpvar_14 = texture2D (_MainTex, P_13).xyz;
					  texC_2 = tmpvar_14;
					  highp vec2 P_15;
					  P_15 = (uv_5 + (tmpvar_6 * 1.5));
					  lowp vec3 tmpvar_16;
					  tmpvar_16 = texture2D (_MainTex, P_15).xyz;
					  texD_1 = tmpvar_16;
					  highp vec4 tmpvar_17;
					  tmpvar_17.w = 1.0;
					  tmpvar_17.xyz = mix (vec3(0.1, 0.18, 0.3), vec3(0.4, 0.3, 0.2), vec3((15.0 * pow (
					    max (abs((dot (texA_4, vec3(0.333333, 0.333333, 0.333333)) - dot (texD_1, vec3(0.333333, 0.333333, 0.333333)))), abs((dot (texB_3, vec3(0.333333, 0.333333, 0.333333)) - dot (texC_2, vec3(0.333333, 0.333333, 0.333333)))))
					  , 0.5))));
					  gl_FragData[0] = tmpvar_17;
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
					uniform highp vec4 _ScreenResolution;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 texD_1;
					  highp vec3 texC_2;
					  highp vec3 texB_3;
					  highp vec3 texA_4;
					  highp vec2 uv_5;
					  uv_5 = xlv_TEXCOORD0;
					  highp vec2 tmpvar_6;
					  tmpvar_6 = (1.0/(_ScreenResolution.xy));
					  highp vec2 P_7;
					  P_7 = (uv_5 + (-(tmpvar_6) * 1.5));
					  lowp vec3 tmpvar_8;
					  tmpvar_8 = texture2D (_MainTex, P_7).xyz;
					  texA_4 = tmpvar_8;
					  highp vec2 tmpvar_9;
					  tmpvar_9.x = tmpvar_6.x;
					  tmpvar_9.y = -(tmpvar_6.y);
					  highp vec2 P_10;
					  P_10 = (uv_5 + (tmpvar_9 * 1.5));
					  lowp vec3 tmpvar_11;
					  tmpvar_11 = texture2D (_MainTex, P_10).xyz;
					  texB_3 = tmpvar_11;
					  highp vec2 tmpvar_12;
					  tmpvar_12.x = -(tmpvar_6.x);
					  tmpvar_12.y = tmpvar_6.y;
					  highp vec2 P_13;
					  P_13 = (uv_5 + (tmpvar_12 * 1.5));
					  lowp vec3 tmpvar_14;
					  tmpvar_14 = texture2D (_MainTex, P_13).xyz;
					  texC_2 = tmpvar_14;
					  highp vec2 P_15;
					  P_15 = (uv_5 + (tmpvar_6 * 1.5));
					  lowp vec3 tmpvar_16;
					  tmpvar_16 = texture2D (_MainTex, P_15).xyz;
					  texD_1 = tmpvar_16;
					  highp vec4 tmpvar_17;
					  tmpvar_17.w = 1.0;
					  tmpvar_17.xyz = mix (vec3(0.1, 0.18, 0.3), vec3(0.4, 0.3, 0.2), vec3((15.0 * pow (
					    max (abs((dot (texA_4, vec3(0.333333, 0.333333, 0.333333)) - dot (texD_1, vec3(0.333333, 0.333333, 0.333333)))), abs((dot (texB_3, vec3(0.333333, 0.333333, 0.333333)) - dot (texC_2, vec3(0.333333, 0.333333, 0.333333)))))
					  , 0.5))));
					  gl_FragData[0] = tmpvar_17;
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
					uniform highp vec4 _ScreenResolution;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 texD_1;
					  highp vec3 texC_2;
					  highp vec3 texB_3;
					  highp vec3 texA_4;
					  highp vec2 uv_5;
					  uv_5 = xlv_TEXCOORD0;
					  highp vec2 tmpvar_6;
					  tmpvar_6 = (1.0/(_ScreenResolution.xy));
					  highp vec2 P_7;
					  P_7 = (uv_5 + (-(tmpvar_6) * 1.5));
					  lowp vec3 tmpvar_8;
					  tmpvar_8 = texture2D (_MainTex, P_7).xyz;
					  texA_4 = tmpvar_8;
					  highp vec2 tmpvar_9;
					  tmpvar_9.x = tmpvar_6.x;
					  tmpvar_9.y = -(tmpvar_6.y);
					  highp vec2 P_10;
					  P_10 = (uv_5 + (tmpvar_9 * 1.5));
					  lowp vec3 tmpvar_11;
					  tmpvar_11 = texture2D (_MainTex, P_10).xyz;
					  texB_3 = tmpvar_11;
					  highp vec2 tmpvar_12;
					  tmpvar_12.x = -(tmpvar_6.x);
					  tmpvar_12.y = tmpvar_6.y;
					  highp vec2 P_13;
					  P_13 = (uv_5 + (tmpvar_12 * 1.5));
					  lowp vec3 tmpvar_14;
					  tmpvar_14 = texture2D (_MainTex, P_13).xyz;
					  texC_2 = tmpvar_14;
					  highp vec2 P_15;
					  P_15 = (uv_5 + (tmpvar_6 * 1.5));
					  lowp vec3 tmpvar_16;
					  tmpvar_16 = texture2D (_MainTex, P_15).xyz;
					  texD_1 = tmpvar_16;
					  highp vec4 tmpvar_17;
					  tmpvar_17.w = 1.0;
					  tmpvar_17.xyz = mix (vec3(0.1, 0.18, 0.3), vec3(0.4, 0.3, 0.2), vec3((15.0 * pow (
					    max (abs((dot (texA_4, vec3(0.333333, 0.333333, 0.333333)) - dot (texD_1, vec3(0.333333, 0.333333, 0.333333)))), abs((dot (texB_3, vec3(0.333333, 0.333333, 0.333333)) - dot (texC_2, vec3(0.333333, 0.333333, 0.333333)))))
					  , 0.5))));
					  gl_FragData[0] = tmpvar_17;
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
					uniform 	vec4 _ScreenResolution;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					lowp vec3 u_xlat10_0;
					vec4 u_xlat1;
					lowp vec3 u_xlat10_1;
					lowp vec3 u_xlat10_2;
					void main()
					{
					    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / _ScreenResolution.xyxy;
					    u_xlat1 = u_xlat0.zwzw * vec4(-1.5, -1.5, 1.5, -1.5) + vs_TEXCOORD0.xyxy;
					    u_xlat0 = u_xlat0 * vec4(-1.5, 1.5, 1.5, 1.5) + vs_TEXCOORD0.xyxy;
					    u_xlat10_2.xyz = texture(_MainTex, u_xlat1.xy).xyz;
					    u_xlat10_1.xyz = texture(_MainTex, u_xlat1.zw).xyz;
					    u_xlat1.x = dot(u_xlat10_1.xyz, vec3(0.333332986, 0.333332986, 0.333332986));
					    u_xlat1.y = dot(u_xlat10_2.xyz, vec3(0.333332986, 0.333332986, 0.333332986));
					    u_xlat10_2.xyz = texture(_MainTex, u_xlat0.zw).xyz;
					    u_xlat10_0.xyz = texture(_MainTex, u_xlat0.xy).xyz;
					    u_xlat0.x = dot(u_xlat10_0.xyz, vec3(0.333332986, 0.333332986, 0.333332986));
					    u_xlat0.y = dot(u_xlat10_2.xyz, vec3(0.333332986, 0.333332986, 0.333332986));
					    u_xlat0.xy = (-u_xlat0.xy) + u_xlat1.xy;
					    u_xlat0.x = max(abs(u_xlat0.x), abs(u_xlat0.y));
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    SV_Target0.xyz = u_xlat0.xxx * vec3(4.5, 1.80000007, -1.50000012) + vec3(0.100000001, 0.180000007, 0.300000012);
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
					uniform 	vec4 _ScreenResolution;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					lowp vec3 u_xlat10_0;
					vec4 u_xlat1;
					lowp vec3 u_xlat10_1;
					lowp vec3 u_xlat10_2;
					void main()
					{
					    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / _ScreenResolution.xyxy;
					    u_xlat1 = u_xlat0.zwzw * vec4(-1.5, -1.5, 1.5, -1.5) + vs_TEXCOORD0.xyxy;
					    u_xlat0 = u_xlat0 * vec4(-1.5, 1.5, 1.5, 1.5) + vs_TEXCOORD0.xyxy;
					    u_xlat10_2.xyz = texture(_MainTex, u_xlat1.xy).xyz;
					    u_xlat10_1.xyz = texture(_MainTex, u_xlat1.zw).xyz;
					    u_xlat1.x = dot(u_xlat10_1.xyz, vec3(0.333332986, 0.333332986, 0.333332986));
					    u_xlat1.y = dot(u_xlat10_2.xyz, vec3(0.333332986, 0.333332986, 0.333332986));
					    u_xlat10_2.xyz = texture(_MainTex, u_xlat0.zw).xyz;
					    u_xlat10_0.xyz = texture(_MainTex, u_xlat0.xy).xyz;
					    u_xlat0.x = dot(u_xlat10_0.xyz, vec3(0.333332986, 0.333332986, 0.333332986));
					    u_xlat0.y = dot(u_xlat10_2.xyz, vec3(0.333332986, 0.333332986, 0.333332986));
					    u_xlat0.xy = (-u_xlat0.xy) + u_xlat1.xy;
					    u_xlat0.x = max(abs(u_xlat0.x), abs(u_xlat0.y));
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    SV_Target0.xyz = u_xlat0.xxx * vec3(4.5, 1.80000007, -1.50000012) + vec3(0.100000001, 0.180000007, 0.300000012);
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
					uniform 	vec4 _ScreenResolution;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					lowp vec3 u_xlat10_0;
					vec4 u_xlat1;
					lowp vec3 u_xlat10_1;
					lowp vec3 u_xlat10_2;
					void main()
					{
					    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / _ScreenResolution.xyxy;
					    u_xlat1 = u_xlat0.zwzw * vec4(-1.5, -1.5, 1.5, -1.5) + vs_TEXCOORD0.xyxy;
					    u_xlat0 = u_xlat0 * vec4(-1.5, 1.5, 1.5, 1.5) + vs_TEXCOORD0.xyxy;
					    u_xlat10_2.xyz = texture(_MainTex, u_xlat1.xy).xyz;
					    u_xlat10_1.xyz = texture(_MainTex, u_xlat1.zw).xyz;
					    u_xlat1.x = dot(u_xlat10_1.xyz, vec3(0.333332986, 0.333332986, 0.333332986));
					    u_xlat1.y = dot(u_xlat10_2.xyz, vec3(0.333332986, 0.333332986, 0.333332986));
					    u_xlat10_2.xyz = texture(_MainTex, u_xlat0.zw).xyz;
					    u_xlat10_0.xyz = texture(_MainTex, u_xlat0.xy).xyz;
					    u_xlat0.x = dot(u_xlat10_0.xyz, vec3(0.333332986, 0.333332986, 0.333332986));
					    u_xlat0.y = dot(u_xlat10_2.xyz, vec3(0.333332986, 0.333332986, 0.333332986));
					    u_xlat0.xy = (-u_xlat0.xy) + u_xlat1.xy;
					    u_xlat0.x = max(abs(u_xlat0.x), abs(u_xlat0.y));
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    SV_Target0.xyz = u_xlat0.xxx * vec3(4.5, 1.80000007, -1.50000012) + vec3(0.100000001, 0.180000007, 0.300000012);
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