// Error.swift
//
// Copyright (c) 2014-2016 Alamofire Software Foundation (http://alamofire.org/)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import Foundation

/// The `Error` struct provides a convenience for creating custom Alamofire NSErrors.
public struct Error {
    /// The domain used for creating all Alamofire errors.
    public static let Domain = "com.alamofire.error"

    /// The custom error codes generated by Alamofire.
    public enum Code: Int {
        case InputStreamReadFailed           = -6000
        case OutputStreamWriteFailed         = -6001
        case ContentTypeValidationFailed     = -6002
        case StatusCodeValidationFailed      = -6003
        case DataSerializationFailed         = -6004
        case StringSerializationFailed       = -6005
        case JSONSerializationFailed         = -6006
        case PropertyListSerializationFailed = -6007
    }

    /// Custom keys contained within certain NSError `userInfo` dictionaries generated by Alamofire.
    public struct UserInfoKeys {
        /// The content type user info key for a `.ContentTypeValidationFailed` error stored as a `String` value.
        public static let ContentType = "ContentType"

        /// The status code user info key for a `.StatusCodeValidationFailed` error stored as an `Int` value.
        public static let StatusCode = "StatusCode"
    }

    /**
        Creates an `NSError` with the given error code and failure reason.

        - parameter code:          The error code.
        - parameter failureReason: The failure reason.

        - returns: An `NSError` with the given error code and failure reason.
    */
    @available(*, deprecated=3.4.0)
    public static func errorWithCode(code: Code, failureReason: String) -> NSError {
        return errorWithCode(code.rawValue, failureReason: failureReason)
    }

    /**
        Creates an `NSError` with the given error code and failure reason.

        - parameter code:          The error code.
        - parameter failureReason: The failure reason.

        - returns: An `NSError` with the given error code and failure reason.
    */
    @available(*, deprecated=3.4.0)
    public static func errorWithCode(code: Int, failureReason: String) -> NSError {
        let userInfo = [NSLocalizedFailureReasonErrorKey: failureReason]
        return NSError(domain: Domain, code: code, userInfo: userInfo)
    }

    static func error(domain domain: String = Error.Domain, code: Code, failureReason: String) -> NSError {
        return error(domain: domain, code: code.rawValue, failureReason: failureReason)
    }

    static func error(domain domain: String = Error.Domain, code: Int, failureReason: String) -> NSError {
        let userInfo = [NSLocalizedFailureReasonErrorKey: failureReason]
        return NSError(domain: domain, code: code, userInfo: userInfo)
    }
}
