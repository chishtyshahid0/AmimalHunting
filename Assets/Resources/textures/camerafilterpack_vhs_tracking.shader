Shader "CameraFilterPack/VHS_Tracking" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 49443
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
					  highp float colx_1;
					  highp float yt_2;
					  highp float y_3;
					  highp float x_4;
					  highp vec2 uv_org_5;
					  highp vec2 uv_6;
					  uv_6 = xlv_TEXCOORD0;
					  uv_org_5 = uv_6;
					  highp float tmpvar_7;
					  tmpvar_7 = floor((_TimeX * 0.6));
					  highp float tmpvar_8;
					  highp float tmpvar_9;
					  tmpvar_9 = dot (vec2(_TimeX), vec2(12.98, 78.13));
					  tmpvar_8 = ((abs(
					    cos(_TimeX)
					  ) * fract(
					    (sin(tmpvar_9) * 43858.55)
					  )) * 100.0);
					  highp float tmpvar_10;
					  tmpvar_10 = ((uv_6.y * 32.0) - tmpvar_8);
					  x_4 = (uv_6.x - ((
					    sin(fract((sin(tmpvar_9) * 43858.55)))
					   * 0.1) * exp(
					    (-((tmpvar_10 * tmpvar_10)) / 24.0)
					  )));
					  y_3 = uv_6.y;
					  uv_6.x = x_4;
					  uv_6.y = y_3;
					  yt_2 = (0.5 * cos(tmpvar_8));
					  highp float tmpvar_11;
					  tmpvar_11 = (0.1 * cos(yt_2));
					  colx_1 = 0.0;
					  bool tmpvar_12;
					  if ((uv_org_5.y > yt_2)) {
					    highp vec2 tmpvar_13;
					    tmpvar_13.x = tmpvar_7;
					    tmpvar_13.y = _TimeX;
					    highp float tmpvar_14;
					    tmpvar_14 = fract((sin(
					      dot (tmpvar_13, vec2(12.98, 78.13))
					    ) * 43858.55));
					    tmpvar_12 = (uv_org_5.y < (yt_2 + (tmpvar_14 * 0.25)));
					  } else {
					    tmpvar_12 = bool(0);
					  };
					  if (tmpvar_12) {
					    highp float tmpvar_15;
					    highp float x_16;
					    x_16 = (x_4 * 100.0);
					    tmpvar_15 = (x_16 - (floor(
					      (x_16 * 0.1)
					    ) * 10.0));
					    highp float tmpvar_17;
					    tmpvar_17 = sin(_TimeX);
					    highp float tmpvar_18;
					    tmpvar_18 = sin((tmpvar_11 * 360.0));
					    bool tmpvar_19;
					    if (((tmpvar_15 * tmpvar_17) > tmpvar_18)) {
					      tmpvar_19 = bool(1);
					    } else {
					      highp float tmpvar_20;
					      tmpvar_20 = fract((sin(
					        dot (vec2(tmpvar_15), vec2(12.98, 78.13))
					      ) * 43858.55));
					      tmpvar_19 = (tmpvar_20 > 0.4);
					    };
					    if (tmpvar_19) {
					      colx_1 = (fract((
					        sin(dot (vec2(tmpvar_7), vec2(12.98, 78.13)))
					       * 43858.55)) * _Value);
					    };
					  };
					  highp vec2 tmpvar_21;
					  tmpvar_21 = mix (uv_org_5, uv_6, vec2(_Value));
					  uv_6 = tmpvar_21;
					  lowp vec4 tmpvar_22;
					  tmpvar_22 = texture2D (_MainTex, tmpvar_21);
					  highp vec4 tmpvar_23;
					  tmpvar_23.w = 1.0;
					  tmpvar_23.xyz = (tmpvar_22.xyz + colx_1);
					  gl_FragData[0] = tmpvar_23;
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
					  highp float colx_1;
					  highp float yt_2;
					  highp float y_3;
					  highp float x_4;
					  highp vec2 uv_org_5;
					  highp vec2 uv_6;
					  uv_6 = xlv_TEXCOORD0;
					  uv_org_5 = uv_6;
					  highp float tmpvar_7;
					  tmpvar_7 = floor((_TimeX * 0.6));
					  highp float tmpvar_8;
					  highp float tmpvar_9;
					  tmpvar_9 = dot (vec2(_TimeX), vec2(12.98, 78.13));
					  tmpvar_8 = ((abs(
					    cos(_TimeX)
					  ) * fract(
					    (sin(tmpvar_9) * 43858.55)
					  )) * 100.0);
					  highp float tmpvar_10;
					  tmpvar_10 = ((uv_6.y * 32.0) - tmpvar_8);
					  x_4 = (uv_6.x - ((
					    sin(fract((sin(tmpvar_9) * 43858.55)))
					   * 0.1) * exp(
					    (-((tmpvar_10 * tmpvar_10)) / 24.0)
					  )));
					  y_3 = uv_6.y;
					  uv_6.x = x_4;
					  uv_6.y = y_3;
					  yt_2 = (0.5 * cos(tmpvar_8));
					  highp float tmpvar_11;
					  tmpvar_11 = (0.1 * cos(yt_2));
					  colx_1 = 0.0;
					  bool tmpvar_12;
					  if ((uv_org_5.y > yt_2)) {
					    highp vec2 tmpvar_13;
					    tmpvar_13.x = tmpvar_7;
					    tmpvar_13.y = _TimeX;
					    highp float tmpvar_14;
					    tmpvar_14 = fract((sin(
					      dot (tmpvar_13, vec2(12.98, 78.13))
					    ) * 43858.55));
					    tmpvar_12 = (uv_org_5.y < (yt_2 + (tmpvar_14 * 0.25)));
					  } else {
					    tmpvar_12 = bool(0);
					  };
					  if (tmpvar_12) {
					    highp float tmpvar_15;
					    highp float x_16;
					    x_16 = (x_4 * 100.0);
					    tmpvar_15 = (x_16 - (floor(
					      (x_16 * 0.1)
					    ) * 10.0));
					    highp float tmpvar_17;
					    tmpvar_17 = sin(_TimeX);
					    highp float tmpvar_18;
					    tmpvar_18 = sin((tmpvar_11 * 360.0));
					    bool tmpvar_19;
					    if (((tmpvar_15 * tmpvar_17) > tmpvar_18)) {
					      tmpvar_19 = bool(1);
					    } else {
					      highp float tmpvar_20;
					      tmpvar_20 = fract((sin(
					        dot (vec2(tmpvar_15), vec2(12.98, 78.13))
					      ) * 43858.55));
					      tmpvar_19 = (tmpvar_20 > 0.4);
					    };
					    if (tmpvar_19) {
					      colx_1 = (fract((
					        sin(dot (vec2(tmpvar_7), vec2(12.98, 78.13)))
					       * 43858.55)) * _Value);
					    };
					  };
					  highp vec2 tmpvar_21;
					  tmpvar_21 = mix (uv_org_5, uv_6, vec2(_Value));
					  uv_6 = tmpvar_21;
					  lowp vec4 tmpvar_22;
					  tmpvar_22 = texture2D (_MainTex, tmpvar_21);
					  highp vec4 tmpvar_23;
					  tmpvar_23.w = 1.0;
					  tmpvar_23.xyz = (tmpvar_22.xyz + colx_1);
					  gl_FragData[0] = tmpvar_23;
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
					  highp float colx_1;
					  highp float yt_2;
					  highp float y_3;
					  highp float x_4;
					  highp vec2 uv_org_5;
					  highp vec2 uv_6;
					  uv_6 = xlv_TEXCOORD0;
					  uv_org_5 = uv_6;
					  highp float tmpvar_7;
					  tmpvar_7 = floor((_TimeX * 0.6));
					  highp float tmpvar_8;
					  highp float tmpvar_9;
					  tmpvar_9 = dot (vec2(_TimeX), vec2(12.98, 78.13));
					  tmpvar_8 = ((abs(
					    cos(_TimeX)
					  ) * fract(
					    (sin(tmpvar_9) * 43858.55)
					  )) * 100.0);
					  highp float tmpvar_10;
					  tmpvar_10 = ((uv_6.y * 32.0) - tmpvar_8);
					  x_4 = (uv_6.x - ((
					    sin(fract((sin(tmpvar_9) * 43858.55)))
					   * 0.1) * exp(
					    (-((tmpvar_10 * tmpvar_10)) / 24.0)
					  )));
					  y_3 = uv_6.y;
					  uv_6.x = x_4;
					  uv_6.y = y_3;
					  yt_2 = (0.5 * cos(tmpvar_8));
					  highp float tmpvar_11;
					  tmpvar_11 = (0.1 * cos(yt_2));
					  colx_1 = 0.0;
					  bool tmpvar_12;
					  if ((uv_org_5.y > yt_2)) {
					    highp vec2 tmpvar_13;
					    tmpvar_13.x = tmpvar_7;
					    tmpvar_13.y = _TimeX;
					    highp float tmpvar_14;
					    tmpvar_14 = fract((sin(
					      dot (tmpvar_13, vec2(12.98, 78.13))
					    ) * 43858.55));
					    tmpvar_12 = (uv_org_5.y < (yt_2 + (tmpvar_14 * 0.25)));
					  } else {
					    tmpvar_12 = bool(0);
					  };
					  if (tmpvar_12) {
					    highp float tmpvar_15;
					    highp float x_16;
					    x_16 = (x_4 * 100.0);
					    tmpvar_15 = (x_16 - (floor(
					      (x_16 * 0.1)
					    ) * 10.0));
					    highp float tmpvar_17;
					    tmpvar_17 = sin(_TimeX);
					    highp float tmpvar_18;
					    tmpvar_18 = sin((tmpvar_11 * 360.0));
					    bool tmpvar_19;
					    if (((tmpvar_15 * tmpvar_17) > tmpvar_18)) {
					      tmpvar_19 = bool(1);
					    } else {
					      highp float tmpvar_20;
					      tmpvar_20 = fract((sin(
					        dot (vec2(tmpvar_15), vec2(12.98, 78.13))
					      ) * 43858.55));
					      tmpvar_19 = (tmpvar_20 > 0.4);
					    };
					    if (tmpvar_19) {
					      colx_1 = (fract((
					        sin(dot (vec2(tmpvar_7), vec2(12.98, 78.13)))
					       * 43858.55)) * _Value);
					    };
					  };
					  highp vec2 tmpvar_21;
					  tmpvar_21 = mix (uv_org_5, uv_6, vec2(_Value));
					  uv_6 = tmpvar_21;
					  lowp vec4 tmpvar_22;
					  tmpvar_22 = texture2D (_MainTex, tmpvar_21);
					  highp vec4 tmpvar_23;
					  tmpvar_23.w = 1.0;
					  tmpvar_23.xyz = (tmpvar_22.xyz + colx_1);
					  gl_FragData[0] = tmpvar_23;
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
					vec3 u_xlat0;
					int u_xlati0;
					vec2 u_xlat1;
					vec2 u_xlat2;
					vec2 u_xlat3;
					lowp vec3 u_xlat10_3;
					bool u_xlatb3;
					float u_xlat6;
					int u_xlati6;
					bool u_xlatb6;
					float u_xlat9;
					void main()
					{
					    u_xlat0.x = dot(vec2(_TimeX), vec2(12.9799995, 78.1299973));
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 43858.5547;
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlat1.x = sin(_TimeX);
					    u_xlat2.x = cos(_TimeX);
					    u_xlat0.y = u_xlat0.x * abs(u_xlat2.x);
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.xy = u_xlat0.xy * vec2(0.100000001, 100.0);
					    u_xlat6 = vs_TEXCOORD0.y * 32.0 + (-u_xlat0.y);
					    u_xlat3.x = cos(u_xlat0.y);
					    u_xlat3.y = u_xlat6 * u_xlat6;
					    u_xlat3.xy = u_xlat3.xy * vec2(0.5, -0.0601122938);
					    u_xlat6 = exp2(u_xlat3.y);
					    u_xlat9 = (-u_xlat0.x) * u_xlat6 + vs_TEXCOORD0.x;
					    u_xlat2.x = u_xlat6 * u_xlat0.x;
					    u_xlat2.x = (-u_xlat2.x);
					    u_xlat0.xz = vec2(u_xlat9) * vec2(100.0, 10.0);
					    u_xlat6 = floor(u_xlat0.z);
					    u_xlat0.x = (-u_xlat6) * 10.0 + u_xlat0.x;
					    u_xlat6 = u_xlat1.x * u_xlat0.x;
					    u_xlat0.x = dot(u_xlat0.xx, vec2(12.9799995, 78.1299973));
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 43858.5547;
					    u_xlat0.x = fract(u_xlat0.x);
					#ifdef UNITY_ADRENO_ES3
					    { bool cond = 0.400000006<u_xlat0.x; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
					#else
					    u_xlati0 = int((0.400000006<u_xlat0.x) ? 0xFFFFFFFFu : uint(0u));
					#endif
					    u_xlat9 = cos(u_xlat3.x);
					    u_xlat9 = u_xlat9 * 36.0;
					    u_xlat9 = sin(u_xlat9);
					#ifdef UNITY_ADRENO_ES3
					    { bool cond = u_xlat9<u_xlat6; u_xlati6 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
					#else
					    u_xlati6 = int((u_xlat9<u_xlat6) ? 0xFFFFFFFFu : uint(0u));
					#endif
					    u_xlati0 = int(uint(u_xlati0) | uint(u_xlati6));
					    u_xlat6 = _TimeX * 0.600000024;
					    u_xlat1.x = floor(u_xlat6);
					    u_xlat6 = dot(u_xlat1.xx, vec2(12.9799995, 78.1299973));
					    u_xlat6 = sin(u_xlat6);
					    u_xlat6 = u_xlat6 * 43858.5547;
					    u_xlat6 = fract(u_xlat6);
					    u_xlat6 = u_xlat6 * _Value;
					    u_xlati0 = int(floatBitsToUint(u_xlat6) & uint(u_xlati0));
					    u_xlat1.y = _TimeX;
					    u_xlat6 = dot(u_xlat1.xy, vec2(12.9799995, 78.1299973));
					    u_xlat6 = sin(u_xlat6);
					    u_xlat6 = u_xlat6 * 43858.5547;
					    u_xlat6 = fract(u_xlat6);
					    u_xlat6 = u_xlat6 * 0.25 + u_xlat3.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb3 = !!(u_xlat3.x<vs_TEXCOORD0.y);
					#else
					    u_xlatb3 = u_xlat3.x<vs_TEXCOORD0.y;
					#endif
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb6 = !!(vs_TEXCOORD0.y<u_xlat6);
					#else
					    u_xlatb6 = vs_TEXCOORD0.y<u_xlat6;
					#endif
					    u_xlatb3 = u_xlatb6 && u_xlatb3;
					    u_xlat0.x = u_xlatb3 ? intBitsToFloat(u_xlati0) : float(0.0);
					    u_xlat2.y = 0.0;
					    u_xlat3.xy = vec2(vec2(_Value, _Value)) * u_xlat2.xy + vs_TEXCOORD0.xy;
					    u_xlat10_3.xyz = texture(_MainTex, u_xlat3.xy).xyz;
					    SV_Target0.xyz = u_xlat0.xxx + u_xlat10_3.xyz;
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
					vec3 u_xlat0;
					int u_xlati0;
					vec2 u_xlat1;
					vec2 u_xlat2;
					vec2 u_xlat3;
					lowp vec3 u_xlat10_3;
					bool u_xlatb3;
					float u_xlat6;
					int u_xlati6;
					bool u_xlatb6;
					float u_xlat9;
					void main()
					{
					    u_xlat0.x = dot(vec2(_TimeX), vec2(12.9799995, 78.1299973));
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 43858.5547;
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlat1.x = sin(_TimeX);
					    u_xlat2.x = cos(_TimeX);
					    u_xlat0.y = u_xlat0.x * abs(u_xlat2.x);
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.xy = u_xlat0.xy * vec2(0.100000001, 100.0);
					    u_xlat6 = vs_TEXCOORD0.y * 32.0 + (-u_xlat0.y);
					    u_xlat3.x = cos(u_xlat0.y);
					    u_xlat3.y = u_xlat6 * u_xlat6;
					    u_xlat3.xy = u_xlat3.xy * vec2(0.5, -0.0601122938);
					    u_xlat6 = exp2(u_xlat3.y);
					    u_xlat9 = (-u_xlat0.x) * u_xlat6 + vs_TEXCOORD0.x;
					    u_xlat2.x = u_xlat6 * u_xlat0.x;
					    u_xlat2.x = (-u_xlat2.x);
					    u_xlat0.xz = vec2(u_xlat9) * vec2(100.0, 10.0);
					    u_xlat6 = floor(u_xlat0.z);
					    u_xlat0.x = (-u_xlat6) * 10.0 + u_xlat0.x;
					    u_xlat6 = u_xlat1.x * u_xlat0.x;
					    u_xlat0.x = dot(u_xlat0.xx, vec2(12.9799995, 78.1299973));
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 43858.5547;
					    u_xlat0.x = fract(u_xlat0.x);
					#ifdef UNITY_ADRENO_ES3
					    { bool cond = 0.400000006<u_xlat0.x; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
					#else
					    u_xlati0 = int((0.400000006<u_xlat0.x) ? 0xFFFFFFFFu : uint(0u));
					#endif
					    u_xlat9 = cos(u_xlat3.x);
					    u_xlat9 = u_xlat9 * 36.0;
					    u_xlat9 = sin(u_xlat9);
					#ifdef UNITY_ADRENO_ES3
					    { bool cond = u_xlat9<u_xlat6; u_xlati6 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
					#else
					    u_xlati6 = int((u_xlat9<u_xlat6) ? 0xFFFFFFFFu : uint(0u));
					#endif
					    u_xlati0 = int(uint(u_xlati0) | uint(u_xlati6));
					    u_xlat6 = _TimeX * 0.600000024;
					    u_xlat1.x = floor(u_xlat6);
					    u_xlat6 = dot(u_xlat1.xx, vec2(12.9799995, 78.1299973));
					    u_xlat6 = sin(u_xlat6);
					    u_xlat6 = u_xlat6 * 43858.5547;
					    u_xlat6 = fract(u_xlat6);
					    u_xlat6 = u_xlat6 * _Value;
					    u_xlati0 = int(floatBitsToUint(u_xlat6) & uint(u_xlati0));
					    u_xlat1.y = _TimeX;
					    u_xlat6 = dot(u_xlat1.xy, vec2(12.9799995, 78.1299973));
					    u_xlat6 = sin(u_xlat6);
					    u_xlat6 = u_xlat6 * 43858.5547;
					    u_xlat6 = fract(u_xlat6);
					    u_xlat6 = u_xlat6 * 0.25 + u_xlat3.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb3 = !!(u_xlat3.x<vs_TEXCOORD0.y);
					#else
					    u_xlatb3 = u_xlat3.x<vs_TEXCOORD0.y;
					#endif
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb6 = !!(vs_TEXCOORD0.y<u_xlat6);
					#else
					    u_xlatb6 = vs_TEXCOORD0.y<u_xlat6;
					#endif
					    u_xlatb3 = u_xlatb6 && u_xlatb3;
					    u_xlat0.x = u_xlatb3 ? intBitsToFloat(u_xlati0) : float(0.0);
					    u_xlat2.y = 0.0;
					    u_xlat3.xy = vec2(vec2(_Value, _Value)) * u_xlat2.xy + vs_TEXCOORD0.xy;
					    u_xlat10_3.xyz = texture(_MainTex, u_xlat3.xy).xyz;
					    SV_Target0.xyz = u_xlat0.xxx + u_xlat10_3.xyz;
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
					vec3 u_xlat0;
					int u_xlati0;
					vec2 u_xlat1;
					vec2 u_xlat2;
					vec2 u_xlat3;
					lowp vec3 u_xlat10_3;
					bool u_xlatb3;
					float u_xlat6;
					int u_xlati6;
					bool u_xlatb6;
					float u_xlat9;
					void main()
					{
					    u_xlat0.x = dot(vec2(_TimeX), vec2(12.9799995, 78.1299973));
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 43858.5547;
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlat1.x = sin(_TimeX);
					    u_xlat2.x = cos(_TimeX);
					    u_xlat0.y = u_xlat0.x * abs(u_xlat2.x);
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.xy = u_xlat0.xy * vec2(0.100000001, 100.0);
					    u_xlat6 = vs_TEXCOORD0.y * 32.0 + (-u_xlat0.y);
					    u_xlat3.x = cos(u_xlat0.y);
					    u_xlat3.y = u_xlat6 * u_xlat6;
					    u_xlat3.xy = u_xlat3.xy * vec2(0.5, -0.0601122938);
					    u_xlat6 = exp2(u_xlat3.y);
					    u_xlat9 = (-u_xlat0.x) * u_xlat6 + vs_TEXCOORD0.x;
					    u_xlat2.x = u_xlat6 * u_xlat0.x;
					    u_xlat2.x = (-u_xlat2.x);
					    u_xlat0.xz = vec2(u_xlat9) * vec2(100.0, 10.0);
					    u_xlat6 = floor(u_xlat0.z);
					    u_xlat0.x = (-u_xlat6) * 10.0 + u_xlat0.x;
					    u_xlat6 = u_xlat1.x * u_xlat0.x;
					    u_xlat0.x = dot(u_xlat0.xx, vec2(12.9799995, 78.1299973));
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 43858.5547;
					    u_xlat0.x = fract(u_xlat0.x);
					#ifdef UNITY_ADRENO_ES3
					    { bool cond = 0.400000006<u_xlat0.x; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
					#else
					    u_xlati0 = int((0.400000006<u_xlat0.x) ? 0xFFFFFFFFu : uint(0u));
					#endif
					    u_xlat9 = cos(u_xlat3.x);
					    u_xlat9 = u_xlat9 * 36.0;
					    u_xlat9 = sin(u_xlat9);
					#ifdef UNITY_ADRENO_ES3
					    { bool cond = u_xlat9<u_xlat6; u_xlati6 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
					#else
					    u_xlati6 = int((u_xlat9<u_xlat6) ? 0xFFFFFFFFu : uint(0u));
					#endif
					    u_xlati0 = int(uint(u_xlati0) | uint(u_xlati6));
					    u_xlat6 = _TimeX * 0.600000024;
					    u_xlat1.x = floor(u_xlat6);
					    u_xlat6 = dot(u_xlat1.xx, vec2(12.9799995, 78.1299973));
					    u_xlat6 = sin(u_xlat6);
					    u_xlat6 = u_xlat6 * 43858.5547;
					    u_xlat6 = fract(u_xlat6);
					    u_xlat6 = u_xlat6 * _Value;
					    u_xlati0 = int(floatBitsToUint(u_xlat6) & uint(u_xlati0));
					    u_xlat1.y = _TimeX;
					    u_xlat6 = dot(u_xlat1.xy, vec2(12.9799995, 78.1299973));
					    u_xlat6 = sin(u_xlat6);
					    u_xlat6 = u_xlat6 * 43858.5547;
					    u_xlat6 = fract(u_xlat6);
					    u_xlat6 = u_xlat6 * 0.25 + u_xlat3.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb3 = !!(u_xlat3.x<vs_TEXCOORD0.y);
					#else
					    u_xlatb3 = u_xlat3.x<vs_TEXCOORD0.y;
					#endif
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb6 = !!(vs_TEXCOORD0.y<u_xlat6);
					#else
					    u_xlatb6 = vs_TEXCOORD0.y<u_xlat6;
					#endif
					    u_xlatb3 = u_xlatb6 && u_xlatb3;
					    u_xlat0.x = u_xlatb3 ? intBitsToFloat(u_xlati0) : float(0.0);
					    u_xlat2.y = 0.0;
					    u_xlat3.xy = vec2(vec2(_Value, _Value)) * u_xlat2.xy + vs_TEXCOORD0.xy;
					    u_xlat10_3.xyz = texture(_MainTex, u_xlat3.xy).xyz;
					    SV_Target0.xyz = u_xlat0.xxx + u_xlat10_3.xyz;
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