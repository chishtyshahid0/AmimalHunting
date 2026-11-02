Shader "CameraFilterPack/TV_Distorted" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(1, 10)) = 1
		_RGB ("_RGB", Range(1, 10)) = 1
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 65205
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
					uniform highp float _RGB;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp float blue_1;
					  highp float green_2;
					  highp float red_3;
					  highp vec2 uv_4;
					  uv_4 = xlv_TEXCOORD0;
					  highp vec2 tmpvar_5;
					  tmpvar_5.x = (_TimeX * 15.0);
					  tmpvar_5.y = (uv_4.y * 80.0);
					  highp vec2 tmpvar_6;
					  tmpvar_6.x = _TimeX;
					  tmpvar_6.y = (uv_4.y * 25.0);
					  highp float tmpvar_7;
					  tmpvar_7 = (((
					    (sin(((_TimeX * tmpvar_5.y) / 35.0)) * fract((sin(
					      dot (tmpvar_5, vec2(12.9898, 78.233))
					    ) * 43758.55)))
					   * 0.003) * _Distortion) + ((
					    (sin(((_TimeX * tmpvar_6.y) / 35.0)) * fract((sin(
					      dot (tmpvar_6, vec2(12.9898, 78.233))
					    ) * 43758.55)))
					   * 0.004) * _Distortion));
					  highp vec2 tmpvar_8;
					  tmpvar_8.x = ((uv_4.x + tmpvar_7) - _RGB);
					  tmpvar_8.y = uv_4.y;
					  lowp float tmpvar_9;
					  tmpvar_9 = texture2D (_MainTex, tmpvar_8).x;
					  red_3 = tmpvar_9;
					  highp vec2 tmpvar_10;
					  tmpvar_10.x = (uv_4.x + tmpvar_7);
					  tmpvar_10.y = uv_4.y;
					  lowp float tmpvar_11;
					  tmpvar_11 = texture2D (_MainTex, tmpvar_10).y;
					  green_2 = tmpvar_11;
					  highp vec2 tmpvar_12;
					  tmpvar_12.x = ((uv_4.x + tmpvar_7) + _RGB);
					  tmpvar_12.y = uv_4.y;
					  lowp float tmpvar_13;
					  tmpvar_13 = texture2D (_MainTex, tmpvar_12).z;
					  blue_1 = tmpvar_13;
					  highp vec3 tmpvar_14;
					  tmpvar_14.x = red_3;
					  tmpvar_14.y = green_2;
					  tmpvar_14.z = blue_1;
					  highp vec4 tmpvar_15;
					  tmpvar_15.w = 1.0;
					  tmpvar_15.xyz = (tmpvar_14 - (sin(
					    (uv_4.y * 800.0)
					  ) * 0.04));
					  gl_FragData[0] = tmpvar_15;
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
					uniform highp float _RGB;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp float blue_1;
					  highp float green_2;
					  highp float red_3;
					  highp vec2 uv_4;
					  uv_4 = xlv_TEXCOORD0;
					  highp vec2 tmpvar_5;
					  tmpvar_5.x = (_TimeX * 15.0);
					  tmpvar_5.y = (uv_4.y * 80.0);
					  highp vec2 tmpvar_6;
					  tmpvar_6.x = _TimeX;
					  tmpvar_6.y = (uv_4.y * 25.0);
					  highp float tmpvar_7;
					  tmpvar_7 = (((
					    (sin(((_TimeX * tmpvar_5.y) / 35.0)) * fract((sin(
					      dot (tmpvar_5, vec2(12.9898, 78.233))
					    ) * 43758.55)))
					   * 0.003) * _Distortion) + ((
					    (sin(((_TimeX * tmpvar_6.y) / 35.0)) * fract((sin(
					      dot (tmpvar_6, vec2(12.9898, 78.233))
					    ) * 43758.55)))
					   * 0.004) * _Distortion));
					  highp vec2 tmpvar_8;
					  tmpvar_8.x = ((uv_4.x + tmpvar_7) - _RGB);
					  tmpvar_8.y = uv_4.y;
					  lowp float tmpvar_9;
					  tmpvar_9 = texture2D (_MainTex, tmpvar_8).x;
					  red_3 = tmpvar_9;
					  highp vec2 tmpvar_10;
					  tmpvar_10.x = (uv_4.x + tmpvar_7);
					  tmpvar_10.y = uv_4.y;
					  lowp float tmpvar_11;
					  tmpvar_11 = texture2D (_MainTex, tmpvar_10).y;
					  green_2 = tmpvar_11;
					  highp vec2 tmpvar_12;
					  tmpvar_12.x = ((uv_4.x + tmpvar_7) + _RGB);
					  tmpvar_12.y = uv_4.y;
					  lowp float tmpvar_13;
					  tmpvar_13 = texture2D (_MainTex, tmpvar_12).z;
					  blue_1 = tmpvar_13;
					  highp vec3 tmpvar_14;
					  tmpvar_14.x = red_3;
					  tmpvar_14.y = green_2;
					  tmpvar_14.z = blue_1;
					  highp vec4 tmpvar_15;
					  tmpvar_15.w = 1.0;
					  tmpvar_15.xyz = (tmpvar_14 - (sin(
					    (uv_4.y * 800.0)
					  ) * 0.04));
					  gl_FragData[0] = tmpvar_15;
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
					uniform highp float _RGB;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp float blue_1;
					  highp float green_2;
					  highp float red_3;
					  highp vec2 uv_4;
					  uv_4 = xlv_TEXCOORD0;
					  highp vec2 tmpvar_5;
					  tmpvar_5.x = (_TimeX * 15.0);
					  tmpvar_5.y = (uv_4.y * 80.0);
					  highp vec2 tmpvar_6;
					  tmpvar_6.x = _TimeX;
					  tmpvar_6.y = (uv_4.y * 25.0);
					  highp float tmpvar_7;
					  tmpvar_7 = (((
					    (sin(((_TimeX * tmpvar_5.y) / 35.0)) * fract((sin(
					      dot (tmpvar_5, vec2(12.9898, 78.233))
					    ) * 43758.55)))
					   * 0.003) * _Distortion) + ((
					    (sin(((_TimeX * tmpvar_6.y) / 35.0)) * fract((sin(
					      dot (tmpvar_6, vec2(12.9898, 78.233))
					    ) * 43758.55)))
					   * 0.004) * _Distortion));
					  highp vec2 tmpvar_8;
					  tmpvar_8.x = ((uv_4.x + tmpvar_7) - _RGB);
					  tmpvar_8.y = uv_4.y;
					  lowp float tmpvar_9;
					  tmpvar_9 = texture2D (_MainTex, tmpvar_8).x;
					  red_3 = tmpvar_9;
					  highp vec2 tmpvar_10;
					  tmpvar_10.x = (uv_4.x + tmpvar_7);
					  tmpvar_10.y = uv_4.y;
					  lowp float tmpvar_11;
					  tmpvar_11 = texture2D (_MainTex, tmpvar_10).y;
					  green_2 = tmpvar_11;
					  highp vec2 tmpvar_12;
					  tmpvar_12.x = ((uv_4.x + tmpvar_7) + _RGB);
					  tmpvar_12.y = uv_4.y;
					  lowp float tmpvar_13;
					  tmpvar_13 = texture2D (_MainTex, tmpvar_12).z;
					  blue_1 = tmpvar_13;
					  highp vec3 tmpvar_14;
					  tmpvar_14.x = red_3;
					  tmpvar_14.y = green_2;
					  tmpvar_14.z = blue_1;
					  highp vec4 tmpvar_15;
					  tmpvar_15.w = 1.0;
					  tmpvar_15.xyz = (tmpvar_14 - (sin(
					    (uv_4.y * 800.0)
					  ) * 0.04));
					  gl_FragData[0] = tmpvar_15;
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
					uniform 	float _RGB;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec2 u_xlat2;
					float u_xlat4;
					float u_xlat6;
					void main()
					{
					    u_xlat0.x = _TimeX;
					    u_xlat1.xyz = vs_TEXCOORD0.yyy * vec3(80.0, 25.0, 800.0);
					    u_xlat0.y = u_xlat1.y;
					    u_xlat0.x = dot(u_xlat0.xy, vec2(12.9898005, 78.2330017));
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 43758.5469;
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlat2.xy = u_xlat1.xy * vec2(_TimeX);
					    u_xlat2.xy = u_xlat2.xy * vec2(0.0285714287, 0.0285714287);
					    u_xlat2.xy = sin(u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x * u_xlat2.y;
					    u_xlat0.x = u_xlat0.x * _Distortion;
					    u_xlat1.w = _TimeX * 15.0;
					    u_xlat4 = dot(u_xlat1.wx, vec2(12.9898005, 78.2330017));
					    u_xlat6 = sin(u_xlat1.z);
					    u_xlat0.z = sin(u_xlat4);
					    u_xlat0.xz = u_xlat0.xz * vec2(0.00400000019, 43758.5469);
					    u_xlat4 = fract(u_xlat0.z);
					    u_xlat2.x = u_xlat4 * u_xlat2.x;
					    u_xlat2.x = u_xlat2.x * _Distortion;
					    u_xlat0.x = u_xlat2.x * 0.00300000003 + u_xlat0.x;
					    u_xlat1.z = u_xlat0.x + vs_TEXCOORD0.x;
					    u_xlat0.x = u_xlat1.z + _RGB;
					    u_xlat0.y = vs_TEXCOORD0.y;
					    u_xlat0.z = texture(_MainTex, u_xlat0.xy).z;
					    u_xlat1.x = u_xlat1.z + (-_RGB);
					    u_xlat1.yw = vs_TEXCOORD0.yy;
					    u_xlat0.x = texture(_MainTex, u_xlat1.xy).x;
					    u_xlat0.y = texture(_MainTex, u_xlat1.zw).y;
					    SV_Target0.xyz = (-vec3(u_xlat6)) * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat0.xyz;
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
					uniform 	float _RGB;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec2 u_xlat2;
					float u_xlat4;
					float u_xlat6;
					void main()
					{
					    u_xlat0.x = _TimeX;
					    u_xlat1.xyz = vs_TEXCOORD0.yyy * vec3(80.0, 25.0, 800.0);
					    u_xlat0.y = u_xlat1.y;
					    u_xlat0.x = dot(u_xlat0.xy, vec2(12.9898005, 78.2330017));
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 43758.5469;
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlat2.xy = u_xlat1.xy * vec2(_TimeX);
					    u_xlat2.xy = u_xlat2.xy * vec2(0.0285714287, 0.0285714287);
					    u_xlat2.xy = sin(u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x * u_xlat2.y;
					    u_xlat0.x = u_xlat0.x * _Distortion;
					    u_xlat1.w = _TimeX * 15.0;
					    u_xlat4 = dot(u_xlat1.wx, vec2(12.9898005, 78.2330017));
					    u_xlat6 = sin(u_xlat1.z);
					    u_xlat0.z = sin(u_xlat4);
					    u_xlat0.xz = u_xlat0.xz * vec2(0.00400000019, 43758.5469);
					    u_xlat4 = fract(u_xlat0.z);
					    u_xlat2.x = u_xlat4 * u_xlat2.x;
					    u_xlat2.x = u_xlat2.x * _Distortion;
					    u_xlat0.x = u_xlat2.x * 0.00300000003 + u_xlat0.x;
					    u_xlat1.z = u_xlat0.x + vs_TEXCOORD0.x;
					    u_xlat0.x = u_xlat1.z + _RGB;
					    u_xlat0.y = vs_TEXCOORD0.y;
					    u_xlat0.z = texture(_MainTex, u_xlat0.xy).z;
					    u_xlat1.x = u_xlat1.z + (-_RGB);
					    u_xlat1.yw = vs_TEXCOORD0.yy;
					    u_xlat0.x = texture(_MainTex, u_xlat1.xy).x;
					    u_xlat0.y = texture(_MainTex, u_xlat1.zw).y;
					    SV_Target0.xyz = (-vec3(u_xlat6)) * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat0.xyz;
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
					uniform 	float _RGB;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec2 u_xlat2;
					float u_xlat4;
					float u_xlat6;
					void main()
					{
					    u_xlat0.x = _TimeX;
					    u_xlat1.xyz = vs_TEXCOORD0.yyy * vec3(80.0, 25.0, 800.0);
					    u_xlat0.y = u_xlat1.y;
					    u_xlat0.x = dot(u_xlat0.xy, vec2(12.9898005, 78.2330017));
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 43758.5469;
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlat2.xy = u_xlat1.xy * vec2(_TimeX);
					    u_xlat2.xy = u_xlat2.xy * vec2(0.0285714287, 0.0285714287);
					    u_xlat2.xy = sin(u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x * u_xlat2.y;
					    u_xlat0.x = u_xlat0.x * _Distortion;
					    u_xlat1.w = _TimeX * 15.0;
					    u_xlat4 = dot(u_xlat1.wx, vec2(12.9898005, 78.2330017));
					    u_xlat6 = sin(u_xlat1.z);
					    u_xlat0.z = sin(u_xlat4);
					    u_xlat0.xz = u_xlat0.xz * vec2(0.00400000019, 43758.5469);
					    u_xlat4 = fract(u_xlat0.z);
					    u_xlat2.x = u_xlat4 * u_xlat2.x;
					    u_xlat2.x = u_xlat2.x * _Distortion;
					    u_xlat0.x = u_xlat2.x * 0.00300000003 + u_xlat0.x;
					    u_xlat1.z = u_xlat0.x + vs_TEXCOORD0.x;
					    u_xlat0.x = u_xlat1.z + _RGB;
					    u_xlat0.y = vs_TEXCOORD0.y;
					    u_xlat0.z = texture(_MainTex, u_xlat0.xy).z;
					    u_xlat1.x = u_xlat1.z + (-_RGB);
					    u_xlat1.yw = vs_TEXCOORD0.yy;
					    u_xlat0.x = texture(_MainTex, u_xlat1.xy).x;
					    u_xlat0.y = texture(_MainTex, u_xlat1.zw).y;
					    SV_Target0.xyz = (-vec3(u_xlat6)) * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat0.xyz;
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