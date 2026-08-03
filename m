Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010070.outbound.protection.outlook.com [52.101.193.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6323FFFB8
	for <sashiko-reviews@lists.linux.dev>; Mon,  3 Aug 2026 13:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785764011; cv=fail; b=poDTqKvVqIw4tqTuK9E1VXDCWoGli4VQKbaQDxGphctQIG3Pm5L/tM6Un7rJhb9RTV1l3gyRVYSAjFn1Osn31vEQMAVN1s77N6QEoCzFxvbbx9qnylvRx2l5HunEwumtDiYS4NxonVcdbd2y7/16T5tkrW33pWE3oX2NvfM9qdg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785764011; c=relaxed/simple;
	bh=6FhzfOg/i7CD+cDDKgOLimHj9HR7yvXuHKOTZFFXUJw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=t/7jm/4bWKVfaxQTCSuJ3OIFpX5Kt1VoYP8wtEqJbtpACoAZhUdT1ohivPZNTCyoYXpnXQCFsa46Oz+dQOsAWM5vRZvTKjMghg/3gd37fVIaBEtRo29cb9+f7HnaFqAfb+J/kCHQG0RpUg0UVlRhdzrdrpaVyH2ZrPuYU543cx4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=4VN5FdL0; arc=fail smtp.client-ip=52.101.193.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="4VN5FdL0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xs+CX3JMFuxsuuXQPdAzawvYDSSpMIFMzaWvR0fAPQd5IUABbSqQlWszAirQWOJ6XBTAFrrbW3ZzQpLLsq53QrAN5jiEKVkz1QxuRx9Q6BNAV6i4Ujz3WlnGCZGaUCwut6mHTpNmrj67+XRZMbNx/ZmdyywCCvPlCnXb50+9JICASa20lq067ZWw/a7CWYD/0iO+XKVBzbi07Yen8UC4Bj5ylUtwZHsCYr9qmS5cpU62NTQMP86+sKdqJ8nzXs6VMkz9Wb2ImnNqnzAfoNYn3h2EeIq3P4F/lCqvI4WpOcZCGTLHLvwTQ3rl5ILSp3fHU05G3p8HFiDQsgoDyMkW9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6FhzfOg/i7CD+cDDKgOLimHj9HR7yvXuHKOTZFFXUJw=;
 b=WKfN3hnjg990N9XKSqeyu7x5O4lQwTpM90Cy46Smr9wHMqgSIDjpfrqXzTBupOOAZcQz8AliKEjyRCaRUB4p12VMdbxNhShfe83+LLZ7QL6/5kYLAsmcwSnDnBhnleOaDHZjrT1vj1ylq8Vhz2I0NEgvcySXBYnbQ0ZhgrtF32l3Lft9MnsZ5qbCw8aSV42HwnodCB4VY8Y9+lhmF9w+JjhogsHIc7OtK6FpKfUAjDe5/Oiv72GVXN4mQoMfpGcuTbNKN5F9MqKXS7y9mOBo/utGpABax/lJjglvuFL/oArKNc+dzDvX7cRScOOArbPgn39NlreoE8U0UQFFXSwBkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6FhzfOg/i7CD+cDDKgOLimHj9HR7yvXuHKOTZFFXUJw=;
 b=4VN5FdL0dHW81xSgj8/iVlNxmzZHXjgG5LfvVBHwE8lo5B3cdSVzzz2boJYr1/FFdmSPIkiydHnWKLLWt9zOlImYzNJ+uk3VSIIuLWrfOfYtwhoIhREkdiy5e2nPx6mfFkOkSizrJ6q/z2f1gcD1CKN9hOw7GUuxjhstJiReL5C9Cp6RznzFbQRKcLj8H9UHkO85mCJDvn9GBamDwKEfvg+J/FbdFBYwN8A86CPcvsIeUVGvogtAoelYdCjt10MXM4hq2bXWGByME5Qkha04iruPN0rGefhglA/nOHdc8YveW+qHtJp5t1oEA9shyPjTuTpsZjvnr+D6WXp/zk8+5Q==
Received: from BY5PR11MB3990.namprd11.prod.outlook.com (2603:10b6:a03:18d::31)
 by IA3PR11MB8966.namprd11.prod.outlook.com (2603:10b6:208:572::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 13:33:10 +0000
Received: from BY5PR11MB3990.namprd11.prod.outlook.com
 ([fe80::2349:6631:bb47:77d3]) by BY5PR11MB3990.namprd11.prod.outlook.com
 ([fe80::2349:6631:bb47:77d3%4]) with mapi id 15.21.0270.017; Mon, 3 Aug 2026
 13:33:09 +0000
From: <JensEmil.SchulzOstergaard@microchip.com>
To: <sashiko-reviews@lists.linux.dev>
CC: <robh@kernel.org>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH net-next v10 2/9] dt-bindings: net: lan9645x: add LAN9645X
 switch bindings
Thread-Topic: [PATCH net-next v10 2/9] dt-bindings: net: lan9645x: add
 LAN9645X switch bindings
Thread-Index: AQHdEtU1YuYQBDugnUuNnS8Q2cgOR7ZtGK2AgB9a5gA=
Date: Mon, 3 Aug 2026 13:33:09 +0000
Message-ID: <83c72841a7f360e9947684334aac3d61af188101.camel@microchip.com>
References:
 <20260713-dsa_lan9645x_switch_driver_base-v10-0-a4886a08fb15@microchip.com>
	 <20260713-dsa_lan9645x_switch_driver_base-v10-2-a4886a08fb15@microchip.com>
	 <20260714144345.6C64D1F00A3A@smtp.kernel.org>
In-Reply-To: <20260714144345.6C64D1F00A3A@smtp.kernel.org>
Accept-Language: en-DK, da-DK, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB3990:EE_|IA3PR11MB8966:EE_
x-ms-office365-filtering-correlation-id: f6df0798-6b46-4869-4cc3-08def163c25b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|18002099003|22082099003|4143699003|11063799006|56012099006|3023799007|38070700021|10067099003;
x-microsoft-antispam-message-info:
 S7bXAoaB+FfHyD/wuO7Bz/CDCkNCHhMA3bp24xWpIj7yoh80LK5qSiB2FJ9GmhM80z6ngFZXSJE5DkZDCSWJMlkOTAlZ4VHiyCTFazB/sfw0bDPvRVxTI8bHVG/DouIsH58mikX1fA0plxwNppvd7RtuOM6+kD+/BjIjE3VrloigR3ieElT8b5EG2ofWNkYHoBBdyV6syJggZQ3N/ttmbiRsbAdYpdzqgKhBwe13Vp7jWTp3SRi8p0wM9zdeRAULb3Ht/jK3KmbokXBnJKLO/f0Hbk3E7R5EKP7amA8w8s7c/VH9fDmjdvOh5flqh/uCQJ2b9++363d9frIfMQBQIyAPDbwY52L5kqDi1uVo+spGAnMxjqgh8kYxuXtNN6pxy8HhYomo7+XdLT2IcM383iA3hXQuFtn5jkCqckbvb4ocEX6tjnZaWmPIi1y1/TAXAEj83fpBtLyUJ/ujNr+t9C2/RsX1oOWG1DwORF1MLdCtEMzgpBhxpfokzuEuQEIWkb24vqqLuAmz9CI/RVzoLm5MaZF8l+VL4yWH6O0k4zdhRilzskfOn+Rcvf6MZN7Cd3IqlYykvtyztI9IxpcrrAYWTe/rEALok4I8WyYnYHymGVVCrnhGpcAv6Sk+UKbEZyp0rqojqpDPWURAPTs1rp7yetZHAcxlkMdUkVHbopg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3990.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006)(3023799007)(38070700021)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WGE5SWthdkVJMi9ST29QTW9xZGtmWEJrWWk3ZGYrRzZ6QmRvRnlKVXRqYUUx?=
 =?utf-8?B?aGFYMENubnF4VnJHWjk5b3RNc3JMTmlyUi9TeVZmMnhSY2swS2NuNklNdEtR?=
 =?utf-8?B?SVZ1dy9yMkI1aXFjUUoySmFsd1NSWnAzanRoVHhlUkFlMnBDM1gzaXdMVXVR?=
 =?utf-8?B?YzRieU54dlk5SHdjT1RUSXpRVG1IaDNFNVk3MnhqWEp0T2ZZRFZSK2pzUDFa?=
 =?utf-8?B?K3ZLVVRjWEMvdHNZUW1LZktVeTBlNzg3NVgxNitML3l6dkhPNzFmYTM2TVlj?=
 =?utf-8?B?b1hwc01ub0hmK2xjOEVWQnlkdGxySDhkSTZWeVBQR1N0clRMS0dybXRYQW9T?=
 =?utf-8?B?UEtnL0owUXptQVNOOFN2UHhrMVk2REt6OUxoUE1Da0N2U25sTTlCVmw4STcy?=
 =?utf-8?B?dkV5UUR2WHVVWm4vMDZYaUtCWWJsYmZ0TzhyYkhzb3hMckFaaUl3aWJjQmVB?=
 =?utf-8?B?ZUxyQU9lRU53WnJQcmVHL3NwK3RueXNWbDRjNStrTGoya2Izem1PNkZ5KzdM?=
 =?utf-8?B?ZkhKbXd6Qmk4aXVUQjlqdHZyTUg4MEE1NHkyMEVXcVNBbjJMU2txWkF3Wjhk?=
 =?utf-8?B?bVhkZCtxSXhua2xKTHBpNWc5OGdDa2RjZ1lyNnZHRTB0eG9BWVJCekhYZHcx?=
 =?utf-8?B?TVg2V3NqQ3BGNnd2NGhSVElBS0plWUNiYXlUWUtrV1lYSXRFc3pYNEFFdXlD?=
 =?utf-8?B?SDlaRzl5NWM4Z3BIMFYvanlvc0NxV0kxNkUrd2h2L3NtcURpdlFsb3dPSTZX?=
 =?utf-8?B?SHdPcWNRNjlqOU9CRGQwbjFrYWd2YkFTNnIvd21zbmwrR2ZCNDBsYTFDVEcy?=
 =?utf-8?B?Mm8vR0R6VTgwdFVFSDBjdXNsMzQyaWNJNUZ2RGZlcENyU1h0SmlDeXZVODN5?=
 =?utf-8?B?YjZMUlhLcUhvMEdUd3RDSDV5cXBVWkk3VExuUVJHNGkxckJ1RDhUWHd2dHEz?=
 =?utf-8?B?eEN3eTYxUVl1MU12TURsMFJSc0hsdEUzenBwN0dGUjdJZFNXL0pxWnRqTkFK?=
 =?utf-8?B?RGhiRFArODBCcXhRMXZLd1BLZ045WkEwMVNKekJNKzVqYmwrK2N1U2cvcWtN?=
 =?utf-8?B?S2dVT044NkZuc3U5THZLc2FDVUtkT0FiNlJGYXhRL3Q3MUJVRmF3aEkrWThn?=
 =?utf-8?B?UzNJdnFRWG1Zb25hM2ZiTVJtUnJqV0RkZy9jWkh0aTZjOXM5T3c2TkpUVTRw?=
 =?utf-8?B?a3RNNGtRWHE3QVVqSEpod2gyZ1A2RUJ5V2FRazVZRm14a2tVUWl4WmNUKzIr?=
 =?utf-8?B?VDVTb09adlI4MUxSWHJGWVZwb3Z2R3UxVFJyNzlaUDVRR3Y2Yzh1UWtUck1S?=
 =?utf-8?B?Y1c3a1NMTjVOVVhxWHJIUzE5R3BTRmRRSmJqdzRrcGNjT2FUdyt3dXcybGNR?=
 =?utf-8?B?U0UyRUJxZ04zNEhmN3Axd3NxMm1YU2kzMXJZNjZxa1lJT21nRjhEemZsLzho?=
 =?utf-8?B?UWQwVFVFemhIc3FuTWo2dUZNTUR2Z3N2Z0xUTWNYN3hCa3ZXSjZEQ21qR0Fl?=
 =?utf-8?B?YXRDYlkydnUwNGI5YWErNWRlZVc5THE2RDlmclRIcWUyZTB3VmRJdUM0NTh6?=
 =?utf-8?B?VjFMQTZrTU8vSGppelJsRUlyR2xUK3Jnc1Q5REN0cWFNbFZqMGZFODh6ZU9o?=
 =?utf-8?B?VVhSMU90VFVIZlhqbGN4RlpqeUJpUWtONFE1MCtmcWZORXQybHJyWW9hdXRj?=
 =?utf-8?B?Tm5jUjBTMGJTWVZXZkdmd1JIcGJpTWZmNGZ6aFJoYzJnZTRKTjlNUlpWODBz?=
 =?utf-8?B?QXZOQUhNaEN1UGJvbGF2TE44aEM5dXBWNktXcWN3Uk9rM0hyUml0QzZiZzhE?=
 =?utf-8?B?UHJlTU1JaHZodlljR050MzRCdnNuSzBCcUV1UXdLS0NJN09OZTlqTldxMU1J?=
 =?utf-8?B?Y3U3Sjdwell0R0tZQ09ZUy9Pa1NTTGJBZUVIK09YY1lWa2pZcHVpbkorWmU2?=
 =?utf-8?B?QXF4R3BKZDhFRk5icUoxTjI4cGZVWjE4cHorZWQrL0cvRzIxMlFKd3ArOFVT?=
 =?utf-8?B?YVovK1hqaDV1am1aKzcvSWtMd3BucTFMYkpvckdQMjBTc3V1Z29oSGtXOW9O?=
 =?utf-8?B?UmNENGVtUGlOMzBDdFNnK0hmdUZCaDFubnRkMHhES3RNR21nR0pEOWs3ODhV?=
 =?utf-8?B?Sm5mTU5MUThId3UrRStTYnJUbFRWcVE1S010VndrMFpEUUF1QWFtdFFYSTdj?=
 =?utf-8?B?YkZoYkN5WHNwenhpdzgxaFl3V2RveDZSVE93LzdEVWxJVWFFYmZxSnA1SWJH?=
 =?utf-8?B?VnUvbmdPOHNMNU14R1V2bGFyWjh6NEJXSUhzMldFamVzTHR2R3ZrV0Y2TjZ4?=
 =?utf-8?B?WGtQRUFUbVJQVlA2UGlPMzNuZDBvZ1p4anQxekduWWZyb3Y4eEdIZTZ1VXlC?=
 =?utf-8?Q?gGJHyFuBE7Xpno8WGaIu+nUyYyEq1NIN0ceBcIdNVNfEI?=
x-ms-exchange-antispam-messagedata-1: GMhGpf+UidlMUQ==
Content-Type: text/plain; charset="utf-8"
Content-ID: <5D4A0155C4906E458B46AC12808A066E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3990.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6df0798-6b46-4869-4cc3-08def163c25b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2026 13:33:09.7657
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N7oQTW4hOeVZ+vw5iptUOq/27FzpiUb5qJi+xREa3uFJenVMLveXARh9jaepbEwHV/QNCy7SfaNx+uUi2tjNG5iUGeJlyeFA6uZw6YaRS5qA6doGx2+xHrEJ9tfupZfG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8966

T24gVHVlLCAyMDI2LTA3LTE0IGF0IDE0OjQzICswMDAwLCBzYXNoaWtvLWJvdEBrZXJuZWwub3Jn
IHdyb3RlOg0KPiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0
YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IFRoYW5r
IHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkgcmV2aWV3IGZvdW5kIDEgcG90
ZW50aWFsIGlzc3VlKHMpIHRvIGNvbnNpZGVyOg0KPiAtIFtNZWRpdW1dIERUIGJpbmRpbmcgc2No
ZW1hIHN0cmljdGx5IHByb2hpYml0cyBgbWRpb2AgYnVzIG5vZGVzLCBicmVha2luZyB0aGUgYWJp
bGl0eSB0byBkZWZpbmUgaW50ZWdyYXRlZCBQSFlzLg0KPiAtLQ0KPiANCj4gLS0tIFBhdGNoIFsy
XTogW1BBVENIIG5ldC1uZXh0IHYxMCAyLzldIGR0LWJpbmRpbmdzOiBuZXQ6IGxhbjk2NDV4OiBh
ZGQgTEFOOTY0NVggc3dpdGNoIGJpbmRpbmdzIC0tLQ0KPiBjb21taXQgZDBjYThjZDYyNTg4MWFj
M2I4NTI5ZmQ5NzdiZGIwYzhhMGMzYjEyOQ0KPiBBdXRob3I6IEplbnMgRW1pbCBTY2h1bHogw5hz
dGVyZ2FhcmQgPGplbnNlbWlsLnNjaHVsem9zdGVyZ2FhcmRAbWljcm9jaGlwLmNvbT4NCj4gDQo+
IGR0LWJpbmRpbmdzOiBuZXQ6IGxhbjk2NDV4OiBhZGQgTEFOOTY0NVggc3dpdGNoIGJpbmRpbmdz
DQo+IA0KPiBBZGQgYmluZGluZ3MgZm9yIExBTjk2NDVYIHN3aXRjaC4gV2UgdXNlIGEgZmFsbGJh
Y2sgY29tcGF0aWJsZSBmb3IgdGhlDQo+IHNtYWxsZXN0IFNLVSBtaWNyb2NoaXAsbGFuOTY0NTVz
LXN3aXRjaC4NCj4gDQo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9uZXQvZHNhL21pY3JvY2hpcCxsYW45NjQ1NXMtc3dpdGNoLnlhbWwgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L2RzYS9taWNyb2NoaXAsbGFuOTY0NTVzLXN3
aXRjaC55YW1sDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAw
MDAwLi4wNDNmYjQ4OTIyYjQxDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvZHNhL21pY3JvY2hpcCxsYW45NjQ1NXMtc3dp
dGNoLnlhbWwNCj4gDQo+IFsgLi4uIF0NCj4gDQo+ID4gK3JlcXVpcmVkOg0KPiA+ICsgIC0gY29t
cGF0aWJsZQ0KPiA+ICsgIC0gcmVnDQo+ID4gKyAgLSBldGhlcm5ldC1wb3J0cw0KPiA+ICsNCj4g
PiArdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQ0KPiANCj4gW1NldmVyaXR5OiBNZWRpdW1d
DQo+IFdpbGwgdGhpcyBzY2hlbWEgcmVqZWN0IHZhbGlkIGhhcmR3YXJlIGRlc2NyaXB0aW9ucyB0
aGF0IGluY2x1ZGUgYW4gbWRpbyBjaGlsZA0KPiBub2RlIGZvciB0aGUgaW50ZWdyYXRlZCBQSFlz
Pw0KPiANCj4gU2luY2UgdGhlIHNjaGVtYSBzZXRzIHVuZXZhbHVhdGVkUHJvcGVydGllczogZmFs
c2Ugd2l0aG91dCBkZWZpbmluZyBvcg0KPiByZWZlcmVuY2luZyBhbiBtZGlvIHByb3BlcnR5LCBh
bnkgbWRpbyBub2RlIGRlZmluZWQgaW4gYSBkZXZpY2UgdHJlZSB3aWxsDQo+IGJlIHJlamVjdGVk
IGFzIGFuIGlsbGVnYWwgcHJvcGVydHkuDQo+IA0KPiA+ICsNCj4gPiArZXhhbXBsZXM6DQo+ID4g
KyAgLSB8DQo+ID4gKyAgICBldGhlcm5ldC1zd2l0Y2hANDAwMCB7DQo+ID4gKyAgICAgICAgY29t
cGF0aWJsZSA9ICJtaWNyb2NoaXAsbGFuOTY0NTlmLXN3aXRjaCIsICJtaWNyb2NoaXAsbGFuOTY0
NTVzLXN3aXRjaCI7DQo+ID4gKyAgICAgICAgcmVnID0gPDB4NDAwMCAweDI0ND47DQo+ID4gKw0K
PiA+ICsgICAgICAgIGV0aGVybmV0LXBvcnRzIHsNCj4gPiArICAgICAgICAgICAgI2FkZHJlc3Mt
Y2VsbHMgPSA8MT47DQo+ID4gKyAgICAgICAgICAgICNzaXplLWNlbGxzID0gPDA+Ow0KPiA+ICsN
Cj4gPiArICAgICAgICAgICAgZXRoZXJuZXQtcG9ydEAwIHsNCj4gPiArICAgICAgICAgICAgICAg
IHJlZyA9IDwwPjsNCj4gPiArICAgICAgICAgICAgICAgIHBoeS1tb2RlID0gImdtaWkiOw0KPiA+
ICsgICAgICAgICAgICAgICAgcGh5LWhhbmRsZSA9IDwmY3VwaHkwPjsNCj4gDQo+IFtTZXZlcml0
eTogTWVkaXVtXQ0KPiBEb2VzIHRoZSBzY2hlbWEgYWxsb3cgZGVmaW5pbmcgdGhlIGludGVncmF0
ZWQgUEhZIG5vZGVzIHJlZmVyZW5jZWQgaGVyZT8NCj4gDQo+IFRoZSBleGFtcGxlIGRlbW9uc3Ry
YXRlcyB0aGUgbmVjZXNzaXR5IG9mIHBoeS1oYW5kbGUgcG9pbnRlcnMgdG8gaW50ZWdyYXRlZA0K
PiBQSFkgbm9kZXMgKHN1Y2ggYXMgJmN1cGh5MCksIHlldCB0aGUgc2NoZW1hJ3MgY29uc3RyYWlu
dHMgbWFrZSBpdA0KPiBzdHJ1Y3R1cmFsbHkgaW1wb3NzaWJsZSB0byB2YWxpZGx5IGRlZmluZSB0
aGUgTURJTyBidXMgZm9yIHRob3NlIFBIWXMuDQo+IA0KDQpJIHRoaW5rIHRoaXMgaXMgYSBmYWxz
ZSBwb3NpdGl2ZS4gQW55IHBlcmlwaGVyYWxzIHN1Y2ggYXMgTURJTyBjb250cm9sbGVycyBhcmUN
Cm1lYW50IHRvIGJlIGNoaWxkIG5vZGVzIG9mIGFuIE1GRCBkZXZpY2UsIGFzIHNpYmxpbmdzIG9m
IHRoaXMgc3dpdGNoIG5vZGUuIFRoZQ0KTURJTyBidXMgZGV2aWNlcyB3aWxsIG5vdCBiZSBzdWJu
b2RlcyBvZiB0aGlzIHN3aXRjaCBub2RlLCBzbyB0aGV5IGFyZSBub3QNCm1lYW50IHRvIGJlIGFj
Y29tb2RhdGVkIGJ5IHRoaXMgc2NoZW1hLg0KDQo+IC0tDQo+IFNhc2hpa28gQUkgcmV2aWV3IMK3
IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDcxMy1kc2FfbGFuOTY0NXhfc3dp
dGNoX2RyaXZlcl9iYXNlLXYxMC0wLWE0ODg2YTA4ZmIxNUBtaWNyb2NoaXAuY29tP3BhcnQ9Mg0K
DQo=
