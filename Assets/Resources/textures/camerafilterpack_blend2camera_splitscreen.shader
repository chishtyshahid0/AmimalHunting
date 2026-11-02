Shader "CameraFilterPack/Blend2Camera_SplitScreen" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_MainTex2 ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 8400
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
					uniform highp float _Value3;
					uniform highp float _Value4;
					uniform highp float _Value5;
					uniform highp float _Value6;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tex2_1;
					  highp vec2 uv2_2;
					  highp vec4 tex_3;
					  highp vec2 uv_4;
					  uv_4 = xlv_TEXCOORD0;
					  lowp vec4 tmpvar_5;
					  tmpvar_5 = texture2D (_MainTex, uv_4);
					  tex_3 = tmpvar_5;
					  highp vec2 tmpvar_6;
					  tmpvar_6.x = _Value3;
					  tmpvar_6.y = _Value6;
					  highp vec2 tmpvar_7;
					  tmpvar_7 = (uv_4 - tmpvar_6);
					  highp float tmpvar_8;
					  tmpvar_8 = cos(_Value5);
					  highp float tmpvar_9;
					  tmpvar_9 = sin(_Value5);
					  highp vec2 tmpvar_10;
					  tmpvar_10.x = ((tmpvar_7.x * tmpvar_8) - (tmpvar_7.y * tmpvar_9));
					  tmpvar_10.y = ((tmpvar_7.x * tmpvar_9) + (tmpvar_7.y * tmpvar_8));
					  uv_4 = tmpvar_10;
					  uv2_2 = xlv_TEXCOORD0;
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_MainTex2, uv2_2);
					  tex2_1 = tmpvar_11;
					  highp vec2 x_12;
					  x_12 = vec2(-(max (tmpvar_10.y, 0.0)));
					  highp float tmpvar_13;
					  tmpvar_13 = clamp ((sqrt(
					    dot (x_12, x_12)
					  ) / _Value4), 0.0, 1.0);
					  highp vec4 tmpvar_14;
					  tmpvar_14.w = 1.0;
					  tmpvar_14.xyz = mix (mix (tex_3.xyz, tex2_1.xyz, vec3(_Value2)), mix (tex_3.xyz, tex2_1.xyz, vec3((1.0 - _Value2))), vec3(((1.0 - 
					    (tmpvar_13 * (tmpvar_13 * (3.0 - (2.0 * tmpvar_13))))
					  ) * _Value)));
					  gl_FragData[0] = tmpvar_14;
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
					uniform highp float _Value3;
					uniform highp float _Value4;
					uniform highp float _Value5;
					uniform highp float _Value6;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tex2_1;
					  highp vec2 uv2_2;
					  highp vec4 tex_3;
					  highp vec2 uv_4;
					  uv_4 = xlv_TEXCOORD0;
					  lowp vec4 tmpvar_5;
					  tmpvar_5 = texture2D (_MainTex, uv_4);
					  tex_3 = tmpvar_5;
					  highp vec2 tmpvar_6;
					  tmpvar_6.x = _Value3;
					  tmpvar_6.y = _Value6;
					  highp vec2 tmpvar_7;
					  tmpvar_7 = (uv_4 - tmpvar_6);
					  highp float tmpvar_8;
					  tmpvar_8 = cos(_Value5);
					  highp float tmpvar_9;
					  tmpvar_9 = sin(_Value5);
					  highp vec2 tmpvar_10;
					  tmpvar_10.x = ((tmpvar_7.x * tmpvar_8) - (tmpvar_7.y * tmpvar_9));
					  tmpvar_10.y = ((tmpvar_7.x * tmpvar_9) + (tmpvar_7.y * tmpvar_8));
					  uv_4 = tmpvar_10;
					  uv2_2 = xlv_TEXCOORD0;
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_MainTex2, uv2_2);
					  tex2_1 = tmpvar_11;
					  highp vec2 x_12;
					  x_12 = vec2(-(max (tmpvar_10.y, 0.0)));
					  highp float tmpvar_13;
					  tmpvar_13 = clamp ((sqrt(
					    dot (x_12, x_12)
					  ) / _Value4), 0.0, 1.0);
					  highp vec4 tmpvar_14;
					  tmpvar_14.w = 1.0;
					  tmpvar_14.xyz = mix (mix (tex_3.xyz, tex2_1.xyz, vec3(_Value2)), mix (tex_3.xyz, tex2_1.xyz, vec3((1.0 - _Value2))), vec3(((1.0 - 
					    (tmpvar_13 * (tmpvar_13 * (3.0 - (2.0 * tmpvar_13))))
					  ) * _Value)));
					  gl_FragData[0] = tmpvar_14;
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
					uniform highp float _Value3;
					uniform highp float _Value4;
					uniform highp float _Value5;
					uniform highp float _Value6;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tex2_1;
					  highp vec2 uv2_2;
					  highp vec4 tex_3;
					  highp vec2 uv_4;
					  uv_4 = xlv_TEXCOORD0;
					  lowp vec4 tmpvar_5;
					  tmpvar_5 = texture2D (_MainTex, uv_4);
					  tex_3 = tmpvar_5;
					  highp vec2 tmpvar_6;
					  tmpvar_6.x = _Value3;
					  tmpvar_6.y = _Value6;
					  highp vec2 tmpvar_7;
					  tmpvar_7 = (uv_4 - tmpvar_6);
					  highp float tmpvar_8;
					  tmpvar_8 = cos(_Value5);
					  highp float tmpvar_9;
					  tmpvar_9 = sin(_Value5);
					  highp vec2 tmpvar_10;
					  tmpvar_10.x = ((tmpvar_7.x * tmpvar_8) - (tmpvar_7.y * tmpvar_9));
					  tmpvar_10.y = ((tmpvar_7.x * tmpvar_9) + (tmpvar_7.y * tmpvar_8));
					  uv_4 = tmpvar_10;
					  uv2_2 = xlv_TEXCOORD0;
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_MainTex2, uv2_2);
					  tex2_1 = tmpvar_11;
					  highp vec2 x_12;
					  x_12 = vec2(-(max (tmpvar_10.y, 0.0)));
					  highp float tmpvar_13;
					  tmpvar_13 = clamp ((sqrt(
					    dot (x_12, x_12)
					  ) / _Value4), 0.0, 1.0);
					  highp vec4 tmpvar_14;
					  tmpvar_14.w = 1.0;
					  tmpvar_14.xyz = mix (mix (tex_3.xyz, tex2_1.xyz, vec3(_Value2)), mix (tex_3.xyz, tex2_1.xyz, vec3((1.0 - _Value2))), vec3(((1.0 - 
					    (tmpvar_13 * (tmpvar_13 * (3.0 - (2.0 * tmpvar_13))))
					  ) * _Value)));
					  gl_FragData[0] = tmpvar_14;
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
					uniform 	float _Value3;
					uniform 	float _Value4;
					uniform 	float _Value5;
					uniform 	float _Value6;
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _MainTex2;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					mediump vec3 u_xlat16_1;
					lowp vec3 u_xlat10_1;
					float u_xlat2;
					lowp vec3 u_xlat10_2;
					vec3 u_xlat3;
					float u_xlat6;
					void main()
					{
					    u_xlat0.y = (-_Value6);
					    u_xlat0.xz = (-vec2(_Value3, _Value2));
					    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.xy;
					    u_xlat6 = u_xlat0.z + 1.0;
					    u_xlat1.x = sin(_Value5);
					    u_xlat2 = cos(_Value5);
					    u_xlat3.x = u_xlat0.y * u_xlat2;
					    u_xlat0.x = u_xlat0.x * u_xlat1.x + u_xlat3.x;
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat0.x = dot((-u_xlat0.xx), (-u_xlat0.xx));
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat3.x = float(1.0) / _Value4;
					    u_xlat0.x = u_xlat3.x * u_xlat0.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat3.x = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = (-u_xlat3.x) * u_xlat0.x + 1.0;
					    u_xlat0.x = u_xlat0.x * _Value;
					    u_xlat10_1.xyz = texture(_MainTex2, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_1.xyz = u_xlat10_1.xyz + (-u_xlat10_2.xyz);
					    u_xlat3.xyz = vec3(u_xlat6) * u_xlat16_1.xyz + u_xlat10_2.xyz;
					    u_xlat1.xyz = vec3(vec3(_Value2, _Value2, _Value2)) * u_xlat16_1.xyz + u_xlat10_2.xyz;
					    u_xlat3.xyz = u_xlat3.xyz + (-u_xlat1.xyz);
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat3.xyz + u_xlat1.xyz;
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
					uniform 	float _Value3;
					uniform 	float _Value4;
					uniform 	float _Value5;
					uniform 	float _Value6;
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _MainTex2;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					mediump vec3 u_xlat16_1;
					lowp vec3 u_xlat10_1;
					float u_xlat2;
					lowp vec3 u_xlat10_2;
					vec3 u_xlat3;
					float u_xlat6;
					void main()
					{
					    u_xlat0.y = (-_Value6);
					    u_xlat0.xz = (-vec2(_Value3, _Value2));
					    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.xy;
					    u_xlat6 = u_xlat0.z + 1.0;
					    u_xlat1.x = sin(_Value5);
					    u_xlat2 = cos(_Value5);
					    u_xlat3.x = u_xlat0.y * u_xlat2;
					    u_xlat0.x = u_xlat0.x * u_xlat1.x + u_xlat3.x;
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat0.x = dot((-u_xlat0.xx), (-u_xlat0.xx));
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat3.x = float(1.0) / _Value4;
					    u_xlat0.x = u_xlat3.x * u_xlat0.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat3.x = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = (-u_xlat3.x) * u_xlat0.x + 1.0;
					    u_xlat0.x = u_xlat0.x * _Value;
					    u_xlat10_1.xyz = texture(_MainTex2, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_1.xyz = u_xlat10_1.xyz + (-u_xlat10_2.xyz);
					    u_xlat3.xyz = vec3(u_xlat6) * u_xlat16_1.xyz + u_xlat10_2.xyz;
					    u_xlat1.xyz = vec3(vec3(_Value2, _Value2, _Value2)) * u_xlat16_1.xyz + u_xlat10_2.xyz;
					    u_xlat3.xyz = u_xlat3.xyz + (-u_xlat1.xyz);
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat3.xyz + u_xlat1.xyz;
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
					uniform 	float _Value3;
					uniform 	float _Value4;
					uniform 	float _Value5;
					uniform 	float _Value6;
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _MainTex2;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					mediump vec3 u_xlat16_1;
					lowp vec3 u_xlat10_1;
					float u_xlat2;
					lowp vec3 u_xlat10_2;
					vec3 u_xlat3;
					float u_xlat6;
					void main()
					{
					    u_xlat0.y = (-_Value6);
					    u_xlat0.xz = (-vec2(_Value3, _Value2));
					    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.xy;
					    u_xlat6 = u_xlat0.z + 1.0;
					    u_xlat1.x = sin(_Value5);
					    u_xlat2 = cos(_Value5);
					    u_xlat3.x = u_xlat0.y * u_xlat2;
					    u_xlat0.x = u_xlat0.x * u_xlat1.x + u_xlat3.x;
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat0.x = dot((-u_xlat0.xx), (-u_xlat0.xx));
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat3.x = float(1.0) / _Value4;
					    u_xlat0.x = u_xlat3.x * u_xlat0.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat3.x = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = (-u_xlat3.x) * u_xlat0.x + 1.0;
					    u_xlat0.x = u_xlat0.x * _Value;
					    u_xlat10_1.xyz = texture(_MainTex2, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_1.xyz = u_xlat10_1.xyz + (-u_xlat10_2.xyz);
					    u_xlat3.xyz = vec3(u_xlat6) * u_xlat16_1.xyz + u_xlat10_2.xyz;
					    u_xlat1.xyz = vec3(vec3(_Value2, _Value2, _Value2)) * u_xlat16_1.xyz + u_xlat10_2.xyz;
					    u_xlat3.xyz = u_xlat3.xyz + (-u_xlat1.xyz);
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat3.xyz + u_xlat1.xyz;
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