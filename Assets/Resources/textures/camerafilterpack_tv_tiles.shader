Shader "CameraFilterPack/TV_Tiles" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 50051
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
					uniform highp float _Value2;
					uniform highp float _Value3;
					uniform highp float _Value4;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 col_2;
					  highp vec4 txt_3;
					  highp vec2 pos_4;
					  pos_4 = ((256.0 * xlv_TEXCOORD0) + _TimeX);
					  lowp vec4 tmpvar_5;
					  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
					  txt_3 = tmpvar_5;
					  mediump float tmpvar_6;
					  mediump vec2 x_7;
					  x_7 = (vec2(0.5, 0.5) - xlv_TEXCOORD0);
					  tmpvar_6 = sqrt(dot (x_7, x_7));
					  highp float tmpvar_8;
					  tmpvar_8 = clamp (((tmpvar_6 - _Value3) / (
					    (_Value3 - _Value4)
					   - _Value3)), 0.0, 1.0);
					  highp float tmpvar_9;
					  tmpvar_9 = (1.0 - (tmpvar_8 * (tmpvar_8 * 
					    (3.0 - (2.0 * tmpvar_8))
					  )));
					  col_2 = vec3(0.0, 0.0, 0.0);
					  for (highp int i_1_1 = 0; i_1_1 < 6; i_1_1++) {
					    highp vec2 tmpvar_10;
					    tmpvar_10 = floor(pos_4);
					    highp vec2 tmpvar_11;
					    tmpvar_11 = fract(pos_4);
					    highp vec4 tmpvar_12;
					    tmpvar_12 = fract(((
					      sin((((tmpvar_10.x * 7.0) + (31.0 * tmpvar_10.y)) + (0.01 * _TimeX)))
					     + vec4(0.035, 0.01, 0.0, 0.7)) * 13.54532));
					    highp float tmpvar_13;
					    tmpvar_13 = clamp (((tmpvar_12.w - 0.45) / 0.1), 0.0, 1.0);
					    col_2 = (col_2 + ((tmpvar_12.xyz * 
					      (tmpvar_13 * (tmpvar_13 * (3.0 - (2.0 * tmpvar_13))))
					    ) * sqrt(
					      ((((16.0 * tmpvar_11.x) * tmpvar_11.y) * (1.0 - tmpvar_11.x)) * (1.0 - tmpvar_11.y))
					    )));
					    pos_4 = (pos_4 / (2.0 * _Value));
					    col_2 = (col_2 / 2.0);
					  };
					  col_2 = (txt_3.xyz * (pow (
					    (2.5 * col_2)
					  , vec3(1.0, 1.0, 0.7)) * _Value2));
					  highp vec4 tmpvar_14;
					  tmpvar_14.w = 1.0;
					  tmpvar_14.xyz = mix (txt_3.xyz, col_2, vec3(tmpvar_9));
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
					uniform highp float _TimeX;
					uniform highp float _Value;
					uniform highp float _Value2;
					uniform highp float _Value3;
					uniform highp float _Value4;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 col_2;
					  highp vec4 txt_3;
					  highp vec2 pos_4;
					  pos_4 = ((256.0 * xlv_TEXCOORD0) + _TimeX);
					  lowp vec4 tmpvar_5;
					  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
					  txt_3 = tmpvar_5;
					  mediump float tmpvar_6;
					  mediump vec2 x_7;
					  x_7 = (vec2(0.5, 0.5) - xlv_TEXCOORD0);
					  tmpvar_6 = sqrt(dot (x_7, x_7));
					  highp float tmpvar_8;
					  tmpvar_8 = clamp (((tmpvar_6 - _Value3) / (
					    (_Value3 - _Value4)
					   - _Value3)), 0.0, 1.0);
					  highp float tmpvar_9;
					  tmpvar_9 = (1.0 - (tmpvar_8 * (tmpvar_8 * 
					    (3.0 - (2.0 * tmpvar_8))
					  )));
					  col_2 = vec3(0.0, 0.0, 0.0);
					  for (highp int i_1_1 = 0; i_1_1 < 6; i_1_1++) {
					    highp vec2 tmpvar_10;
					    tmpvar_10 = floor(pos_4);
					    highp vec2 tmpvar_11;
					    tmpvar_11 = fract(pos_4);
					    highp vec4 tmpvar_12;
					    tmpvar_12 = fract(((
					      sin((((tmpvar_10.x * 7.0) + (31.0 * tmpvar_10.y)) + (0.01 * _TimeX)))
					     + vec4(0.035, 0.01, 0.0, 0.7)) * 13.54532));
					    highp float tmpvar_13;
					    tmpvar_13 = clamp (((tmpvar_12.w - 0.45) / 0.1), 0.0, 1.0);
					    col_2 = (col_2 + ((tmpvar_12.xyz * 
					      (tmpvar_13 * (tmpvar_13 * (3.0 - (2.0 * tmpvar_13))))
					    ) * sqrt(
					      ((((16.0 * tmpvar_11.x) * tmpvar_11.y) * (1.0 - tmpvar_11.x)) * (1.0 - tmpvar_11.y))
					    )));
					    pos_4 = (pos_4 / (2.0 * _Value));
					    col_2 = (col_2 / 2.0);
					  };
					  col_2 = (txt_3.xyz * (pow (
					    (2.5 * col_2)
					  , vec3(1.0, 1.0, 0.7)) * _Value2));
					  highp vec4 tmpvar_14;
					  tmpvar_14.w = 1.0;
					  tmpvar_14.xyz = mix (txt_3.xyz, col_2, vec3(tmpvar_9));
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
					uniform highp float _TimeX;
					uniform highp float _Value;
					uniform highp float _Value2;
					uniform highp float _Value3;
					uniform highp float _Value4;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 col_2;
					  highp vec4 txt_3;
					  highp vec2 pos_4;
					  pos_4 = ((256.0 * xlv_TEXCOORD0) + _TimeX);
					  lowp vec4 tmpvar_5;
					  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
					  txt_3 = tmpvar_5;
					  mediump float tmpvar_6;
					  mediump vec2 x_7;
					  x_7 = (vec2(0.5, 0.5) - xlv_TEXCOORD0);
					  tmpvar_6 = sqrt(dot (x_7, x_7));
					  highp float tmpvar_8;
					  tmpvar_8 = clamp (((tmpvar_6 - _Value3) / (
					    (_Value3 - _Value4)
					   - _Value3)), 0.0, 1.0);
					  highp float tmpvar_9;
					  tmpvar_9 = (1.0 - (tmpvar_8 * (tmpvar_8 * 
					    (3.0 - (2.0 * tmpvar_8))
					  )));
					  col_2 = vec3(0.0, 0.0, 0.0);
					  for (highp int i_1_1 = 0; i_1_1 < 6; i_1_1++) {
					    highp vec2 tmpvar_10;
					    tmpvar_10 = floor(pos_4);
					    highp vec2 tmpvar_11;
					    tmpvar_11 = fract(pos_4);
					    highp vec4 tmpvar_12;
					    tmpvar_12 = fract(((
					      sin((((tmpvar_10.x * 7.0) + (31.0 * tmpvar_10.y)) + (0.01 * _TimeX)))
					     + vec4(0.035, 0.01, 0.0, 0.7)) * 13.54532));
					    highp float tmpvar_13;
					    tmpvar_13 = clamp (((tmpvar_12.w - 0.45) / 0.1), 0.0, 1.0);
					    col_2 = (col_2 + ((tmpvar_12.xyz * 
					      (tmpvar_13 * (tmpvar_13 * (3.0 - (2.0 * tmpvar_13))))
					    ) * sqrt(
					      ((((16.0 * tmpvar_11.x) * tmpvar_11.y) * (1.0 - tmpvar_11.x)) * (1.0 - tmpvar_11.y))
					    )));
					    pos_4 = (pos_4 / (2.0 * _Value));
					    col_2 = (col_2 / 2.0);
					  };
					  col_2 = (txt_3.xyz * (pow (
					    (2.5 * col_2)
					  , vec3(1.0, 1.0, 0.7)) * _Value2));
					  highp vec4 tmpvar_14;
					  tmpvar_14.w = 1.0;
					  tmpvar_14.xyz = mix (txt_3.xyz, col_2, vec3(tmpvar_9));
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
					uniform 	float _TimeX;
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform 	float _Value3;
					uniform 	float _Value4;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					lowp vec3 u_xlat10_1;
					vec3 u_xlat2;
					vec2 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					float u_xlat12;
					mediump vec2 u_xlat16_12;
					vec2 u_xlat15;
					float u_xlat18;
					int u_xlati19;
					float u_xlat20;
					bool u_xlatb20;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(256.0, 256.0) + vec2(_TimeX);
					    u_xlat10_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_12.xy = (-vs_TEXCOORD0.xy) + vec2(0.5, 0.5);
					    u_xlat16_12.x = dot(u_xlat16_12.xy, u_xlat16_12.xy);
					    u_xlat16_12.x = sqrt(u_xlat16_12.x);
					    u_xlat12 = u_xlat16_12.x + (-_Value3);
					    u_xlat18 = float(1.0) / (-_Value4);
					    u_xlat12 = u_xlat18 * u_xlat12;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
					#else
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					#endif
					    u_xlat18 = u_xlat12 * -2.0 + 3.0;
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat12 = (-u_xlat18) * u_xlat12 + 1.0;
					    u_xlat18 = _Value + _Value;
					    u_xlat2.x = float(0.0);
					    u_xlat2.y = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat3.xy = u_xlat0.xy;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<6 ; u_xlati_loop_1++)
					    {
					        u_xlat15.xy = floor(u_xlat3.xy);
					        u_xlat4.xy = fract(u_xlat3.xy);
					        u_xlat20 = dot(u_xlat15.xy, vec2(7.0, 31.0));
					        u_xlat20 = _TimeX * 0.00999999978 + u_xlat20;
					        u_xlat20 = sin(u_xlat20);
					        u_xlat5 = vec4(u_xlat20) + vec4(0.0350000001, 0.00999999978, 0.0, 0.699999988);
					        u_xlat5 = u_xlat5 * vec4(13.5453167, 13.5453167, 13.5453167, 13.5453167);
					        u_xlat5 = fract(u_xlat5);
					        u_xlat20 = u_xlat5.w + -0.449999988;
					        u_xlat20 = u_xlat20 * 9.99999809;
					#ifdef UNITY_ADRENO_ES3
					        u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
					#else
					        u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
					#endif
					        u_xlat15.x = u_xlat20 * -2.0 + 3.0;
					        u_xlat20 = u_xlat20 * u_xlat20;
					        u_xlat20 = u_xlat20 * u_xlat15.x;
					        u_xlat5.xyz = vec3(u_xlat20) * u_xlat5.xyz;
					        u_xlat20 = u_xlat4.x * u_xlat4.y;
					        u_xlat20 = u_xlat20 * 16.0;
					        u_xlat15.xy = (-u_xlat4.xy) + vec2(1.0, 1.0);
					        u_xlat20 = u_xlat20 * u_xlat15.x;
					        u_xlat20 = u_xlat15.y * u_xlat20;
					        u_xlat20 = sqrt(u_xlat20);
					        u_xlat4.xyz = u_xlat5.xyz * vec3(u_xlat20) + u_xlat2.xyz;
					        u_xlat3.xy = u_xlat3.xy / vec2(u_xlat18);
					        u_xlat2.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5);
					    }
					    u_xlat0.xyw = u_xlat2.xyz * vec3(2.5, 2.5, 2.5);
					    u_xlat0.xyw = log2(u_xlat0.xyw);
					    u_xlat0.xyw = u_xlat0.xyw * vec3(1.0, 1.0, 0.699999988);
					    u_xlat0.xyw = exp2(u_xlat0.xyw);
					    u_xlat0.xyw = u_xlat0.xyw * vec3(vec3(_Value2, _Value2, _Value2));
					    u_xlat0.xyw = u_xlat10_1.xyz * u_xlat0.xyw + (-u_xlat10_1.xyz);
					    SV_Target0.xyz = vec3(u_xlat12) * u_xlat0.xyw + u_xlat10_1.xyz;
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
					uniform 	float _Value2;
					uniform 	float _Value3;
					uniform 	float _Value4;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					lowp vec3 u_xlat10_1;
					vec3 u_xlat2;
					vec2 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					float u_xlat12;
					mediump vec2 u_xlat16_12;
					vec2 u_xlat15;
					float u_xlat18;
					int u_xlati19;
					float u_xlat20;
					bool u_xlatb20;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(256.0, 256.0) + vec2(_TimeX);
					    u_xlat10_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_12.xy = (-vs_TEXCOORD0.xy) + vec2(0.5, 0.5);
					    u_xlat16_12.x = dot(u_xlat16_12.xy, u_xlat16_12.xy);
					    u_xlat16_12.x = sqrt(u_xlat16_12.x);
					    u_xlat12 = u_xlat16_12.x + (-_Value3);
					    u_xlat18 = float(1.0) / (-_Value4);
					    u_xlat12 = u_xlat18 * u_xlat12;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
					#else
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					#endif
					    u_xlat18 = u_xlat12 * -2.0 + 3.0;
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat12 = (-u_xlat18) * u_xlat12 + 1.0;
					    u_xlat18 = _Value + _Value;
					    u_xlat2.x = float(0.0);
					    u_xlat2.y = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat3.xy = u_xlat0.xy;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<6 ; u_xlati_loop_1++)
					    {
					        u_xlat15.xy = floor(u_xlat3.xy);
					        u_xlat4.xy = fract(u_xlat3.xy);
					        u_xlat20 = dot(u_xlat15.xy, vec2(7.0, 31.0));
					        u_xlat20 = _TimeX * 0.00999999978 + u_xlat20;
					        u_xlat20 = sin(u_xlat20);
					        u_xlat5 = vec4(u_xlat20) + vec4(0.0350000001, 0.00999999978, 0.0, 0.699999988);
					        u_xlat5 = u_xlat5 * vec4(13.5453167, 13.5453167, 13.5453167, 13.5453167);
					        u_xlat5 = fract(u_xlat5);
					        u_xlat20 = u_xlat5.w + -0.449999988;
					        u_xlat20 = u_xlat20 * 9.99999809;
					#ifdef UNITY_ADRENO_ES3
					        u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
					#else
					        u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
					#endif
					        u_xlat15.x = u_xlat20 * -2.0 + 3.0;
					        u_xlat20 = u_xlat20 * u_xlat20;
					        u_xlat20 = u_xlat20 * u_xlat15.x;
					        u_xlat5.xyz = vec3(u_xlat20) * u_xlat5.xyz;
					        u_xlat20 = u_xlat4.x * u_xlat4.y;
					        u_xlat20 = u_xlat20 * 16.0;
					        u_xlat15.xy = (-u_xlat4.xy) + vec2(1.0, 1.0);
					        u_xlat20 = u_xlat20 * u_xlat15.x;
					        u_xlat20 = u_xlat15.y * u_xlat20;
					        u_xlat20 = sqrt(u_xlat20);
					        u_xlat4.xyz = u_xlat5.xyz * vec3(u_xlat20) + u_xlat2.xyz;
					        u_xlat3.xy = u_xlat3.xy / vec2(u_xlat18);
					        u_xlat2.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5);
					    }
					    u_xlat0.xyw = u_xlat2.xyz * vec3(2.5, 2.5, 2.5);
					    u_xlat0.xyw = log2(u_xlat0.xyw);
					    u_xlat0.xyw = u_xlat0.xyw * vec3(1.0, 1.0, 0.699999988);
					    u_xlat0.xyw = exp2(u_xlat0.xyw);
					    u_xlat0.xyw = u_xlat0.xyw * vec3(vec3(_Value2, _Value2, _Value2));
					    u_xlat0.xyw = u_xlat10_1.xyz * u_xlat0.xyw + (-u_xlat10_1.xyz);
					    SV_Target0.xyz = vec3(u_xlat12) * u_xlat0.xyw + u_xlat10_1.xyz;
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
					uniform 	float _Value2;
					uniform 	float _Value3;
					uniform 	float _Value4;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					lowp vec3 u_xlat10_1;
					vec3 u_xlat2;
					vec2 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					float u_xlat12;
					mediump vec2 u_xlat16_12;
					vec2 u_xlat15;
					float u_xlat18;
					int u_xlati19;
					float u_xlat20;
					bool u_xlatb20;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(256.0, 256.0) + vec2(_TimeX);
					    u_xlat10_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_12.xy = (-vs_TEXCOORD0.xy) + vec2(0.5, 0.5);
					    u_xlat16_12.x = dot(u_xlat16_12.xy, u_xlat16_12.xy);
					    u_xlat16_12.x = sqrt(u_xlat16_12.x);
					    u_xlat12 = u_xlat16_12.x + (-_Value3);
					    u_xlat18 = float(1.0) / (-_Value4);
					    u_xlat12 = u_xlat18 * u_xlat12;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
					#else
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					#endif
					    u_xlat18 = u_xlat12 * -2.0 + 3.0;
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat12 = (-u_xlat18) * u_xlat12 + 1.0;
					    u_xlat18 = _Value + _Value;
					    u_xlat2.x = float(0.0);
					    u_xlat2.y = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat3.xy = u_xlat0.xy;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<6 ; u_xlati_loop_1++)
					    {
					        u_xlat15.xy = floor(u_xlat3.xy);
					        u_xlat4.xy = fract(u_xlat3.xy);
					        u_xlat20 = dot(u_xlat15.xy, vec2(7.0, 31.0));
					        u_xlat20 = _TimeX * 0.00999999978 + u_xlat20;
					        u_xlat20 = sin(u_xlat20);
					        u_xlat5 = vec4(u_xlat20) + vec4(0.0350000001, 0.00999999978, 0.0, 0.699999988);
					        u_xlat5 = u_xlat5 * vec4(13.5453167, 13.5453167, 13.5453167, 13.5453167);
					        u_xlat5 = fract(u_xlat5);
					        u_xlat20 = u_xlat5.w + -0.449999988;
					        u_xlat20 = u_xlat20 * 9.99999809;
					#ifdef UNITY_ADRENO_ES3
					        u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
					#else
					        u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
					#endif
					        u_xlat15.x = u_xlat20 * -2.0 + 3.0;
					        u_xlat20 = u_xlat20 * u_xlat20;
					        u_xlat20 = u_xlat20 * u_xlat15.x;
					        u_xlat5.xyz = vec3(u_xlat20) * u_xlat5.xyz;
					        u_xlat20 = u_xlat4.x * u_xlat4.y;
					        u_xlat20 = u_xlat20 * 16.0;
					        u_xlat15.xy = (-u_xlat4.xy) + vec2(1.0, 1.0);
					        u_xlat20 = u_xlat20 * u_xlat15.x;
					        u_xlat20 = u_xlat15.y * u_xlat20;
					        u_xlat20 = sqrt(u_xlat20);
					        u_xlat4.xyz = u_xlat5.xyz * vec3(u_xlat20) + u_xlat2.xyz;
					        u_xlat3.xy = u_xlat3.xy / vec2(u_xlat18);
					        u_xlat2.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5);
					    }
					    u_xlat0.xyw = u_xlat2.xyz * vec3(2.5, 2.5, 2.5);
					    u_xlat0.xyw = log2(u_xlat0.xyw);
					    u_xlat0.xyw = u_xlat0.xyw * vec3(1.0, 1.0, 0.699999988);
					    u_xlat0.xyw = exp2(u_xlat0.xyw);
					    u_xlat0.xyw = u_xlat0.xyw * vec3(vec3(_Value2, _Value2, _Value2));
					    u_xlat0.xyw = u_xlat10_1.xyz * u_xlat0.xyw + (-u_xlat10_1.xyz);
					    SV_Target0.xyz = vec3(u_xlat12) * u_xlat0.xyw + u_xlat10_1.xyz;
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