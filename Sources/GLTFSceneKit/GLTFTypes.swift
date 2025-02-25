//
//  GLTFTypes.swift
//  GLTFSceneKit
//
//  Created by magicien on 2017/08/18.
//  Copyright © 2017 DarkHorse. All rights reserved.
//

import SceneKit

#if targetEnvironment(macCatalyst)
/* BeginMode */
let GL_POINTS =                 0x0000
let GL_LINES =                  0x0001
let GL_LINE_LOOP =              0x0002
let GL_LINE_STRIP =             0x0003
let GL_TRIANGLES =              0x0004
let GL_TRIANGLE_STRIP =         0x0005
let GL_TRIANGLE_FAN =           0x0006
/* DataType */
let GL_BYTE =                   0x1400
let GL_UNSIGNED_BYTE =          0x1401
let GL_SHORT =                  0x1402
let GL_UNSIGNED_SHORT =         0x1403
let GL_INT =                    0x1404
let GL_UNSIGNED_INT =           0x1405
let GL_FLOAT =                  0x1406
let GL_FIXED =                  0x140C
/* Buffer Objects */
let GL_ARRAY_BUFFER =           0x8892
let GL_ELEMENT_ARRAY_BUFFER =   0x8893
/* TextureMagFilter */
let GL_NEAREST =                0x2600
let GL_LINEAR =                0x2601
/* TextureMinFilter */
/*      GL_NEAREST */
/*      GL_LINEAR */
let GL_NEAREST_MIPMAP_NEAREST =  0x2700
let GL_LINEAR_MIPMAP_NEAREST =   0x2701
let GL_NEAREST_MIPMAP_LINEAR =   0x2702
let GL_LINEAR_MIPMAP_LINEAR =    0x2703
/* TextureWrapMode */
let GL_REPEAT =                  0x2901
let GL_CLAMP_TO_EDGE =           0x812F
let GL_MIRRORED_REPEAT =         0x8370
#endif

let attributeMap: [String: SCNGeometrySource.Semantic] = [
    "POSITION": SCNGeometrySource.Semantic.vertex,
    "NORMAL": SCNGeometrySource.Semantic.normal,
    "TANGENT": SCNGeometrySource.Semantic.tangent,
    "TEXCOORD_0": SCNGeometrySource.Semantic.texcoord,
    "TEXCOORD_1": SCNGeometrySource.Semantic.texcoord,
    "TEXCOORD_2": SCNGeometrySource.Semantic.texcoord,
    "TEXCOORD_3": SCNGeometrySource.Semantic.texcoord,
    "COLOR_0": SCNGeometrySource.Semantic.color,
    "JOINTS_0": SCNGeometrySource.Semantic.boneIndices,
    "JOINTS_1": SCNGeometrySource.Semantic.boneIndices,
    "WEIGHTS_0": SCNGeometrySource.Semantic.boneWeights,
    "WEIGHTS_1": SCNGeometrySource.Semantic.boneWeights
]

let GLTF_BYTE = Int(GL_BYTE)
let GLTF_UNSIGNED_BYTE = Int(GL_UNSIGNED_BYTE)
let GLTF_SHORT = Int(GL_SHORT)
let GLTF_UNSIGNED_SHORT = Int(GL_UNSIGNED_SHORT)
let GLTF_UNSIGNED_INT = Int(GL_UNSIGNED_INT)
let GLTF_FLOAT = Int(GL_FLOAT)

let GLTF_ARRAY_BUFFER = Int(GL_ARRAY_BUFFER)
let GLTF_ELEMENT_ARRAY_BUFFER = Int(GL_ELEMENT_ARRAY_BUFFER)

let GLTF_POINTS = Int(GL_POINTS)
let GLTF_LINES = Int(GL_LINES)
let GLTF_LINE_LOOP = Int(GL_LINE_LOOP)
let GLTF_LINE_STRIP = Int(GL_LINE_STRIP)
let GLTF_TRIANGLES = Int(GL_TRIANGLES)
let GLTF_TRIANGLE_STRIP = Int(GL_TRIANGLE_STRIP)
let GLTF_TRIANGLE_FAN = Int(GL_TRIANGLE_FAN)

let GLTF_NEAREST = Int(GL_NEAREST)
let GLTF_LINEAR = Int(GL_LINEAR)
let GLTF_NEAREST_MIPMAP_NEAREST = Int(GL_NEAREST_MIPMAP_NEAREST)
let GLTF_LINEAR_MIPMAP_NEAREST = Int(GL_LINEAR_MIPMAP_NEAREST)
let GLTF_NEAREST_MIPMAP_LINEAR = Int(GL_NEAREST_MIPMAP_LINEAR)
let GLTF_LINEAR_MIPMAP_LINEAR = Int(GL_LINEAR_MIPMAP_LINEAR)

let GLTF_CLAMP_TO_EDGE = Int(GL_CLAMP_TO_EDGE)
let GLTF_MIRRORED_REPEAT = Int(GL_MIRRORED_REPEAT)
let GLTF_REPEAT = Int(GL_REPEAT)

let usesFloatComponentsMap: [Int: Bool] = [
    GLTF_BYTE: false,
    GLTF_UNSIGNED_BYTE: false,
    GLTF_SHORT: false,
    GLTF_UNSIGNED_SHORT: false,
    GLTF_UNSIGNED_INT: false,
    GLTF_FLOAT: true
]

let bytesPerComponentMap: [Int: Int] = [
    GLTF_BYTE: 1,
    GLTF_UNSIGNED_BYTE: 1,
    GLTF_SHORT: 2,
    GLTF_UNSIGNED_SHORT: 2,
    GLTF_UNSIGNED_INT: 4,
    GLTF_FLOAT: 4
]

let componentsPerVectorMap: [String: Int] = [
    "SCALAR": 1,
    "VEC2": 2,
    "VEC3": 3,
    "VEC4": 4,
    "MAT2": 4,
    "MAT3": 9,
    "MAT4": 16
]

// GLTF_LINE_LOOP, GLTF_LINE_STRIP, GLTF_TRIANGEL_FAN: need to convert
let primitiveTypeMap: [Int: SCNGeometryPrimitiveType] = [
    GLTF_POINTS: SCNGeometryPrimitiveType.point,
    GLTF_LINES: SCNGeometryPrimitiveType.line,
    GLTF_TRIANGLES: SCNGeometryPrimitiveType.triangles,
    GLTF_TRIANGLE_STRIP: SCNGeometryPrimitiveType.triangleStrip
]

let filterModeMap: [Int: SCNFilterMode] = [
    GLTF_NEAREST: SCNFilterMode.nearest,
    GLTF_LINEAR: SCNFilterMode.linear
]

let wrapModeMap: [Int: SCNWrapMode] = [
    GLTF_CLAMP_TO_EDGE: SCNWrapMode.clamp,
    GLTF_MIRRORED_REPEAT: SCNWrapMode.mirror,
    GLTF_REPEAT: SCNWrapMode.repeat
]

let keyPathMap: [String: String] = [
    "translation": "position",
    "rotation": "orientation",
    "scale": "scale"
]

#if os(macOS)
    typealias Image = NSImage
    typealias Color = NSColor
#elseif os(iOS) || os(tvOS) || os(watchOS)
    typealias Image = UIImage
    typealias Color = UIColor
#endif

public protocol GLTFCodable: Codable {
    func didLoad(by object: Any, unarchiver: GLTFUnarchiver)
}

protocol GLTFPropertyProtocol: GLTFCodable {
    /** Dictionary object with extension-specific objects. */
    var extensions: GLTFExtension? { get }
    
    /** Application-specific data. */
    var extras: GLTFExtras? { get }
}

extension GLTFPropertyProtocol {
    func didLoad(by object: Any, unarchiver: GLTFUnarchiver) {
        if let extensions = self.extensions?.extensions {
            for ext in extensions.values {
                if let codable = ext as? GLTFCodable {
                    codable.didLoad(by: object, unarchiver: unarchiver)
                }
            }
        }
    }
}


