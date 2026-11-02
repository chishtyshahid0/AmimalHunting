Shader "CameraFilterPack/Vision_Blood" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 52729
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
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 p_2;
					  highp vec3 c_3;
					  highp vec3 o_4;
					  highp vec3 d_5;
					  highp vec2 uv_6;
					  highp float k_7;
					  k_7 = 0.0;
					  uv_6 = xlv_TEXCOORD0;
					  highp vec3 tmpvar_8;
					  tmpvar_8.z = 1.0;
					  tmpvar_8.xy = uv_6;
					  highp vec3 tmpvar_9;
					  tmpvar_9 = (tmpvar_8 - 0.5);
					  o_4 = tmpvar_9;
					  c_3 = vec3(0.0, 0.0, 0.0);
					  lowp vec4 tmpvar_10;
					  tmpvar_10 = texture2D (_MainTex, vec2(0.1, 0.5));
					  d_5 = (tmpvar_9 + (tmpvar_10.xyz * 0.01));
					  for (highp int i_1_1 = 0; i_1_1 < 12; i_1_1++) {
					    p_2 = (o_4 + (sin(
					(_TimeX / 2.0)
					) / 2.0));
					    for (highp int j_11 = 0; j_11 < 10; j_11++) {
					      highp vec3 tmpvar_12;
					      tmpvar_12 = (abs((p_2.zyx - 0.4)) - 0.9);
					      p_2 = tmpvar_12;
					      k_7 = (k_7 + exp((-1.25 * 
					        abs(dot (o_4, tmpvar_12))
					      )));
					    };
					    k_7 = (k_7 / 3.0);
					    o_4 = (o_4 + ((d_5 * 0.4) * k_7));
					    highp vec3 tmpvar_13;
					    tmpvar_13.z = -0.01;
					    tmpvar_13.x = ((k_7 * k_7) * (k_7 * 3.173));
					    tmpvar_13.y = ((k_7 * k_7) * -0.041);
					    c_3 = ((0.97 * c_3) + ((0.1 * k_7) * tmpvar_13));
					  };
					  highp vec2 x_14;
					  x_14 = (vec2(0.5, 0.5) - uv_6);
					  highp float tmpvar_15;
					  tmpvar_15 = clamp (((
					    sqrt(dot (x_14, x_14))
					   - _Value) / (
					    ((_Value - 0.05) - _Value2)
					   - _Value)), 0.0, 1.0);
					  c_3 = (0.4 * log((1.0 + c_3)));
					  c_3 = (c_3 - 0.5);
					  highp vec2 tmpvar_16;
					  tmpvar_16.x = ((c_3.x / 2.0) * uv_6.x);
					  tmpvar_16.y = ((c_3.x / 2.0) * uv_6.y);
					  lowp vec4 tmpvar_17;
					  tmpvar_17 = texture2D (_MainTex, tmpvar_16);
					  c_3 = (c_3 + tmpvar_17.xyz);
					  lowp vec4 tmpvar_18;
					  tmpvar_18 = texture2D (_MainTex, uv_6);
					  highp vec4 tmpvar_19;
					  tmpvar_19.w = 0.0;
					  tmpvar_19.xyz = c_3;
					  highp vec3 tmpvar_20;
					  tmpvar_20 = mix (tmpvar_18, tmpvar_19, vec4((1.0 - (tmpvar_15 * 
					    (tmpvar_15 * (3.0 - (2.0 * tmpvar_15)))
					  )))).xyz;
					  c_3 = tmpvar_20;
					  highp vec4 tmpvar_21;
					  tmpvar_21.w = 1.0;
					  tmpvar_21.xyz = tmpvar_20;
					  gl_FragData[0] = tmpvar_21;
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
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 p_2;
					  highp vec3 c_3;
					  highp vec3 o_4;
					  highp vec3 d_5;
					  highp vec2 uv_6;
					  highp float k_7;
					  k_7 = 0.0;
					  uv_6 = xlv_TEXCOORD0;
					  highp vec3 tmpvar_8;
					  tmpvar_8.z = 1.0;
					  tmpvar_8.xy = uv_6;
					  highp vec3 tmpvar_9;
					  tmpvar_9 = (tmpvar_8 - 0.5);
					  o_4 = tmpvar_9;
					  c_3 = vec3(0.0, 0.0, 0.0);
					  lowp vec4 tmpvar_10;
					  tmpvar_10 = texture2D (_MainTex, vec2(0.1, 0.5));
					  d_5 = (tmpvar_9 + (tmpvar_10.xyz * 0.01));
					  for (highp int i_1_1 = 0; i_1_1 < 12; i_1_1++) {
					    p_2 = (o_4 + (sin(
					(_TimeX / 2.0)
					) / 2.0));
					    for (highp int j_11 = 0; j_11 < 10; j_11++) {
					      highp vec3 tmpvar_12;
					      tmpvar_12 = (abs((p_2.zyx - 0.4)) - 0.9);
					      p_2 = tmpvar_12;
					      k_7 = (k_7 + exp((-1.25 * 
					        abs(dot (o_4, tmpvar_12))
					      )));
					    };
					    k_7 = (k_7 / 3.0);
					    o_4 = (o_4 + ((d_5 * 0.4) * k_7));
					    highp vec3 tmpvar_13;
					    tmpvar_13.z = -0.01;
					    tmpvar_13.x = ((k_7 * k_7) * (k_7 * 3.173));
					    tmpvar_13.y = ((k_7 * k_7) * -0.041);
					    c_3 = ((0.97 * c_3) + ((0.1 * k_7) * tmpvar_13));
					  };
					  highp vec2 x_14;
					  x_14 = (vec2(0.5, 0.5) - uv_6);
					  highp float tmpvar_15;
					  tmpvar_15 = clamp (((
					    sqrt(dot (x_14, x_14))
					   - _Value) / (
					    ((_Value - 0.05) - _Value2)
					   - _Value)), 0.0, 1.0);
					  c_3 = (0.4 * log((1.0 + c_3)));
					  c_3 = (c_3 - 0.5);
					  highp vec2 tmpvar_16;
					  tmpvar_16.x = ((c_3.x / 2.0) * uv_6.x);
					  tmpvar_16.y = ((c_3.x / 2.0) * uv_6.y);
					  lowp vec4 tmpvar_17;
					  tmpvar_17 = texture2D (_MainTex, tmpvar_16);
					  c_3 = (c_3 + tmpvar_17.xyz);
					  lowp vec4 tmpvar_18;
					  tmpvar_18 = texture2D (_MainTex, uv_6);
					  highp vec4 tmpvar_19;
					  tmpvar_19.w = 0.0;
					  tmpvar_19.xyz = c_3;
					  highp vec3 tmpvar_20;
					  tmpvar_20 = mix (tmpvar_18, tmpvar_19, vec4((1.0 - (tmpvar_15 * 
					    (tmpvar_15 * (3.0 - (2.0 * tmpvar_15)))
					  )))).xyz;
					  c_3 = tmpvar_20;
					  highp vec4 tmpvar_21;
					  tmpvar_21.w = 1.0;
					  tmpvar_21.xyz = tmpvar_20;
					  gl_FragData[0] = tmpvar_21;
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
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 p_2;
					  highp vec3 c_3;
					  highp vec3 o_4;
					  highp vec3 d_5;
					  highp vec2 uv_6;
					  highp float k_7;
					  k_7 = 0.0;
					  uv_6 = xlv_TEXCOORD0;
					  highp vec3 tmpvar_8;
					  tmpvar_8.z = 1.0;
					  tmpvar_8.xy = uv_6;
					  highp vec3 tmpvar_9;
					  tmpvar_9 = (tmpvar_8 - 0.5);
					  o_4 = tmpvar_9;
					  c_3 = vec3(0.0, 0.0, 0.0);
					  lowp vec4 tmpvar_10;
					  tmpvar_10 = texture2D (_MainTex, vec2(0.1, 0.5));
					  d_5 = (tmpvar_9 + (tmpvar_10.xyz * 0.01));
					  for (highp int i_1_1 = 0; i_1_1 < 12; i_1_1++) {
					    p_2 = (o_4 + (sin(
					(_TimeX / 2.0)
					) / 2.0));
					    for (highp int j_11 = 0; j_11 < 10; j_11++) {
					      highp vec3 tmpvar_12;
					      tmpvar_12 = (abs((p_2.zyx - 0.4)) - 0.9);
					      p_2 = tmpvar_12;
					      k_7 = (k_7 + exp((-1.25 * 
					        abs(dot (o_4, tmpvar_12))
					      )));
					    };
					    k_7 = (k_7 / 3.0);
					    o_4 = (o_4 + ((d_5 * 0.4) * k_7));
					    highp vec3 tmpvar_13;
					    tmpvar_13.z = -0.01;
					    tmpvar_13.x = ((k_7 * k_7) * (k_7 * 3.173));
					    tmpvar_13.y = ((k_7 * k_7) * -0.041);
					    c_3 = ((0.97 * c_3) + ((0.1 * k_7) * tmpvar_13));
					  };
					  highp vec2 x_14;
					  x_14 = (vec2(0.5, 0.5) - uv_6);
					  highp float tmpvar_15;
					  tmpvar_15 = clamp (((
					    sqrt(dot (x_14, x_14))
					   - _Value) / (
					    ((_Value - 0.05) - _Value2)
					   - _Value)), 0.0, 1.0);
					  c_3 = (0.4 * log((1.0 + c_3)));
					  c_3 = (c_3 - 0.5);
					  highp vec2 tmpvar_16;
					  tmpvar_16.x = ((c_3.x / 2.0) * uv_6.x);
					  tmpvar_16.y = ((c_3.x / 2.0) * uv_6.y);
					  lowp vec4 tmpvar_17;
					  tmpvar_17 = texture2D (_MainTex, tmpvar_16);
					  c_3 = (c_3 + tmpvar_17.xyz);
					  lowp vec4 tmpvar_18;
					  tmpvar_18 = texture2D (_MainTex, uv_6);
					  highp vec4 tmpvar_19;
					  tmpvar_19.w = 0.0;
					  tmpvar_19.xyz = c_3;
					  highp vec3 tmpvar_20;
					  tmpvar_20 = mix (tmpvar_18, tmpvar_19, vec4((1.0 - (tmpvar_15 * 
					    (tmpvar_15 * (3.0 - (2.0 * tmpvar_15)))
					  )))).xyz;
					  c_3 = tmpvar_20;
					  highp vec4 tmpvar_21;
					  tmpvar_21.w = 1.0;
					  tmpvar_21.xyz = tmpvar_20;
					  gl_FragData[0] = tmpvar_21;
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
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					lowp vec3 u_xlat10_1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec4 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					vec3 u_xlat8;
					vec3 u_xlat9;
					mediump vec2 u_xlat16_9;
					vec3 u_xlat13;
					float u_xlat27;
					int u_xlati28;
					int u_xlati29;
					bool u_xlatb29;
					float u_xlat30;
					bool u_xlatb30;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy;
					    u_xlat0.z = 1.0;
					    u_xlat0.xyz = u_xlat0.xyz + vec3(-0.5, -0.5, -0.5);
					    u_xlat10_1.xyz = texture(_MainTex, vec2(0.100000001, 0.5)).xyz;
					    u_xlat1.xyz = u_xlat10_1.xyz * vec3(0.00999999978, 0.00999999978, 0.00999999978) + u_xlat0.xyz;
					    u_xlat27 = _TimeX * 0.5;
					    u_xlat27 = sin(u_xlat27);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(0.400000006, 0.400000006, 0.400000006);
					    u_xlat2.xyz = u_xlat0.xyz;
					    u_xlat3.x = float(0.0);
					    u_xlat3.y = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat4.x = 0.0;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<12 ; u_xlati_loop_1++)
					    {
					        u_xlat5.xyz = vec3(u_xlat27) * vec3(0.5, 0.5, 0.5) + u_xlat2.xyz;
					        u_xlat6.xyz = u_xlat5.xyz;
					        u_xlat7.z = u_xlat4.x;
					        for(int u_xlati_loop_2 = 0 ; u_xlati_loop_2<10 ; u_xlati_loop_2++)
					        {
					            u_xlat8.xyz = u_xlat6.zyx + vec3(-0.400000006, -0.400000006, -0.400000006);
					            u_xlat6.xyz = abs(u_xlat8.xyz) + vec3(-0.899999976, -0.899999976, -0.899999976);
					            u_xlat30 = dot(u_xlat2.xyz, u_xlat6.xyz);
					            u_xlat30 = abs(u_xlat30) * -1.80336881;
					            u_xlat30 = exp2(u_xlat30);
					            u_xlat7.z = u_xlat30 + u_xlat7.z;
					        }
					        u_xlat4.xy = u_xlat7.zz * vec2(0.333333343, 0.0333333351);
					        u_xlat2.xyz = u_xlat1.xyz * u_xlat4.xxx + u_xlat2.xyz;
					        u_xlat4.zw = u_xlat4.xx * u_xlat4.xy;
					        u_xlat7.xy = vec2(u_xlat4.z * u_xlat4.w, u_xlat4.y * u_xlat4.z);
					        u_xlat13.xyz = u_xlat7.xyz * vec3(3.1730001, -0.0410000011, -0.00033333333);
					        u_xlat3.xyz = u_xlat3.xyz * vec3(0.970000029, 0.970000029, 0.970000029) + u_xlat13.xyz;
					    }
					    u_xlat0.x = _Value + -0.0500000007;
					    u_xlat0.x = u_xlat0.x + (-_Value2);
					    u_xlat16_9.xy = (-vs_TEXCOORD0.xy) + vec2(0.5, 0.5);
					    u_xlat16_9.x = dot(u_xlat16_9.xy, u_xlat16_9.xy);
					    u_xlat0.y = sqrt(u_xlat16_9.x);
					    u_xlat0.xy = u_xlat0.xy + (-vec2(vec2(_Value, _Value)));
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * u_xlat0.y;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat9.x = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = (-u_xlat9.x) * u_xlat0.x + 1.0;
					    u_xlat9.xyz = u_xlat3.xyz + vec3(1.0, 1.0, 1.0);
					    u_xlat9.xyz = log2(u_xlat9.xyz);
					    u_xlat9.xyz = u_xlat9.xyz * vec3(0.277258873, 0.277258873, 0.277258873) + vec3(-0.5, -0.5, -0.5);
					    u_xlat1.x = u_xlat9.x * 0.5;
					    u_xlat1.xy = u_xlat1.xx * vs_TEXCOORD0.xy;
					    u_xlat10_1.xyz = texture(_MainTex, u_xlat1.xy).xyz;
					    u_xlat9.xyz = u_xlat9.xyz + u_xlat10_1.xyz;
					    u_xlat10_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat9.xyz = u_xlat9.xyz + (-u_xlat10_1.xyz);
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat9.xyz + u_xlat10_1.xyz;
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
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					lowp vec3 u_xlat10_1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec4 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					vec3 u_xlat8;
					vec3 u_xlat9;
					mediump vec2 u_xlat16_9;
					vec3 u_xlat13;
					float u_xlat27;
					int u_xlati28;
					int u_xlati29;
					bool u_xlatb29;
					float u_xlat30;
					bool u_xlatb30;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy;
					    u_xlat0.z = 1.0;
					    u_xlat0.xyz = u_xlat0.xyz + vec3(-0.5, -0.5, -0.5);
					    u_xlat10_1.xyz = texture(_MainTex, vec2(0.100000001, 0.5)).xyz;
					    u_xlat1.xyz = u_xlat10_1.xyz * vec3(0.00999999978, 0.00999999978, 0.00999999978) + u_xlat0.xyz;
					    u_xlat27 = _TimeX * 0.5;
					    u_xlat27 = sin(u_xlat27);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(0.400000006, 0.400000006, 0.400000006);
					    u_xlat2.xyz = u_xlat0.xyz;
					    u_xlat3.x = float(0.0);
					    u_xlat3.y = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat4.x = 0.0;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<12 ; u_xlati_loop_1++)
					    {
					        u_xlat5.xyz = vec3(u_xlat27) * vec3(0.5, 0.5, 0.5) + u_xlat2.xyz;
					        u_xlat6.xyz = u_xlat5.xyz;
					        u_xlat7.z = u_xlat4.x;
					        for(int u_xlati_loop_2 = 0 ; u_xlati_loop_2<10 ; u_xlati_loop_2++)
					        {
					            u_xlat8.xyz = u_xlat6.zyx + vec3(-0.400000006, -0.400000006, -0.400000006);
					            u_xlat6.xyz = abs(u_xlat8.xyz) + vec3(-0.899999976, -0.899999976, -0.899999976);
					            u_xlat30 = dot(u_xlat2.xyz, u_xlat6.xyz);
					            u_xlat30 = abs(u_xlat30) * -1.80336881;
					            u_xlat30 = exp2(u_xlat30);
					            u_xlat7.z = u_xlat30 + u_xlat7.z;
					        }
					        u_xlat4.xy = u_xlat7.zz * vec2(0.333333343, 0.0333333351);
					        u_xlat2.xyz = u_xlat1.xyz * u_xlat4.xxx + u_xlat2.xyz;
					        u_xlat4.zw = u_xlat4.xx * u_xlat4.xy;
					        u_xlat7.xy = vec2(u_xlat4.z * u_xlat4.w, u_xlat4.y * u_xlat4.z);
					        u_xlat13.xyz = u_xlat7.xyz * vec3(3.1730001, -0.0410000011, -0.00033333333);
					        u_xlat3.xyz = u_xlat3.xyz * vec3(0.970000029, 0.970000029, 0.970000029) + u_xlat13.xyz;
					    }
					    u_xlat0.x = _Value + -0.0500000007;
					    u_xlat0.x = u_xlat0.x + (-_Value2);
					    u_xlat16_9.xy = (-vs_TEXCOORD0.xy) + vec2(0.5, 0.5);
					    u_xlat16_9.x = dot(u_xlat16_9.xy, u_xlat16_9.xy);
					    u_xlat0.y = sqrt(u_xlat16_9.x);
					    u_xlat0.xy = u_xlat0.xy + (-vec2(vec2(_Value, _Value)));
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * u_xlat0.y;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat9.x = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = (-u_xlat9.x) * u_xlat0.x + 1.0;
					    u_xlat9.xyz = u_xlat3.xyz + vec3(1.0, 1.0, 1.0);
					    u_xlat9.xyz = log2(u_xlat9.xyz);
					    u_xlat9.xyz = u_xlat9.xyz * vec3(0.277258873, 0.277258873, 0.277258873) + vec3(-0.5, -0.5, -0.5);
					    u_xlat1.x = u_xlat9.x * 0.5;
					    u_xlat1.xy = u_xlat1.xx * vs_TEXCOORD0.xy;
					    u_xlat10_1.xyz = texture(_MainTex, u_xlat1.xy).xyz;
					    u_xlat9.xyz = u_xlat9.xyz + u_xlat10_1.xyz;
					    u_xlat10_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat9.xyz = u_xlat9.xyz + (-u_xlat10_1.xyz);
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat9.xyz + u_xlat10_1.xyz;
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
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					lowp vec3 u_xlat10_1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec4 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					vec3 u_xlat8;
					vec3 u_xlat9;
					mediump vec2 u_xlat16_9;
					vec3 u_xlat13;
					float u_xlat27;
					int u_xlati28;
					int u_xlati29;
					bool u_xlatb29;
					float u_xlat30;
					bool u_xlatb30;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy;
					    u_xlat0.z = 1.0;
					    u_xlat0.xyz = u_xlat0.xyz + vec3(-0.5, -0.5, -0.5);
					    u_xlat10_1.xyz = texture(_MainTex, vec2(0.100000001, 0.5)).xyz;
					    u_xlat1.xyz = u_xlat10_1.xyz * vec3(0.00999999978, 0.00999999978, 0.00999999978) + u_xlat0.xyz;
					    u_xlat27 = _TimeX * 0.5;
					    u_xlat27 = sin(u_xlat27);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(0.400000006, 0.400000006, 0.400000006);
					    u_xlat2.xyz = u_xlat0.xyz;
					    u_xlat3.x = float(0.0);
					    u_xlat3.y = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat4.x = 0.0;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<12 ; u_xlati_loop_1++)
					    {
					        u_xlat5.xyz = vec3(u_xlat27) * vec3(0.5, 0.5, 0.5) + u_xlat2.xyz;
					        u_xlat6.xyz = u_xlat5.xyz;
					        u_xlat7.z = u_xlat4.x;
					        for(int u_xlati_loop_2 = 0 ; u_xlati_loop_2<10 ; u_xlati_loop_2++)
					        {
					            u_xlat8.xyz = u_xlat6.zyx + vec3(-0.400000006, -0.400000006, -0.400000006);
					            u_xlat6.xyz = abs(u_xlat8.xyz) + vec3(-0.899999976, -0.899999976, -0.899999976);
					            u_xlat30 = dot(u_xlat2.xyz, u_xlat6.xyz);
					            u_xlat30 = abs(u_xlat30) * -1.80336881;
					            u_xlat30 = exp2(u_xlat30);
					            u_xlat7.z = u_xlat30 + u_xlat7.z;
					        }
					        u_xlat4.xy = u_xlat7.zz * vec2(0.333333343, 0.0333333351);
					        u_xlat2.xyz = u_xlat1.xyz * u_xlat4.xxx + u_xlat2.xyz;
					        u_xlat4.zw = u_xlat4.xx * u_xlat4.xy;
					        u_xlat7.xy = vec2(u_xlat4.z * u_xlat4.w, u_xlat4.y * u_xlat4.z);
					        u_xlat13.xyz = u_xlat7.xyz * vec3(3.1730001, -0.0410000011, -0.00033333333);
					        u_xlat3.xyz = u_xlat3.xyz * vec3(0.970000029, 0.970000029, 0.970000029) + u_xlat13.xyz;
					    }
					    u_xlat0.x = _Value + -0.0500000007;
					    u_xlat0.x = u_xlat0.x + (-_Value2);
					    u_xlat16_9.xy = (-vs_TEXCOORD0.xy) + vec2(0.5, 0.5);
					    u_xlat16_9.x = dot(u_xlat16_9.xy, u_xlat16_9.xy);
					    u_xlat0.y = sqrt(u_xlat16_9.x);
					    u_xlat0.xy = u_xlat0.xy + (-vec2(vec2(_Value, _Value)));
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * u_xlat0.y;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat9.x = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = (-u_xlat9.x) * u_xlat0.x + 1.0;
					    u_xlat9.xyz = u_xlat3.xyz + vec3(1.0, 1.0, 1.0);
					    u_xlat9.xyz = log2(u_xlat9.xyz);
					    u_xlat9.xyz = u_xlat9.xyz * vec3(0.277258873, 0.277258873, 0.277258873) + vec3(-0.5, -0.5, -0.5);
					    u_xlat1.x = u_xlat9.x * 0.5;
					    u_xlat1.xy = u_xlat1.xx * vs_TEXCOORD0.xy;
					    u_xlat10_1.xyz = texture(_MainTex, u_xlat1.xy).xyz;
					    u_xlat9.xyz = u_xlat9.xyz + u_xlat10_1.xyz;
					    u_xlat10_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat9.xyz = u_xlat9.xyz + (-u_xlat10_1.xyz);
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat9.xyz + u_xlat10_1.xyz;
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