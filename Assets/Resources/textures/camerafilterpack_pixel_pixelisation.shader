Shader "CameraFilterPack/Pixel_Pixelisation" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 23275
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
					uniform highp float _Val;
					uniform highp float _Val2;
					uniform highp float _Val3;
					highp float xlat_mutable_Val;
					highp float xlat_mutable_Val2;
					highp float xlat_mutable_Val3;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  highp vec2 uv_2;
					  uv_2 = xlv_TEXCOORD0;
					  xlat_mutable_Val = (512.0 / _Val);
					  xlat_mutable_Val2 = (512.0 / _Val2);
					  xlat_mutable_Val3 = (512.0 / _Val3);
					  uv_2 = (floor((uv_2 * xlat_mutable_Val)) / xlat_mutable_Val);
					  uv_2.x = (floor((uv_2.x * xlat_mutable_Val2)) / xlat_mutable_Val2);
					  uv_2.y = (floor((uv_2.y * xlat_mutable_Val3)) / xlat_mutable_Val3);
					  lowp vec4 tmpvar_3;
					  tmpvar_3.w = 1.0;
					  tmpvar_3.xyz = texture2D (_MainTex, uv_2).xyz;
					  tmpvar_1 = tmpvar_3;
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
					uniform highp float _Val;
					uniform highp float _Val2;
					uniform highp float _Val3;
					highp float xlat_mutable_Val;
					highp float xlat_mutable_Val2;
					highp float xlat_mutable_Val3;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  highp vec2 uv_2;
					  uv_2 = xlv_TEXCOORD0;
					  xlat_mutable_Val = (512.0 / _Val);
					  xlat_mutable_Val2 = (512.0 / _Val2);
					  xlat_mutable_Val3 = (512.0 / _Val3);
					  uv_2 = (floor((uv_2 * xlat_mutable_Val)) / xlat_mutable_Val);
					  uv_2.x = (floor((uv_2.x * xlat_mutable_Val2)) / xlat_mutable_Val2);
					  uv_2.y = (floor((uv_2.y * xlat_mutable_Val3)) / xlat_mutable_Val3);
					  lowp vec4 tmpvar_3;
					  tmpvar_3.w = 1.0;
					  tmpvar_3.xyz = texture2D (_MainTex, uv_2).xyz;
					  tmpvar_1 = tmpvar_3;
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
					uniform highp float _Val;
					uniform highp float _Val2;
					uniform highp float _Val3;
					highp float xlat_mutable_Val;
					highp float xlat_mutable_Val2;
					highp float xlat_mutable_Val3;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  highp vec2 uv_2;
					  uv_2 = xlv_TEXCOORD0;
					  xlat_mutable_Val = (512.0 / _Val);
					  xlat_mutable_Val2 = (512.0 / _Val2);
					  xlat_mutable_Val3 = (512.0 / _Val3);
					  uv_2 = (floor((uv_2 * xlat_mutable_Val)) / xlat_mutable_Val);
					  uv_2.x = (floor((uv_2.x * xlat_mutable_Val2)) / xlat_mutable_Val2);
					  uv_2.y = (floor((uv_2.y * xlat_mutable_Val3)) / xlat_mutable_Val3);
					  lowp vec4 tmpvar_3;
					  tmpvar_3.w = 1.0;
					  tmpvar_3.xyz = texture2D (_MainTex, uv_2).xyz;
					  tmpvar_1 = tmpvar_3;
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
					uniform 	float _Val;
					uniform 	float _Val2;
					uniform 	float _Val3;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					lowp vec3 u_xlat10_0;
					vec2 u_xlat1;
					void main()
					{
					    u_xlat0.xyz = vec3(512.0, 512.0, 512.0) / vec3(_Val, _Val2, _Val3);
					    u_xlat1.xy = u_xlat0.xx * vs_TEXCOORD0.xy;
					    u_xlat1.xy = floor(u_xlat1.xy);
					    u_xlat0.xw = u_xlat1.xy / u_xlat0.xx;
					    u_xlat0.xw = vec2(u_xlat0.y * u_xlat0.x, u_xlat0.z * u_xlat0.w);
					    u_xlat0.xw = floor(u_xlat0.xw);
					    u_xlat0.xy = vec2(u_xlat0.x / u_xlat0.y, u_xlat0.w / u_xlat0.z);
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
					uniform 	float _Val;
					uniform 	float _Val2;
					uniform 	float _Val3;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					lowp vec3 u_xlat10_0;
					vec2 u_xlat1;
					void main()
					{
					    u_xlat0.xyz = vec3(512.0, 512.0, 512.0) / vec3(_Val, _Val2, _Val3);
					    u_xlat1.xy = u_xlat0.xx * vs_TEXCOORD0.xy;
					    u_xlat1.xy = floor(u_xlat1.xy);
					    u_xlat0.xw = u_xlat1.xy / u_xlat0.xx;
					    u_xlat0.xw = vec2(u_xlat0.y * u_xlat0.x, u_xlat0.z * u_xlat0.w);
					    u_xlat0.xw = floor(u_xlat0.xw);
					    u_xlat0.xy = vec2(u_xlat0.x / u_xlat0.y, u_xlat0.w / u_xlat0.z);
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
					uniform 	float _Val;
					uniform 	float _Val2;
					uniform 	float _Val3;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					lowp vec3 u_xlat10_0;
					vec2 u_xlat1;
					void main()
					{
					    u_xlat0.xyz = vec3(512.0, 512.0, 512.0) / vec3(_Val, _Val2, _Val3);
					    u_xlat1.xy = u_xlat0.xx * vs_TEXCOORD0.xy;
					    u_xlat1.xy = floor(u_xlat1.xy);
					    u_xlat0.xw = u_xlat1.xy / u_xlat0.xx;
					    u_xlat0.xw = vec2(u_xlat0.y * u_xlat0.x, u_xlat0.z * u_xlat0.w);
					    u_xlat0.xw = floor(u_xlat0.xw);
					    u_xlat0.xy = vec2(u_xlat0.x / u_xlat0.y, u_xlat0.w / u_xlat0.z);
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