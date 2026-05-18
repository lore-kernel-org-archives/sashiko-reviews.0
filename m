Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022072.outbound.protection.outlook.com [52.101.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C50305669
	for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 06:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779087015; cv=fail; b=cCMp62v3Lud+5xAaREXuwgeRER6aXCP88glfph0+YaxNaeOX0T9x18FzdsmezCznf7tN9qEIx7KDtP39W640MDB7QHkaTKd0eYdQaps6u0XwCGM8VLxdkruI4TCT461UVQY+V2rifa9Ex8PVnhjK1Hr1S8PLzsvqwOIwnPajkFQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779087015; c=relaxed/simple;
	bh=Sv9BioCfKnDvfmo1jwUzC+eNbat3aQiFoFrUSuf31wo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rtBgcxsZ+6guIvkR6H4PG0iyt6gGypFNR1ns0U4tQydkBSDje31JDZaqMO7NTHNP3H3YOwMmU8zqU+0iElDXr/XWTHA94KfPwPP7o5Yo9ICgegtXUwc4yper98fEaxC05f96cR+m92PlJsN1aoMdmi5FYDU6T5RVg/i2xT4hiZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=Rf2FQFvl; arc=fail smtp.client-ip=52.101.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="Rf2FQFvl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yOFeEkDNgdFFTZ7pQ2rgb17AdRyTbcfp+F9O05u37SXBvfrwCyTaJrGDGF/GxcSmoEAPFtWOmy6Y3bpaeUeZSNDDKnyRoa/8fVSeZ6C9YSfx3ODsncnPuT+4g8cKx7AeL2p1Gf6VA52M3OYwpT7bZPVOyiquCJNgnpDicP2IZddGA2svJBrPfr4lEioyMfrnNBmnEJ5yXyw02PHe62imYadveE8RPqAoAo95HGhf+DEjFQw+kWdxCHfUmdzdvnj9+lhl0+rGZy4q2QpdlP4A7P1xv8LW46E5pQo3VEcg4TMpkHFEg/oKIc4ukNn0xOqUfCH/va5fQp5GJ2WHgDz6kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sv9BioCfKnDvfmo1jwUzC+eNbat3aQiFoFrUSuf31wo=;
 b=Bknr4ol7zuA/kzYVNvHxTTYwpeLVzpn4oxEakw+OdTqD9a8gzlKUmxqhtVXThMdhWteSVRp0JGJ1RjnxpM8Oc2jgXHco1T3IMtjdTSUpBR7p2uai+xx+zE2JGukyi+BorJW1B0MGfrLB3kkmFLD+8ZtthvsnV4qfaeVAOPgYaVmUIIaN5O2Rt0YGYYIGUkEFUbddT0SaGxfp1aenzxOq0xPfHth6n79t+zKYDF0niHaJ1t5b4LnurGn/+MB5mP3+TH3I4cMf4r+YcE1NtoGs46JuIZc0lflTZKMzC2mhCotbdxTkeZgdpotG1iNZUiKAb8LdWVTn4Wg+2GFM1C9PQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sv9BioCfKnDvfmo1jwUzC+eNbat3aQiFoFrUSuf31wo=;
 b=Rf2FQFvliIkGM7tIJbkedmnpD6u5/NkdrPgdikU5vHJ41UC8l5qDVIfEu6yATow+3w1QN150mlBYsMNS2oNyhzEapAUdkHFyiKhttOGQRNFTwWCtltzYaKP+aYvlatpwjc4hvRSqjT1NEXlDo3PiIR1oU1Gf8BQd6CsT7zp3EQcfo7xvn3MUOziiT/26KDZviLNW7nfNyBghu0+08k84NAFzjYVP7nswQ8g92MZ5nS8S8ImOaOsgwZDeHeSbAQXcYk1xofX0UfZq1qfzUdCCXVpOC0dWO1kber17fxR3DPF2KeBFIpmcsoHDjcyed5uwFh/+ZBvTefafH/EG4a2Rnw==
Received: from TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com (2603:1096:408::791)
 by SEZPR06MB8975.apcprd06.prod.outlook.com (2603:1096:101:33b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.20; Mon, 18 May
 2026 06:50:10 +0000
Received: from TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
 ([fe80::b696:e104:1f5e:7838]) by TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
 ([fe80::b696:e104:1f5e:7838%7]) with mapi id 15.20.9913.009; Mon, 18 May 2026
 06:50:09 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH RESEND v29 1/4] dt-bindings: i2c: Split AST2600 binding
 into a new YAML
Thread-Topic: [PATCH RESEND v29 1/4] dt-bindings: i2c: Split AST2600 binding
 into a new YAML
Thread-Index: AQHc4pnb91x2nqBBnUKfKdVRgeEO7bYMw3QAgAaZMVA=
Date: Mon, 18 May 2026 06:50:09 +0000
Message-ID:
 <TY2PPF5CB9A1BE63BB9DB475E786838B7CCF2032@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
References: <20260513-upstream_i2c-v29-1-fe9926964d55@aspeedtech.com>
 <20260514015232.8FC29C19425@smtp.kernel.org>
In-Reply-To: <20260514015232.8FC29C19425@smtp.kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PPF5CB9A1BE6:EE_|SEZPR06MB8975:EE_
x-ms-office365-filtering-correlation-id: c8477f8a-4020-4cb3-1e1c-08deb4a9b3b1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|3023799003|18002099003|56012099003|22082099003|4143699003;
x-microsoft-antispam-message-info:
 nIM9QIP1j+f5P4AFemlV8OeTFGXteE6JS1BS1Nsn8+IZT+fxudYo45SSi2IomnxBG/yZaPpOIxKfGvcC+EvpnkdRED0L7pMx96/STj5b3bfyCcmOyAPQs96iNyCg9DaHBK7sgDFQaTo1D+C8wgC1jsZDNvb2WpnLvf2OFwkv/ZfUxuWNDu6zo2UDzuwFrlna3QNOWA+TyJlT+oCTFAX+xtdUh+WmwKIVZwTEkNdz6xRacNLD56QQsJCzNJ+T3d/wkg/allcfYlMfchyJyO0o6lewQr1w/dK0BGX0VRS4D0YkSce+5MiZ+wJ+l7LS90vVCmF4gepGiAJEhdc/0k/H1W+2R+/BLFy47/kKZyF1yTATe2zSlAQ+4QVM8NdRAqlulSQpmyEH3KraqJK4GjkLOXt60vQ+UXXloS+S7xOagOxa41Zr3KN8XrZBLCT1HdnqoLpcMvOid2oUaWnAgi40P35U3QE75XboL7ggSebvvqfy+zsZHllXiPjAWI3npIYcrHdd3VxLftSotRdM4nGrv4n7n0Gef6xWdMxgr2edZTtcUVrLIzmUYuCq3YAdtOw1hU+m7ayvsj68TejC02y82NDg8AafoGZzQIU3gkmRgqF8PERbMeNesazIj2dLYADmT9jP+XiXgsG+H2nX93Kgj1Y0asl2sLMqPEeXnzh+Ts2bNrRfn0SQl4uYBJ/q0ApS
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(3023799003)(18002099003)(56012099003)(22082099003)(4143699003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cnFoVWF3TW9NSEp6blFSTGIvK2txMFJkZ3NHYkhKRVBWZ2hBNit0dEJXSkF5?=
 =?utf-8?B?K09oMUsybzlGbzlQeGNjeWlYQitpZi9vaXJCMldocEFHMmV2SlJ3cTdKZ0VC?=
 =?utf-8?B?ejMrMzVoNmszalpZaU9PblFjZnJrU1kycTZ5ZjZUYStXWlphQnFyRk10d1JD?=
 =?utf-8?B?WCtlNld4V2RFMUdDdDJ6MVFpZngrcHdTZnl5YXBxUVpSUXUwb3NNUy9aN2RY?=
 =?utf-8?B?SXNQVUN4V2NYSWdrWTNHditlUlRsVk1SWi9PbHlKVzJzSW5yM1NZcURwbUlu?=
 =?utf-8?B?c2lwS1dCeU43NVJXNVdsRHk5emVPeE95c2tYaXhNR2tGcm5oOEUvWW5GK1Ro?=
 =?utf-8?B?S0lUUDdXL3VmSVRGUGVKOTZlanZXTWo1MzlpREd3MjlIZGtvMUpVdzVIc2du?=
 =?utf-8?B?U1hDSnJEdWRpZlFhM2dtNFpNUzAvVks1WCtmYllOanp6WWxJNGlnT2lvVk5G?=
 =?utf-8?B?c3ZTWGxKeFNJeEhuSUEvUUYyTGttWXJPbXdkVW5YeURQWE9zQ0RycDU4Wnhn?=
 =?utf-8?B?WURQeWdWK0prd0RhNVBhbzBMRTR6MS82UVBBWG14YXZDdncybW0vU25Wbkdj?=
 =?utf-8?B?alppdEVTNXA4RUkvamRLbDJSLzFJQUJwR2kwMGx1RDVWSDlvVEw3T2YybTRs?=
 =?utf-8?B?b2piRkZ3bnZBK1NsSGc3ekp5bHp2elAzUitGSGhFTDNNM1NNMWJnaWQrOFAx?=
 =?utf-8?B?bXF0eElWcTdaWXNYVDZab2dDa3k2a2V4Q2JyYkJpMWxXcDFINnQyYkZLRW12?=
 =?utf-8?B?emNCd2Z4ZmNMditPc1VZc1lKOGNUNUJHQXFIdEwwSTVsd1laTHN3NHRIdEVm?=
 =?utf-8?B?RnA4UWVKUEFYSlJ1SEsvRy9SdVhncUpKNWtLK0M1dTViczZFak52ZkVzSllL?=
 =?utf-8?B?ajJnS3ZUZHBiQVdQVExlTkg1NUI0dGsrcGx6VkNIdTZXY0RVRGxQaEN0Lzg2?=
 =?utf-8?B?VGFya3VoTEdXMGdlaDhSQTZxYlpIVlBhNDAvY1BoRy9SVnVNTWgvTk1LQWRL?=
 =?utf-8?B?dmFBMjZGWnZ3bUZMZjhiUFdua1pLNU5lV2gzTXBycFIySHd0Rmxkd1Z3Z2M2?=
 =?utf-8?B?K2I0VkJPUmlVaTNUcWJSS0luUURnemdZYStyY1hYTXJzNzlzNXNaVDEvOVdu?=
 =?utf-8?B?U1pMTUdJTFZXV0t3MFlnZk0rZmJ5K1JoV09Ib014R1FnenVmbXAxT0wxVCtq?=
 =?utf-8?B?YkZ6aFU2aExyTWV2LzhSc0pmbU8zTW1yY1BrMURJTzUyQ1dNelJubGNaWFNq?=
 =?utf-8?B?bXh3ZUF2NUV2VnlWZ21ZWkNsL29udFpETXRzaHRDMEVYUTRkckhqNGhCWW1Y?=
 =?utf-8?B?UjVxSlpGTzFmYkdPdm9tVkoyR1dJRHZPVGJKZ0grV0Q4eFJzY0kwVktSMXdK?=
 =?utf-8?B?SXM5OUpiRDFyRzQwcjZjOWd5d0prL1pIVWhveHp2RHJuQ2NhNGkxZVVnZXpY?=
 =?utf-8?B?U3A5V2xzUDBNTFNROHY3b2EzUHBsSXpzaXJuelA1K0VBSDN0QzZnOTBNQ2F4?=
 =?utf-8?B?SlBFZkMyWklTbXFQMC9oSWVEK2JSZytFd3JFaXNRT1NZVFhadytNeDR4YXRT?=
 =?utf-8?B?OUZKVDY3aDVwdWJ6Y0tVY0FUOVRYZ3VrK3I2M0tuRDFCS0M2VVZMZTNWY0NY?=
 =?utf-8?B?TjVpbDBVa25IZXdKQ1BnbTAreDlZM2NLRjlicG5iWC9WNkVvcmdjeEw5anR0?=
 =?utf-8?B?eVBWUVo5Z2xxcTVkN3B2UU0vQ2tTcmhrbzlNRy9TaDYzdkZyR0lpQXZ2WEQ3?=
 =?utf-8?B?cE56cWJXbk1XMUtUT3g4T3FqSWZqUkwxdHhuTVVMdDZVTktYY25GS2p3RDRz?=
 =?utf-8?B?Mm1FNElML05ldmp5Tjl3dVFUU1U1YkVDYi8zM3NPekRMV25jZDh4ekhPTk1V?=
 =?utf-8?B?NGc0RzZzVjIrblJka3hvN1FOSGRIVU9vTmw0RkxDcElpanpjOXN3YTZ3L3hG?=
 =?utf-8?B?U0dOMlMzMlI2eFRpdzlMajJOQkVYT0gvU3JzVno5QUFsMXBjcFJ5WTUrYmJF?=
 =?utf-8?B?RUJvSEQxNHBHS1FtclFCUU51azJqWFZ5bVZVN0VERis3Y0t1b3ZkSmNpbE1u?=
 =?utf-8?B?TnRFQ040cWdud1E2MGFvQlNrRG0vR2l2T243UFl2SDhVNUlVL0gzWWN4YTBN?=
 =?utf-8?B?YUlIODlqaXVYVitHNmZGRitmU0F2M2QxTUVSU001QkhIOFY5NHJyUnQxVmkw?=
 =?utf-8?B?OHV1a3lhc2NjSFpqa29XYXEvR0MvRlRiWjNPN0hqOVJUUldEWmgxblNKVWh2?=
 =?utf-8?B?NUR6QXZGZlM3Q3JsNXRYYm04cVhQVEhWYVZxQUNaSjFrbUpJUDFFQlZBRjRn?=
 =?utf-8?B?bmVaaFFsZlcwQmVlaGpmQ29GZmFKMS9OSUd1NXFseXI2cU1obm1Sdz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c8477f8a-4020-4cb3-1e1c-08deb4a9b3b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2026 06:50:09.0322
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jNdvr7D4K0egJsnmxEq8c1F13EbXmrnw8+HfZ0OHA4cquATOYjvTQ/uS6D0A4zToqM93x7BxobuNPeC7FDJFhBV3I5yxmOoOkkjGetKduR4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB8975

SGVsbG8gUm9iLA0KCVRoYW5rcyB5b3VyIHJldmlldy4NCg0KPiBTdWJqZWN0OiBSZTogW1BBVENI
IFJFU0VORCB2MjkgMS80XSBkdC1iaW5kaW5nczogaTJjOiBTcGxpdCBBU1QyNjAwIGJpbmRpbmcN
Cj4gaW50byBhIG5ldyBZQU1MDQo+IA0KPiBUaGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9u
ISBTYXNoaWtvIEFJIHJldmlldyBmb3VuZCAyIHBvdGVudGlhbCBpc3N1ZShzKSB0bw0KPiBjb25z
aWRlcjoNCj4gLSBbSGlnaF0gVGhlIG5ldyBEVCBiaW5kaW5nIGJyZWFrcyB2YWxpZGF0aW9uIGZv
ciBleGlzdGluZyBBU1QyNjAwIGRldmljZQ0KPiB0cmVlcyBieSBlbmZvcmNpbmcgYSBuZXcgYHJl
Z2AgbGF5b3V0IGFuZCByZW1vdmluZyBgYnVzLWZyZXF1ZW5jeWAuDQo+IC0gW0hpZ2hdIFJlbmFt
aW5nIGBidXMtZnJlcXVlbmN5YCB0byBgY2xvY2stZnJlcXVlbmN5YCBjYXVzZXMgYSBzaWxlbnQN
Cj4gcGVyZm9ybWFuY2UgcmVncmVzc2lvbiB3aXRoIHRoZSBsZWdhY3kgaTJjLWFzcGVlZCBkcml2
ZXIuDQo+IC0tDQo+IA0KPiBjb21taXQgNjI1ZjA2ZTdiNDc1MmE2NzY5ZGUxYjk3Yjc5M2ViMjA0
M2JkYThkZQ0KPiBBdXRob3I6IFJ5YW4gQ2hlbiA8cnlhbl9jaGVuQGFzcGVlZHRlY2guY29tPg0K
PiANCj4gZHQtYmluZGluZ3M6IGkyYzogU3BsaXQgQVNUMjYwMCBiaW5kaW5nIGludG8gYSBuZXcg
WUFNTA0KPiANCj4gVGhlIEFTVDI2MDAgSTJDIGNvbnRyb2xsZXIgaW50cm9kdWNlcyBhIG5ldyBy
ZWdpc3RlciBsYXlvdXQgd2l0aCBzZXBhcmF0ZQ0KPiBjb250cm9sbGVyIGFuZCB0YXJnZXQgYmxv
Y2tzLiBUaGUgYmluZGluZyBmb3IgQVNUMjYwMCBpcyBtb3ZlZCB0byBhIGRlZGljYXRlZA0KPiBh
c3BlZWQsYXN0MjYwMC1pMmMueWFtbCBzY2hlbWEsIHVwZGF0aW5nIHJlcXVpcmVtZW50cyBsaWtl
IGVuZm9yY2luZyB0d28NCj4gcmVnIHJlZ2lvbnMgYW5kIHVzaW5nIGNsb2NrLWZyZXF1ZW5jeSBp
bnN0ZWFkIG9mIGJ1cy1mcmVxdWVuY3kuDQo+IA0KPiA+IGRpZmYgLS1naXQNCj4gPiBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvYXNwZWVkLGFzdDI2MDAtaTJjLnlhbWwN
Cj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvYXNwZWVkLGFzdDI2
MDAtaTJjLnlhbWwNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAw
MDAwMDAuLmRlMmMzNTkwMzdkYTUNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9hc3BlZWQsYXN0MjYwMC1pMmMueWFtbA0K
PiBbIC4uLiBdDQo+ID4gK3Byb3BlcnRpZXM6DQo+ID4gKyAgY29tcGF0aWJsZToNCj4gPiArICAg
IGVudW06DQo+ID4gKyAgICAgIC0gYXNwZWVkLGFzdDI2MDAtaTJjLWJ1cw0KPiA+ICsNCj4gPiAr
ICByZWc6DQo+ID4gKyAgICBpdGVtczoNCj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogY29udHJv
bGxlciByZWdpc3RlcnMNCj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogY29udHJvbGxlciBidWZm
ZXIgc3BhY2UNCj4gDQo+IFdpbGwgZW5mb3JjaW5nIHRoaXMgbmV3IHJlZyBsYXlvdXQgYnJlYWsg
dmFsaWRhdGlvbiBmb3IgZXhpc3RpbmcgQVNUMjYwMCBkZXZpY2UNCj4gdHJlZXM/DQo+IA0KPiBF
eGlzdGluZyBpbi10cmVlIGRldmljZSB0cmVlcyBkZWZpbmUgYSBzaW5nbGUgcmVnIHJlZ2lvbi4g
QmVjYXVzZSB0aGVzZSBkZXZpY2UNCj4gdHJlZXMgYXJlIG5vdCB1cGRhdGVkIGluIHRoaXMgcGF0
Y2ggc2VyaWVzLCBtYWtlIGR0YnNfY2hlY2sgd2lsbCBmYWlsIGZvciBhbGwNCj4gQVNUMjYwMCBi
b2FyZHMuDQo+IA0KPiBTaG91bGQgdGhlIGJpbmRpbmcgcmV0YWluIGJhY2t3YXJkIGNvbXBhdGli
aWxpdHkgYnkgYWxsb3dpbmcgYSBzaW5nbGUgcmVnDQo+IHJlZ2lvbiBmb3IgbGVnYWN5IG5vZGVz
Pw0KDQpJIHBsYW4gc3VibWl0IHYzMCBrZWVwcyB0aGUgYmluZGluZyBiYWNrd2FyZCBjb21wYXRp
YmxlOg0KDQogIHJlZzoNCiAgICBtaW5JdGVtczogMQ0KICAgIGl0ZW1zOg0KICAgICAgLSBkZXNj
cmlwdGlvbjogY29udHJvbGxlciByZWdpc3RlcnMNCiAgICAgIC0gZGVzY3JpcHRpb246IGNvbnRy
b2xsZXIgYnVmZmVyIHNwYWNlDQoNCj4gDQo+IFsgLi4uIF0NCj4gPiArICBjbG9jay1mcmVxdWVu
Y3k6DQo+ID4gKyAgICBkZXNjcmlwdGlvbjogRGVzaXJlZCBvcGVyYXRpbmcgZnJlcXVlbmN5IG9m
IHRoZSBJMkMgYnVzIGluIEh6Lg0KPiA+ICsgICAgbWluaW11bTogNTAwDQo+ID4gKyAgICBtYXhp
bXVtOiA0MDAwMDAwDQo+ID4gKyAgICBkZWZhdWx0OiAxMDAwMDANCj4gPiArDQo+ID4gKyAgcmVz
ZXRzOg0KPiA+ICsgICAgbWF4SXRlbXM6IDENCj4gPiArDQo+ID4gK3JlcXVpcmVkOg0KPiA+ICsg
IC0gcmVnDQo+ID4gKyAgLSBjb21wYXRpYmxlDQo+ID4gKyAgLSBjbG9ja3MNCj4gPiArICAtIHJl
c2V0cw0KPiA+ICsgIC0gaW50ZXJydXB0cw0KPiA+ICsNCj4gPiArdW5ldmFsdWF0ZWRQcm9wZXJ0
aWVzOiBmYWxzZQ0KPiANCj4gQ291bGQgcmVuYW1pbmcgYnVzLWZyZXF1ZW5jeSB0byBjbG9jay1m
cmVxdWVuY3kgY2F1c2UgYSBzaWxlbnQgcGVyZm9ybWFuY2UNCj4gcmVncmVzc2lvbiB3aXRoIHRo
ZSBsZWdhY3kgaTJjLWFzcGVlZCBkcml2ZXI/DQo+IA0KPiBJZiBhIGRldmljZSB0cmVlIGlzIHVw
ZGF0ZWQgdG8gY29uZm9ybSB0byB0aGlzIG5ldyBiaW5kaW5nIChieSByZXBsYWNpbmcNCj4gYnVz
LWZyZXF1ZW5jeSB3aXRoIGNsb2NrLWZyZXF1ZW5jeSkgYnV0IGRvZXMgbm90IGFkZCB0aGUgYXNw
ZWVkLGdsb2JhbC1yZWdzDQo+IHByb3BlcnR5LCB0aGUgbGVnYWN5IGkyYy1hc3BlZWQuYyBkcml2
ZXIgd2lsbCBzdGlsbCBwcm9iZS4NCj4gDQo+IFRoZSBsZWdhY3kgZHJpdmVyIHJlbGllcyBlbnRp
cmVseSBvbiBidXMtZnJlcXVlbmN5IGFuZCBkb2VzIG5vdCB1c2Ugc3RhbmRhcmQNCj4gaGVscGVy
cyBsaWtlIGkyY19wYXJzZV9md190aW1pbmdzKCkgdG8gcmVhZCBjbG9jay1mcmVxdWVuY3kuDQo+
IA0KPiBUaGlzIHdpbGwgY2F1c2UgdGhlIGRyaXZlciB0byBmYWlsIHRvIGZpbmQgdGhlIGJ1cyBm
cmVxdWVuY3kgcHJvcGVydHksIGxvZyBhbiBlcnJvciwNCj4gYW5kIHNpbGVudGx5IGZhbGwgYmFj
ayB0byB0aGUgZGVmYXVsdCAxMDBrSHosIHdoaWNoIHdpbGwgZGVncmFkZSBwZXJmb3JtYW5jZQ0K
PiBmb3IgZmFzdC1tb2RlIGRldmljZXMuDQo+IA0KPiBBZGRpdGlvbmFsbHksIGJlY2F1c2UgdGhl
IGJpbmRpbmcgc2V0cyB1bmV2YWx1YXRlZFByb3BlcnRpZXMgdG8gZmFsc2UgYW5kDQo+IHJlbW92
ZXMgYnVzLWZyZXF1ZW5jeSwgZXhpc3RpbmcgZGV2aWNlIHRyZWVzIHRoYXQgc3RpbGwgdXNlIGJ1
cy1mcmVxdWVuY3kgd2lsbA0KPiBmYWlsIHZhbGlkYXRpb24uDQo+IA0KSSB3aWxsIGFkZCBidXMt
ZnJlcXVlbmN5IGZvciBsZWdhY3kgZHJpdmVyDQoNCiAgYnVzLWZyZXF1ZW5jeToNCiAgICAkcmVm
OiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzINCiAgICBkZXByZWNhdGVk
OiB0cnVlDQogICAgZGVzY3JpcHRpb246DQogICAgICBMZWdhY3kgbmFtZSBmb3IgY2xvY2stZnJl
cXVlbmN5LiBFeGlzdGluZyBBU1QyNjAwIGRldmljZSB0cmVlcw0KICAgICAgdXNlZCB0aGlzIGJl
Zm9yZSB0aGUgYmluZGluZyB3YXMgc3BsaXQgb3V0LiBOZXcgZGV2aWNlIHRyZWVzDQogICAgICBz
aG91bGQgdXNlIHRoZSBzdGFuZGFyZCBjbG9jay1mcmVxdWVuY3kgcHJvcGVydHkgaW5zdGVhZC4N
CiAgICBtaW5pbXVtOiA1MDANCiAgICBtYXhpbXVtOiA0MDAwMDAwDQoNCg0KSXMgdGhpcyB0d28g
bW9kaWZ5IG9rPw0KPiAtLQ0KPiBTYXNoaWtvIEFJIHJldmlldyDCtw0KPiBodHRwczovL3Nhc2hp
a28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA1MTMtdXBzdHJlYW1faTJjLXYyOS0wLWZlOTkyNjk2NGQ1
NUANCj4gYXNwZWVkdGVjaC5jb20/cGFydD0xDQo=
