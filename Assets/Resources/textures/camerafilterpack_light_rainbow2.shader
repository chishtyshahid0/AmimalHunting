Shader "CameraFilterPack/Light_Rainbow2" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 27848
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
					uniform highp float _Value;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 V_1;
					  highp vec2 uv_2;
					  uv_2 = xlv_TEXCOORD0;
					  uv_2 = (uv_2 - vec2(0.5, 0.5));
					  uv_2.y = (uv_2.y * _Value);
					  uv_2 = (uv_2 + (sin(
					    (((uv_2.x * 10.0) * (uv_2.y * 1.11)) + _TimeX)
					  ) * 0.15));
					  highp vec3 tmpvar_3;
					  tmpvar_3.yz = vec2(1.0, 1.0);
					  tmpvar_3.x = ((uv_2.x * 0.1) + (_TimeX * 0.25));
					  highp vec3 x_4;
					  x_4 = ((tmpvar_3.x * 6.0) + vec3(0.0, 4.0, 2.0));
					  V_1 = (clamp ((
					    abs(((x_4 - (
					      floor((x_4 * vec3(0.1666667, 0.1666667, 0.1666667)))
					     * vec3(6.0, 6.0, 6.0))) - 3.0))
					   - 1.0), vec3(0.0, 0.0, 0.0), vec3(1.0, 1.0, 1.0)) * clamp ((
					    (0.7 - abs(uv_2.y))
					   * 3.0), 0.0, 1.0));
					  V_1 = (V_1 * (1.0 - (
					    sin(((uv_2.y * uv_2.y) * 30.0))
					   * 0.26)));
					  lowp vec3 tmpvar_5;
					  tmpvar_5 = (texture2D (_MainTex, xlv_TEXCOORD0) / 2.0).xyz;
					  V_1 = (V_1 * tmpvar_5);
					  highp vec4 tmpvar_6;
					  tmpvar_6.w = 1.0;
					  tmpvar_6.xyz = V_1;
					  gl_FragData[0] = tmpvar_6;
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
					uniform highp float _Value;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 V_1;
					  highp vec2 uv_2;
					  uv_2 = xlv_TEXCOORD0;
					  uv_2 = (uv_2 - vec2(0.5, 0.5));
					  uv_2.y = (uv_2.y * _Value);
					  uv_2 = (uv_2 + (sin(
					    (((uv_2.x * 10.0) * (uv_2.y * 1.11)) + _TimeX)
					  ) * 0.15));
					  highp vec3 tmpvar_3;
					  tmpvar_3.yz = vec2(1.0, 1.0);
					  tmpvar_3.x = ((uv_2.x * 0.1) + (_TimeX * 0.25));
					  highp vec3 x_4;
					  x_4 = ((tmpvar_3.x * 6.0) + vec3(0.0, 4.0, 2.0));
					  V_1 = (clamp ((
					    abs(((x_4 - (
					      floor((x_4 * vec3(0.1666667, 0.1666667, 0.1666667)))
					     * vec3(6.0, 6.0, 6.0))) - 3.0))
					   - 1.0), vec3(0.0, 0.0, 0.0), vec3(1.0, 1.0, 1.0)) * clamp ((
					    (0.7 - abs(uv_2.y))
					   * 3.0), 0.0, 1.0));
					  V_1 = (V_1 * (1.0 - (
					    sin(((uv_2.y * uv_2.y) * 30.0))
					   * 0.26)));
					  lowp vec3 tmpvar_5;
					  tmpvar_5 = (texture2D (_MainTex, xlv_TEXCOORD0) / 2.0).xyz;
					  V_1 = (V_1 * tmpvar_5);
					  highp vec4 tmpvar_6;
					  tmpvar_6.w = 1.0;
					  tmpvar_6.xyz = V_1;
					  gl_FragData[0] = tmpvar_6;
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
					uniform highp float _Value;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 V_1;
					  highp vec2 uv_2;
					  uv_2 = xlv_TEXCOORD0;
					  uv_2 = (uv_2 - vec2(0.5, 0.5));
					  uv_2.y = (uv_2.y * _Value);
					  uv_2 = (uv_2 + (sin(
					    (((uv_2.x * 10.0) * (uv_2.y * 1.11)) + _TimeX)
					  ) * 0.15));
					  highp vec3 tmpvar_3;
					  tmpvar_3.yz = vec2(1.0, 1.0);
					  tmpvar_3.x = ((uv_2.x * 0.1) + (_TimeX * 0.25));
					  highp vec3 x_4;
					  x_4 = ((tmpvar_3.x * 6.0) + vec3(0.0, 4.0, 2.0));
					  V_1 = (clamp ((
					    abs(((x_4 - (
					      floor((x_4 * vec3(0.1666667, 0.1666667, 0.1666667)))
					     * vec3(6.0, 6.0, 6.0))) - 3.0))
					   - 1.0), vec3(0.0, 0.0, 0.0), vec3(1.0, 1.0, 1.0)) * clamp ((
					    (0.7 - abs(uv_2.y))
					   * 3.0), 0.0, 1.0));
					  V_1 = (V_1 * (1.0 - (
					    sin(((uv_2.y * uv_2.y) * 30.0))
					   * 0.26)));
					  lowp vec3 tmpvar_5;
					  tmpvar_5 = (texture2D (_MainTex, xlv_TEXCOORD0) / 2.0).xyz;
					  V_1 = (V_1 * tmpvar_5);
					  highp vec4 tmpvar_6;
					  tmpvar_6.w = 1.0;
					  tmpvar_6.xyz = V_1;
					  gl_FragData[0] = tmpvar_6;
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
					uniform 	float _Value;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat1;
					lowp vec3 u_xlat10_1;
					float u_xlat2;
					float u_xlat4;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat0.z = u_xlat0.y * _Value;
					    u_xlat2 = u_xlat0.z * u_xlat0.x;
					    u_xlat2 = u_xlat2 * 11.1000004 + _TimeX;
					    u_xlat2 = sin(u_xlat2);
					    u_xlat0.xy = vec2(u_xlat2) * vec2(0.150000006, 0.150000006) + u_xlat0.xz;
					    u_xlat4 = _TimeX * 0.25;
					    u_xlat0.x = u_xlat0.x * 0.100000001 + u_xlat4;
					    u_xlat0.xzw = u_xlat0.xxx * vec3(6.0, 6.0, 6.0) + vec3(0.0, 4.0, 2.0);
					    u_xlat1.xyz = u_xlat0.xzw * vec3(0.166666672, 0.166666672, 0.166666672);
					    u_xlat1.xyz = floor(u_xlat1.xyz);
					    u_xlat0.xzw = (-u_xlat1.xyz) * vec3(6.0, 6.0, 6.0) + u_xlat0.xzw;
					    u_xlat0.xzw = u_xlat0.xzw + vec3(-3.0, -3.0, -3.0);
					    u_xlat0.xzw = abs(u_xlat0.xzw) + vec3(-1.0, -1.0, -1.0);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.xzw = min(max(u_xlat0.xzw, 0.0), 1.0);
					#else
					    u_xlat0.xzw = clamp(u_xlat0.xzw, 0.0, 1.0);
					#endif
					    u_xlat1.x = -abs(u_xlat0.y) + 0.699999988;
					    u_xlat2 = u_xlat0.y * u_xlat0.y;
					    u_xlat2 = u_xlat2 * 30.0;
					    u_xlat2 = sin(u_xlat2);
					    u_xlat2 = (-u_xlat2) * 0.25999999 + 1.0;
					    u_xlat1.x = u_xlat1.x * 3.0;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
					#else
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					#endif
					    u_xlat0.xzw = u_xlat0.xzw * u_xlat1.xxx;
					    u_xlat0.xyz = vec3(u_xlat2) * u_xlat0.xzw;
					    u_xlat10_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5);
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
					uniform 	float _Value;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat1;
					lowp vec3 u_xlat10_1;
					float u_xlat2;
					float u_xlat4;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat0.z = u_xlat0.y * _Value;
					    u_xlat2 = u_xlat0.z * u_xlat0.x;
					    u_xlat2 = u_xlat2 * 11.1000004 + _TimeX;
					    u_xlat2 = sin(u_xlat2);
					    u_xlat0.xy = vec2(u_xlat2) * vec2(0.150000006, 0.150000006) + u_xlat0.xz;
					    u_xlat4 = _TimeX * 0.25;
					    u_xlat0.x = u_xlat0.x * 0.100000001 + u_xlat4;
					    u_xlat0.xzw = u_xlat0.xxx * vec3(6.0, 6.0, 6.0) + vec3(0.0, 4.0, 2.0);
					    u_xlat1.xyz = u_xlat0.xzw * vec3(0.166666672, 0.166666672, 0.166666672);
					    u_xlat1.xyz = floor(u_xlat1.xyz);
					    u_xlat0.xzw = (-u_xlat1.xyz) * vec3(6.0, 6.0, 6.0) + u_xlat0.xzw;
					    u_xlat0.xzw = u_xlat0.xzw + vec3(-3.0, -3.0, -3.0);
					    u_xlat0.xzw = abs(u_xlat0.xzw) + vec3(-1.0, -1.0, -1.0);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.xzw = min(max(u_xlat0.xzw, 0.0), 1.0);
					#else
					    u_xlat0.xzw = clamp(u_xlat0.xzw, 0.0, 1.0);
					#endif
					    u_xlat1.x = -abs(u_xlat0.y) + 0.699999988;
					    u_xlat2 = u_xlat0.y * u_xlat0.y;
					    u_xlat2 = u_xlat2 * 30.0;
					    u_xlat2 = sin(u_xlat2);
					    u_xlat2 = (-u_xlat2) * 0.25999999 + 1.0;
					    u_xlat1.x = u_xlat1.x * 3.0;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
					#else
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					#endif
					    u_xlat0.xzw = u_xlat0.xzw * u_xlat1.xxx;
					    u_xlat0.xyz = vec3(u_xlat2) * u_xlat0.xzw;
					    u_xlat10_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5);
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
					uniform 	float _Value;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat1;
					lowp vec3 u_xlat10_1;
					float u_xlat2;
					float u_xlat4;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat0.z = u_xlat0.y * _Value;
					    u_xlat2 = u_xlat0.z * u_xlat0.x;
					    u_xlat2 = u_xlat2 * 11.1000004 + _TimeX;
					    u_xlat2 = sin(u_xlat2);
					    u_xlat0.xy = vec2(u_xlat2) * vec2(0.150000006, 0.150000006) + u_xlat0.xz;
					    u_xlat4 = _TimeX * 0.25;
					    u_xlat0.x = u_xlat0.x * 0.100000001 + u_xlat4;
					    u_xlat0.xzw = u_xlat0.xxx * vec3(6.0, 6.0, 6.0) + vec3(0.0, 4.0, 2.0);
					    u_xlat1.xyz = u_xlat0.xzw * vec3(0.166666672, 0.166666672, 0.166666672);
					    u_xlat1.xyz = floor(u_xlat1.xyz);
					    u_xlat0.xzw = (-u_xlat1.xyz) * vec3(6.0, 6.0, 6.0) + u_xlat0.xzw;
					    u_xlat0.xzw = u_xlat0.xzw + vec3(-3.0, -3.0, -3.0);
					    u_xlat0.xzw = abs(u_xlat0.xzw) + vec3(-1.0, -1.0, -1.0);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.xzw = min(max(u_xlat0.xzw, 0.0), 1.0);
					#else
					    u_xlat0.xzw = clamp(u_xlat0.xzw, 0.0, 1.0);
					#endif
					    u_xlat1.x = -abs(u_xlat0.y) + 0.699999988;
					    u_xlat2 = u_xlat0.y * u_xlat0.y;
					    u_xlat2 = u_xlat2 * 30.0;
					    u_xlat2 = sin(u_xlat2);
					    u_xlat2 = (-u_xlat2) * 0.25999999 + 1.0;
					    u_xlat1.x = u_xlat1.x * 3.0;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
					#else
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					#endif
					    u_xlat0.xzw = u_xlat0.xzw * u_xlat1.xxx;
					    u_xlat0.xyz = vec3(u_xlat2) * u_xlat0.xzw;
					    u_xlat10_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5);
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