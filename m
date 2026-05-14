Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011049.outbound.protection.outlook.com [52.101.125.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28123386C17
	for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 22:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778798186; cv=fail; b=DsFnrRZNanIPDOEVWSfwCo3/496muQJwnqjZqMUisYApLoOVC9L17IWBgvBHbrVHLPt4/KKY/1iWDZKvqXeUQhfEmOuVsln2xcsSQtnZeIzVaRzFvEFY457kdUP3sIWM/kOHicvhAL9LuyVhClDUosoJwUonst6b2ujt5OKEQrg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778798186; c=relaxed/simple;
	bh=sV9s+n36XJE+huu8U8+IA7nXyAhSjEh2NRmHfdtemVE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bYBq1Bn9NaCcOI7EQEtLn4aJpa2fvEI1kNfC/mmvbGld3QCN+Goiw8eST3tcz3fYQx/JmwBE91nKLMSlaaxYOmA40+6900Th7TZBKKWeArOQbNEv1eROK94jaxiJCMLK1+GKPckJc2egt4y26/jiy0o1Yawtm1pE/TgijgFnla0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=H4cChLur; arc=fail smtp.client-ip=52.101.125.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="H4cChLur"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qL1aLBsLrvQFx1ADl8jNKcyb+UE58p2pr4gNR4xFEQ6wb+v21o+DBWrKRLo/TeXEUf0ekX8iXQpvmcA7jqwXGkMH1eMTJ0dx20RG09qZ8V/IL1EypJB5bAVY/EttMFi+dcIjzeWPLhYjSrqthig0iZaIR4OeZk5HIIw7kCb2eaxztAo4eHLkKr3Q/FFse7dpBu/mHtM0oxg0zzcIEz53A88JJMjR9E7jpRv3d/Bb8ap3BH+G5A2YrHotDft5TUyMFzrTSbWLg546LwZpVwIr0WNRy5HVe7EJQz4vxvvVklsjcVMCZ3VO9pKDMwGHM3u5LG2TqFlLRTVbf7Qp4fRNMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sV9s+n36XJE+huu8U8+IA7nXyAhSjEh2NRmHfdtemVE=;
 b=EfOhZ8Ha5GP7UeR5WJQpr9IHC/cZ3rdqBbPUq/1t8ufi4ituaXP4fjIlGc3J5rl+RreNr8xdTi+oUtzRUk5UUd8kIiPISgFzWHbVhTdRv93S9W1oR2SjpTQCfcmfC1uOvsnwmz2wcct1tUTufJ+qjhlzDjNXzdbYtZcWi5Iiq0PtQSJylmYZamD0jcihHQKD06klA+nYfcypByN2DtmlshGirkN9DpwKMhOuFUijk00R5WxHHcowqVrpEwK9mjJNWB9xT/UEOn1qA8Doan72oK0KhKvF1GApODrqq5hZHQOaUWMuT17IRgX9bt+t/qLKl3OK5FOparSL0R2M3YgchA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sV9s+n36XJE+huu8U8+IA7nXyAhSjEh2NRmHfdtemVE=;
 b=H4cChLurXMPXBeoV9UBQUC7KkOzr6QdNzWF4xNV/k+ZobhGhvSBrBFphmOrVwVlpjX9h9puGfNy1Sn2oUEmWGYAXKR+vlHWDDWVZCR08OH9pLOELjUr3pEzN+kMikesUJ+9t4PjXf1wK/QP+r+G3p+/AMYlwO9YVz+nz58+XuW8=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TY7PR01MB13694.jpnprd01.prod.outlook.com (2603:1096:405:1ee::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 22:36:22 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.20.9913.012; Thu, 14 May 2026
 22:36:22 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "robh@kernel.org" <robh@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, wsa+renesas
	<wsa+renesas@sang-engineering.com>
Subject: RE: [PATCH v6 08/16] ASoC: rsnd: Add RZ/G3E DMA address calculation
 support
Thread-Topic: [PATCH v6 08/16] ASoC: rsnd: Add RZ/G3E DMA address calculation
 support
Thread-Index: AQHc4j0kYjqrvq9Lo0CrZShsHPMelLYMyemAgAFUvbA=
Date: Thu, 14 May 2026 22:36:22 +0000
Message-ID:
 <TY6PR01MB17377C5DB8030BF2EB640BC7CFF072@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260512182631.3842065-9-john.madieu.xa@bp.renesas.com>
 <20260514021303.8E402C19425@smtp.kernel.org>
In-Reply-To: <20260514021303.8E402C19425@smtp.kernel.org>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|TY7PR01MB13694:EE_
x-ms-office365-filtering-correlation-id: c6dfdab0-59bf-4087-f3a7-08deb209399c
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|11063799003|4143699003|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 ELEPvDgPOCBswvmz33xWy/g4wIf2MhsBr89mi7DXox3l+GPduzj8mdUcaxKyXnSSD+Ymbl1orzAngy08ZbYFqSKTh66/AeanuJgYmXw+d1VhtloTVkpHWO3WgXePpVnuyDRfsTnKlKw4vDDTflMBPERxjaSUvbFChbwMvekS0t2MAOcV8T/o2aCATSENxPCDUFbIPuc3kvw3F0rwC6qKYM048wT8Zv2QkfCJ+ydJPTQzBwmX3vkiKt2HomI8kUEwtv4fXsZ+ju7Cenj0Q3OgVlKlqNCmRS+wA7Y1mvCQVF8VKnDj4/oQlJ/81yEUZmASWq6m+6uq0i5Fg1pj8/9JxJtTC/4qKOO+Oql1Z5ciKVoNMo4Ud+ByWf2uBReG/eZHzNMGcwuEOSsU8hl9YndFwrpjORDf9z+qTXdV2+hqkANOrX7Fiu0XN6UizNtA/2JDOAFhDgtY604PyAfMiaxhM8NQCyEqAD0s3lcaOD7k9ri5K4h99BSg4iAn0lbnuafIHWYzaOzoC9ZpamIbiSIggaekxtNBGGLHpMGAYDI0hXzgaawuAlCxq5z+CnlSKw7RyZfN6/A5vkQK3Y20HJbeAbgLgThjMtQ+127pFrtz0MfxMueWuLAqvVGUCpuSw1Ocx/VBo/Blmk2Z295pUVSvwX9hhSYRWssL2HjBWM1UQM648otgDGMFLpVvl9+1WUXs
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(11063799003)(4143699003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RWdXQmRpbEo2SXhEL0tnZFMvOGJtanc5eWtqMkprQy8vRTZIRDROOTNRRDRH?=
 =?utf-8?B?dGJaOXFLd0hnK1diTnNMZ1lCVlNKcjNGRjBYb1duTWhVSGRmbnp2N2IxNzBv?=
 =?utf-8?B?Q0ZYTnJ2OWpXSXBsbnRhTUhIRUF5L1ZIYnhGVG1meTZybXdlc2FVdUZlckgy?=
 =?utf-8?B?WVlObDVIdTlLWnV3eUNiY2JiZWk3RjJpWlFlbUJPelBXOVlvTENlQ0RTZjRw?=
 =?utf-8?B?Nk1hZ2F6QWJjWENZSlBzOXRkTnE2MDduc0ZXUFlIZFRsTFowWnpDK00rbTlz?=
 =?utf-8?B?djZ2K3RrU3lHL1IvUnAyckJJbkdWbW5iYUo2ZzkySk1tZytBd1JmZXl3d3Bj?=
 =?utf-8?B?Z0xSYnE3Z0dXaWxlMFNkMjdIQXVadm9wVjZFcFg5RnF1ZEo0N0JldVlLL2JC?=
 =?utf-8?B?UTNrL01QLzhyVFd6WHoxWUs1WjJuWm51am1mZG96bElYWFNrdUJsV2VLM1I5?=
 =?utf-8?B?K25NU2dqSGZYbkpSemdGUHg4WWlJaC9XSlFaSU9DdjBaRGo2ZG05RXVad0ZB?=
 =?utf-8?B?UTRYcDdoUXMwSGUxTmlNMnBOSk5TWnpnTWZ3azZlaXBVaXhOVXFmY3BCcjgz?=
 =?utf-8?B?VUVrVlpqbXFTWDkwSHM5S2RTK1Z1Snh1dm1hOGI0WDVFUVF6R3M1R1ZkbFNI?=
 =?utf-8?B?cmszcUtrOURTUmtDN21ONnBhVHFLelpOVUVHODVGRjlvQWd5bXg1OVhNVEN2?=
 =?utf-8?B?UWpFcGFkTDZYZlNWKyt6RGV0dGVaUndkVzJnZXhnbGNMU0FtaEJ3bXJrSG9j?=
 =?utf-8?B?S0xRZEVSU1pjVDk1TVNvaUlseDFFaUltL1FKeER4Smc1d2tOQ3JVeFhYWnZQ?=
 =?utf-8?B?UXQ4aVRKSjZoL2xlMlVhUkVvcmNESXgyc3g3NzFtME1ITUUwT29yak5ReVBV?=
 =?utf-8?B?QXc1aWZ0Tm1JcWFzVWtEd3dNQmswNnJjRHU4ejljYjlNWjFHTUlNc1puZTJq?=
 =?utf-8?B?L28wNWlieUxwUmc5QzJLTUphUUUrWXhKK3lBVnZ4UWY3cnppOUllcnhEV1pE?=
 =?utf-8?B?VjNGWDZZT0hvZitwdHBnZkVBc245VmJnTjBtWXByMDVRWTlBNVRaeDVaTjln?=
 =?utf-8?B?TmdlZTRJdmVVSXBRSkNGdkRBNjNoMktSUkJ5NUZyZzI2Ujh1RlZDRUNKbHFB?=
 =?utf-8?B?WUl5QjB1S1JVYWJTMnE1R2JibjVnY0pSYXdHRVlEZTdna3VoTDNQd3ZYckJs?=
 =?utf-8?B?QmNnMDNFUm9qUURkVFZNeTFlK1I3Ymp2Mkx3eDRUWGRxa083dlprQTZRNmxv?=
 =?utf-8?B?UXV4dndVYnAwK3FMdUhVRmxySHR1UVo0bnZkM0xCdzNEd0hKaVZYaGV5QWha?=
 =?utf-8?B?Q2RuNkVrWXBVOHE3am94R2kyZWhyUDZjTUxKbXRHaktsQUl2MzB2bnhYYmtU?=
 =?utf-8?B?Y1h0eFovRkpvWU5hQ1dCbldLZCtBUTVGZVNVZWJCRWFpdGttUlhRTTU3ZWpH?=
 =?utf-8?B?dUdEaVdIQ3JhS05nWVFrbzZNeXhFWWRSa1ZLeEx0QkNRQ1Y1S29wOGR1R1hB?=
 =?utf-8?B?OUtQRnFUREJJWU03M2tyd3VpUGhObVM4OXZRRXZibFRpYWcxWlNCd25nT2ZM?=
 =?utf-8?B?VmxMVitWaXV0OUloV1ZQZDk1TlRGWTN1Rk5rUW5EM2ZrYVZHTHRaYk81ck51?=
 =?utf-8?B?TUFENFYvTTJ3Yk9WTGg1enlBZndhcXpVdVlmRE9yeFc3SGRBbkVncjJLQmhT?=
 =?utf-8?B?NzdLYVpQMTllMkxxd1lCSkpZZXNyK0p5bUxNS08wZ0pzcmhoZXU4YUo5eWdq?=
 =?utf-8?B?ZjhUczkwOTlxSVVYcWRKRzV6N2R0bnkwMFFaVC81M1RjK2dsOE9XbnBjRzhk?=
 =?utf-8?B?Qnpad3pIT1pqV0hGWVBQa2dtbUlXSWUveFcxbnhBallGQldDZUQxTm5QRnZQ?=
 =?utf-8?B?NzMyNDRsN3RnbksrdEN2b0tzYncrYlNvN0h0bGw2RjNWbFMwb0JvRGs2UlEw?=
 =?utf-8?B?ck4vTUxoaUhIV2RWa1FqYk9jRUtyTG9tUHFRQUdtTGlwQnZRSUN0Um50S0Zm?=
 =?utf-8?B?NE1vQk9wUk10dzVCWE9pcG91MkcxekJQUUhDWjJoeTRFM0hrdGx4QndtSC9n?=
 =?utf-8?B?K3RreUQ0VlNNcXpJN1ZRb3ZNU3ZIRXpUOCs1SjhNUVdkMWxXbWNvUGFLVXZQ?=
 =?utf-8?B?VEZDTUo2M0tFOXpIcHk2STNjaVNhVXhaZWxWaWJOV214cmJucjltOUxUZExr?=
 =?utf-8?B?NHdXbk5kdkFwdXdNTG9JRVJVcE04UGl5Z1dyMGNvQVJkd3JXRE5Oc3lxS1cr?=
 =?utf-8?B?d2JvNEVGVFpqYTZPc2VoakV2amNtQThWSlV4bnhicWNaTFVnRWdETGJLSzhB?=
 =?utf-8?B?MGFzQVFkTHViS0tVNXBnTTR4RlJlQ0QzT2RLUnBvSTNzOVMzTjFia0FtVTI3?=
 =?utf-8?Q?NEEPoHonn0fR40dg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6dfdab0-59bf-4087-f3a7-08deb209399c
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2026 22:36:22.3731
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BTDLHPvQOJzgwDTyZdDPFFSmLTVTb1SBM5fM6azScJv0GF8hNPK7kzWA5WaX+s/NhIQq+xyDowIe55Caxp4gwzahAr6ui4xpcIm8nsMAkW4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB13694

SGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogc2FzaGlrby1ib3RA
a2VybmVsLm9yZyA8c2FzaGlrby1ib3RAa2VybmVsLm9yZz4NCj4gU2VudDogRG9ubmVyc3RhZywg
MTQuIE1haSAyMDI2IDA0OjEzDQo+IFRvOiBKb2huIE1hZGlldSA8am9obi5tYWRpZXUueGFAYnAu
cmVuZXNhcy5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjYgMDgvMTZdIEFTb0M6IHJzbmQ6
IEFkZCBSWi9HM0UgRE1BIGFkZHJlc3MNCj4gY2FsY3VsYXRpb24gc3VwcG9ydA0KPiANCj4gW1lv
dSBkb24ndCBvZnRlbiBnZXQgZW1haWwgZnJvbSBzYXNoaWtvLWJvdEBrZXJuZWwub3JnLiBMZWFy
biB3aHkgdGhpcyBpcw0KPiBpbXBvcnRhbnQgYXQgaHR0cHM6Ly9ha2EubXMvTGVhcm5BYm91dFNl
bmRlcklkZW50aWZpY2F0aW9uIF0NCj4gDQo+IFRoYW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRp
b24hIFNhc2hpa28gQUkgcmV2aWV3IGZvdW5kIDIgcG90ZW50aWFsDQo+IGlzc3VlKHMpIHRvIGNv
bnNpZGVyOg0KPiAtIFtIaWdoXSBVbmNoZWNrZWQgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIGlu
IHJzbmRfcnpnM2VfZG1hX2FkZHIoKSB3aGVuDQo+IFNTSVUgbW9kdWxlIGlzIG5vdCBwcmVzZW50
Lg0KPiAtIFtMb3ddIE1pc3NpbmcgcGFyZW50aGVzZXMgYXJvdW5kIG1hY3JvIGFyZ3VtZW50cyBp
biBSWi9HM0UgRE1BIGFkZHJlc3MNCj4gY2FsY3VsYXRpb24gbWFjcm9zLg0KPiAtLQ0KPiANCj4g
Y29tbWl0IDhhYzQ0ZDMyYzllMGIzOWNjZTM5MGRkN2RlZGU3ZDE5MmIwZjVhZDcNCj4gQXV0aG9y
OiBKb2huIE1hZGlldSA8am9obi5tYWRpZXUueGFAYnAucmVuZXNhcy5jb20+DQo+IA0KPiBBU29D
OiByc25kOiBBZGQgUlovRzNFIERNQSBhZGRyZXNzIGNhbGN1bGF0aW9uIHN1cHBvcnQNCj4gDQo+
IFRoaXMgY29tbWl0IGFkZHMgYSBkZWRpY2F0ZWQgRE1BIGFkZHJlc3MgY2FsY3VsYXRpb24gZnVu
Y3Rpb24gZm9yIHRoZQ0KPiBSWi9HM0UgcGxhdGZvcm0sIHdoaWNoIGhhcyBkaWZmZXJlbnQgRE1B
IHJlZ2lzdGVyIGJhc2UgYWRkcmVzc2VzIGFuZA0KPiBvZmZzZXRzIGNvbXBhcmVkIHRvIG90aGVy
IFItQ2FyIHBsYXRmb3Jtcy4NCj4gDQo+ID4gZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9yZW5lc2Fz
L3JjYXIvZG1hLmMNCj4gPiBiL3NvdW5kL3NvYy9yZW5lc2FzL3JjYXIvZG1hLmMgaW5kZXggMjRj
MjNjYjg5MzkwNi4uZWRlMDEyM2Q0MGViNQ0KPiA+IDEwMDY0NA0KPiA+IC0tLSBhL3NvdW5kL3Nv
Yy9yZW5lc2FzL3JjYXIvZG1hLmMNCj4gPiArKysgYi9zb3VuZC9zb2MvcmVuZXNhcy9yY2FyL2Rt
YS5jDQo+IA0KPiBbIC4uLiBdDQo+IA0KPiA+ICsvKiBSWi9HM0UgRE1BIGFkZHJlc3MgbWFjcm9z
ICovDQo+ID4gKyNkZWZpbmUgUkRNQV9TU0lfSV9OX0czRShhZGRyLCBpKSAgICAoYWRkciAjI19y
ZWcgKyAweDAwMDBGMDAwICsNCj4gKDB4MTAwMCAqIGkpKQ0KPiA+ICsjZGVmaW5lIFJETUFfU1NJ
X09fTl9HM0UoYWRkciwgaSkgICAgKGFkZHIgIyNfcmVnICsgMHgwMDAwRjAwMCArDQo+ICgweDEw
MDAgKiBpKSkNCj4gDQo+IFRoaXMgaXNuJ3QgYSBidWcsIGJ1dCBjb3VsZCB0aGUgJ2knIHBhcmFt
ZXRlciBiZSB3cmFwcGVkIGluIHBhcmVudGhlc2VzPw0KPiANCj4gV2hpbGUgJ2knIGlzIGN1cnJl
bnRseSBwYXNzZWQgYXMgYSBzaW5nbGUgdmFyaWFibGUgKCdpZCcpLCB1c2luZyAoMHgxMDAwICoN
Cj4gKGkpKSB3b3VsZCBwcmV2ZW50IGluY29ycmVjdCBhZGRyZXNzIGNhbGN1bGF0aW9ucyBkdWUg
dG8gb3BlcmF0b3INCj4gcHJlY2VkZW5jZSBpZiBhbiBleHByZXNzaW9uIGlzIGV2ZXIgcGFzc2Vk
IGFzIGFuIGFyZ3VtZW50IGluIHRoZSBmdXR1cmUuDQo+IA0KPiBEb2VzIGl0IG1ha2Ugc2Vuc2Ug
dG8gdXBkYXRlIHRoZSBTUkMgYW5kIENNRCBtYWNyb3MgYmVsb3cgYXMgd2VsbD8NCg0KTGVnaXRp
bWF0ZS4gV2lsbCB3cmFwIGV2ZXJ5IGkgYW5kIGogaW4gUkRNQV9TU0lfKl9HM0UsDQpSRE1BX1NT
SVVfKl9HM0UsIFJETUFfU1JDXypfRzNFLCBSRE1BX0NNRF8qX0czRS4NCg0KPiANCj4gPiArDQo+
ID4gKyNkZWZpbmUgUkRNQV9TU0lVX0lfTl9HM0UoYWRkciwgaSwgaikgICAgICAgIChhZGRyICMj
X3JlZyArIDB4MDAwMEYwMDANCj4gKyAoMHgxMDAwICogKGkpKSArICgoKGopIC8gNCkgKiAweEEw
MDApICsgKCgoaikgJSA0KSAqIDB4NDAwKSAtICgweDQwMDAgKg0KPiAoKGkpIC8gOSkgKiAoKGop
IC8gNCkpKQ0KPiA+ICsjZGVmaW5lIFJETUFfU1NJVV9PX05fRzNFKGFkZHIsIGksIGopICAgICAg
ICBSRE1BX1NTSVVfSV9OX0czRShhZGRyLCBpLA0KPiBqKQ0KPiANCj4gWyAuLi4gXQ0KPiANCj4g
PiArc3RhdGljIGRtYV9hZGRyX3QNCj4gPiArcnNuZF9yemczZV9kbWFfYWRkcihzdHJ1Y3QgcnNu
ZF9kYWlfc3RyZWFtICppbywNCj4gPiArICAgICAgICAgICAgICAgICBzdHJ1Y3QgcnNuZF9tb2Qg
Km1vZCwgaW50IGlzX3BsYXksIGludCBpc19mcm9tKSB7DQo+ID4gKyAgICAgc3RydWN0IHJzbmRf
cHJpdiAqcHJpdiA9IHJzbmRfaW9fdG9fcHJpdihpbyk7DQo+ID4gKyAgICAgcGh5c19hZGRyX3Qg
c3NpX3JlZyA9IHJzbmRfZ2VuX2dldF9waHlfYWRkcihwcml2LCBSU05EX0JBU0VfU1NJKTsNCj4g
PiArICAgICBwaHlzX2FkZHJfdCBzcmNfcmVnID0gcnNuZF9nZW5fZ2V0X3BoeV9hZGRyKHByaXYs
IFJTTkRfQkFTRV9TQ1UpOw0KPiA+ICsgICAgIGludCBpZCAgICA9IHJzbmRfbW9kX2lkKG1vZCk7
DQo+ID4gKyAgICAgaW50IGJ1c2lmID0gcnNuZF9tb2RfaWRfc3ViKHJzbmRfaW9fdG9fbW9kX3Nz
aXUoaW8pKTsNCj4gDQo+IENhbiB0aGlzIHJlc3VsdCBpbiBhIE5VTEwgcG9pbnRlciBkZXJlZmVy
ZW5jZT8NCj4gDQo+IElmIHRoZSBBTFNBIHN0cmVhbSBkb2VzIG5vdCBoYXZlIGFuIFNTSVUgbW9k
dWxlIGF0dGFjaGVkIChsaWtlIHdoZW4gdGhlDQo+IGRldmljZSB0cmVlIG9taXRzIHRoZSBTU0lV
IG5vZGUsIG9yIHRoZSBTU0kgaXMgY29uZmlndXJlZCBmb3IgUElPIG1vZGUgdmlhDQo+IHRoZSBw
aW8tdHJhbnNmZXIgcHJvcGVydHkpLCByc25kX2lvX3RvX21vZF9zc2l1KGlvKSB3aWxsIHJldHVy
biBOVUxMLg0KPiANCj4gTG9va2luZyBhdCByc25kX21vZF9pZF9zdWIoKSwgaXQgdW5jb25kaXRp
b25hbGx5IGRlcmVmZXJlbmNlcyB0aGUgcG9pbnRlcjoNCj4gDQo+IHNvdW5kL3NvYy9yZW5lc2Fz
L3JjYXIvY29yZS5jOnJzbmRfbW9kX2lkX3N1YigpIHsNCj4gICAgICAgICBpZiAoKG1vZCktPm9w
cy0+aWRfc3ViKQ0KPiAgICAgICAgICAgICAgICAgcmV0dXJuIChtb2QpLT5vcHMtPmlkX3N1Yiht
b2QpOw0KPiANCj4gICAgICAgICByZXR1cm4gMDsNCj4gfQ0KPiANCj4gQ291bGQgdGhpcyB0cmln
Z2VyIGEgcGFuaWMgb24gc3RyZWFtIG9wZW4gaW4gdmFsaWQgY29uZmlndXJhdGlvbnMgbGlrZQ0K
PiBbU1JDXSAtPiBbU1NJIChQSU8pXT8NCg0KTm90IG9uIFJaL0czRToNCiAgLSBEVCBvbWl0dGlu
ZyBTU0lVIGlzIHJlamVjdGVkIGJ5IHRoZSBiaW5kaW5nIChzc2l1IHJlZy1uYW1lIGFuZA0KICAg
IFNTSVUgc3Vibm9kZSBhcmUgcmVxdWlyZWQpLg0KICAtIFNTSSBpbiBQSU8gbW9kZSBpcyByZWpl
Y3RlZCBieSB0aGUgYmluZGluZyAobm8gcGlvLXRyYW5zZmVyIG9uDQogICAgc3NpLU4pLg0KDQpB
IHdvcmtpbmcgUlovRzNFIHN5c3RlbSBjYW5ub3QgcmVhY2ggdGhpcyBmdW5jdGlvbiB3aXRoIHNz
aXVfbW9kID09DQpOVUxMLiBBIGRlZmVuc2l2ZSBgaWYgKCFzc2l1X21vZCkgcmV0dXJuIDA7YCB3
b3VsZCBzaWxlbnRseSBwcm9kdWNlDQphbiBpbnZhbGlkIERNQSBhZGRyZXNzIHJhdGhlciB0aGFu
IGZhaWxpbmcgbG91ZGx5LiBLZWVwaW5nIGFzLWlzLg0KDQpSZWdhcmRzLA0KSm9obg0KDQo+IA0K
PiAtLQ0KPiBTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hz
ZXQvMjAyNjA1MTIxODI2MzEuMzg0MjA2NS0NCj4gMS1qb2huLm1hZGlldS54YUBicC5yZW5lc2Fz
LmNvbT9wYXJ0PTgNCg==
