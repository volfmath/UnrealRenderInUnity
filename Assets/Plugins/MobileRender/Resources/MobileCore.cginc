#ifndef MOBILECORE_INCLUDE
#define MOBILECORE_INCLUDE


struct FVertexFactoryInput
{
	float4 Position		: POSITION;
	float3 Normal		: NORMAL;
#if defined(USE_TANGENT)
	half4  Tangent		: TANGENT;
#endif
	float2 UV0			: TEXCOORD0;
	float2 UV1			: TEXCOORD1;
	UNITY_VERTEX_INPUT_INSTANCE_ID
};

struct FVertexFactoryInterpolantsVSTOPS
{
	UNITY_POSITION(pos);
#if defined(DEPTH_OUTPUT)
	half4 normal	:	NORMAL;
#else 
	half3 normal	:	NORMAL;
#endif

#if defined(USE_TANGENT)
	half4 tanget	:   TANGENT;
#endif

	float4 uv		:   TEXCOORD0;
	half3 viewDIr	:   TEXCOORD1;
	float worldPos	:	TEXCOORD2;
	half3 light		:	TEXCOORD3;
	UNITY_VERTEX_INPUT_INSTANCE_ID
};


vs_output


#endif //MOBILECORE_INCLUDE