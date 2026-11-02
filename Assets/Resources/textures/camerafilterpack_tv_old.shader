Shader "CameraFilterPack/TV_Old" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(1, 10)) = 1
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 687
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
					  highp vec3 color_1;
					  highp vec3 textur_2;
					  highp vec2 uv_3;
					  uv_3 = xlv_TEXCOORD0;
					  lowp vec3 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, uv_3).xyz;
					  textur_2 = tmpvar_4;
					  highp vec2 tmpvar_5;
					  tmpvar_5.x = floor(((uv_3.x * 200.0) * (uv_3.x / uv_3.y)));
					  tmpvar_5.y = floor((uv_3.y * 200.0));
					  highp float tmpvar_6;
					  tmpvar_6 = clamp ((fract(
					    (sin(dot ((
					      (tmpvar_5 * _TimeX)
					     / 1000.0), vec2(12.9898, 78.233))) * 43758.55)
					  ) + 0.5), 0.0, 1.0);
					  highp vec3 tmpvar_7;
					  tmpvar_7 = (textur_2 * mix ((vec3(tmpvar_6) - 0.75), vec3(tmpvar_6), vec3(clamp (
					    (sin(((uv_3.y * 6.0) + (_TimeX * 5.6))) + 1.25)
					  , 0.0, 1.0)))).xxx;
					  color_1.xy = tmpvar_7.xy;
					  color_1.z = (tmpvar_7.z + 0.052);
					  highp vec2 tmpvar_8;
					  tmpvar_8 = (uv_3 - vec2(0.5, 0.5));
					  color_1 = (color_1 * (1.0 - (
					    pow (sqrt(dot (tmpvar_8, tmpvar_8)), 2.1)
					   * 2.8)));
					  highp vec4 tmpvar_9;
					  tmpvar_9.w = 1.0;
					  tmpvar_9.xyz = color_1;
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
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 color_1;
					  highp vec3 textur_2;
					  highp vec2 uv_3;
					  uv_3 = xlv_TEXCOORD0;
					  lowp vec3 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, uv_3).xyz;
					  textur_2 = tmpvar_4;
					  highp vec2 tmpvar_5;
					  tmpvar_5.x = floor(((uv_3.x * 200.0) * (uv_3.x / uv_3.y)));
					  tmpvar_5.y = floor((uv_3.y * 200.0));
					  highp float tmpvar_6;
					  tmpvar_6 = clamp ((fract(
					    (sin(dot ((
					      (tmpvar_5 * _TimeX)
					     / 1000.0), vec2(12.9898, 78.233))) * 43758.55)
					  ) + 0.5), 0.0, 1.0);
					  highp vec3 tmpvar_7;
					  tmpvar_7 = (textur_2 * mix ((vec3(tmpvar_6) - 0.75), vec3(tmpvar_6), vec3(clamp (
					    (sin(((uv_3.y * 6.0) + (_TimeX * 5.6))) + 1.25)
					  , 0.0, 1.0)))).xxx;
					  color_1.xy = tmpvar_7.xy;
					  color_1.z = (tmpvar_7.z + 0.052);
					  highp vec2 tmpvar_8;
					  tmpvar_8 = (uv_3 - vec2(0.5, 0.5));
					  color_1 = (color_1 * (1.0 - (
					    pow (sqrt(dot (tmpvar_8, tmpvar_8)), 2.1)
					   * 2.8)));
					  highp vec4 tmpvar_9;
					  tmpvar_9.w = 1.0;
					  tmpvar_9.xyz = color_1;
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
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 color_1;
					  highp vec3 textur_2;
					  highp vec2 uv_3;
					  uv_3 = xlv_TEXCOORD0;
					  lowp vec3 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, uv_3).xyz;
					  textur_2 = tmpvar_4;
					  highp vec2 tmpvar_5;
					  tmpvar_5.x = floor(((uv_3.x * 200.0) * (uv_3.x / uv_3.y)));
					  tmpvar_5.y = floor((uv_3.y * 200.0));
					  highp float tmpvar_6;
					  tmpvar_6 = clamp ((fract(
					    (sin(dot ((
					      (tmpvar_5 * _TimeX)
					     / 1000.0), vec2(12.9898, 78.233))) * 43758.55)
					  ) + 0.5), 0.0, 1.0);
					  highp vec3 tmpvar_7;
					  tmpvar_7 = (textur_2 * mix ((vec3(tmpvar_6) - 0.75), vec3(tmpvar_6), vec3(clamp (
					    (sin(((uv_3.y * 6.0) + (_TimeX * 5.6))) + 1.25)
					  , 0.0, 1.0)))).xxx;
					  color_1.xy = tmpvar_7.xy;
					  color_1.z = (tmpvar_7.z + 0.052);
					  highp vec2 tmpvar_8;
					  tmpvar_8 = (uv_3 - vec2(0.5, 0.5));
					  color_1 = (color_1 * (1.0 - (
					    pow (sqrt(dot (tmpvar_8, tmpvar_8)), 2.1)
					   * 2.8)));
					  highp vec4 tmpvar_9;
					  tmpvar_9.w = 1.0;
					  tmpvar_9.xyz = color_1;
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
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					mediump vec2 u_xlat16_0;
					vec3 u_xlat1;
					mediump vec3 u_xlat16_1;
					vec2 u_xlat2;
					vec2 u_xlat3;
					mediump float u_xlat16_3;
					vec2 u_xlat6;
					lowp float u_xlat10_6;
					float u_xlat9;
					void main()
					{
					    u_xlat16_0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat16_0.x = dot(u_xlat16_0.xy, u_xlat16_0.xy);
					    u_xlat16_0.x = sqrt(u_xlat16_0.x);
					    u_xlat16_0.x = log2(u_xlat16_0.x);
					    u_xlat16_0.x = u_xlat16_0.x * 2.0999999;
					    u_xlat16_0.x = exp2(u_xlat16_0.x);
					    u_xlat16_0.x = (-u_xlat16_0.x) * 2.79999995 + 1.0;
					    u_xlat16_3 = vs_TEXCOORD0.x / vs_TEXCOORD0.y;
					    u_xlat16_1.xyz = vs_TEXCOORD0.yxy * vec3(6.0, 200.0, 200.0);
					    u_xlat3.x = u_xlat16_3 * u_xlat16_1.y;
					    u_xlat2.x = floor(u_xlat3.x);
					    u_xlat2.y = floor(u_xlat16_1.z);
					    u_xlat3.x = _TimeX * 5.5999999 + u_xlat16_1.x;
					    u_xlat3.x = sin(u_xlat3.x);
					    u_xlat3.x = u_xlat3.x + 1.25;
					    u_xlat6.xy = u_xlat2.xy * vec2(_TimeX);
					    u_xlat6.xy = u_xlat6.xy * vec2(0.00100000005, 0.00100000005);
					    u_xlat6.x = dot(u_xlat6.xy, vec2(12.9898005, 78.2330017));
					    u_xlat6.x = sin(u_xlat6.x);
					    u_xlat6.x = u_xlat6.x * 43758.5469;
					    u_xlat6.x = fract(u_xlat6.x);
					    u_xlat3.y = u_xlat6.x + 0.5;
					    u_xlat3.xy = min(u_xlat3.xy, vec2(1.0, 1.0));
					    u_xlat9 = u_xlat3.y + -0.75;
					    u_xlat6.x = (-u_xlat9) + u_xlat3.y;
					    u_xlat3.x = u_xlat3.x * u_xlat6.x + u_xlat9;
					    u_xlat10_6 = texture(_MainTex, vs_TEXCOORD0.xy).x;
					    u_xlat1.xy = vec2(u_xlat10_6) * u_xlat3.xx;
					    u_xlat1.z = u_xlat3.x * u_xlat10_6 + 0.0520000011;
					    SV_Target0.xyz = u_xlat16_0.xxx * u_xlat1.xyz;
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
					mediump vec2 u_xlat16_0;
					vec3 u_xlat1;
					mediump vec3 u_xlat16_1;
					vec2 u_xlat2;
					vec2 u_xlat3;
					mediump float u_xlat16_3;
					vec2 u_xlat6;
					lowp float u_xlat10_6;
					float u_xlat9;
					void main()
					{
					    u_xlat16_0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat16_0.x = dot(u_xlat16_0.xy, u_xlat16_0.xy);
					    u_xlat16_0.x = sqrt(u_xlat16_0.x);
					    u_xlat16_0.x = log2(u_xlat16_0.x);
					    u_xlat16_0.x = u_xlat16_0.x * 2.0999999;
					    u_xlat16_0.x = exp2(u_xlat16_0.x);
					    u_xlat16_0.x = (-u_xlat16_0.x) * 2.79999995 + 1.0;
					    u_xlat16_3 = vs_TEXCOORD0.x / vs_TEXCOORD0.y;
					    u_xlat16_1.xyz = vs_TEXCOORD0.yxy * vec3(6.0, 200.0, 200.0);
					    u_xlat3.x = u_xlat16_3 * u_xlat16_1.y;
					    u_xlat2.x = floor(u_xlat3.x);
					    u_xlat2.y = floor(u_xlat16_1.z);
					    u_xlat3.x = _TimeX * 5.5999999 + u_xlat16_1.x;
					    u_xlat3.x = sin(u_xlat3.x);
					    u_xlat3.x = u_xlat3.x + 1.25;
					    u_xlat6.xy = u_xlat2.xy * vec2(_TimeX);
					    u_xlat6.xy = u_xlat6.xy * vec2(0.00100000005, 0.00100000005);
					    u_xlat6.x = dot(u_xlat6.xy, vec2(12.9898005, 78.2330017));
					    u_xlat6.x = sin(u_xlat6.x);
					    u_xlat6.x = u_xlat6.x * 43758.5469;
					    u_xlat6.x = fract(u_xlat6.x);
					    u_xlat3.y = u_xlat6.x + 0.5;
					    u_xlat3.xy = min(u_xlat3.xy, vec2(1.0, 1.0));
					    u_xlat9 = u_xlat3.y + -0.75;
					    u_xlat6.x = (-u_xlat9) + u_xlat3.y;
					    u_xlat3.x = u_xlat3.x * u_xlat6.x + u_xlat9;
					    u_xlat10_6 = texture(_MainTex, vs_TEXCOORD0.xy).x;
					    u_xlat1.xy = vec2(u_xlat10_6) * u_xlat3.xx;
					    u_xlat1.z = u_xlat3.x * u_xlat10_6 + 0.0520000011;
					    SV_Target0.xyz = u_xlat16_0.xxx * u_xlat1.xyz;
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
					mediump vec2 u_xlat16_0;
					vec3 u_xlat1;
					mediump vec3 u_xlat16_1;
					vec2 u_xlat2;
					vec2 u_xlat3;
					mediump float u_xlat16_3;
					vec2 u_xlat6;
					lowp float u_xlat10_6;
					float u_xlat9;
					void main()
					{
					    u_xlat16_0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat16_0.x = dot(u_xlat16_0.xy, u_xlat16_0.xy);
					    u_xlat16_0.x = sqrt(u_xlat16_0.x);
					    u_xlat16_0.x = log2(u_xlat16_0.x);
					    u_xlat16_0.x = u_xlat16_0.x * 2.0999999;
					    u_xlat16_0.x = exp2(u_xlat16_0.x);
					    u_xlat16_0.x = (-u_xlat16_0.x) * 2.79999995 + 1.0;
					    u_xlat16_3 = vs_TEXCOORD0.x / vs_TEXCOORD0.y;
					    u_xlat16_1.xyz = vs_TEXCOORD0.yxy * vec3(6.0, 200.0, 200.0);
					    u_xlat3.x = u_xlat16_3 * u_xlat16_1.y;
					    u_xlat2.x = floor(u_xlat3.x);
					    u_xlat2.y = floor(u_xlat16_1.z);
					    u_xlat3.x = _TimeX * 5.5999999 + u_xlat16_1.x;
					    u_xlat3.x = sin(u_xlat3.x);
					    u_xlat3.x = u_xlat3.x + 1.25;
					    u_xlat6.xy = u_xlat2.xy * vec2(_TimeX);
					    u_xlat6.xy = u_xlat6.xy * vec2(0.00100000005, 0.00100000005);
					    u_xlat6.x = dot(u_xlat6.xy, vec2(12.9898005, 78.2330017));
					    u_xlat6.x = sin(u_xlat6.x);
					    u_xlat6.x = u_xlat6.x * 43758.5469;
					    u_xlat6.x = fract(u_xlat6.x);
					    u_xlat3.y = u_xlat6.x + 0.5;
					    u_xlat3.xy = min(u_xlat3.xy, vec2(1.0, 1.0));
					    u_xlat9 = u_xlat3.y + -0.75;
					    u_xlat6.x = (-u_xlat9) + u_xlat3.y;
					    u_xlat3.x = u_xlat3.x * u_xlat6.x + u_xlat9;
					    u_xlat10_6 = texture(_MainTex, vs_TEXCOORD0.xy).x;
					    u_xlat1.xy = vec2(u_xlat10_6) * u_xlat3.xx;
					    u_xlat1.z = u_xlat3.x * u_xlat10_6 + 0.0520000011;
					    SV_Target0.xyz = u_xlat16_0.xxx * u_xlat1.xyz;
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