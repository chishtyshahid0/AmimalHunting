Shader "CameraFilterPack/Gradients_FireGradient" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 49836
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
					uniform highp float _Value;
					uniform highp float _Value2;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tc_1;
					  highp vec2 uv_2;
					  uv_2 = xlv_TEXCOORD0;
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, uv_2);
					  tc_1 = tmpvar_3;
					  highp float tmpvar_4;
					  tmpvar_4 = (((0.2126 * tc_1.x) + (0.7152 * tc_1.y)) + (0.0722 * tc_1.z));
					  highp float tmpvar_5;
					  tmpvar_5 = mix (tmpvar_4, (1.0 - tmpvar_4), _Value);
					  highp vec4 tmpvar_6;
					  tmpvar_6.w = 0.0;
					  tmpvar_6.xyz = max (pow (vec3(min (
					    (tmpvar_5 * 1.02)
					  , 1.0)), vec3(1.7, 25.0, 100.0)), vec3((0.06 * pow (
					    max ((1.0 - abs((tmpvar_5 - 0.35))), 0.0)
					  , 5.0))));
					  highp vec4 tmpvar_7;
					  tmpvar_7.w = 1.0;
					  tmpvar_7.xyz = mix (tc_1, tmpvar_6, vec4(_Value2)).xyz;
					  tc_1 = tmpvar_7;
					  gl_FragData[0] = tmpvar_7;
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
					uniform highp float _Value;
					uniform highp float _Value2;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tc_1;
					  highp vec2 uv_2;
					  uv_2 = xlv_TEXCOORD0;
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, uv_2);
					  tc_1 = tmpvar_3;
					  highp float tmpvar_4;
					  tmpvar_4 = (((0.2126 * tc_1.x) + (0.7152 * tc_1.y)) + (0.0722 * tc_1.z));
					  highp float tmpvar_5;
					  tmpvar_5 = mix (tmpvar_4, (1.0 - tmpvar_4), _Value);
					  highp vec4 tmpvar_6;
					  tmpvar_6.w = 0.0;
					  tmpvar_6.xyz = max (pow (vec3(min (
					    (tmpvar_5 * 1.02)
					  , 1.0)), vec3(1.7, 25.0, 100.0)), vec3((0.06 * pow (
					    max ((1.0 - abs((tmpvar_5 - 0.35))), 0.0)
					  , 5.0))));
					  highp vec4 tmpvar_7;
					  tmpvar_7.w = 1.0;
					  tmpvar_7.xyz = mix (tc_1, tmpvar_6, vec4(_Value2)).xyz;
					  tc_1 = tmpvar_7;
					  gl_FragData[0] = tmpvar_7;
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
					uniform highp float _Value;
					uniform highp float _Value2;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tc_1;
					  highp vec2 uv_2;
					  uv_2 = xlv_TEXCOORD0;
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, uv_2);
					  tc_1 = tmpvar_3;
					  highp float tmpvar_4;
					  tmpvar_4 = (((0.2126 * tc_1.x) + (0.7152 * tc_1.y)) + (0.0722 * tc_1.z));
					  highp float tmpvar_5;
					  tmpvar_5 = mix (tmpvar_4, (1.0 - tmpvar_4), _Value);
					  highp vec4 tmpvar_6;
					  tmpvar_6.w = 0.0;
					  tmpvar_6.xyz = max (pow (vec3(min (
					    (tmpvar_5 * 1.02)
					  , 1.0)), vec3(1.7, 25.0, 100.0)), vec3((0.06 * pow (
					    max ((1.0 - abs((tmpvar_5 - 0.35))), 0.0)
					  , 5.0))));
					  highp vec4 tmpvar_7;
					  tmpvar_7.w = 1.0;
					  tmpvar_7.xyz = mix (tc_1, tmpvar_6, vec4(_Value2)).xyz;
					  tc_1 = tmpvar_7;
					  gl_FragData[0] = tmpvar_7;
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
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					lowp vec3 u_xlat10_0;
					vec3 u_xlat1;
					mediump float u_xlat16_1;
					vec3 u_xlat3;
					float u_xlat6;
					mediump float u_xlat16_6;
					void main()
					{
					    u_xlat10_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_6 = dot(u_xlat10_0.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlat16_1 = u_xlat16_6 * -2.0 + 1.0;
					    u_xlat6 = _Value * u_xlat16_1 + u_xlat16_6;
					    u_xlat1.x = u_xlat6 + -0.349999994;
					    u_xlat6 = u_xlat6 * 1.01999998;
					    u_xlat6 = min(u_xlat6, 1.0);
					    u_xlat6 = log2(u_xlat6);
					    u_xlat3.xyz = vec3(u_xlat6) * vec3(1.70000005, 25.0, 100.0);
					    u_xlat3.xyz = exp2(u_xlat3.xyz);
					    u_xlat6 = -abs(u_xlat1.x) + 1.0;
					    u_xlat6 = max(u_xlat6, 0.0);
					    u_xlat1.x = u_xlat6 * u_xlat6;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat6 = u_xlat6 * u_xlat1.x;
					    u_xlat6 = u_xlat6 * 0.0599999987;
					    u_xlat1.xyz = max(vec3(u_xlat6), u_xlat3.xyz);
					    u_xlat1.xyz = (-u_xlat10_0.xyz) + u_xlat1.xyz;
					    SV_Target0.xyz = vec3(vec3(_Value2, _Value2, _Value2)) * u_xlat1.xyz + u_xlat10_0.xyz;
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
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					lowp vec3 u_xlat10_0;
					vec3 u_xlat1;
					mediump float u_xlat16_1;
					vec3 u_xlat3;
					float u_xlat6;
					mediump float u_xlat16_6;
					void main()
					{
					    u_xlat10_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_6 = dot(u_xlat10_0.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlat16_1 = u_xlat16_6 * -2.0 + 1.0;
					    u_xlat6 = _Value * u_xlat16_1 + u_xlat16_6;
					    u_xlat1.x = u_xlat6 + -0.349999994;
					    u_xlat6 = u_xlat6 * 1.01999998;
					    u_xlat6 = min(u_xlat6, 1.0);
					    u_xlat6 = log2(u_xlat6);
					    u_xlat3.xyz = vec3(u_xlat6) * vec3(1.70000005, 25.0, 100.0);
					    u_xlat3.xyz = exp2(u_xlat3.xyz);
					    u_xlat6 = -abs(u_xlat1.x) + 1.0;
					    u_xlat6 = max(u_xlat6, 0.0);
					    u_xlat1.x = u_xlat6 * u_xlat6;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat6 = u_xlat6 * u_xlat1.x;
					    u_xlat6 = u_xlat6 * 0.0599999987;
					    u_xlat1.xyz = max(vec3(u_xlat6), u_xlat3.xyz);
					    u_xlat1.xyz = (-u_xlat10_0.xyz) + u_xlat1.xyz;
					    SV_Target0.xyz = vec3(vec3(_Value2, _Value2, _Value2)) * u_xlat1.xyz + u_xlat10_0.xyz;
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
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					lowp vec3 u_xlat10_0;
					vec3 u_xlat1;
					mediump float u_xlat16_1;
					vec3 u_xlat3;
					float u_xlat6;
					mediump float u_xlat16_6;
					void main()
					{
					    u_xlat10_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_6 = dot(u_xlat10_0.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlat16_1 = u_xlat16_6 * -2.0 + 1.0;
					    u_xlat6 = _Value * u_xlat16_1 + u_xlat16_6;
					    u_xlat1.x = u_xlat6 + -0.349999994;
					    u_xlat6 = u_xlat6 * 1.01999998;
					    u_xlat6 = min(u_xlat6, 1.0);
					    u_xlat6 = log2(u_xlat6);
					    u_xlat3.xyz = vec3(u_xlat6) * vec3(1.70000005, 25.0, 100.0);
					    u_xlat3.xyz = exp2(u_xlat3.xyz);
					    u_xlat6 = -abs(u_xlat1.x) + 1.0;
					    u_xlat6 = max(u_xlat6, 0.0);
					    u_xlat1.x = u_xlat6 * u_xlat6;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat6 = u_xlat6 * u_xlat1.x;
					    u_xlat6 = u_xlat6 * 0.0599999987;
					    u_xlat1.xyz = max(vec3(u_xlat6), u_xlat3.xyz);
					    u_xlat1.xyz = (-u_xlat10_0.xyz) + u_xlat1.xyz;
					    SV_Target0.xyz = vec3(vec3(_Value2, _Value2, _Value2)) * u_xlat1.xyz + u_xlat10_0.xyz;
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