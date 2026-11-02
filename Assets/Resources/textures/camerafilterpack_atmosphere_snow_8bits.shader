Shader "CameraFilterPack/Atmosphere_Snow_8bits" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 7171
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
					  highp vec3 col_1;
					  highp vec2 uv_2;
					  uv_2 = xlv_TEXCOORD0;
					  lowp vec3 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, uv_2).xyz;
					  col_1 = tmpvar_3;
					  uv_2 = (uv_2 * 2.0);
					  uv_2 = ((uv_2 - 0.5) * vec2(1.076716, 0.916887));
					  highp vec2 x_4;
					  highp vec2 tmpvar_5;
					  tmpvar_5 = (vec2(_TimeX) * vec2(0.02, 0.501));
					  x_4 = ((uv_2 * 1.01) + tmpvar_5);
					  highp float tmpvar_6;
					  tmpvar_6 = clamp (((
					    ((fract((
					      sin(dot (floor((
					        (x_4 - floor(x_4))
					       * _Value2)), vec2(12.9898, 78.233)))
					     * 43758.55)) * 0.9) * _Value)
					   - 0.9) / 0.1), 0.0, 1.0);
					  highp vec2 x_7;
					  x_7 = ((uv_2 * 1.07) + tmpvar_5);
					  highp float tmpvar_8;
					  tmpvar_8 = clamp (((
					    (fract((sin(
					      dot (floor(((x_7 - 
					        floor(x_7)
					      ) * _Value2)), vec2(12.9898, 78.233))
					    ) * 43758.55)) * _Value)
					   - 0.9) / 0.1), 0.0, 1.0);
					  highp vec2 x_9;
					  x_9 = (uv_2 + (vec2(_TimeX) * vec2(0.05, 0.5)));
					  highp float tmpvar_10;
					  tmpvar_10 = clamp (((
					    ((fract((
					      sin(dot (floor((
					        (x_9 - floor(x_9))
					       * _Value2)), vec2(12.9898, 78.233)))
					     * 43758.55)) * 0.98) * _Value)
					   - 0.9) / 0.1), 0.0, 1.0);
					  highp vec2 x_11;
					  x_11 = ((uv_2 * 0.9) + (vec2(_TimeX) * vec2(0.02, 0.51)));
					  highp float tmpvar_12;
					  tmpvar_12 = clamp (((
					    ((fract((
					      sin(dot (floor((
					        (x_11 - floor(x_11))
					       * _Value2)), vec2(12.9898, 78.233)))
					     * 43758.55)) * 0.99) * _Value)
					   - 0.9) / 0.1), 0.0, 1.0);
					  highp vec2 x_13;
					  x_13 = ((uv_2 * 0.75) + (vec2(_TimeX) * vec2(0.07, 0.493)));
					  highp float tmpvar_14;
					  tmpvar_14 = clamp (((
					    (fract((sin(
					      dot (floor(((x_13 - 
					        floor(x_13)
					      ) * _Value2)), vec2(12.9898, 78.233))
					    ) * 43758.55)) * _Value)
					   - 0.9) / 0.1), 0.0, 1.0);
					  highp vec2 x_15;
					  x_15 = ((uv_2 * 0.5) + (vec2(_TimeX) * vec2(0.03, 0.504)));
					  highp float tmpvar_16;
					  tmpvar_16 = clamp (((
					    (fract((sin(
					      dot (floor(((x_15 - 
					        floor(x_15)
					      ) * _Value2)), vec2(12.9898, 78.233))
					    ) * 43758.55)) * _Value)
					   - 0.94) / 0.06), 0.0, 1.0);
					  highp vec2 x_17;
					  x_17 = ((uv_2 * 0.3) + (vec2(_TimeX) * vec2(0.02, 0.497)));
					  highp float tmpvar_18;
					  tmpvar_18 = clamp (((
					    (fract((sin(
					      dot (floor(((x_17 - 
					        floor(x_17)
					      ) * _Value2)), vec2(12.9898, 78.233))
					    ) * 43758.55)) * _Value)
					   - 0.95) / 0.05000001), 0.0, 1.0);
					  highp vec2 x_19;
					  x_19 = ((uv_2 * 0.1) + (vec2(_TimeX) * vec2(0.0, 0.51)));
					  highp float tmpvar_20;
					  tmpvar_20 = clamp (((
					    (fract((sin(
					      dot (floor(((x_19 - 
					        floor(x_19)
					      ) * _Value2)), vec2(12.9898, 78.233))
					    ) * 43758.55)) * _Value)
					   - 0.96) / 0.04000002), 0.0, 1.0);
					  highp vec2 x_21;
					  x_21 = ((uv_2 * 0.03) + (vec2(_TimeX) * vec2(0.0, 0.523)));
					  highp float tmpvar_22;
					  tmpvar_22 = clamp (((
					    (fract((sin(
					      dot (floor(((x_21 - 
					        floor(x_21)
					      ) * _Value2)), vec2(12.9898, 78.233))
					    ) * 43758.55)) * _Value)
					   - 0.99) / 0.00999999), 0.0, 1.0);
					  highp vec3 tmpvar_23;
					  tmpvar_23 = mix (mix (mix (
					    mix (mix (mix (mix (
					      mix (mix (col_1, vec3(1.0, 1.0, 1.0), vec3((tmpvar_6 * (tmpvar_6 * 
					        (3.0 - (2.0 * tmpvar_6))
					      )))), vec3(1.0, 1.0, 1.0), vec3((tmpvar_8 * (tmpvar_8 * (3.0 - 
					        (2.0 * tmpvar_8)
					      )))))
					    , vec3(1.0, 1.0, 1.0), vec3(
					      (tmpvar_10 * (tmpvar_10 * (3.0 - (2.0 * tmpvar_10))))
					    )), vec3(1.0, 1.0, 1.0), vec3((tmpvar_12 * 
					      (tmpvar_12 * (3.0 - (2.0 * tmpvar_12)))
					    ))), vec3(1.0, 1.0, 1.0), vec3((tmpvar_14 * (tmpvar_14 * 
					      (3.0 - (2.0 * tmpvar_14))
					    )))), vec3(1.0, 1.0, 1.0), vec3((tmpvar_16 * (tmpvar_16 * (3.0 - 
					      (2.0 * tmpvar_16)
					    )))))
					  , vec3(1.0, 1.0, 1.0), vec3(
					    (tmpvar_18 * (tmpvar_18 * (3.0 - (2.0 * tmpvar_18))))
					  )), vec3(1.0, 1.0, 1.0), vec3((tmpvar_20 * 
					    (tmpvar_20 * (3.0 - (2.0 * tmpvar_20)))
					  ))), vec3(1.0, 1.0, 1.0), vec3((tmpvar_22 * (tmpvar_22 * 
					    (3.0 - (2.0 * tmpvar_22))
					  ))));
					  col_1 = tmpvar_23;
					  highp vec4 tmpvar_24;
					  tmpvar_24.w = 1.0;
					  tmpvar_24.xyz = tmpvar_23;
					  gl_FragData[0] = tmpvar_24;
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
					  highp vec3 col_1;
					  highp vec2 uv_2;
					  uv_2 = xlv_TEXCOORD0;
					  lowp vec3 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, uv_2).xyz;
					  col_1 = tmpvar_3;
					  uv_2 = (uv_2 * 2.0);
					  uv_2 = ((uv_2 - 0.5) * vec2(1.076716, 0.916887));
					  highp vec2 x_4;
					  highp vec2 tmpvar_5;
					  tmpvar_5 = (vec2(_TimeX) * vec2(0.02, 0.501));
					  x_4 = ((uv_2 * 1.01) + tmpvar_5);
					  highp float tmpvar_6;
					  tmpvar_6 = clamp (((
					    ((fract((
					      sin(dot (floor((
					        (x_4 - floor(x_4))
					       * _Value2)), vec2(12.9898, 78.233)))
					     * 43758.55)) * 0.9) * _Value)
					   - 0.9) / 0.1), 0.0, 1.0);
					  highp vec2 x_7;
					  x_7 = ((uv_2 * 1.07) + tmpvar_5);
					  highp float tmpvar_8;
					  tmpvar_8 = clamp (((
					    (fract((sin(
					      dot (floor(((x_7 - 
					        floor(x_7)
					      ) * _Value2)), vec2(12.9898, 78.233))
					    ) * 43758.55)) * _Value)
					   - 0.9) / 0.1), 0.0, 1.0);
					  highp vec2 x_9;
					  x_9 = (uv_2 + (vec2(_TimeX) * vec2(0.05, 0.5)));
					  highp float tmpvar_10;
					  tmpvar_10 = clamp (((
					    ((fract((
					      sin(dot (floor((
					        (x_9 - floor(x_9))
					       * _Value2)), vec2(12.9898, 78.233)))
					     * 43758.55)) * 0.98) * _Value)
					   - 0.9) / 0.1), 0.0, 1.0);
					  highp vec2 x_11;
					  x_11 = ((uv_2 * 0.9) + (vec2(_TimeX) * vec2(0.02, 0.51)));
					  highp float tmpvar_12;
					  tmpvar_12 = clamp (((
					    ((fract((
					      sin(dot (floor((
					        (x_11 - floor(x_11))
					       * _Value2)), vec2(12.9898, 78.233)))
					     * 43758.55)) * 0.99) * _Value)
					   - 0.9) / 0.1), 0.0, 1.0);
					  highp vec2 x_13;
					  x_13 = ((uv_2 * 0.75) + (vec2(_TimeX) * vec2(0.07, 0.493)));
					  highp float tmpvar_14;
					  tmpvar_14 = clamp (((
					    (fract((sin(
					      dot (floor(((x_13 - 
					        floor(x_13)
					      ) * _Value2)), vec2(12.9898, 78.233))
					    ) * 43758.55)) * _Value)
					   - 0.9) / 0.1), 0.0, 1.0);
					  highp vec2 x_15;
					  x_15 = ((uv_2 * 0.5) + (vec2(_TimeX) * vec2(0.03, 0.504)));
					  highp float tmpvar_16;
					  tmpvar_16 = clamp (((
					    (fract((sin(
					      dot (floor(((x_15 - 
					        floor(x_15)
					      ) * _Value2)), vec2(12.9898, 78.233))
					    ) * 43758.55)) * _Value)
					   - 0.94) / 0.06), 0.0, 1.0);
					  highp vec2 x_17;
					  x_17 = ((uv_2 * 0.3) + (vec2(_TimeX) * vec2(0.02, 0.497)));
					  highp float tmpvar_18;
					  tmpvar_18 = clamp (((
					    (fract((sin(
					      dot (floor(((x_17 - 
					        floor(x_17)
					      ) * _Value2)), vec2(12.9898, 78.233))
					    ) * 43758.55)) * _Value)
					   - 0.95) / 0.05000001), 0.0, 1.0);
					  highp vec2 x_19;
					  x_19 = ((uv_2 * 0.1) + (vec2(_TimeX) * vec2(0.0, 0.51)));
					  highp float tmpvar_20;
					  tmpvar_20 = clamp (((
					    (fract((sin(
					      dot (floor(((x_19 - 
					        floor(x_19)
					      ) * _Value2)), vec2(12.9898, 78.233))
					    ) * 43758.55)) * _Value)
					   - 0.96) / 0.04000002), 0.0, 1.0);
					  highp vec2 x_21;
					  x_21 = ((uv_2 * 0.03) + (vec2(_TimeX) * vec2(0.0, 0.523)));
					  highp float tmpvar_22;
					  tmpvar_22 = clamp (((
					    (fract((sin(
					      dot (floor(((x_21 - 
					        floor(x_21)
					      ) * _Value2)), vec2(12.9898, 78.233))
					    ) * 43758.55)) * _Value)
					   - 0.99) / 0.00999999), 0.0, 1.0);
					  highp vec3 tmpvar_23;
					  tmpvar_23 = mix (mix (mix (
					    mix (mix (mix (mix (
					      mix (mix (col_1, vec3(1.0, 1.0, 1.0), vec3((tmpvar_6 * (tmpvar_6 * 
					        (3.0 - (2.0 * tmpvar_6))
					      )))), vec3(1.0, 1.0, 1.0), vec3((tmpvar_8 * (tmpvar_8 * (3.0 - 
					        (2.0 * tmpvar_8)
					      )))))
					    , vec3(1.0, 1.0, 1.0), vec3(
					      (tmpvar_10 * (tmpvar_10 * (3.0 - (2.0 * tmpvar_10))))
					    )), vec3(1.0, 1.0, 1.0), vec3((tmpvar_12 * 
					      (tmpvar_12 * (3.0 - (2.0 * tmpvar_12)))
					    ))), vec3(1.0, 1.0, 1.0), vec3((tmpvar_14 * (tmpvar_14 * 
					      (3.0 - (2.0 * tmpvar_14))
					    )))), vec3(1.0, 1.0, 1.0), vec3((tmpvar_16 * (tmpvar_16 * (3.0 - 
					      (2.0 * tmpvar_16)
					    )))))
					  , vec3(1.0, 1.0, 1.0), vec3(
					    (tmpvar_18 * (tmpvar_18 * (3.0 - (2.0 * tmpvar_18))))
					  )), vec3(1.0, 1.0, 1.0), vec3((tmpvar_20 * 
					    (tmpvar_20 * (3.0 - (2.0 * tmpvar_20)))
					  ))), vec3(1.0, 1.0, 1.0), vec3((tmpvar_22 * (tmpvar_22 * 
					    (3.0 - (2.0 * tmpvar_22))
					  ))));
					  col_1 = tmpvar_23;
					  highp vec4 tmpvar_24;
					  tmpvar_24.w = 1.0;
					  tmpvar_24.xyz = tmpvar_23;
					  gl_FragData[0] = tmpvar_24;
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
					  highp vec3 col_1;
					  highp vec2 uv_2;
					  uv_2 = xlv_TEXCOORD0;
					  lowp vec3 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, uv_2).xyz;
					  col_1 = tmpvar_3;
					  uv_2 = (uv_2 * 2.0);
					  uv_2 = ((uv_2 - 0.5) * vec2(1.076716, 0.916887));
					  highp vec2 x_4;
					  highp vec2 tmpvar_5;
					  tmpvar_5 = (vec2(_TimeX) * vec2(0.02, 0.501));
					  x_4 = ((uv_2 * 1.01) + tmpvar_5);
					  highp float tmpvar_6;
					  tmpvar_6 = clamp (((
					    ((fract((
					      sin(dot (floor((
					        (x_4 - floor(x_4))
					       * _Value2)), vec2(12.9898, 78.233)))
					     * 43758.55)) * 0.9) * _Value)
					   - 0.9) / 0.1), 0.0, 1.0);
					  highp vec2 x_7;
					  x_7 = ((uv_2 * 1.07) + tmpvar_5);
					  highp float tmpvar_8;
					  tmpvar_8 = clamp (((
					    (fract((sin(
					      dot (floor(((x_7 - 
					        floor(x_7)
					      ) * _Value2)), vec2(12.9898, 78.233))
					    ) * 43758.55)) * _Value)
					   - 0.9) / 0.1), 0.0, 1.0);
					  highp vec2 x_9;
					  x_9 = (uv_2 + (vec2(_TimeX) * vec2(0.05, 0.5)));
					  highp float tmpvar_10;
					  tmpvar_10 = clamp (((
					    ((fract((
					      sin(dot (floor((
					        (x_9 - floor(x_9))
					       * _Value2)), vec2(12.9898, 78.233)))
					     * 43758.55)) * 0.98) * _Value)
					   - 0.9) / 0.1), 0.0, 1.0);
					  highp vec2 x_11;
					  x_11 = ((uv_2 * 0.9) + (vec2(_TimeX) * vec2(0.02, 0.51)));
					  highp float tmpvar_12;
					  tmpvar_12 = clamp (((
					    ((fract((
					      sin(dot (floor((
					        (x_11 - floor(x_11))
					       * _Value2)), vec2(12.9898, 78.233)))
					     * 43758.55)) * 0.99) * _Value)
					   - 0.9) / 0.1), 0.0, 1.0);
					  highp vec2 x_13;
					  x_13 = ((uv_2 * 0.75) + (vec2(_TimeX) * vec2(0.07, 0.493)));
					  highp float tmpvar_14;
					  tmpvar_14 = clamp (((
					    (fract((sin(
					      dot (floor(((x_13 - 
					        floor(x_13)
					      ) * _Value2)), vec2(12.9898, 78.233))
					    ) * 43758.55)) * _Value)
					   - 0.9) / 0.1), 0.0, 1.0);
					  highp vec2 x_15;
					  x_15 = ((uv_2 * 0.5) + (vec2(_TimeX) * vec2(0.03, 0.504)));
					  highp float tmpvar_16;
					  tmpvar_16 = clamp (((
					    (fract((sin(
					      dot (floor(((x_15 - 
					        floor(x_15)
					      ) * _Value2)), vec2(12.9898, 78.233))
					    ) * 43758.55)) * _Value)
					   - 0.94) / 0.06), 0.0, 1.0);
					  highp vec2 x_17;
					  x_17 = ((uv_2 * 0.3) + (vec2(_TimeX) * vec2(0.02, 0.497)));
					  highp float tmpvar_18;
					  tmpvar_18 = clamp (((
					    (fract((sin(
					      dot (floor(((x_17 - 
					        floor(x_17)
					      ) * _Value2)), vec2(12.9898, 78.233))
					    ) * 43758.55)) * _Value)
					   - 0.95) / 0.05000001), 0.0, 1.0);
					  highp vec2 x_19;
					  x_19 = ((uv_2 * 0.1) + (vec2(_TimeX) * vec2(0.0, 0.51)));
					  highp float tmpvar_20;
					  tmpvar_20 = clamp (((
					    (fract((sin(
					      dot (floor(((x_19 - 
					        floor(x_19)
					      ) * _Value2)), vec2(12.9898, 78.233))
					    ) * 43758.55)) * _Value)
					   - 0.96) / 0.04000002), 0.0, 1.0);
					  highp vec2 x_21;
					  x_21 = ((uv_2 * 0.03) + (vec2(_TimeX) * vec2(0.0, 0.523)));
					  highp float tmpvar_22;
					  tmpvar_22 = clamp (((
					    (fract((sin(
					      dot (floor(((x_21 - 
					        floor(x_21)
					      ) * _Value2)), vec2(12.9898, 78.233))
					    ) * 43758.55)) * _Value)
					   - 0.99) / 0.00999999), 0.0, 1.0);
					  highp vec3 tmpvar_23;
					  tmpvar_23 = mix (mix (mix (
					    mix (mix (mix (mix (
					      mix (mix (col_1, vec3(1.0, 1.0, 1.0), vec3((tmpvar_6 * (tmpvar_6 * 
					        (3.0 - (2.0 * tmpvar_6))
					      )))), vec3(1.0, 1.0, 1.0), vec3((tmpvar_8 * (tmpvar_8 * (3.0 - 
					        (2.0 * tmpvar_8)
					      )))))
					    , vec3(1.0, 1.0, 1.0), vec3(
					      (tmpvar_10 * (tmpvar_10 * (3.0 - (2.0 * tmpvar_10))))
					    )), vec3(1.0, 1.0, 1.0), vec3((tmpvar_12 * 
					      (tmpvar_12 * (3.0 - (2.0 * tmpvar_12)))
					    ))), vec3(1.0, 1.0, 1.0), vec3((tmpvar_14 * (tmpvar_14 * 
					      (3.0 - (2.0 * tmpvar_14))
					    )))), vec3(1.0, 1.0, 1.0), vec3((tmpvar_16 * (tmpvar_16 * (3.0 - 
					      (2.0 * tmpvar_16)
					    )))))
					  , vec3(1.0, 1.0, 1.0), vec3(
					    (tmpvar_18 * (tmpvar_18 * (3.0 - (2.0 * tmpvar_18))))
					  )), vec3(1.0, 1.0, 1.0), vec3((tmpvar_20 * 
					    (tmpvar_20 * (3.0 - (2.0 * tmpvar_20)))
					  ))), vec3(1.0, 1.0, 1.0), vec3((tmpvar_22 * (tmpvar_22 * 
					    (3.0 - (2.0 * tmpvar_22))
					  ))));
					  col_1 = tmpvar_23;
					  highp vec4 tmpvar_24;
					  tmpvar_24.w = 1.0;
					  tmpvar_24.xyz = tmpvar_23;
					  gl_FragData[0] = tmpvar_24;
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
					vec4 u_xlat0;
					vec2 u_xlat1;
					mediump vec2 u_xlat16_1;
					vec4 u_xlat2;
					lowp vec3 u_xlat10_2;
					vec4 u_xlat3;
					mediump vec3 u_xlat16_3;
					float u_xlat4;
					vec2 u_xlat8;
					vec2 u_xlat9;
					vec2 u_xlat11;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = vec4(_TimeX) * vec4(0.0199999996, 0.500999987, 0.0500000007, 0.5);
					    u_xlat16_1.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-0.5, -0.5);
					    u_xlat2 = u_xlat16_1.xyxy * vec4(1.08748353, 0.926055908, 1.07671642, 0.916887045) + u_xlat0;
					    u_xlat0.xy = u_xlat16_1.xy * vec2(1.15208662, 0.981069207) + u_xlat0.xy;
					    u_xlat3 = floor(u_xlat2);
					    u_xlat2 = u_xlat2 + (-u_xlat3);
					    u_xlat2 = u_xlat2 * vec4(vec4(_Value2, _Value2, _Value2, _Value2));
					    u_xlat2 = floor(u_xlat2);
					    u_xlat8.x = dot(u_xlat2.xy, vec2(12.9898005, 78.2330017));
					    u_xlat8.y = dot(u_xlat2.zw, vec2(12.9898005, 78.2330017));
					    u_xlat8.xy = sin(u_xlat8.xy);
					    u_xlat8.xy = u_xlat8.xy * vec2(43758.5469, 43758.5469);
					    u_xlat8.xy = fract(u_xlat8.xy);
					    u_xlat8.xy = u_xlat8.xy * vec2(vec2(_Value, _Value));
					    u_xlat8.y = u_xlat8.y * 0.980000019 + -0.899999976;
					    u_xlat8.x = u_xlat8.x * 0.899999976 + -0.899999976;
					    u_xlat8.xy = u_xlat8.xy * vec2(9.99999809, 9.99999809);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat8.xy = min(max(u_xlat8.xy, 0.0), 1.0);
					#else
					    u_xlat8.xy = clamp(u_xlat8.xy, 0.0, 1.0);
					#endif
					    u_xlat9.x = u_xlat8.x * -2.0 + 3.0;
					    u_xlat8.x = u_xlat8.x * u_xlat8.x;
					    u_xlat8.x = u_xlat8.x * u_xlat9.x;
					    u_xlat10_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_3.xyz = (-u_xlat10_2.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat2.xyz = u_xlat8.xxx * u_xlat16_3.xyz + u_xlat10_2.xyz;
					    u_xlat3.xyz = (-u_xlat2.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat9.xy = floor(u_xlat0.xy);
					    u_xlat0.xy = u_xlat0.xy + (-u_xlat9.xy);
					    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_Value2, _Value2));
					    u_xlat0.xy = floor(u_xlat0.xy);
					    u_xlat0.x = dot(u_xlat0.xy, vec2(12.9898005, 78.2330017));
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 43758.5469;
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * _Value + -0.899999976;
					    u_xlat0.x = u_xlat0.x * 9.99999809;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat4 = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * u_xlat4;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz + u_xlat2.xyz;
					    u_xlat2.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat9.x = u_xlat8.y * -2.0 + 3.0;
					    u_xlat12 = u_xlat8.y * u_xlat8.y;
					    u_xlat12 = u_xlat12 * u_xlat9.x;
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat3 = vec4(_TimeX) * vec4(0.0199999996, 0.50999999, 0.0700000003, 0.493000001);
					    u_xlat9.xy = u_xlat16_1.xy * vec2(0.969044745, 0.825198293) + u_xlat3.xy;
					    u_xlat3.xy = u_xlat16_1.xy * vec2(0.807537317, 0.687665284) + u_xlat3.zw;
					    u_xlat11.xy = floor(u_xlat9.xy);
					    u_xlat9.xy = u_xlat9.xy + (-u_xlat11.xy);
					    u_xlat9.xy = u_xlat9.xy * vec2(vec2(_Value2, _Value2));
					    u_xlat9.xy = floor(u_xlat9.xy);
					    u_xlat12 = dot(u_xlat9.xy, vec2(12.9898005, 78.2330017));
					    u_xlat12 = sin(u_xlat12);
					    u_xlat12 = u_xlat12 * 43758.5469;
					    u_xlat12 = fract(u_xlat12);
					    u_xlat12 = u_xlat12 * _Value;
					    u_xlat12 = u_xlat12 * 0.99000001 + -0.899999976;
					    u_xlat12 = u_xlat12 * 9.99999809;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
					#else
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					#endif
					    u_xlat9.x = u_xlat12 * -2.0 + 3.0;
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat12 = u_xlat12 * u_xlat9.x;
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat9.xy = floor(u_xlat3.xy);
					    u_xlat9.xy = (-u_xlat9.xy) + u_xlat3.xy;
					    u_xlat9.xy = u_xlat9.xy * vec2(vec2(_Value2, _Value2));
					    u_xlat9.xy = floor(u_xlat9.xy);
					    u_xlat12 = dot(u_xlat9.xy, vec2(12.9898005, 78.2330017));
					    u_xlat12 = sin(u_xlat12);
					    u_xlat12 = u_xlat12 * 43758.5469;
					    u_xlat12 = fract(u_xlat12);
					    u_xlat12 = u_xlat12 * _Value + -0.899999976;
					    u_xlat12 = u_xlat12 * 9.99999809;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
					#else
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					#endif
					    u_xlat9.x = u_xlat12 * -2.0 + 3.0;
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat12 = u_xlat12 * u_xlat9.x;
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat3 = vec4(_TimeX) * vec4(0.0299999993, 0.504000008, 0.0199999996, 0.497000009);
					    u_xlat9.xy = u_xlat16_1.xy * vec2(0.538358212, 0.458443522) + u_xlat3.xy;
					    u_xlat3.xy = u_xlat16_1.xy * vec2(0.323014945, 0.275066137) + u_xlat3.zw;
					    u_xlat11.xy = floor(u_xlat9.xy);
					    u_xlat9.xy = u_xlat9.xy + (-u_xlat11.xy);
					    u_xlat9.xy = u_xlat9.xy * vec2(vec2(_Value2, _Value2));
					    u_xlat9.xy = floor(u_xlat9.xy);
					    u_xlat12 = dot(u_xlat9.xy, vec2(12.9898005, 78.2330017));
					    u_xlat12 = sin(u_xlat12);
					    u_xlat12 = u_xlat12 * 43758.5469;
					    u_xlat12 = fract(u_xlat12);
					    u_xlat12 = u_xlat12 * _Value + -0.939999998;
					    u_xlat12 = u_xlat12 * 16.666666;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
					#else
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					#endif
					    u_xlat9.x = u_xlat12 * -2.0 + 3.0;
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat12 = u_xlat12 * u_xlat9.x;
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat9.xy = floor(u_xlat3.xy);
					    u_xlat9.xy = (-u_xlat9.xy) + u_xlat3.xy;
					    u_xlat9.xy = u_xlat9.xy * vec2(vec2(_Value2, _Value2));
					    u_xlat9.xy = floor(u_xlat9.xy);
					    u_xlat12 = dot(u_xlat9.xy, vec2(12.9898005, 78.2330017));
					    u_xlat12 = sin(u_xlat12);
					    u_xlat12 = u_xlat12 * 43758.5469;
					    u_xlat12 = fract(u_xlat12);
					    u_xlat12 = u_xlat12 * _Value + -0.949999988;
					    u_xlat12 = u_xlat12 * 19.9999962;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
					#else
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					#endif
					    u_xlat9.x = u_xlat12 * -2.0 + 3.0;
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat12 = u_xlat12 * u_xlat9.x;
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat3 = vec4(_TimeX) * vec4(0.0, 0.50999999, 0.0, 0.523000002);
					    u_xlat9.xy = u_xlat16_1.xy * vec2(0.107671641, 0.0916887075) + u_xlat3.xy;
					    u_xlat1.xy = u_xlat16_1.xy * vec2(0.032301493, 0.0275066104) + u_xlat3.zw;
					    u_xlat3.xy = floor(u_xlat9.xy);
					    u_xlat9.xy = u_xlat9.xy + (-u_xlat3.xy);
					    u_xlat9.xy = u_xlat9.xy * vec2(vec2(_Value2, _Value2));
					    u_xlat9.xy = floor(u_xlat9.xy);
					    u_xlat12 = dot(u_xlat9.xy, vec2(12.9898005, 78.2330017));
					    u_xlat12 = sin(u_xlat12);
					    u_xlat12 = u_xlat12 * 43758.5469;
					    u_xlat12 = fract(u_xlat12);
					    u_xlat12 = u_xlat12 * _Value + -0.959999979;
					    u_xlat12 = u_xlat12 * 24.9999866;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
					#else
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					#endif
					    u_xlat9.x = u_xlat12 * -2.0 + 3.0;
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat12 = u_xlat12 * u_xlat9.x;
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat9.xy = floor(u_xlat1.xy);
					    u_xlat1.xy = (-u_xlat9.xy) + u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy * vec2(vec2(_Value2, _Value2));
					    u_xlat1.xy = floor(u_xlat1.xy);
					    u_xlat12 = dot(u_xlat1.xy, vec2(12.9898005, 78.2330017));
					    u_xlat12 = sin(u_xlat12);
					    u_xlat12 = u_xlat12 * 43758.5469;
					    u_xlat12 = fract(u_xlat12);
					    u_xlat12 = u_xlat12 * _Value + -0.99000001;
					    u_xlat12 = u_xlat12 * 100.000099;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
					#else
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					#endif
					    u_xlat1.x = u_xlat12 * -2.0 + 3.0;
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat12 = u_xlat12 * u_xlat1.x;
					    SV_Target0.xyz = vec3(u_xlat12) * u_xlat2.xyz + u_xlat0.xyz;
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
					vec4 u_xlat0;
					vec2 u_xlat1;
					mediump vec2 u_xlat16_1;
					vec4 u_xlat2;
					lowp vec3 u_xlat10_2;
					vec4 u_xlat3;
					mediump vec3 u_xlat16_3;
					float u_xlat4;
					vec2 u_xlat8;
					vec2 u_xlat9;
					vec2 u_xlat11;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = vec4(_TimeX) * vec4(0.0199999996, 0.500999987, 0.0500000007, 0.5);
					    u_xlat16_1.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-0.5, -0.5);
					    u_xlat2 = u_xlat16_1.xyxy * vec4(1.08748353, 0.926055908, 1.07671642, 0.916887045) + u_xlat0;
					    u_xlat0.xy = u_xlat16_1.xy * vec2(1.15208662, 0.981069207) + u_xlat0.xy;
					    u_xlat3 = floor(u_xlat2);
					    u_xlat2 = u_xlat2 + (-u_xlat3);
					    u_xlat2 = u_xlat2 * vec4(vec4(_Value2, _Value2, _Value2, _Value2));
					    u_xlat2 = floor(u_xlat2);
					    u_xlat8.x = dot(u_xlat2.xy, vec2(12.9898005, 78.2330017));
					    u_xlat8.y = dot(u_xlat2.zw, vec2(12.9898005, 78.2330017));
					    u_xlat8.xy = sin(u_xlat8.xy);
					    u_xlat8.xy = u_xlat8.xy * vec2(43758.5469, 43758.5469);
					    u_xlat8.xy = fract(u_xlat8.xy);
					    u_xlat8.xy = u_xlat8.xy * vec2(vec2(_Value, _Value));
					    u_xlat8.y = u_xlat8.y * 0.980000019 + -0.899999976;
					    u_xlat8.x = u_xlat8.x * 0.899999976 + -0.899999976;
					    u_xlat8.xy = u_xlat8.xy * vec2(9.99999809, 9.99999809);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat8.xy = min(max(u_xlat8.xy, 0.0), 1.0);
					#else
					    u_xlat8.xy = clamp(u_xlat8.xy, 0.0, 1.0);
					#endif
					    u_xlat9.x = u_xlat8.x * -2.0 + 3.0;
					    u_xlat8.x = u_xlat8.x * u_xlat8.x;
					    u_xlat8.x = u_xlat8.x * u_xlat9.x;
					    u_xlat10_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_3.xyz = (-u_xlat10_2.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat2.xyz = u_xlat8.xxx * u_xlat16_3.xyz + u_xlat10_2.xyz;
					    u_xlat3.xyz = (-u_xlat2.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat9.xy = floor(u_xlat0.xy);
					    u_xlat0.xy = u_xlat0.xy + (-u_xlat9.xy);
					    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_Value2, _Value2));
					    u_xlat0.xy = floor(u_xlat0.xy);
					    u_xlat0.x = dot(u_xlat0.xy, vec2(12.9898005, 78.2330017));
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 43758.5469;
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * _Value + -0.899999976;
					    u_xlat0.x = u_xlat0.x * 9.99999809;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat4 = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * u_xlat4;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz + u_xlat2.xyz;
					    u_xlat2.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat9.x = u_xlat8.y * -2.0 + 3.0;
					    u_xlat12 = u_xlat8.y * u_xlat8.y;
					    u_xlat12 = u_xlat12 * u_xlat9.x;
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat3 = vec4(_TimeX) * vec4(0.0199999996, 0.50999999, 0.0700000003, 0.493000001);
					    u_xlat9.xy = u_xlat16_1.xy * vec2(0.969044745, 0.825198293) + u_xlat3.xy;
					    u_xlat3.xy = u_xlat16_1.xy * vec2(0.807537317, 0.687665284) + u_xlat3.zw;
					    u_xlat11.xy = floor(u_xlat9.xy);
					    u_xlat9.xy = u_xlat9.xy + (-u_xlat11.xy);
					    u_xlat9.xy = u_xlat9.xy * vec2(vec2(_Value2, _Value2));
					    u_xlat9.xy = floor(u_xlat9.xy);
					    u_xlat12 = dot(u_xlat9.xy, vec2(12.9898005, 78.2330017));
					    u_xlat12 = sin(u_xlat12);
					    u_xlat12 = u_xlat12 * 43758.5469;
					    u_xlat12 = fract(u_xlat12);
					    u_xlat12 = u_xlat12 * _Value;
					    u_xlat12 = u_xlat12 * 0.99000001 + -0.899999976;
					    u_xlat12 = u_xlat12 * 9.99999809;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
					#else
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					#endif
					    u_xlat9.x = u_xlat12 * -2.0 + 3.0;
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat12 = u_xlat12 * u_xlat9.x;
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat9.xy = floor(u_xlat3.xy);
					    u_xlat9.xy = (-u_xlat9.xy) + u_xlat3.xy;
					    u_xlat9.xy = u_xlat9.xy * vec2(vec2(_Value2, _Value2));
					    u_xlat9.xy = floor(u_xlat9.xy);
					    u_xlat12 = dot(u_xlat9.xy, vec2(12.9898005, 78.2330017));
					    u_xlat12 = sin(u_xlat12);
					    u_xlat12 = u_xlat12 * 43758.5469;
					    u_xlat12 = fract(u_xlat12);
					    u_xlat12 = u_xlat12 * _Value + -0.899999976;
					    u_xlat12 = u_xlat12 * 9.99999809;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
					#else
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					#endif
					    u_xlat9.x = u_xlat12 * -2.0 + 3.0;
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat12 = u_xlat12 * u_xlat9.x;
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat3 = vec4(_TimeX) * vec4(0.0299999993, 0.504000008, 0.0199999996, 0.497000009);
					    u_xlat9.xy = u_xlat16_1.xy * vec2(0.538358212, 0.458443522) + u_xlat3.xy;
					    u_xlat3.xy = u_xlat16_1.xy * vec2(0.323014945, 0.275066137) + u_xlat3.zw;
					    u_xlat11.xy = floor(u_xlat9.xy);
					    u_xlat9.xy = u_xlat9.xy + (-u_xlat11.xy);
					    u_xlat9.xy = u_xlat9.xy * vec2(vec2(_Value2, _Value2));
					    u_xlat9.xy = floor(u_xlat9.xy);
					    u_xlat12 = dot(u_xlat9.xy, vec2(12.9898005, 78.2330017));
					    u_xlat12 = sin(u_xlat12);
					    u_xlat12 = u_xlat12 * 43758.5469;
					    u_xlat12 = fract(u_xlat12);
					    u_xlat12 = u_xlat12 * _Value + -0.939999998;
					    u_xlat12 = u_xlat12 * 16.666666;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
					#else
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					#endif
					    u_xlat9.x = u_xlat12 * -2.0 + 3.0;
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat12 = u_xlat12 * u_xlat9.x;
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat9.xy = floor(u_xlat3.xy);
					    u_xlat9.xy = (-u_xlat9.xy) + u_xlat3.xy;
					    u_xlat9.xy = u_xlat9.xy * vec2(vec2(_Value2, _Value2));
					    u_xlat9.xy = floor(u_xlat9.xy);
					    u_xlat12 = dot(u_xlat9.xy, vec2(12.9898005, 78.2330017));
					    u_xlat12 = sin(u_xlat12);
					    u_xlat12 = u_xlat12 * 43758.5469;
					    u_xlat12 = fract(u_xlat12);
					    u_xlat12 = u_xlat12 * _Value + -0.949999988;
					    u_xlat12 = u_xlat12 * 19.9999962;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
					#else
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					#endif
					    u_xlat9.x = u_xlat12 * -2.0 + 3.0;
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat12 = u_xlat12 * u_xlat9.x;
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat3 = vec4(_TimeX) * vec4(0.0, 0.50999999, 0.0, 0.523000002);
					    u_xlat9.xy = u_xlat16_1.xy * vec2(0.107671641, 0.0916887075) + u_xlat3.xy;
					    u_xlat1.xy = u_xlat16_1.xy * vec2(0.032301493, 0.0275066104) + u_xlat3.zw;
					    u_xlat3.xy = floor(u_xlat9.xy);
					    u_xlat9.xy = u_xlat9.xy + (-u_xlat3.xy);
					    u_xlat9.xy = u_xlat9.xy * vec2(vec2(_Value2, _Value2));
					    u_xlat9.xy = floor(u_xlat9.xy);
					    u_xlat12 = dot(u_xlat9.xy, vec2(12.9898005, 78.2330017));
					    u_xlat12 = sin(u_xlat12);
					    u_xlat12 = u_xlat12 * 43758.5469;
					    u_xlat12 = fract(u_xlat12);
					    u_xlat12 = u_xlat12 * _Value + -0.959999979;
					    u_xlat12 = u_xlat12 * 24.9999866;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
					#else
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					#endif
					    u_xlat9.x = u_xlat12 * -2.0 + 3.0;
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat12 = u_xlat12 * u_xlat9.x;
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat9.xy = floor(u_xlat1.xy);
					    u_xlat1.xy = (-u_xlat9.xy) + u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy * vec2(vec2(_Value2, _Value2));
					    u_xlat1.xy = floor(u_xlat1.xy);
					    u_xlat12 = dot(u_xlat1.xy, vec2(12.9898005, 78.2330017));
					    u_xlat12 = sin(u_xlat12);
					    u_xlat12 = u_xlat12 * 43758.5469;
					    u_xlat12 = fract(u_xlat12);
					    u_xlat12 = u_xlat12 * _Value + -0.99000001;
					    u_xlat12 = u_xlat12 * 100.000099;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
					#else
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					#endif
					    u_xlat1.x = u_xlat12 * -2.0 + 3.0;
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat12 = u_xlat12 * u_xlat1.x;
					    SV_Target0.xyz = vec3(u_xlat12) * u_xlat2.xyz + u_xlat0.xyz;
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
					vec4 u_xlat0;
					vec2 u_xlat1;
					mediump vec2 u_xlat16_1;
					vec4 u_xlat2;
					lowp vec3 u_xlat10_2;
					vec4 u_xlat3;
					mediump vec3 u_xlat16_3;
					float u_xlat4;
					vec2 u_xlat8;
					vec2 u_xlat9;
					vec2 u_xlat11;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = vec4(_TimeX) * vec4(0.0199999996, 0.500999987, 0.0500000007, 0.5);
					    u_xlat16_1.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-0.5, -0.5);
					    u_xlat2 = u_xlat16_1.xyxy * vec4(1.08748353, 0.926055908, 1.07671642, 0.916887045) + u_xlat0;
					    u_xlat0.xy = u_xlat16_1.xy * vec2(1.15208662, 0.981069207) + u_xlat0.xy;
					    u_xlat3 = floor(u_xlat2);
					    u_xlat2 = u_xlat2 + (-u_xlat3);
					    u_xlat2 = u_xlat2 * vec4(vec4(_Value2, _Value2, _Value2, _Value2));
					    u_xlat2 = floor(u_xlat2);
					    u_xlat8.x = dot(u_xlat2.xy, vec2(12.9898005, 78.2330017));
					    u_xlat8.y = dot(u_xlat2.zw, vec2(12.9898005, 78.2330017));
					    u_xlat8.xy = sin(u_xlat8.xy);
					    u_xlat8.xy = u_xlat8.xy * vec2(43758.5469, 43758.5469);
					    u_xlat8.xy = fract(u_xlat8.xy);
					    u_xlat8.xy = u_xlat8.xy * vec2(vec2(_Value, _Value));
					    u_xlat8.y = u_xlat8.y * 0.980000019 + -0.899999976;
					    u_xlat8.x = u_xlat8.x * 0.899999976 + -0.899999976;
					    u_xlat8.xy = u_xlat8.xy * vec2(9.99999809, 9.99999809);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat8.xy = min(max(u_xlat8.xy, 0.0), 1.0);
					#else
					    u_xlat8.xy = clamp(u_xlat8.xy, 0.0, 1.0);
					#endif
					    u_xlat9.x = u_xlat8.x * -2.0 + 3.0;
					    u_xlat8.x = u_xlat8.x * u_xlat8.x;
					    u_xlat8.x = u_xlat8.x * u_xlat9.x;
					    u_xlat10_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_3.xyz = (-u_xlat10_2.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat2.xyz = u_xlat8.xxx * u_xlat16_3.xyz + u_xlat10_2.xyz;
					    u_xlat3.xyz = (-u_xlat2.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat9.xy = floor(u_xlat0.xy);
					    u_xlat0.xy = u_xlat0.xy + (-u_xlat9.xy);
					    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_Value2, _Value2));
					    u_xlat0.xy = floor(u_xlat0.xy);
					    u_xlat0.x = dot(u_xlat0.xy, vec2(12.9898005, 78.2330017));
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 43758.5469;
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * _Value + -0.899999976;
					    u_xlat0.x = u_xlat0.x * 9.99999809;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat4 = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * u_xlat4;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz + u_xlat2.xyz;
					    u_xlat2.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat9.x = u_xlat8.y * -2.0 + 3.0;
					    u_xlat12 = u_xlat8.y * u_xlat8.y;
					    u_xlat12 = u_xlat12 * u_xlat9.x;
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat3 = vec4(_TimeX) * vec4(0.0199999996, 0.50999999, 0.0700000003, 0.493000001);
					    u_xlat9.xy = u_xlat16_1.xy * vec2(0.969044745, 0.825198293) + u_xlat3.xy;
					    u_xlat3.xy = u_xlat16_1.xy * vec2(0.807537317, 0.687665284) + u_xlat3.zw;
					    u_xlat11.xy = floor(u_xlat9.xy);
					    u_xlat9.xy = u_xlat9.xy + (-u_xlat11.xy);
					    u_xlat9.xy = u_xlat9.xy * vec2(vec2(_Value2, _Value2));
					    u_xlat9.xy = floor(u_xlat9.xy);
					    u_xlat12 = dot(u_xlat9.xy, vec2(12.9898005, 78.2330017));
					    u_xlat12 = sin(u_xlat12);
					    u_xlat12 = u_xlat12 * 43758.5469;
					    u_xlat12 = fract(u_xlat12);
					    u_xlat12 = u_xlat12 * _Value;
					    u_xlat12 = u_xlat12 * 0.99000001 + -0.899999976;
					    u_xlat12 = u_xlat12 * 9.99999809;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
					#else
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					#endif
					    u_xlat9.x = u_xlat12 * -2.0 + 3.0;
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat12 = u_xlat12 * u_xlat9.x;
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat9.xy = floor(u_xlat3.xy);
					    u_xlat9.xy = (-u_xlat9.xy) + u_xlat3.xy;
					    u_xlat9.xy = u_xlat9.xy * vec2(vec2(_Value2, _Value2));
					    u_xlat9.xy = floor(u_xlat9.xy);
					    u_xlat12 = dot(u_xlat9.xy, vec2(12.9898005, 78.2330017));
					    u_xlat12 = sin(u_xlat12);
					    u_xlat12 = u_xlat12 * 43758.5469;
					    u_xlat12 = fract(u_xlat12);
					    u_xlat12 = u_xlat12 * _Value + -0.899999976;
					    u_xlat12 = u_xlat12 * 9.99999809;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
					#else
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					#endif
					    u_xlat9.x = u_xlat12 * -2.0 + 3.0;
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat12 = u_xlat12 * u_xlat9.x;
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat3 = vec4(_TimeX) * vec4(0.0299999993, 0.504000008, 0.0199999996, 0.497000009);
					    u_xlat9.xy = u_xlat16_1.xy * vec2(0.538358212, 0.458443522) + u_xlat3.xy;
					    u_xlat3.xy = u_xlat16_1.xy * vec2(0.323014945, 0.275066137) + u_xlat3.zw;
					    u_xlat11.xy = floor(u_xlat9.xy);
					    u_xlat9.xy = u_xlat9.xy + (-u_xlat11.xy);
					    u_xlat9.xy = u_xlat9.xy * vec2(vec2(_Value2, _Value2));
					    u_xlat9.xy = floor(u_xlat9.xy);
					    u_xlat12 = dot(u_xlat9.xy, vec2(12.9898005, 78.2330017));
					    u_xlat12 = sin(u_xlat12);
					    u_xlat12 = u_xlat12 * 43758.5469;
					    u_xlat12 = fract(u_xlat12);
					    u_xlat12 = u_xlat12 * _Value + -0.939999998;
					    u_xlat12 = u_xlat12 * 16.666666;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
					#else
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					#endif
					    u_xlat9.x = u_xlat12 * -2.0 + 3.0;
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat12 = u_xlat12 * u_xlat9.x;
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat9.xy = floor(u_xlat3.xy);
					    u_xlat9.xy = (-u_xlat9.xy) + u_xlat3.xy;
					    u_xlat9.xy = u_xlat9.xy * vec2(vec2(_Value2, _Value2));
					    u_xlat9.xy = floor(u_xlat9.xy);
					    u_xlat12 = dot(u_xlat9.xy, vec2(12.9898005, 78.2330017));
					    u_xlat12 = sin(u_xlat12);
					    u_xlat12 = u_xlat12 * 43758.5469;
					    u_xlat12 = fract(u_xlat12);
					    u_xlat12 = u_xlat12 * _Value + -0.949999988;
					    u_xlat12 = u_xlat12 * 19.9999962;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
					#else
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					#endif
					    u_xlat9.x = u_xlat12 * -2.0 + 3.0;
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat12 = u_xlat12 * u_xlat9.x;
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat3 = vec4(_TimeX) * vec4(0.0, 0.50999999, 0.0, 0.523000002);
					    u_xlat9.xy = u_xlat16_1.xy * vec2(0.107671641, 0.0916887075) + u_xlat3.xy;
					    u_xlat1.xy = u_xlat16_1.xy * vec2(0.032301493, 0.0275066104) + u_xlat3.zw;
					    u_xlat3.xy = floor(u_xlat9.xy);
					    u_xlat9.xy = u_xlat9.xy + (-u_xlat3.xy);
					    u_xlat9.xy = u_xlat9.xy * vec2(vec2(_Value2, _Value2));
					    u_xlat9.xy = floor(u_xlat9.xy);
					    u_xlat12 = dot(u_xlat9.xy, vec2(12.9898005, 78.2330017));
					    u_xlat12 = sin(u_xlat12);
					    u_xlat12 = u_xlat12 * 43758.5469;
					    u_xlat12 = fract(u_xlat12);
					    u_xlat12 = u_xlat12 * _Value + -0.959999979;
					    u_xlat12 = u_xlat12 * 24.9999866;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
					#else
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					#endif
					    u_xlat9.x = u_xlat12 * -2.0 + 3.0;
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat12 = u_xlat12 * u_xlat9.x;
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat9.xy = floor(u_xlat1.xy);
					    u_xlat1.xy = (-u_xlat9.xy) + u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy * vec2(vec2(_Value2, _Value2));
					    u_xlat1.xy = floor(u_xlat1.xy);
					    u_xlat12 = dot(u_xlat1.xy, vec2(12.9898005, 78.2330017));
					    u_xlat12 = sin(u_xlat12);
					    u_xlat12 = u_xlat12 * 43758.5469;
					    u_xlat12 = fract(u_xlat12);
					    u_xlat12 = u_xlat12 * _Value + -0.99000001;
					    u_xlat12 = u_xlat12 * 100.000099;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
					#else
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					#endif
					    u_xlat1.x = u_xlat12 * -2.0 + 3.0;
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat12 = u_xlat12 * u_xlat1.x;
					    SV_Target0.xyz = vec3(u_xlat12) * u_xlat2.xyz + u_xlat0.xyz;
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