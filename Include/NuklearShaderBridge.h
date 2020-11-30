#ifndef NuklearShaderBridge_h
#define NuklearShaderBridge_h

#import <simd/simd.h>

typedef struct {
  vector_float2 position;
  vector_float2 uv;
  vector_uchar4 color;
} NKVertexIn;

typedef struct {
  matrix_float4x4 projectionMatrix;
} NKUniform;

#endif