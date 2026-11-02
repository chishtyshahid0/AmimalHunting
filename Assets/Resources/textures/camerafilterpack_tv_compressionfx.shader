Shader "CameraFilterPack/TV_CompressionFX" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Parasite ("_Parasite", Range(1, 10)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 34469
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
					uniform highp float _Parasite;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 col1_1;
					  highp vec2 uv_2;
					  uv_2 = xlv_TEXCOORD0;
					  highp float tmpvar_3;
					  tmpvar_3 = (_TimeX * 12.0);
					  highp vec2 tmpvar_4;
					  tmpvar_4.y = 0.0;
					  tmpvar_4.x = (((
					    (pow (fract((
					      sin(dot (((
					        floor((uv_2 * vec2(24.0, 19.0)))
					       * 4.0) * floor(tmpvar_3)), vec2(127.1, 311.7)))
					     * 43758.55)), 3.0) * _Parasite)
					   * 
					    pow (fract((sin(
					      dot (((floor(
					        (uv_2 * vec2(38.0, 14.0))
					      ) * 4.0) * floor(tmpvar_3)), vec2(127.1, 311.7))
					    ) * 43758.55)), 3.0)
					  ) * 0.02) * fract((
					    sin(dot ((vec2(2.0, 1.0) * floor(tmpvar_3)), vec2(127.1, 311.7)))
					   * 43758.55)));
					  lowp vec4 tmpvar_5;
					  highp vec2 P_6;
					  P_6 = (uv_2 + tmpvar_4);
					  tmpvar_5 = texture2D (_MainTex, P_6);
					  col1_1 = tmpvar_5;
					  highp vec4 tmpvar_7;
					  tmpvar_7.w = 1.0;
					  tmpvar_7.xyz = col1_1.xyz;
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
					uniform highp float _TimeX;
					uniform highp float _Parasite;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 col1_1;
					  highp vec2 uv_2;
					  uv_2 = xlv_TEXCOORD0;
					  highp float tmpvar_3;
					  tmpvar_3 = (_TimeX * 12.0);
					  highp vec2 tmpvar_4;
					  tmpvar_4.y = 0.0;
					  tmpvar_4.x = (((
					    (pow (fract((
					      sin(dot (((
					        floor((uv_2 * vec2(24.0, 19.0)))
					       * 4.0) * floor(tmpvar_3)), vec2(127.1, 311.7)))
					     * 43758.55)), 3.0) * _Parasite)
					   * 
					    pow (fract((sin(
					      dot (((floor(
					        (uv_2 * vec2(38.0, 14.0))
					      ) * 4.0) * floor(tmpvar_3)), vec2(127.1, 311.7))
					    ) * 43758.55)), 3.0)
					  ) * 0.02) * fract((
					    sin(dot ((vec2(2.0, 1.0) * floor(tmpvar_3)), vec2(127.1, 311.7)))
					   * 43758.55)));
					  lowp vec4 tmpvar_5;
					  highp vec2 P_6;
					  P_6 = (uv_2 + tmpvar_4);
					  tmpvar_5 = texture2D (_MainTex, P_6);
					  col1_1 = tmpvar_5;
					  highp vec4 tmpvar_7;
					  tmpvar_7.w = 1.0;
					  tmpvar_7.xyz = col1_1.xyz;
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
					uniform highp float _TimeX;
					uniform highp float _Parasite;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 col1_1;
					  highp vec2 uv_2;
					  uv_2 = xlv_TEXCOORD0;
					  highp float tmpvar_3;
					  tmpvar_3 = (_TimeX * 12.0);
					  highp vec2 tmpvar_4;
					  tmpvar_4.y = 0.0;
					  tmpvar_4.x = (((
					    (pow (fract((
					      sin(dot (((
					        floor((uv_2 * vec2(24.0, 19.0)))
					       * 4.0) * floor(tmpvar_3)), vec2(127.1, 311.7)))
					     * 43758.55)), 3.0) * _Parasite)
					   * 
					    pow (fract((sin(
					      dot (((floor(
					        (uv_2 * vec2(38.0, 14.0))
					      ) * 4.0) * floor(tmpvar_3)), vec2(127.1, 311.7))
					    ) * 43758.55)), 3.0)
					  ) * 0.02) * fract((
					    sin(dot ((vec2(2.0, 1.0) * floor(tmpvar_3)), vec2(127.1, 311.7)))
					   * 43758.55)));
					  lowp vec4 tmpvar_5;
					  highp vec2 P_6;
					  P_6 = (uv_2 + tmpvar_4);
					  tmpvar_5 = texture2D (_MainTex, P_6);
					  col1_1 = tmpvar_5;
					  highp vec4 tmpvar_7;
					  tmpvar_7.w = 1.0;
					  tmpvar_7.xyz = col1_1.xyz;
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
					uniform 	float _TimeX;
					uniform 	float _Parasite;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					lowp vec3 u_xlat10_0;
					vec2 u_xlat1;
					float u_xlat2;
					float u_xlat4;
					void main()
					{
					    u_xlat0 = vs_TEXCOORD0.xyxy * vec4(24.0, 19.0, 38.0, 14.0);
					    u_xlat0 = floor(u_xlat0);
					    u_xlat0 = u_xlat0 * vec4(4.0, 4.0, 4.0, 4.0);
					    u_xlat1.x = _TimeX * 12.0;
					    u_xlat1.x = floor(u_xlat1.x);
					    u_xlat0 = u_xlat0 * u_xlat1.xxxx;
					    u_xlat1.xy = u_xlat1.xx * vec2(2.0, 1.0);
					    u_xlat1.x = dot(u_xlat1.xy, vec2(127.099998, 311.700012));
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * 43758.5469;
					    u_xlat1.x = fract(u_xlat1.x);
					    u_xlat0.x = dot(u_xlat0.xy, vec2(127.099998, 311.700012));
					    u_xlat0.y = dot(u_xlat0.zw, vec2(127.099998, 311.700012));
					    u_xlat0.xy = sin(u_xlat0.xy);
					    u_xlat0.xy = u_xlat0.xy * vec2(43758.5469, 43758.5469);
					    u_xlat0.xy = fract(u_xlat0.xy);
					    u_xlat4 = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = u_xlat4 * u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * _Parasite;
					    u_xlat4 = u_xlat0.y * u_xlat0.y;
					    u_xlat2 = u_xlat4 * u_xlat0.y;
					    u_xlat0.x = u_xlat2 * u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * 0.0199999996;
					    u_xlat0.x = u_xlat1.x * u_xlat0.x;
					    u_xlat0.y = 0.0;
					    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.xy;
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
					uniform 	float _Parasite;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					lowp vec3 u_xlat10_0;
					vec2 u_xlat1;
					float u_xlat2;
					float u_xlat4;
					void main()
					{
					    u_xlat0 = vs_TEXCOORD0.xyxy * vec4(24.0, 19.0, 38.0, 14.0);
					    u_xlat0 = floor(u_xlat0);
					    u_xlat0 = u_xlat0 * vec4(4.0, 4.0, 4.0, 4.0);
					    u_xlat1.x = _TimeX * 12.0;
					    u_xlat1.x = floor(u_xlat1.x);
					    u_xlat0 = u_xlat0 * u_xlat1.xxxx;
					    u_xlat1.xy = u_xlat1.xx * vec2(2.0, 1.0);
					    u_xlat1.x = dot(u_xlat1.xy, vec2(127.099998, 311.700012));
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * 43758.5469;
					    u_xlat1.x = fract(u_xlat1.x);
					    u_xlat0.x = dot(u_xlat0.xy, vec2(127.099998, 311.700012));
					    u_xlat0.y = dot(u_xlat0.zw, vec2(127.099998, 311.700012));
					    u_xlat0.xy = sin(u_xlat0.xy);
					    u_xlat0.xy = u_xlat0.xy * vec2(43758.5469, 43758.5469);
					    u_xlat0.xy = fract(u_xlat0.xy);
					    u_xlat4 = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = u_xlat4 * u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * _Parasite;
					    u_xlat4 = u_xlat0.y * u_xlat0.y;
					    u_xlat2 = u_xlat4 * u_xlat0.y;
					    u_xlat0.x = u_xlat2 * u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * 0.0199999996;
					    u_xlat0.x = u_xlat1.x * u_xlat0.x;
					    u_xlat0.y = 0.0;
					    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.xy;
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
					uniform 	float _Parasite;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					lowp vec3 u_xlat10_0;
					vec2 u_xlat1;
					float u_xlat2;
					float u_xlat4;
					void main()
					{
					    u_xlat0 = vs_TEXCOORD0.xyxy * vec4(24.0, 19.0, 38.0, 14.0);
					    u_xlat0 = floor(u_xlat0);
					    u_xlat0 = u_xlat0 * vec4(4.0, 4.0, 4.0, 4.0);
					    u_xlat1.x = _TimeX * 12.0;
					    u_xlat1.x = floor(u_xlat1.x);
					    u_xlat0 = u_xlat0 * u_xlat1.xxxx;
					    u_xlat1.xy = u_xlat1.xx * vec2(2.0, 1.0);
					    u_xlat1.x = dot(u_xlat1.xy, vec2(127.099998, 311.700012));
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * 43758.5469;
					    u_xlat1.x = fract(u_xlat1.x);
					    u_xlat0.x = dot(u_xlat0.xy, vec2(127.099998, 311.700012));
					    u_xlat0.y = dot(u_xlat0.zw, vec2(127.099998, 311.700012));
					    u_xlat0.xy = sin(u_xlat0.xy);
					    u_xlat0.xy = u_xlat0.xy * vec2(43758.5469, 43758.5469);
					    u_xlat0.xy = fract(u_xlat0.xy);
					    u_xlat4 = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = u_xlat4 * u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * _Parasite;
					    u_xlat4 = u_xlat0.y * u_xlat0.y;
					    u_xlat2 = u_xlat4 * u_xlat0.y;
					    u_xlat0.x = u_xlat2 * u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * 0.0199999996;
					    u_xlat0.x = u_xlat1.x * u_xlat0.x;
					    u_xlat0.y = 0.0;
					    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.xy;
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