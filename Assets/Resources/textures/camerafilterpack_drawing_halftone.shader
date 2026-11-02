Shader "CameraFilterPack/Drawing_Halftone" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.3
		_DotSize ("_DotSize", Range(1, 16)) = 10
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 63974
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
					uniform highp float _Distortion;
					uniform highp float _DotSize;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp float rasterPattern_1;
					  lowp float threshold_2;
					  threshold_2 = _Distortion;
					  highp float tmpvar_3;
					  highp vec2 sh_4;
					  sh_4 = xlv_TEXCOORD0;
					  highp float d_5;
					  d_5 = (2136.281 / _DotSize);
					  highp vec2 tmpvar_6;
					  tmpvar_6 = (sh_4 * 0.7071064);
					  tmpvar_3 = ((0.5 + (0.25 * 
					    cos(((tmpvar_6.x + tmpvar_6.y) * d_5))
					  )) + (0.25 * cos(
					    ((tmpvar_6.x - tmpvar_6.y) * d_5)
					  )));
					  rasterPattern_1 = tmpvar_3;
					  lowp vec4 tmpvar_7;
					  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0);
					  lowp float tmpvar_8;
					  tmpvar_8 = (((
					    (rasterPattern_1 * threshold_2)
					   + 
					    (((0.2125 * tmpvar_7.x) + (0.7154 * tmpvar_7.y)) + (0.0721 * tmpvar_7.z))
					  ) - threshold_2) / (1.0 - threshold_2));
					  lowp vec4 tmpvar_9;
					  tmpvar_9.w = 1.0;
					  tmpvar_9.x = tmpvar_8;
					  tmpvar_9.y = tmpvar_8;
					  tmpvar_9.z = tmpvar_8;
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
					uniform highp float _Distortion;
					uniform highp float _DotSize;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp float rasterPattern_1;
					  lowp float threshold_2;
					  threshold_2 = _Distortion;
					  highp float tmpvar_3;
					  highp vec2 sh_4;
					  sh_4 = xlv_TEXCOORD0;
					  highp float d_5;
					  d_5 = (2136.281 / _DotSize);
					  highp vec2 tmpvar_6;
					  tmpvar_6 = (sh_4 * 0.7071064);
					  tmpvar_3 = ((0.5 + (0.25 * 
					    cos(((tmpvar_6.x + tmpvar_6.y) * d_5))
					  )) + (0.25 * cos(
					    ((tmpvar_6.x - tmpvar_6.y) * d_5)
					  )));
					  rasterPattern_1 = tmpvar_3;
					  lowp vec4 tmpvar_7;
					  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0);
					  lowp float tmpvar_8;
					  tmpvar_8 = (((
					    (rasterPattern_1 * threshold_2)
					   + 
					    (((0.2125 * tmpvar_7.x) + (0.7154 * tmpvar_7.y)) + (0.0721 * tmpvar_7.z))
					  ) - threshold_2) / (1.0 - threshold_2));
					  lowp vec4 tmpvar_9;
					  tmpvar_9.w = 1.0;
					  tmpvar_9.x = tmpvar_8;
					  tmpvar_9.y = tmpvar_8;
					  tmpvar_9.z = tmpvar_8;
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
					uniform highp float _Distortion;
					uniform highp float _DotSize;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp float rasterPattern_1;
					  lowp float threshold_2;
					  threshold_2 = _Distortion;
					  highp float tmpvar_3;
					  highp vec2 sh_4;
					  sh_4 = xlv_TEXCOORD0;
					  highp float d_5;
					  d_5 = (2136.281 / _DotSize);
					  highp vec2 tmpvar_6;
					  tmpvar_6 = (sh_4 * 0.7071064);
					  tmpvar_3 = ((0.5 + (0.25 * 
					    cos(((tmpvar_6.x + tmpvar_6.y) * d_5))
					  )) + (0.25 * cos(
					    ((tmpvar_6.x - tmpvar_6.y) * d_5)
					  )));
					  rasterPattern_1 = tmpvar_3;
					  lowp vec4 tmpvar_7;
					  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0);
					  lowp float tmpvar_8;
					  tmpvar_8 = (((
					    (rasterPattern_1 * threshold_2)
					   + 
					    (((0.2125 * tmpvar_7.x) + (0.7154 * tmpvar_7.y)) + (0.0721 * tmpvar_7.z))
					  ) - threshold_2) / (1.0 - threshold_2));
					  lowp vec4 tmpvar_9;
					  tmpvar_9.w = 1.0;
					  tmpvar_9.x = tmpvar_8;
					  tmpvar_9.y = tmpvar_8;
					  tmpvar_9.z = tmpvar_8;
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
					uniform 	float _Distortion;
					uniform 	float _DotSize;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec2 u_xlat0;
					mediump vec2 u_xlat16_0;
					lowp float u_xlat10_1;
					lowp vec3 u_xlat10_2;
					lowp float u_xlat10_3;
					float u_xlat4;
					void main()
					{
					    u_xlat16_0.xy = vs_TEXCOORD0.xy * vec2(0.707106411, 0.707106411);
					    u_xlat0.x = u_xlat16_0.y + u_xlat16_0.x;
					    u_xlat0.y = vs_TEXCOORD0.x * 0.707106411 + (-u_xlat16_0.y);
					    u_xlat4 = 2136.28125 / _DotSize;
					    u_xlat0.xy = vec2(u_xlat4) * u_xlat0.xy;
					    u_xlat0.xy = cos(u_xlat0.xy);
					    u_xlat0.x = u_xlat0.x * 0.25 + 0.5;
					    u_xlat0.x = u_xlat0.y * 0.25 + u_xlat0.x;
					    u_xlat10_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_1 = dot(u_xlat10_2.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
					    u_xlat10_1 = u_xlat0.x * _Distortion + u_xlat10_1;
					    u_xlat10_1 = u_xlat10_1 + (-_Distortion);
					    u_xlat10_3 = (-_Distortion) + 1.0;
					    SV_Target0.xyz = vec3(u_xlat10_1) / vec3(u_xlat10_3);
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
					uniform 	float _Distortion;
					uniform 	float _DotSize;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec2 u_xlat0;
					mediump vec2 u_xlat16_0;
					lowp float u_xlat10_1;
					lowp vec3 u_xlat10_2;
					lowp float u_xlat10_3;
					float u_xlat4;
					void main()
					{
					    u_xlat16_0.xy = vs_TEXCOORD0.xy * vec2(0.707106411, 0.707106411);
					    u_xlat0.x = u_xlat16_0.y + u_xlat16_0.x;
					    u_xlat0.y = vs_TEXCOORD0.x * 0.707106411 + (-u_xlat16_0.y);
					    u_xlat4 = 2136.28125 / _DotSize;
					    u_xlat0.xy = vec2(u_xlat4) * u_xlat0.xy;
					    u_xlat0.xy = cos(u_xlat0.xy);
					    u_xlat0.x = u_xlat0.x * 0.25 + 0.5;
					    u_xlat0.x = u_xlat0.y * 0.25 + u_xlat0.x;
					    u_xlat10_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_1 = dot(u_xlat10_2.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
					    u_xlat10_1 = u_xlat0.x * _Distortion + u_xlat10_1;
					    u_xlat10_1 = u_xlat10_1 + (-_Distortion);
					    u_xlat10_3 = (-_Distortion) + 1.0;
					    SV_Target0.xyz = vec3(u_xlat10_1) / vec3(u_xlat10_3);
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
					uniform 	float _Distortion;
					uniform 	float _DotSize;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec2 u_xlat0;
					mediump vec2 u_xlat16_0;
					lowp float u_xlat10_1;
					lowp vec3 u_xlat10_2;
					lowp float u_xlat10_3;
					float u_xlat4;
					void main()
					{
					    u_xlat16_0.xy = vs_TEXCOORD0.xy * vec2(0.707106411, 0.707106411);
					    u_xlat0.x = u_xlat16_0.y + u_xlat16_0.x;
					    u_xlat0.y = vs_TEXCOORD0.x * 0.707106411 + (-u_xlat16_0.y);
					    u_xlat4 = 2136.28125 / _DotSize;
					    u_xlat0.xy = vec2(u_xlat4) * u_xlat0.xy;
					    u_xlat0.xy = cos(u_xlat0.xy);
					    u_xlat0.x = u_xlat0.x * 0.25 + 0.5;
					    u_xlat0.x = u_xlat0.y * 0.25 + u_xlat0.x;
					    u_xlat10_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_1 = dot(u_xlat10_2.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
					    u_xlat10_1 = u_xlat0.x * _Distortion + u_xlat10_1;
					    u_xlat10_1 = u_xlat10_1 + (-_Distortion);
					    u_xlat10_3 = (-_Distortion) + 1.0;
					    SV_Target0.xyz = vec3(u_xlat10_1) / vec3(u_xlat10_3);
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