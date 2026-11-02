Shader "CameraFilterPack/AAA_WaterDrop" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_MainTex2 ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_SizeX ("SizeX", Range(0, 1)) = 1
		_SizeY ("SizeY", Range(0, 1)) = 1
		_Speed ("Speed", Range(0, 10)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.87
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 50854
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
					uniform highp float _TimeX;
					uniform highp float _SizeX;
					uniform highp float _Speed;
					uniform highp float _SizeY;
					uniform highp float _Distortion;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  highp vec3 col_2;
					  highp vec2 uv_3;
					  uv_3 = xlv_TEXCOORD0;
					  highp vec2 tmpvar_4;
					  tmpvar_4.x = ((uv_3.x * 1.3) * _SizeX);
					  highp float tmpvar_5;
					  tmpvar_5 = (_TimeX * _Speed);
					  tmpvar_4.y = (((uv_3.y * _SizeY) * 1.4) + (tmpvar_5 * 0.125));
					  lowp vec4 tmpvar_6;
					  tmpvar_6 = texture2D (_MainTex2, tmpvar_4);
					  highp vec2 tmpvar_7;
					  tmpvar_7.x = (((uv_3.x * 1.15) * _SizeX) - 0.1);
					  tmpvar_7.y = (((uv_3.y * _SizeY) * 1.1) + (tmpvar_5 * 0.225));
					  lowp vec4 tmpvar_8;
					  tmpvar_8 = texture2D (_MainTex2, tmpvar_7);
					  highp vec2 tmpvar_9;
					  tmpvar_9.x = ((uv_3.x * _SizeX) - 0.2);
					  tmpvar_9.y = ((uv_3.y * _SizeY) + (tmpvar_5 * 0.025));
					  lowp vec4 tmpvar_10;
					  tmpvar_10 = texture2D (_MainTex2, tmpvar_9);
					  highp vec2 tmpvar_11;
					  tmpvar_11 = (uv_3 - ((
					    ((tmpvar_6.xyz / _Distortion).xy - (tmpvar_8.xyz / _Distortion).xy)
					   - 
					    (tmpvar_10.xyz / _Distortion)
					  .xy) / 3.0));
					  lowp vec3 tmpvar_12;
					  tmpvar_12 = texture2D (_MainTex, tmpvar_11).xyz;
					  col_2 = tmpvar_12;
					  highp vec4 tmpvar_13;
					  tmpvar_13.w = 1.0;
					  tmpvar_13.xyz = col_2;
					  tmpvar_1 = tmpvar_13;
					  gl_FragData[0] = tmpvar_1;
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
					uniform highp float _TimeX;
					uniform highp float _SizeX;
					uniform highp float _Speed;
					uniform highp float _SizeY;
					uniform highp float _Distortion;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  highp vec3 col_2;
					  highp vec2 uv_3;
					  uv_3 = xlv_TEXCOORD0;
					  highp vec2 tmpvar_4;
					  tmpvar_4.x = ((uv_3.x * 1.3) * _SizeX);
					  highp float tmpvar_5;
					  tmpvar_5 = (_TimeX * _Speed);
					  tmpvar_4.y = (((uv_3.y * _SizeY) * 1.4) + (tmpvar_5 * 0.125));
					  lowp vec4 tmpvar_6;
					  tmpvar_6 = texture2D (_MainTex2, tmpvar_4);
					  highp vec2 tmpvar_7;
					  tmpvar_7.x = (((uv_3.x * 1.15) * _SizeX) - 0.1);
					  tmpvar_7.y = (((uv_3.y * _SizeY) * 1.1) + (tmpvar_5 * 0.225));
					  lowp vec4 tmpvar_8;
					  tmpvar_8 = texture2D (_MainTex2, tmpvar_7);
					  highp vec2 tmpvar_9;
					  tmpvar_9.x = ((uv_3.x * _SizeX) - 0.2);
					  tmpvar_9.y = ((uv_3.y * _SizeY) + (tmpvar_5 * 0.025));
					  lowp vec4 tmpvar_10;
					  tmpvar_10 = texture2D (_MainTex2, tmpvar_9);
					  highp vec2 tmpvar_11;
					  tmpvar_11 = (uv_3 - ((
					    ((tmpvar_6.xyz / _Distortion).xy - (tmpvar_8.xyz / _Distortion).xy)
					   - 
					    (tmpvar_10.xyz / _Distortion)
					  .xy) / 3.0));
					  lowp vec3 tmpvar_12;
					  tmpvar_12 = texture2D (_MainTex, tmpvar_11).xyz;
					  col_2 = tmpvar_12;
					  highp vec4 tmpvar_13;
					  tmpvar_13.w = 1.0;
					  tmpvar_13.xyz = col_2;
					  tmpvar_1 = tmpvar_13;
					  gl_FragData[0] = tmpvar_1;
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
					uniform highp float _TimeX;
					uniform highp float _SizeX;
					uniform highp float _Speed;
					uniform highp float _SizeY;
					uniform highp float _Distortion;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  highp vec3 col_2;
					  highp vec2 uv_3;
					  uv_3 = xlv_TEXCOORD0;
					  highp vec2 tmpvar_4;
					  tmpvar_4.x = ((uv_3.x * 1.3) * _SizeX);
					  highp float tmpvar_5;
					  tmpvar_5 = (_TimeX * _Speed);
					  tmpvar_4.y = (((uv_3.y * _SizeY) * 1.4) + (tmpvar_5 * 0.125));
					  lowp vec4 tmpvar_6;
					  tmpvar_6 = texture2D (_MainTex2, tmpvar_4);
					  highp vec2 tmpvar_7;
					  tmpvar_7.x = (((uv_3.x * 1.15) * _SizeX) - 0.1);
					  tmpvar_7.y = (((uv_3.y * _SizeY) * 1.1) + (tmpvar_5 * 0.225));
					  lowp vec4 tmpvar_8;
					  tmpvar_8 = texture2D (_MainTex2, tmpvar_7);
					  highp vec2 tmpvar_9;
					  tmpvar_9.x = ((uv_3.x * _SizeX) - 0.2);
					  tmpvar_9.y = ((uv_3.y * _SizeY) + (tmpvar_5 * 0.025));
					  lowp vec4 tmpvar_10;
					  tmpvar_10 = texture2D (_MainTex2, tmpvar_9);
					  highp vec2 tmpvar_11;
					  tmpvar_11 = (uv_3 - ((
					    ((tmpvar_6.xyz / _Distortion).xy - (tmpvar_8.xyz / _Distortion).xy)
					   - 
					    (tmpvar_10.xyz / _Distortion)
					  .xy) / 3.0));
					  lowp vec3 tmpvar_12;
					  tmpvar_12 = texture2D (_MainTex, tmpvar_11).xyz;
					  col_2 = tmpvar_12;
					  highp vec4 tmpvar_13;
					  tmpvar_13.w = 1.0;
					  tmpvar_13.xyz = col_2;
					  tmpvar_1 = tmpvar_13;
					  gl_FragData[0] = tmpvar_1;
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
					uniform 	float _SizeX;
					uniform 	float _Speed;
					uniform 	float _SizeY;
					uniform 	float _Distortion;
					uniform lowp sampler2D _MainTex2;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec2 u_xlat0;
					lowp vec3 u_xlat10_0;
					vec4 u_xlat1;
					lowp vec2 u_xlat10_1;
					vec3 u_xlat2;
					vec2 u_xlat4;
					mediump vec2 u_xlat16_4;
					lowp vec2 u_xlat10_4;
					void main()
					{
					    u_xlat0.x = vs_TEXCOORD0.y * _SizeY;
					    u_xlat2.x = _Speed * _TimeX;
					    u_xlat2.xyz = u_xlat2.xxx * vec3(0.125, 0.224999994, 0.0250000004);
					    u_xlat1.zw = u_xlat0.xx * vec2(1.39999998, 1.10000002) + u_xlat2.xy;
					    u_xlat0.y = vs_TEXCOORD0.y * _SizeY + u_xlat2.z;
					    u_xlat16_4.xy = vs_TEXCOORD0.xx * vec2(1.29999995, 1.14999998);
					    u_xlat1.xy = u_xlat16_4.xy * vec2(vec2(_SizeX, _SizeX));
					    u_xlat4.xy = vec2(u_xlat1.y + float(-0.100000001), u_xlat1.w + float(0.0));
					    u_xlat10_1.xy = texture(_MainTex2, u_xlat1.xz).xy;
					    u_xlat1.xy = u_xlat10_1.xy / vec2(_Distortion);
					    u_xlat10_4.xy = texture(_MainTex2, u_xlat4.xy).xy;
					    u_xlat4.xy = u_xlat10_4.xy / vec2(_Distortion);
					    u_xlat4.xy = (-u_xlat4.xy) + u_xlat1.xy;
					    u_xlat0.x = vs_TEXCOORD0.x * _SizeX + -0.200000003;
					    u_xlat10_0.xy = texture(_MainTex2, u_xlat0.xy).xy;
					    u_xlat0.xy = u_xlat10_0.xy / vec2(_Distortion);
					    u_xlat0.xy = (-u_xlat0.xy) + u_xlat4.xy;
					    u_xlat0.xy = (-u_xlat0.xy) * vec2(0.333333343, 0.333333343) + vs_TEXCOORD0.xy;
					    u_xlat10_0.xyz = texture(_MainTex, u_xlat0.xy).xyz;
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
					uniform 	float _SizeX;
					uniform 	float _Speed;
					uniform 	float _SizeY;
					uniform 	float _Distortion;
					uniform lowp sampler2D _MainTex2;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec2 u_xlat0;
					lowp vec3 u_xlat10_0;
					vec4 u_xlat1;
					lowp vec2 u_xlat10_1;
					vec3 u_xlat2;
					vec2 u_xlat4;
					mediump vec2 u_xlat16_4;
					lowp vec2 u_xlat10_4;
					void main()
					{
					    u_xlat0.x = vs_TEXCOORD0.y * _SizeY;
					    u_xlat2.x = _Speed * _TimeX;
					    u_xlat2.xyz = u_xlat2.xxx * vec3(0.125, 0.224999994, 0.0250000004);
					    u_xlat1.zw = u_xlat0.xx * vec2(1.39999998, 1.10000002) + u_xlat2.xy;
					    u_xlat0.y = vs_TEXCOORD0.y * _SizeY + u_xlat2.z;
					    u_xlat16_4.xy = vs_TEXCOORD0.xx * vec2(1.29999995, 1.14999998);
					    u_xlat1.xy = u_xlat16_4.xy * vec2(vec2(_SizeX, _SizeX));
					    u_xlat4.xy = vec2(u_xlat1.y + float(-0.100000001), u_xlat1.w + float(0.0));
					    u_xlat10_1.xy = texture(_MainTex2, u_xlat1.xz).xy;
					    u_xlat1.xy = u_xlat10_1.xy / vec2(_Distortion);
					    u_xlat10_4.xy = texture(_MainTex2, u_xlat4.xy).xy;
					    u_xlat4.xy = u_xlat10_4.xy / vec2(_Distortion);
					    u_xlat4.xy = (-u_xlat4.xy) + u_xlat1.xy;
					    u_xlat0.x = vs_TEXCOORD0.x * _SizeX + -0.200000003;
					    u_xlat10_0.xy = texture(_MainTex2, u_xlat0.xy).xy;
					    u_xlat0.xy = u_xlat10_0.xy / vec2(_Distortion);
					    u_xlat0.xy = (-u_xlat0.xy) + u_xlat4.xy;
					    u_xlat0.xy = (-u_xlat0.xy) * vec2(0.333333343, 0.333333343) + vs_TEXCOORD0.xy;
					    u_xlat10_0.xyz = texture(_MainTex, u_xlat0.xy).xyz;
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
					uniform 	float _SizeX;
					uniform 	float _Speed;
					uniform 	float _SizeY;
					uniform 	float _Distortion;
					uniform lowp sampler2D _MainTex2;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec2 u_xlat0;
					lowp vec3 u_xlat10_0;
					vec4 u_xlat1;
					lowp vec2 u_xlat10_1;
					vec3 u_xlat2;
					vec2 u_xlat4;
					mediump vec2 u_xlat16_4;
					lowp vec2 u_xlat10_4;
					void main()
					{
					    u_xlat0.x = vs_TEXCOORD0.y * _SizeY;
					    u_xlat2.x = _Speed * _TimeX;
					    u_xlat2.xyz = u_xlat2.xxx * vec3(0.125, 0.224999994, 0.0250000004);
					    u_xlat1.zw = u_xlat0.xx * vec2(1.39999998, 1.10000002) + u_xlat2.xy;
					    u_xlat0.y = vs_TEXCOORD0.y * _SizeY + u_xlat2.z;
					    u_xlat16_4.xy = vs_TEXCOORD0.xx * vec2(1.29999995, 1.14999998);
					    u_xlat1.xy = u_xlat16_4.xy * vec2(vec2(_SizeX, _SizeX));
					    u_xlat4.xy = vec2(u_xlat1.y + float(-0.100000001), u_xlat1.w + float(0.0));
					    u_xlat10_1.xy = texture(_MainTex2, u_xlat1.xz).xy;
					    u_xlat1.xy = u_xlat10_1.xy / vec2(_Distortion);
					    u_xlat10_4.xy = texture(_MainTex2, u_xlat4.xy).xy;
					    u_xlat4.xy = u_xlat10_4.xy / vec2(_Distortion);
					    u_xlat4.xy = (-u_xlat4.xy) + u_xlat1.xy;
					    u_xlat0.x = vs_TEXCOORD0.x * _SizeX + -0.200000003;
					    u_xlat10_0.xy = texture(_MainTex2, u_xlat0.xy).xy;
					    u_xlat0.xy = u_xlat10_0.xy / vec2(_Distortion);
					    u_xlat0.xy = (-u_xlat0.xy) + u_xlat4.xy;
					    u_xlat0.xy = (-u_xlat0.xy) * vec2(0.333333343, 0.333333343) + vs_TEXCOORD0.xy;
					    u_xlat10_0.xyz = texture(_MainTex, u_xlat0.xy).xyz;
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