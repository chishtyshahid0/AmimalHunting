Shader "RGSK/Reflection" {
	Properties {
		_MainAlpha ("MainAlpha", Range(0, 1)) = 1
		_TintColor ("Tint Color (RGB)", Vector) = (1,1,1,1)
		_MainTex ("MainTex (RGBA)", 2D) = "" {}
		_ReflectionTex ("ReflectionTex", 2D) = "white" {}
	}
	SubShader {
		Tags { "QUEUE" = "Transparent" }
		Pass {
			Tags { "QUEUE" = "Transparent" }
			Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
			ZClip Off
			GpuProgramID 46471
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp vec4 _ProjectionParams;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1 = (glstate_matrix_mvp * _glesVertex);
					  highp vec4 o_2;
					  highp vec4 tmpvar_3;
					  tmpvar_3 = (tmpvar_1 * 0.5);
					  highp vec2 tmpvar_4;
					  tmpvar_4.x = tmpvar_3.x;
					  tmpvar_4.y = (tmpvar_3.y * _ProjectionParams.x);
					  o_2.xy = (tmpvar_4 + tmpvar_3.w);
					  o_2.zw = tmpvar_1.zw;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = o_2;
					  gl_Position = tmpvar_1;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					uniform sampler2D _ReflectionTex;
					uniform highp vec4 _TintColor;
					uniform highp float _MainAlpha;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  highp vec4 result_2;
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2DProj (_ReflectionTex, xlv_TEXCOORD1);
					  result_2.xyz = ((tmpvar_3 + tmpvar_4) * _TintColor).xyz;
					  result_2.w = _MainAlpha;
					  tmpvar_1 = result_2;
					  gl_FragData[0] = tmpvar_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp vec4 _ProjectionParams;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1 = (glstate_matrix_mvp * _glesVertex);
					  highp vec4 o_2;
					  highp vec4 tmpvar_3;
					  tmpvar_3 = (tmpvar_1 * 0.5);
					  highp vec2 tmpvar_4;
					  tmpvar_4.x = tmpvar_3.x;
					  tmpvar_4.y = (tmpvar_3.y * _ProjectionParams.x);
					  o_2.xy = (tmpvar_4 + tmpvar_3.w);
					  o_2.zw = tmpvar_1.zw;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = o_2;
					  gl_Position = tmpvar_1;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					uniform sampler2D _ReflectionTex;
					uniform highp vec4 _TintColor;
					uniform highp float _MainAlpha;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  highp vec4 result_2;
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2DProj (_ReflectionTex, xlv_TEXCOORD1);
					  result_2.xyz = ((tmpvar_3 + tmpvar_4) * _TintColor).xyz;
					  result_2.w = _MainAlpha;
					  tmpvar_1 = result_2;
					  gl_FragData[0] = tmpvar_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp vec4 _ProjectionParams;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1 = (glstate_matrix_mvp * _glesVertex);
					  highp vec4 o_2;
					  highp vec4 tmpvar_3;
					  tmpvar_3 = (tmpvar_1 * 0.5);
					  highp vec2 tmpvar_4;
					  tmpvar_4.x = tmpvar_3.x;
					  tmpvar_4.y = (tmpvar_3.y * _ProjectionParams.x);
					  o_2.xy = (tmpvar_4 + tmpvar_3.w);
					  o_2.zw = tmpvar_1.zw;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = o_2;
					  gl_Position = tmpvar_1;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					uniform sampler2D _ReflectionTex;
					uniform highp vec4 _TintColor;
					uniform highp float _MainAlpha;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  highp vec4 result_2;
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2DProj (_ReflectionTex, xlv_TEXCOORD1);
					  result_2.xyz = ((tmpvar_3 + tmpvar_4) * _TintColor).xyz;
					  result_2.w = _MainAlpha;
					  tmpvar_1 = result_2;
					  gl_FragData[0] = tmpvar_1;
					}
					
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 _MainTex_ST;
					in highp vec4 in_POSITION0;
					in highp vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.w = u_xlat1.x * 0.5;
					    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
					    vs_TEXCOORD1.xy = u_xlat1.zz + u_xlat1.xw;
					    vs_TEXCOORD1.zw = u_xlat0.zw;
					    gl_Position = u_xlat0;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec4 _TintColor;
					uniform 	float _MainAlpha;
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _ReflectionTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec4 u_xlat0;
					lowp vec3 u_xlat10_0;
					lowp vec3 u_xlat10_1;
					lowp vec3 u_xlat10_2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
					    u_xlat10_0.xyz = texture(_ReflectionTex, u_xlat0.xy).xyz;
					    u_xlat10_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_2.xyz = u_xlat10_0.xyz + u_xlat10_1.xyz;
					    u_xlat0.xyz = u_xlat10_2.xyz * _TintColor.xyz;
					    u_xlat0.w = _MainAlpha;
					    SV_Target0 = u_xlat0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 _MainTex_ST;
					in highp vec4 in_POSITION0;
					in highp vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.w = u_xlat1.x * 0.5;
					    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
					    vs_TEXCOORD1.xy = u_xlat1.zz + u_xlat1.xw;
					    vs_TEXCOORD1.zw = u_xlat0.zw;
					    gl_Position = u_xlat0;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec4 _TintColor;
					uniform 	float _MainAlpha;
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _ReflectionTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec4 u_xlat0;
					lowp vec3 u_xlat10_0;
					lowp vec3 u_xlat10_1;
					lowp vec3 u_xlat10_2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
					    u_xlat10_0.xyz = texture(_ReflectionTex, u_xlat0.xy).xyz;
					    u_xlat10_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_2.xyz = u_xlat10_0.xyz + u_xlat10_1.xyz;
					    u_xlat0.xyz = u_xlat10_2.xyz * _TintColor.xyz;
					    u_xlat0.w = _MainAlpha;
					    SV_Target0 = u_xlat0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 _MainTex_ST;
					in highp vec4 in_POSITION0;
					in highp vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.w = u_xlat1.x * 0.5;
					    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
					    vs_TEXCOORD1.xy = u_xlat1.zz + u_xlat1.xw;
					    vs_TEXCOORD1.zw = u_xlat0.zw;
					    gl_Position = u_xlat0;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec4 _TintColor;
					uniform 	float _MainAlpha;
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _ReflectionTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec4 u_xlat0;
					lowp vec3 u_xlat10_0;
					lowp vec3 u_xlat10_1;
					lowp vec3 u_xlat10_2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
					    u_xlat10_0.xyz = texture(_ReflectionTex, u_xlat0.xy).xyz;
					    u_xlat10_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_2.xyz = u_xlat10_0.xyz + u_xlat10_1.xyz;
					    u_xlat0.xyz = u_xlat10_2.xyz * _TintColor.xyz;
					    u_xlat0.w = _MainAlpha;
					    SV_Target0 = u_xlat0;
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