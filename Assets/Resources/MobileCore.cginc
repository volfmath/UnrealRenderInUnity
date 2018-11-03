#ifndef MOBILECORE_INCLUDE
#define MOBILECORE_INCLUDE



struct vs_input
{
	float4 vertex		: POSITION;
	float3 normal		: NORMAL;
#if defined(USE_TANGENT)
	half4  tangent		: TANGENT;
#endif
	float2 uv0			: TEXCOORD0;
	float2 uv1			: TEXCOORD1;
	UNITY_VERTEX_INPUT_INSTANCE_ID
};

struct vs_output
{
	UNITY_POSITION(pos);

};

#endif //MOBILECORE_INCLUDE