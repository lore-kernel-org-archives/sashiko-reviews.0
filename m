Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023141.outbound.protection.outlook.com [52.101.127.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E74374E40
	for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 05:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789537598; cv=fail; b=Cl/KcUYHANkZ5/jLtphNPARS6ysmEhrZ6JMPxWUN8iczwRwEOKfEd9J6di3X7BLsGzUlPmEaC23tXXNQrpoHIQIG049Fcb5Lrath9tGZmsZ5iRdbC4RgFKI1DKG4gjt1G/UXu/hU3zSVtXU5TVcJSX39MQlHpECFPDjAKejndUU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789537598; c=relaxed/simple;
	bh=xm/O+5OtDOgysvD94oRICWmIuWy7KajqIW20z1yftV0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rcNfpokN2z7ouYCySAPYAv4xM03m+D2sTes4XN4Vrudn7wiiEohI2yIi4y60NQ7PMRGIxZNCk/IThyy3XDUHKcu1HutsnP/F6LfZ0LZIIhxvEBYQBtfgaybz55eDN8o310KDW5KNaOKtniC2yeKgDK+Q9+gyCJ6NUG4XW/0Xe0Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=R0RWY13x; arc=fail smtp.client-ip=52.101.127.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="R0RWY13x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=awBu9jarN3Pk3bsrI11dEnImtOd+g6P64UVnp4BW9VHHZdCeYuSSYND2kxJU5uSA3PCBesa/vZoc8Hp4ILSLYHTnTnsgYyybF4B/vKlrHhZC8RrCkYzDgM9++pf2qvWsqyxtz46Y2T/mJ1N9pQm8E8YxcfIIBJnRV+E/CYMClHOat1YTJ2jqWtMAJ+oRc3fcFgSliKBc6dDr9OSXrUU4ailjdGIogukrKYkw7tileH9vyHe5DgeRrGtzNLE12tKehb+cGrnqnAozK6Aj22HRMm601ozhpzlrDL7JFPNaE0tB195ROTrEMhcKz2Hfu1x2uST91ltRPl6hBo2RBBlqTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xm/O+5OtDOgysvD94oRICWmIuWy7KajqIW20z1yftV0=;
 b=sFyWVfz33cHhI+41Rz1kjuiJIwvrNuuS9cUEop3KD73NnDw/Rem6sW9btx/OzJgDU9IhqUJGL78Xnch18qGH3tAIL0l0pdkfhUbJJ43PFztIvbYtrZmn94fYVvBXEgGBmdqT3QrRxUAiWCbXntKAeJ5TAghzRKKmvGsrfsUI1z1XRyqBF/kYrMtFnqKsiMesjTEHspiliN2+sTUu6UD932uLdcwYLZjX3AA4DZzSWfaclkMuU1vGu5Miiky16GSxWrX7CZfVyb9ZhadeImL33dE/Fcgc7Y//DIuFAJ/rt5hVTTnQR6Utyyh4aqJaUldrP5vgG42bbLq3twebA+LEDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xm/O+5OtDOgysvD94oRICWmIuWy7KajqIW20z1yftV0=;
 b=R0RWY13xcg63ngs74AeLBrDAWhsAaVmPyZWg/5OXRpmMYxmLux2kOUq2Ks38ALNqiPnmQKdor4G29B21+R7kohx9I+TTV3F9svHTFzjMMNwrIXbjgygC9K3NrbMch+ghkYAFypbSYbjW+UKWnXNSVa+yEseg54OWnwBZRROm3ydx5Fx6pwa8+GTGot36V/fhjNk9n9lKjRv0hftAQo4pHbTVBzr6nLajlmeST+gObMcJN9UUhCpSsmpE66kA+LBJEKbTAZFPEWkC+nxmu+l2nHj5oFOOXN9jJbS5fpLntwWT41vxqqul7TWcXjWxREu9v16imvamIsyxRGHLAK383g==
Received: from TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com (2603:1096:408::791)
 by KL1PR06MB6322.apcprd06.prod.outlook.com (2603:1096:820:cc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 05:46:30 +0000
Received: from TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
 ([fe80::e00f:6219:946c:195e]) by TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
 ([fe80::e00f:6219:946c:195e%4]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 05:46:30 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "conor+dt@kernel.org" <conor+dt@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH v3 6/9] EDAC/aspeed: Replace regmap with direct register
 access
Thread-Topic: [PATCH v3 6/9] EDAC/aspeed: Replace regmap with direct register
 access
Thread-Index: AQHdRZyGjntoWwDmF02SSQSthUZuQrbQsHMAgAABppA=
Date: Wed, 16 Sep 2026 05:46:30 +0000
Message-ID:
 <TY2PPF5CB9A1BE65CD598859EA2A1D98443F2B92@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
References: <20260916-edac-v3-0-23e9ed2fbdf9@aspeedtech.com>
 <20260916-edac-v3-6-23e9ed2fbdf9@aspeedtech.com>
 <20260916054010.AADE81F000FF@smtp.kernel.org>
In-Reply-To: <20260916054010.AADE81F000FF@smtp.kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PPF5CB9A1BE6:EE_|KL1PR06MB6322:EE_
x-ms-office365-filtering-correlation-id: 255ae727-bd65-4ca0-c480-08df13b5dbd8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|10067099003|6133799003|22082099003|18002099003|56012099006|5023799004|4143699003|38070700021;
x-microsoft-antispam-message-info:
 iQFS8Na2zWXHtvPNo42d3EDVdANorMs0Tt5Opm1hB5SRF+vg15dFldyWXX02YmvqwMYmCHDwG08MC1fa3dEoxXdFkvIlRd5PCn8rlO2B9THuIuiX7V0F0zmNzSRas4LPxaB+OQTjoKk/uQgRP5cgnttMuaKSTmjcbi5lE3Pd2c1kGVlqThHL7oW/Wf5NIq85jefdFgYhXv1LOVApZ0T8ebu0gES7sO1I8aBQvpGVYQdyLBBL0r3vdM5nZtyfFHZDAGj+xGT3LPTldQ+fa9WLUuwTfPnsh7Gwc23mTCNlQGvuhNtZ0zKRMEyqQKMCwygpLg8GaU6RzhoE2hnlCjcfpooLQxU/e/VHiBcnDcY0rHysCoXQjSckvCDGzMndkLpw/FJ+BRtG0RZOIztGqj765Pobo9aSA4plwC8ZH3dr5Hh2V93DloSU/ZyQxehpxcajJUWihOyJzWVnbx0sJYpi/m6/9qigD6LuKkEwz6HR4cXH1kNUK72YTn7/Gw6ZonXSaVlT20S4JzQbtqLEiISut/7/jtgoNN1o+FC1+sT8ChIEtzofEUv55Tmrjv5UVGMusybP+obXQuydU3BbiRuJkq9O+2Lf/l+qRWwLrZbZs6Rzw+DO45wzi/dm6VxVO3ZzaFkcKiWpxFGzQC05bVXoLcrBaGJTwV2xtHumVo0225U=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(10067099003)(6133799003)(22082099003)(18002099003)(56012099006)(5023799004)(4143699003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dklFVTFXcmxxUnNQR1F0UlJvK2RWSHFmNlloc0x4ck5Kb2NQMkhMMWZHcU51?=
 =?utf-8?B?L3llbEVLbkJJNjlvZ1Q0VUhOalN6QXZhY05xUFA3UU5HRDdRb3EyYkxtQ1Bp?=
 =?utf-8?B?blI1N3FoM2ExeHNHOGJ3SFRrbGU5S0FFRHo5dnlEaW1aRTMxcitDbEdFYnVI?=
 =?utf-8?B?RXMxbVVkRlU5Rk9COU1rZUNoQkFtQ0JBSG9JTnlmNE1vNnZnK0pzWk1TQWox?=
 =?utf-8?B?RG1NRmFzSUpsbE13anEyWnNWcXpzWWpKR0FOVGR6ZUwvN1J0bExyc1UwaUNt?=
 =?utf-8?B?R3VGTlVpdlFOVHRGY0xQeDJRRTFsV0xCNnJWZFpDMW5FS2VtL0R2VWdTbWx6?=
 =?utf-8?B?MVBXQlcrWjQ0Zy80VGR3WW5uak9UWkFjeHBQcWV1VVlTRGdOa2pyR3hJMlBD?=
 =?utf-8?B?VUNRM3N6MGYxcUROL3Axa1VLaGtjVVN3VjFwZmhwWHIxcGNyalZwUDhBZXNL?=
 =?utf-8?B?d09YTHZWRXI2dGl6aDFaWXV4ekdoNVRJYlZkdlZZTmtnbU1LQzYxVTU1cHpL?=
 =?utf-8?B?K0dyVGFzY3FMUjNoNkRvdWNRSUxMYzF4L0RVdjJDQU4vRVljd0tQYlp5ajJr?=
 =?utf-8?B?RXNLVkR5cGhTczk3YlhHUGc2TWJTWEhoNWNiWXlTU1ZNMmNvN2MvWCtuZ0tl?=
 =?utf-8?B?UncxK2pkenJDSUJVSWphRDdiTE9MV2dpall3VWdMSFp2WFVlZnIyNjZ4WDdB?=
 =?utf-8?B?REpVQjY3MXVXMHVCVzdYZFhWS1E5VU1FYXdvUVg3Q2I5a1MwRHVYVWNIQm5t?=
 =?utf-8?B?blFoZllGMkdnOExHMW5QVzBPQlZiTExRT0t2czFwRHZIWmZXcjE5MmJIM2U2?=
 =?utf-8?B?K1ZFZDJ6Vm5Qem82TCt6NDFZb2ZTSloxRUFMT2h2cTd4dlRBVUxUWXVmK253?=
 =?utf-8?B?NytGQ2Q1L2U5SjJRTUFheWpnSmh3alpjSk1FZ2t2Y083Q2V0aUYxMGNnaWVk?=
 =?utf-8?B?b2FLZHdsVGJCakNGeVUvOUpjTUE2MWNqN1dhcXpCMit1Y0dlNUVZY3IreDQx?=
 =?utf-8?B?MHBXQzNYRXhSVi9KeHVtNXdXNGhEd1QxME9jTWxxYzNyNUVxWWpURlI1UUY5?=
 =?utf-8?B?TGdVVXZZSXZzaWZkb01iN002SDdURU1iWXRrWTgzTEF1UG1ZZmIzSWpSYng1?=
 =?utf-8?B?MFpXell0ZloyaCtUaElaYWxjS0ZQU2NoallzTktGZC9HZlFNcmhDWExHMzNl?=
 =?utf-8?B?TzQyRnNqZmYvM3VUWFhjc3VOSzFWWkd0OThpYzlwTHFlejZsZncwamF2dzFh?=
 =?utf-8?B?RzJVdUZEQnFFd0NxVUV0WTJaWStxdWxweXhrZUM0WFc5SUJxMU1lSjZFQUdL?=
 =?utf-8?B?UXFZN3NqaUxWb0lFQUIySWdOY2dvMVJIZ1dMemhqZjdGUW9DMXZOSmNrNFpG?=
 =?utf-8?B?eGsvRm1zaXlmMUNPUFZxZU5yY0dJdFppeURpb215ZEo5am1PMXV3ZkdGbGZi?=
 =?utf-8?B?ZTZVTXZieExvcDltU09QVzBXeHliRDVBb0JGeTNVV0FtWHdGaHJLVThCUW9u?=
 =?utf-8?B?ejRMVVBhRmw4cUEvVXFjT0hURXlwWTYycHJYWHhaREdheUZEMk5SQ2RyUnRE?=
 =?utf-8?B?ODEwc1pFRXFCeS96c2l1T21jQ3pEMjVSZlNqMGJxTW9BR3luVWk1OHN1aHdo?=
 =?utf-8?B?cVI4M0pYcTRGU0J6S0daMDg3cGJydXJHWTNWQ2FFQXN6dlh5d1diYkRsa0dY?=
 =?utf-8?B?N3kwU05VZ2svL0V0SzFueHU2Q1A3WHBCRGxabiszeUFja0VBeGJtZFdoRzBj?=
 =?utf-8?B?aWJNWFJYTWowYmxoYmxNSWg4RFJUS2w0eUdadjl5dm1jQzdOVnFLdnA1NWVC?=
 =?utf-8?B?ZUttWnRBUWJiVmxJY1dZKzhTMHpNa001T3ZBVFNaTlFmUENzd1RWZFdWOFdy?=
 =?utf-8?B?RkU5Y3c0dWJybGdXSFdpVldCMzVJMkI2SXdpTjMzcXJKUmViR3h4eUx5VUJu?=
 =?utf-8?B?TWNodUI0T20zM3N6ZUJSaGIweFF4eDJSMzdjTGEyUWFMY1gyTFp4V0Y4TEY2?=
 =?utf-8?B?bkh4dmtIUndLUDVJL3JHUUt1UVZWN3EvbFg4cFBBOExDNmN6VXVtRlI5amly?=
 =?utf-8?B?bkEvTExpUDBuZjU1ZCtBWXNJM2VEajMvenVRYU1XVXJ5Y1dZL0syY1J5VjJQ?=
 =?utf-8?B?OUU5bW9DTzJ4R1l2K3NnbVd1a3cycjYva1dTWnVwT0hqRmtjODZCcEVYMnlF?=
 =?utf-8?B?SWRORlYyUWNoTjFOejdzeTJEQVpiZEg2MVJtenZqbGFQdWFVRlB2VEU3Z1NR?=
 =?utf-8?B?V1FvMVIvUjVKZVVnUXRvTVNpeVlqc0J1T0xwdkVhdHdlZTRITUMrbHl4RlM4?=
 =?utf-8?B?Y2pVcTlaV1Z3d1gxdkoyVGVQN1p3UjllQU5xTVY0YW9CbzJkZ2MxUT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 255ae727-bd65-4ca0-c480-08df13b5dbd8
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2026 05:46:30.8178
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SqH+ZabfQE2Uh72QIRWqiQKngLwshxT4ztzWVWuWydRFQhOpluAaj/PyA35BZTOIC0aKGeHAiWAX4LhnxfvOXS1ksSYT/OO8IP0ZOsi6LEU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6322

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDYvOV0gRURBQy9hc3BlZWQ6IFJlcGxhY2UgcmVnbWFw
IHdpdGggZGlyZWN0IHJlZ2lzdGVyDQo+IGFjY2Vzcw0KPiANCj4gVGhhbmsgeW91IGZvciB5b3Vy
IGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQgMSBwb3RlbnRpYWwgaXNzdWUo
cykgdG8NCj4gY29uc2lkZXI6DQo+IC0gW0xvd10gY2xlYW51cDogbWl4aW5nIGdvdG8gYW5kIHNj
b3BlZF9ndWFyZCgpIGluIGFzcGVlZF9wcm9iZSgpDQo+IC0tDQo+IA0KPiBjb21taXQgYzE0YjI1
YWQwMjMwZTY5NmU4OGYyODVjMDg3MDBiOWMwMmY4M2MxOQ0KPiBBdXRob3I6IFJ5YW4gQ2hlbiA8
cnlhbl9jaGVuQGFzcGVlZHRlY2guY29tPg0KPiANCj4gRURBQy9hc3BlZWQ6IFJlcGxhY2UgcmVn
bWFwIHdpdGggZGlyZWN0IHJlZ2lzdGVyIGFjY2Vzcw0KPiANCj4gVGhpcyBjb21taXQgcmVwbGFj
ZXMgdGhlIHJlZ21hcC1iYXNlZCBNTUlPIGFjY2VzcyBpbiB0aGUgYXNwZWVkLWVkYWMNCj4gZHJp
dmVyIHdpdGggZGlyZWN0IHJlZ2lzdGVyIGFjY2VzcyB1c2luZyByZWFkbCgpL3dyaXRlbCgpLiBJ
dCBpbnRyb2R1Y2VzIGFuIGV4cGxpY2l0DQo+IHJhdyBzcGlubG9jayBhbmQgYW5ub3RhdGVzIHRo
ZSByZWdpc3RlciBiYXNlIHdpdGggX19ndWFyZGVkX2J5KCkgdG8gYWxsb3cNCj4gY29tcGlsZXIt
YmFzZWQgY29udGV4dCBhbmFseXNpcyBjaGVja3MuDQo+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2VkYWMvYXNwZWVkX2VkYWMuYyBiL2RyaXZlcnMvZWRhYy9hc3BlZWRfZWRhYy5jDQo+ID4g
aW5kZXggMzUyOTEwZTFkZWZjNS4uMjZkMmM0NTZjYzBkNiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2
ZXJzL2VkYWMvYXNwZWVkX2VkYWMuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZWRhYy9hc3BlZWRfZWRh
Yy5jDQo+IFsgLi4uIF0NCj4gPiBAQCAtMjc0LDEzICsyNDYsMTEgQEAgc3RhdGljIGludCBhc3Bl
ZWRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZQ0KPiAqcGRldikNCj4gPiAgCWlmIChJU19F
UlIocmVncykpDQo+ID4gIAkJcmV0dXJuIFBUUl9FUlIocmVncyk7DQo+ID4NCj4gPiAtCWFzcGVl
ZF9yZWdtYXAgPSBkZXZtX3JlZ21hcF9pbml0KGRldiwgTlVMTCwgKF9fZm9yY2Ugdm9pZCAqKXJl
Z3MsDQo+ID4gLQkJCQkJICZhc3BlZWRfcmVnbWFwX2NvbmZpZyk7DQo+ID4gLQlpZiAoSVNfRVJS
KGFzcGVlZF9yZWdtYXApKQ0KPiA+IC0JCXJldHVybiBQVFJfRVJSKGFzcGVlZF9yZWdtYXApOw0K
PiA+ICsJc2NvcGVkX2d1YXJkKHJhd19zcGlubG9ja19pcnFzYXZlLCAmYXNwZWVkX2xvY2spDQo+
ID4gKwkJYXNwZWVkX3JlZ3MgPSByZWdzOw0KPiANCj4gW1NldmVyaXR5OiBMb3ddDQo+IERvZXMg
dGhpcyBtaXggc2NvcGUtYmFzZWQgY2xlYW51cCBoZWxwZXJzIHdpdGggZ290by1iYXNlZCBlcnJv
ciBoYW5kbGluZyBpbg0KPiB0aGUgc2FtZSBmdW5jdGlvbj8gVGhlIHN1YnN5c3RlbSBjbGVhbnVw
IGd1aWRlbGluZXMgZXhwbGljaXRseSBmb3JiaWQgbWl4aW5nDQo+IGdvdG8tYmFzZWQgZXJyb3Ig
aGFuZGxpbmcgd2l0aCBzY29wZS1iYXNlZCBjbGVhbnVwIGhlbHBlcnMgKGxpa2UNCj4gc2NvcGVk
X2d1YXJkKSB0byBwcmV2ZW50IG93bmVyc2hpcCBjb25mdXNpb24gYW5kIGxlYWtzLg0KPiANCj4g
TG9va2luZyBmdXJ0aGVyIGRvd24gaW4gYXNwZWVkX3Byb2JlKCksIHRoZSBmdW5jdGlvbiBzdGls
bCByZWxpZXMgb24gZ290byBmb3INCj4gZXJyb3IgY2xlYW51cDoNCj4gDQo+ID4gLQkvKiBiYWls
IG91dCBpZiBFQ0MgbW9kZSBpcyBub3QgY29uZmlndXJlZCAqLw0KPiA+IC0JcmVnbWFwX3JlYWQo
YXNwZWVkX3JlZ21hcCwgQVNQRUVEX01DUl9DT05GLCAmcmVnMDQpOw0KPiA+ICsJcmVnMDQgPSBy
ZWFkbChyZWdzICsgQVNQRUVEX01DUl9DT05GKTsNCj4gWyAuLi4gXQ0KPiA+ICAJLyogcmVnaXN0
ZXIgaW50ZXJydXB0IGhhbmRsZXIgYW5kIGVuYWJsZSBpbnRlcnJ1cHRzICovDQo+ID4gIAlyYyA9
IGNvbmZpZ19pcnEobWNpLCBwZGV2KTsNCj4gPiAgCWlmIChyYykgew0KPiA+ICAJCWRldl9lcnIo
JnBkZXYtPmRldiwgImZhaWxlZCBzZXR0aW5nIHVwIGlycVxuIik7DQo+ID4gIAkJZ290byBwcm9i
ZV9leGl0MDE7DQo+ID4gIAl9DQo+ID4NCj4gPiAgCXJldHVybiAwOw0KPiA+DQo+ID4gIHByb2Jl
X2V4aXQwMToNCj4gPiAgCWVkYWNfbWNfZGVsX21jKCZwZGV2LT5kZXYpOw0KPiA+ICBwcm9iZV9l
eGl0MDI6DQo+ID4gIAllZGFjX21jX2ZyZWUobWNpKTsNCj4gPiAgCXJldHVybiByYzsNCj4gPiAg
fQ0KPiANCj4gU2hvdWxkIHRoaXMgZnVuY3Rpb24gZWl0aGVyIGJlIGNvbXBsZXRlbHkgY29udmVy
dGVkIHRvIHNjb3BlLWJhc2VkIGNsZWFudXAsIG9yDQo+IHN0aWNrIGVudGlyZWx5IHRvIGdvdG8t
YmFzZWQgY2xlYW51cCB0byBhdm9pZCB0aGlzIHBhdHRlcm4gdmlvbGF0aW9uPw0KDQoNClRoaXMg
aXMgdGhlIHNhbWUgZmluZGluZyBhcyBvbiB2MiwgYW5kIHRoZSBjb2RlIGhhcyBub3QgY2hhbmdl
ZCBzaW5jZS4NCg0KTm8gZ290byBjcm9zc2VzIHRoZSBndWFyZC4gVGhlIHNjb3BlZF9ndWFyZCgp
IGNvdmVycyBhIHNpbmdsZQ0KYXNzaWdubWVudCBhbmQgaXRzIHNjb3BlIGVuZHMgYWJvdXQgdGhp
cnR5IGxpbmVzIGJlZm9yZSB0aGUgZmlyc3QgZ290bw0KYmVjb21lcyByZWFjaGFibGUsIHNvIHRo
ZSBoYXphcmQgY2xlYW51cC5oIGRlc2NyaWJlcyAtIGEgZ290byBqdW1waW5nDQpiZXR3ZWVuIHNj
b3BlcyBhbmQgc2tpcHBpbmcgYSBjbGVhbnVwIC0gY2Fubm90IGFyaXNlIGhlcmUuIFRoZSB0d28N
CmxhYmVscyB1bndpbmQgbWNpLCB3aGljaCBubyBjbGVhbnVwIGhlbHBlciBob2xkcy4NCg0KQ29u
dmVydGluZyB0aGUgZXJyb3IgcGF0aHMgaXMgbm90IGF0dHJhY3RpdmU6IHRoZXkgaW1wbGVtZW50
IGENCnR3by1zdGFnZSB0ZWFyZG93biwgZWRhY19tY19kZWxfbWMoKSBmb2xsb3dlZCBieSBlZGFj
X21jX2ZyZWUoKSwgYW5kDQp0aGUgdHdvIGxhYmVscyBkZWxpYmVyYXRlbHkgZW50ZXIgaXQgYXQg
ZGlmZmVyZW50IHN0YWdlcywgd2hpY2ggZG9lcw0Kbm90IG1hcCBvbnRvIGEgc2luZ2xlIF9fZnJl
ZSgpLg0KDQpEcm9wcGluZyB0aGUgZ3VhcmQgaW5zdGVhZCB3b3VsZCBiZSB3b3JzZS4gYXNwZWVk
X3JlZ3MgaXMgYW5ub3RhdGVkDQpfX2d1YXJkZWRfYnkoJmFzcGVlZF9sb2NrKSwgc28gdGhlIGFz
c2lnbm1lbnQgaGFzIHRvIGJlIHNlZW4gYXMgaG9sZGluZw0KdGhlIGxvY2sgZm9yIHRoZSBDT05G
SUdfV0FSTl9DT05URVhUX0FOQUxZU0lTIGNoZWNrIHRvIHBhc3MuIFJlbW92aW5nDQp0aGUgZ3Vh
cmQgd291bGQgbWVhbiBvcGVuLWNvZGluZyByYXdfc3Bpbl9sb2NrX2lycXNhdmUoKSBhcm91bmQg
YQ0Kc2luZ2xlIHN0b3JlLCBpbiBhIHBhdGggd2hlcmUgbm8gaGFuZGxlciBpcyByZWdpc3RlcmVk
IHlldCBhbmQgbm90aGluZw0KY2FuIHJhY2UsIHB1cmVseSB0byBzYXRpc2Z5IHRoZSBhbmFseXNp
cy4NCg0KU28gSSBoYXZlIGxlZnQgdGhpcyBhcyBpdCBpcy4NCj4gDQo+IC0tDQo+IFNhc2hpa28g
QUkgcmV2aWV3IMK3DQo+IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDkxNi1l
ZGFjLXYzLTAtMjNlOWVkMmZiZGY5QGFzcGVlZHRlYw0KPiBoLmNvbT9wYXJ0PTYNCg==
