Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022085.outbound.protection.outlook.com [52.101.126.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B456A36E483
	for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 07:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780038912; cv=fail; b=cKWFRyCTM7mNnG8Iy9KAIIA6fybeZiydgmcwa7IHOGT3334rjHP57HP7YgyOG6MGHTascEeuBWVkmbCBvYdqbJBKP6IJy98h0VFrNLajWvpvNoit4apwnQol9+RsuNEqGAMc0zkFsbsluMm9U5U4LdnzWCg+aBlIKgYOO0aqgjg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780038912; c=relaxed/simple;
	bh=LNSvj8sEFSevmPuNLBaskixQq2C0GQ5yg1juXZR4xX0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TcqyKRpsxzWTJvIo7YHVWHXnHcq+qjbAz/v4xpydOpDF8++LftDZvv+hcVPx2A1iMmdPUG7YqovnuvqBp87u87SFj0GBD8EMa1Pnpu7+7L0sVx3WzNUlDqq3Vog7yGIZjbbJHWV8xRUPRNw+hYn0YvurJUiv2z6dDzQIYZ6/VVY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=AvaGsaee; arc=fail smtp.client-ip=52.101.126.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="AvaGsaee"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NMHZiP8nT/jhW4NQGBfhFgMcTvpjUsG47pZIY18Dah88LQ4WO4lB0G2HEpxuMf975UPd15WwL7ZZKrJVjWiFH73VWpTlfEU3o/3WJoMMRG9ac/YitfRc2cCadV02+yvhKaFeUBTIyETSqWBvP7VoqLno5Sh1S/BsRIpCIGX4ksRsIt45lkjEYMV36+dyeDCpllcnyOOY3rUnPwpaJzeLQxyhnr14Bvux+e9E9+duz/0ATELlkMfUr71X8RssHIG1QeJi3LF+q3FsFnt/VK5XDUOrN5eH6DqtHvMvRQh9x8kGUlENaDJSBjDykA6zeGhNcSJ40oNVp2uVdU4aZfOdiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LNSvj8sEFSevmPuNLBaskixQq2C0GQ5yg1juXZR4xX0=;
 b=yptNk/HZ4Og9uHx5j3yi5+4lVxHKjSvHxMZDXxhtHECVeCgq5213mE4vIC+6k+sjKBpqVQm8vnYVCxjuzvQnKYkgVz25z/+kQ2b7Sqzy65kEq6z2GYgtogY6DxJLBhACId3wf+1A9IluS0/X4tLfKSItTCDoEcbjtlEQzh+EtaeUM75mWJxTjQxs131lPTDzm6wlAMg+ZH/Li434z0q51aeBh3BNHGuSMagrzhh/+8Xk2PCFs6BTPXP1Vg7/EbFn5JyulMcwEnMzYV1S2FfKRSUcx5iifepBb7+3bopu5vl0tnrTP098kOG82xagr0bvCcV32pVDiAxEr3+1VTffhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LNSvj8sEFSevmPuNLBaskixQq2C0GQ5yg1juXZR4xX0=;
 b=AvaGsaeeTIqgJT/N7G/cDFeO4MhBA0BlyCg7Aaf3NU+tN9pRXSiW6HpJaaCOIBMw0MfaIm9GnOmkkbeEN59xxlr1BslR630Xq9cOH6EUYmQC9ZDKovBYwz1ZI+K0Kzxm5SrAcK5skCQWBetgpyz+kGBdmRVZUixrNKgP+Fv4C+AxClvl4+qQ57Bt9W1DsfgVUqsZu8Ki3Mq2aCJmOnvxY/I5RK45GxT0TfXE76SIPvdWhKCoga4z5Lwid7IO9qPeHGKaDF+g3+eUlPBEVoqVci6+jk5VkeRGueXlXiLhupvNMKWWF2gk5ix2O1o+fwqvq8Cj097l0AUL1NQYEaek8w==
Received: from TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com (2603:1096:408::791)
 by KUYPR06MB8964.apcprd06.prod.outlook.com (2603:1096:d10:97::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Fri, 29 May
 2026 07:15:07 +0000
Received: from TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
 ([fe80::b696:e104:1f5e:7838]) by TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
 ([fe80::b696:e104:1f5e:7838%7]) with mapi id 15.21.0048.019; Fri, 29 May 2026
 07:15:07 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "robh@kernel.org" <robh@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>
Subject: RE: [PATCH v30 1/5] dt-bindings: i2c: Split AST2600 binding into a
 new YAML
Thread-Topic: [PATCH v30 1/5] dt-bindings: i2c: Split AST2600 binding into a
 new YAML
Thread-Index: AQHc7nVvMGzjRpulKUCpF04c5MRXoLYjEkuAgAGGR7A=
Date: Fri, 29 May 2026 07:15:06 +0000
Message-ID:
 <TY2PPF5CB9A1BE64BA90A590225C7D30EC1F2162@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
References: <20260528-upstream_i2c-v30-1-5d4f9adc3530@aspeedtech.com>
 <20260528075719.BDC961F000E9@smtp.kernel.org>
In-Reply-To: <20260528075719.BDC961F000E9@smtp.kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PPF5CB9A1BE6:EE_|KUYPR06MB8964:EE_
x-ms-office365-filtering-correlation-id: ace1e963-b8ff-41d7-cea0-08debd5202ff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|56012099006|4143699003|3023799007|18002099003|22082099003;
x-microsoft-antispam-message-info:
 MZX8455K9xj2MCuLzR4UY8id9rzB/ILsspO6kOk0eoBcdpzfkRJ1W78QHbSZoJ9N5iKwucqIWgtkuyhd0IBZm7YZAvJ/zlxHvMGy/9tlSNRSSwoL/GEYoFTVLaStz1oZMfboWs9ApTFPAlDwXX+uBWuKN7Wh5mWXsmEq2AUOhY/KrJOUQQ0AA4EmK/io47OcVVHUed3OtBneL7G0IV75D8OBy6Coez31ttKhhpP82k4BR0WeG5p5+6s2TECROEFWeRT2rnmfQLw3WmikHoD5dTvy9RJD51QuaYxWmIsxSgIpYhAIiTETHC2t3ZLesL2dzd26iPHmxiQUimlelZccInTpXJgYUoz+bF3B82l5bJ6IWr0e67tbTkGCBHVyYLDSMC56Ek3UhlzUQAeOZYQpD5QzB8IH5ZpWEPqZu8qhhy6dEZujw+GO4VwGvOADwQcQTc5aHhJktNQ3rXydzpbEAVbnenoRU8To+w/WYI1T6WGk/kY6MnbCqYLCEKEg6EYfaxN7g6yPG52eiXvFeY+gEiWsahaTQxYn/BAf8XG9yx5u3jWl3pEMUy3L5j0i+WLnP0brP57pRJ2uVq6uiC4J58/sWCuibQbozO/6+GlNV4BctD/iHh7SbtM1ecjwLenRJjLznmmYagmp7soznbA7kSH7ncDQ8xg7L1OMhB2WAyRurPGdqYdCKG61VmKK5uB8
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(56012099006)(4143699003)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Q29OemFETmRLbjFIRXJ4TVJ4RzdxNmRmRXFtdUZDWUl4MVRuVXY1ZGZSS0Jl?=
 =?utf-8?B?eU1yK016Q2ZQQUFlV1RwSVVNaGF5MW1lTFRDUEZOMGtnUDNLUFNsYkJzSmZh?=
 =?utf-8?B?a2lHQ2U1UlRXd0FGaHdJMERvL01vUC9vUlZTUFA5dkJhSHNKM1BrcitPa0Mr?=
 =?utf-8?B?Um1WeUZTVVdVbUpXZlBML3FmMzlSWXpsTGpqZmpaU0V5UWdoOEQ4SXI4dnp2?=
 =?utf-8?B?N1ozUGZyZms3RWNQbnVaTFlrek1JdHVTcDMzRk92RFlPdkNFbEhjTUNUYmxE?=
 =?utf-8?B?R0FXUWFwWGdkUTFhUXVYWmtDeTFkZ3FFblB6aTF4eG9JUFZUOXV2SUlmRWR2?=
 =?utf-8?B?UzhNOTcxUFJqZmVZcWRlank4bUNkUy9HVC9GaVFjS2hhazRsMnRFVVE4S1E1?=
 =?utf-8?B?TEdwMUVDcGtNQm5mNEp2N29iSXBhVmhsRElNU3RVUzZQRkRjdkNIRlR6aGsy?=
 =?utf-8?B?MFFmZU55NVZoSmwycFRYYitsMy94UGp6VWlzeWcyT3lqYXVhQ3J1T3JCVU9R?=
 =?utf-8?B?dWQvd3VRSDdCSjd6U0FxTjBKRVQ0djhBNlJkci81bHdFbGdFSkd5eHlsUzNx?=
 =?utf-8?B?RnU4VlNJdGYvYnFNSkVzb2ZZYkdmdU5VM1h5aS85Q3pVaElGNWgxT1E2ZjNI?=
 =?utf-8?B?Q1dNUE1ZSlJ5eHZnV2pzREo2RTE1S0NPc0xycjV2ZFVsZWJuVG1EMVlmL1Iw?=
 =?utf-8?B?VVNmTGJ6Y0RlSzJLUjd5QUE5OTV3bjg1d2dtcjJRREhNbUtnbjNwamhXSVMz?=
 =?utf-8?B?T2tsQnNjTkU2L2pCYU1SQlRhb2RMQW1XSXpqY0dnZi84S01na3U4MEVoMEVQ?=
 =?utf-8?B?NFNKNEVOS1hnVEZTSzB4ckhJTDBieWI2MzFEZFBhWnpSb0RKak8yOVpZVDRl?=
 =?utf-8?B?NVNDZXlQOVU4ZmxtUlFYSUhWYzgxOHhVQVUwVGJFWFB2SEZkbjhrclBzVm1i?=
 =?utf-8?B?TzR6eDNGdndKdzhTN1laOGJaRDBrR0luQy9aQWRNdHkxaGs5anJnVnJsa2Yz?=
 =?utf-8?B?aVJmSHdxQVpjMzNwbS8vREZzcWdmYyswZlc4ek5ZWUtZM0lXQ2RhYlZXVXJK?=
 =?utf-8?B?RDA1OGhWWTBvdmpsbkFuemVnWEFMbnVRUGlNcklmS1FGSHMyOGRtMnF3UGFi?=
 =?utf-8?B?bW9uZHBvemNKeEsvVGpVcjN0SUtKK0JVYzJxMXFGQllKMTNMME5sUk9pdVFP?=
 =?utf-8?B?L25RbEdBL2ZOYkhERDEvRFlMeVE1NCtOVWJsbmxqN0xCTk9yaGg2MjRLWEFS?=
 =?utf-8?B?OU95WFFYbmVES0xuQzFlL0xFeG5GbG05NTkvbTlTeDRTZ3lxMzVxWUlsUlpu?=
 =?utf-8?B?bGc3UEtyUmxMWnQydkVYc3NsVGFyUXQ4U1lpWWNDNHA2ejZtOUd2NGNES2M2?=
 =?utf-8?B?NForL200UVpXS1pSR3lkVFljNHhxK2Z1dU9LTTlubWVUck9XZnI2aERQWCt1?=
 =?utf-8?B?bnJrQnd3Y0dyRTJ6MEhzcWZncFZQNzY4bVZTNjJ0WXZ3ei84WUpJdXo3M001?=
 =?utf-8?B?NXJHVmdOdlRXelNFUjVJN2Q1bDJXditVdDd3djUyYUlEQ0J2SEMxZEc1c2hh?=
 =?utf-8?B?dkM1bCs4Y0hFbnVDaWRoNnBtU09BYytqMWx2OXljMkNNckZ5RS9YV1ljM3Y5?=
 =?utf-8?B?N2daVE1rcGJwZnorN1V6WnZlN3pDZ0pSaWRNbDZ3cVM1WFdnOWFsUEdVVTJW?=
 =?utf-8?B?M1huekNlZkxsbWZPMUNQc1VPQzkyeVMyZ2xSZHF0ZXpZSU1yZlBmOEV2SXRy?=
 =?utf-8?B?WEpXaDJtb0pzMG5RWko4QVI1MmZ4SmVLVVFVVjhyUEUyWGtrb21VUjJ4Q25O?=
 =?utf-8?B?Tm5rQTBYUktsOHh5U3o0cmVNVU9jMGpNcXhqTHExQjc0S3JrWVVxUFpKOXJI?=
 =?utf-8?B?dENaMkh6NURpNlN5d2FsbnhCZGZKM1IzbTg2MEgyNjIvTCs4V0wxbjQzc3hN?=
 =?utf-8?B?OTl3TnB0YlFSWWdZbndCa0k3M1hSYTV1ZnBhMjV2dVJqMnZtRmRmRUQ2bUdQ?=
 =?utf-8?B?aVpXVVlGcy9RZDY2d3NHMHBZNTMzM0wrQ0pKdGZMdHI3d0FUNDRJY0NmZGlC?=
 =?utf-8?B?Sm1USHZoa1BiNzYvS09lTTBkSzNGbmE1YXlza0FEeTI4U1NJS0N4NEdMaWVn?=
 =?utf-8?B?YjVJWVE5eDloU0RRa3RoUmsxazI1WlUxOVQ1azQrelZUZDBWWkNIRlpoNWFC?=
 =?utf-8?B?dGhhajZERHVuVkYreDVNWFpVRzlCNHBka1k2M0VIT1JsR2haVm9aTGx6UUE2?=
 =?utf-8?B?K1g2TkhIN0MxVTVIYjFmMXBMV0ZEYUd2WnJGd1BRZ0I0NUNtZ3c2dWhQYXpW?=
 =?utf-8?B?QlB5M01oRk1vLzhQQzhwKy8yaXZZbG1RbHJLZWw3Nzd3WGQwU2syZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ace1e963-b8ff-41d7-cea0-08debd5202ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2026 07:15:06.8055
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tSJMGizQDQoQyEdZZJ2vW6PfVQp6133hoaG89c3BvJOAqMXLdeHkWTc1F4m+xossvoLdaUUaOhwL554HENNDJTGPEgB4SqCbHSdK7WU/Vzc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUYPR06MB8964

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYzMCAxLzVdIGR0LWJpbmRpbmdzOiBpMmM6IFNwbGl0IEFT
VDI2MDAgYmluZGluZyBpbnRvIGEgbmV3DQo+IFlBTUwNCj4gDQo+IFRoYW5rIHlvdSBmb3IgeW91
ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkgcmV2aWV3IGZvdW5kIDEgcG90ZW50aWFsIGlzc3Vl
KHMpIHRvDQo+IGNvbnNpZGVyOg0KPiAtIFtNZWRpdW1dIFRoZSBjb21taXQgbWVzc2FnZSBjbGFp
bXMgdGhlIGJpbmRpbmcgcmVxdWlyZXMgdHdvIGByZWdgIHJlZ2lvbnMsDQo+IGJ1dCB0aGUgc2No
ZW1hIHNwZWNpZmllcyBgbWluSXRlbXM6IDFgLCBtYWtpbmcgdGhlIHNlY29uZCByZWdpb24gb3B0
aW9uYWwuDQo+IC0tDQo+IA0KPiBjb21taXQgMWJiNjIyNGIxMTBhODk5MGIzYzk1Y2Q0NGQ2ODNk
MWJhMjQ5ZDk5NA0KPiBBdXRob3I6IFJ5YW4gQ2hlbiA8cnlhbl9jaGVuQGFzcGVlZHRlY2guY29t
Pg0KPiANCj4gZHQtYmluZGluZ3M6IGkyYzogU3BsaXQgQVNUMjYwMCBiaW5kaW5nIGludG8gYSBu
ZXcgWUFNTA0KPiANCj4gVGhpcyBjb21taXQgc2VwYXJhdGVzIHRoZSBBU1QyNjAwIEkyQyBjb250
cm9sbGVyIGJpbmRpbmdzIGZyb20gdGhlIG9sZGVyDQo+IEFTVDI0MDAvQVNUMjUwMCBzY2hlbWFz
IGludG8gYSBkZWRpY2F0ZWQgZmlsZS4gSXQgYWxzbyB1cGRhdGVzIHRoZSBzY2hlbWEgdG8NCj4g
ZW5mb3JjZSBBU1QyNjAwLXNwZWNpZmljIGNvbnN0cmFpbnRzIGxpa2UgaW50ZXJydXB0cywgY2xv
Y2sgZnJlcXVlbmNpZXMsIGFuZA0KPiByZWdpc3RlciByZWdpb25zLg0KPiANCj4gPiBkaWZmIC0t
Z2l0DQo+ID4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2FzcGVlZCxh
c3QyNjAwLWkyYy55YW1sDQo+ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
aTJjL2FzcGVlZCxhc3QyNjAwLWkyYy55YW1sDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4g
PiBpbmRleCAwMDAwMDAwMDAwMDAwLi5hYmM2MTQzMTVkZmZiDQo+ID4gLS0tIC9kZXYvbnVsbA0K
PiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvYXNwZWVkLGFz
dDI2MDAtaTJjLnlhbWwNCj4gDQo+IFsgLi4uIF0NCj4gDQo+ID4gK3Byb3BlcnRpZXM6DQo+ID4g
KyAgY29tcGF0aWJsZToNCj4gPiArICAgIGVudW06DQo+ID4gKyAgICAgIC0gYXNwZWVkLGFzdDI2
MDAtaTJjLWJ1cw0KPiA+ICsNCj4gPiArICByZWc6DQo+ID4gKyAgICBtaW5JdGVtczogMQ0KPiAN
Cj4gW1NldmVyaXR5OiBNZWRpdW1dDQo+IFRoZSBjb21taXQgbWVzc2FnZSBzdGF0ZXMgdGhhdCB0
aGlzIGJpbmRpbmcgYWRqdXN0cyBBU1QyNjAwLXNwZWNpZmljDQo+IHJlcXVpcmVtZW50cyB0byAi
cmVxdWlyZSB0d28gcmVnIHJlZ2lvbnMgKGNvbnRyb2xsZXIgcmVnaXN0ZXIgYmxvY2sgKyBidWZm
ZXINCj4gYmxvY2spIi4NCj4gDQo+IFNob3VsZCBtaW5JdGVtcyBiZSBzZXQgdG8gMiBoZXJlIHRv
IGVuZm9yY2UgdGhhdCByZXF1aXJlbWVudD8gU2V0dGluZyBpdCB0byAxDQo+IG1ha2VzIHRoZSBz
ZWNvbmQgcmVnaW9uIG9wdGlvbmFsLCB3aGljaCBhbGxvd3MgZGV2aWNlIHRyZWUgbm9kZXMgd2l0
aCBvbmx5IGENCj4gc2luZ2xlIHJlZyByZWdpb24gdG8gc2lsZW50bHkgcGFzcyBzY2hlbWEgdmFs
aWRhdGlvbi4NCg0KSSB3aWxsIHVwZGF0ZSBpbiBjb21taXQgbWVzc2FnZSANCiAgICAtIGRlc2Ny
aWJlIHR3byByZWcgcmVnaW9ucyAoY29udHJvbGxlciByZWdpc3RlciBibG9jayArIGJ1ZmZlciBi
bG9jayk7DQogICAgICB0aGUgc2Vjb25kIHJlZ2lvbiBpcyBvcHRpb25hbCAobWluSXRlbXM6IDEp
IHNvIGV4aXN0aW5nIEFTVDI2MDAgRFRzDQogICAgICB0aGF0IG9ubHkgZGVjbGFyZSB0aGUgY29u
dHJvbGxlciByZWdpc3RlciBibG9jayBjb250aW51ZSB0byB2YWxpZGF0ZQ0KDQo+IA0KPiA+ICsg
ICAgaXRlbXM6DQo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IGNvbnRyb2xsZXIgcmVnaXN0ZXJz
DQo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IGNvbnRyb2xsZXIgYnVmZmVyIHNwYWNlDQo+IA0K
PiBbIC4uLiBdDQo+IA0KPiAtLQ0KPiBTYXNoaWtvIEFJIHJldmlldyDCtw0KPiBodHRwczovL3Nh
c2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA1MjgtdXBzdHJlYW1faTJjLXYzMC0wLTVkNGY5YWRj
MzUzMEANCj4gYXNwZWVkdGVjaC5jb20/cGFydD0xDQo=
