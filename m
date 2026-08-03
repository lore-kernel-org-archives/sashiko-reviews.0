Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012023.outbound.protection.outlook.com [40.107.209.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C60368D7F
	for <sashiko-reviews@lists.linux.dev>; Mon,  3 Aug 2026 13:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785763739; cv=fail; b=HoON76kOKY9r53UtkZ2Osl8ZI0psvnbYb0HRCBjj8eXVItzcSQmRzfHbwuPWkR45y6riHD5Xh/eqaXAszZfThNmAJfFKsUdBpyp9Yw7qy5KJZs1jci8idPdcOXI5+hJsoSYOAj9Wje5LowKNTvEEthnjkPKFaRZ4KflEI4hq7OI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785763739; c=relaxed/simple;
	bh=x8Rf/5AU+kyyEi2XpsSgimitgmZERUjZbFGAjAX/OXQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sJz0+bQzzNz2/H2SqGHcmPvqu+9Iu29Eub54IMYAGnUyBabhJ8kbIgxj6kGI3fCKK6/VTE+gb6d5WCEU+n0ONhGsiAEv+ZEviSvISL5BazB073/YKteXtYCP+NqZiz+Sayp1uGgQ8TBzaeWeNx6UGCPEUeYhnHxfftLs8z6gD/s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=rahmzFF5; arc=fail smtp.client-ip=40.107.209.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="rahmzFF5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B15gbIQCawc154JQTxALI9zknQi65Emxr1yiKmLPSbXJrezlXPeAiKLrS3PxWgKXJgMnm4ZXJGPZoQfKuFzcF2XVJFTqYv/xs/2ayN3WmU9ak5NWEKBBFBuA5ePelmPYlUss9s+ROybl1j6k13arNalJ5l0FwvVcG7IaWJlwsAFDxpjDKr11fvtNiNUly3P2B3eIOkMEKruaMBVuJk751e6XTTz3JYt7zcWUJO8oKJLT8WpMieZ1QZ9i3Ibne1IE+MXQpCW/swc+YQpPxJLCcR4YXWTwFW749Wqgg8jZApXi/rRAR4SbB+CB4R3UXgq3YELdpVYBHG7XdYfRRBzaOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x8Rf/5AU+kyyEi2XpsSgimitgmZERUjZbFGAjAX/OXQ=;
 b=t8uyOg2KbdkNbRQMew/4kxvyFtbiJGa0cu/v1W2TX5zR8Bohvw991B5/DTtz1Bi4zLveDelnEwCrnYCsRppB+MSfUZP2M5u6Q+3wmAuXGFFyYpqM/ALLgE5nUAPR9bzrFYtRl6djJYsfRNhcBna5bq7FLy4W50OAi+pu3vUYDyoLFKNR2f8FAW8E5gAyKQG//8QNxltHo6lRsrnXMAgtZJvtcOWXnMvE4BulAcJEwmf+gj8wHQ7w4bOs6brClGQvNC4byMmgv4S+MBg/bhzhn9Ahpt5E7nhwZYvZc8+Y3gvK9oWXVGp8zrmQbhCPRpuGCaCasPwFX3bnVaXOmiRZbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x8Rf/5AU+kyyEi2XpsSgimitgmZERUjZbFGAjAX/OXQ=;
 b=rahmzFF55JRmDc46vB0mVfGVEpb4dqwBuDHe0B/0AO/ulkNYGon1RF1HAQuEzwoJze5Qv/2OCB72FnJ1gx9xWCUoIH8OOb/nENYV8+Ukbpcs3zX7oCkfRIf/kxVLE/1GFZP/Pd5Mqcw/9ulcemyTDWGz0RhdTIhyM+8SuOoOlzMub9KfyQTSgdjNAFzVr8CwPcmSyNPhDy7Rm2E1cpsK4ZjT6aJ11I+mvKsFLY8OdlvUWN9/f/b0tlTJ0hM0IeH89wTn9gFEGbKhxmy5W3N/t6+nBtJ/1jolwIIrFsu9volfDx7msMyubZ3xn6RJnyD9PKDJ8Lg2br52rrQKkBqPCQ==
Received: from BY5PR11MB3990.namprd11.prod.outlook.com (2603:10b6:a03:18d::31)
 by MW5PR11MB5884.namprd11.prod.outlook.com (2603:10b6:303:1a0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 13:28:51 +0000
Received: from BY5PR11MB3990.namprd11.prod.outlook.com
 ([fe80::2349:6631:bb47:77d3]) by BY5PR11MB3990.namprd11.prod.outlook.com
 ([fe80::2349:6631:bb47:77d3%4]) with mapi id 15.21.0270.017; Mon, 3 Aug 2026
 13:28:51 +0000
From: <JensEmil.SchulzOstergaard@microchip.com>
To: <sashiko-reviews@lists.linux.dev>
CC: <robh@kernel.org>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH net-next v10 4/9] net: dsa: lan9645x: add basic dsa driver
 for LAN9645X
Thread-Topic: [PATCH net-next v10 4/9] net: dsa: lan9645x: add basic dsa
 driver for LAN9645X
Thread-Index: AQHdEtU+vRteE77CvUuvMqsfYLuib7ZtGK2AgB9ZsYA=
Date: Mon, 3 Aug 2026 13:28:50 +0000
Message-ID: <5c55e768a185ce97e942eef76cca290f93f7cb5c.camel@microchip.com>
References:
 <20260713-dsa_lan9645x_switch_driver_base-v10-0-a4886a08fb15@microchip.com>
	 <20260713-dsa_lan9645x_switch_driver_base-v10-4-a4886a08fb15@microchip.com>
	 <20260714144346.22BB41F00A3D@smtp.kernel.org>
In-Reply-To: <20260714144346.22BB41F00A3D@smtp.kernel.org>
Accept-Language: en-DK, da-DK, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB3990:EE_|MW5PR11MB5884:EE_
x-ms-office365-filtering-correlation-id: 8a891b86-97b2-4a47-d600-08def1632814
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|6133799003|18002099003|22082099003|38070700021|4143699003|11063799006|56012099006|10067099003;
x-microsoft-antispam-message-info:
 +V1Jo4hrwYLNxiPtdR5oi6JYdIOjDUP5FMiVaXHIYtpWwwAVfOYbUdyJMDxbViEJV5iLqP+hF02rJSGJhqECQcx6WbcmzTpKWXLPhlZK5xV1pElP1ueDt9VGgrGIoqvP0K7E1LeHEwQR8AI6tdLkkdUaOQaSNYMpQzSEbeWCO87FrVISrqmlBL3awQKGoNEnFsTmRoQ80kJtbADFCkOx4rjodc/5Vog/oRnp4ujbs+wK4HH7vjP3LqooAoXg53OvgkxuEF2fXEiIEtljJnu7x/9k2ukNsAAQOF8sqsPkOADHa3XG/pxM/4b3TYn2VZHxk824reGeo7F6NE8RdqgsvzOqHDbi6iw0rG9WUsC46Y2bSTR14OEqlMkLp8i3IfTUncemxBAXMLHH6BUmhdI7O/X8BmTAh0Wa+/4KL0FfNnkxTRh4qJ/GQTbW8/u7q7UeSsYW+Se15wfUpcSduNHFTXOLPuw5g+yaQVREO55NhnqTSPMSjmoFWHAsgghYF35fFPIQQfgmyAkW3SR6a0W1A4u4HlqwSBANKJfpxl/eATv4IUDgxA2Jo7EtAYsJeaOdkZr2hU/tDYjLIkE6g4AlgqAQWRxSH5x5Yil/xhEwlOUr766+uBxGUOUdY3N1cVYR+5ca5+d6sCT7I4F91fxsdiRQZOLCcryMhZzNN9qd9B0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3990.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(6133799003)(18002099003)(22082099003)(38070700021)(4143699003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WUNTSzhETWE0Lys1L1VocUFNckthWS9ndG96NU5oT01MNlFlUG11VUQzOFBC?=
 =?utf-8?B?SG9uSG9IN2xITk04QXRyaWxRZnBSZW52bXNqY3dTdnJsV1NRMnp1dUlaa2ZI?=
 =?utf-8?B?Rlk5aGN5UmJPOHdqejVkR08vRkVVZ3lCRHJYUDNackdRQjJ4VDJ0N1V2Qk9P?=
 =?utf-8?B?a0NUTjJ4Sm4vTWlrTml3anhvRHpGRGtJbUNTNFJ6LythcXgzeVVBc3c4UHRY?=
 =?utf-8?B?WE5QbURPRUFpdWtlcXJ5eVptR2VyRHVBWVRBZzZlbE1hNXhCWDRESEdFU3hX?=
 =?utf-8?B?YVJiU3MwZGRzLzFjaW9IU2RWV0N6aHBFMUp5QXpDYmUzakZoRm9ENXBGa1Vi?=
 =?utf-8?B?K0lPK29NbGxyUUQyS0F6VnlYSnNVY3V4OHUzSUwxRVRScHJsQnFwdlhNdWJL?=
 =?utf-8?B?bnJsZ283d25CWXNSRVZLTGZCeGtYbUljb3BaU3hHTmxkRW5KYlh3MjJZN3My?=
 =?utf-8?B?VmEwWFBiK0NrYmhET1BZMmpVUlNSQmxkYUltaEtqNmIrdmF5d2Q5TmdnTGRX?=
 =?utf-8?B?WDFGbWpCMG9SVzJ6RGZ6Slh1QnBxTkVjSSt3elovME96VEQ2Y0dzMDJNbWp3?=
 =?utf-8?B?dGtqd2tPNDAzVGtGNmhyeXdmUmtGWldZdkxGSi9uK21IVk1LdHBybG1TbnhJ?=
 =?utf-8?B?eVRaaFU4WDY0RXRSYjkxUWRJK2l1Ui9hV01zWlppZmtabkxIaGdSclVkR1Ew?=
 =?utf-8?B?THAyOGN0RTRLM3l1cy91RDVnV2g0RVBEOXpHZUlKRnVDNmpIY1pEVDRXeUFI?=
 =?utf-8?B?VHNvYzlvMzYxOEVrL1FSMzE5Ty96c1RkWi9YSDhlSTlqUGpPQWdaNnhBVU95?=
 =?utf-8?B?N0cxMFJ3d1FJSlRWZWc2YTZlTWdVWHF3MjQyOHZkOURNQ2VOcC9GUmM2ZjNU?=
 =?utf-8?B?WnYrMzB1VU4zbTBDNE5xbnM5N1cwdTJ6dTR0NENkS2RoZ2Q2disrQVdYWjFU?=
 =?utf-8?B?bWlUR2xNWUY4a1gxNmRaeEZZRjlhaWkvcXFqMEluNFdpMlF2VlNSR2pEcGpC?=
 =?utf-8?B?dEZiTERvZDdpMW0zMG9GRU5jcmVscEI4SmxxVkx6N09GQUZVQ0R2SFB3QUV3?=
 =?utf-8?B?K0V0MjVRQ2RFaEFlOUJ0bEgwNFRTNWNETDFUazZsSWxPa2NtTjlxdVVKMnZH?=
 =?utf-8?B?TjFYcVNJZDdLMDBuMXl1V2tsR2F5RWZwZE0zb2JTcEJ4V01uN1hIaVJFVGE0?=
 =?utf-8?B?QWU3T1VyNlZseCs5cW15WVFodjdSR0pyR2pLWnlrYWZJcXlJNFZXTmQvUWZl?=
 =?utf-8?B?VzN2QVI0U2dnRjJBd2JBRmZEaUtRSC9ETmd3Q2RQM3d5WlNtTUFabmNzbHEz?=
 =?utf-8?B?a2NVQzJkQ0w2cVRlelVmMXFCekNVTk1nSTllOEJxVFdmamh0T2hKVU9lM1Qy?=
 =?utf-8?B?Z3cvRzVhVGx3VjhGS1psVzVpenl6U2k2MWwyaVcxNythNWVpQzJqOWFyem1N?=
 =?utf-8?B?Rml2RlZDU0NaMkVKRHVoZDFxZDVtbjhaYjdzeFZpWVBta0JRZVNJK2Q2dk5Q?=
 =?utf-8?B?aTd4VGk2YnF3eERxSWpYeng3c2lsYTdQSzFBUERHZ2VOYUZJTEpja2xLdmpU?=
 =?utf-8?B?dmFDak12TUZVK0tUbmdwZ2g0OEU4R3djYU9KMFRCZzNwbjZZdUVGSGlhbmRq?=
 =?utf-8?B?YkhBa2NGWGh6MXVpK0ZEYmJTTzlVTVplbmREZnJDbWFyNU9XUUo2QXZmVE0y?=
 =?utf-8?B?MytxblBCN0M5dHQvOVNXcnNjTHFJUk1uWWJBekw0c2taSmk4a1k0RWp4NzBr?=
 =?utf-8?B?OGo2aWplaVRjVkVBUXF1ODdsWEhqK3FKNmxRUjIvSDRNLzFybm4rbTVKcS9L?=
 =?utf-8?B?dkZ1OTJYQmF1SGcwVVJKRjJxS3RXTkFFWURPSUgwRXdpbnJBS2FmaHBIUkdU?=
 =?utf-8?B?LzloL2x0UEZtVjdCR3RPM00vSXMxdUNKMTVFZ3htcjU0c1pFRFRndldLTmta?=
 =?utf-8?B?TDAxckIyVXVMbmJHc0plaGZmSkdqcTBTUHJJdGpSMmFtTFRrQWhkUFhoeGtx?=
 =?utf-8?B?ZTVESk9DaVdEdzh0TS9kYjZTUmpqcElBcWxJYnBoWjRxOHdDNnYwTjRKOTUv?=
 =?utf-8?B?eDNjbHk0ZzV2NktQY2ZqeXQwRzlsMG5jbkRLOXNhTmRQTmw5N0ZUY0FZL3VQ?=
 =?utf-8?B?bTZvRkYwQWVYODVkb1YrVG9hODA1MXQxcHdDZ05saEJLS3AveS8yUWhmUUEv?=
 =?utf-8?B?M0VCajQwVndkbWhFUVpEaWhLblZjZTVyYmFKYitFa0tGR2ZMendSRHExOWF0?=
 =?utf-8?B?RUVpT3IzelZWbVFseWVWSHNzeWxBK1NsMHZ4QnN3SnpOS1BodWJJRk5lNVRG?=
 =?utf-8?B?bTQ4STlVRlBnOHMxVEQyeXpNRDVDak5OYncxZ3YrS0h5enJITjJpeGJzdVI4?=
 =?utf-8?Q?Rvp9fdqcTZ1mNA8skUmz8eCRPsy0YZ7sqx7D49/vpnW7M?=
x-ms-exchange-antispam-messagedata-1: hLjBQlpeJOdS4Q==
Content-Type: text/plain; charset="utf-8"
Content-ID: <27E674E826289846AC9C00CB0857B0CA@namprd11.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a891b86-97b2-4a47-d600-08def1632814
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2026 13:28:50.9128
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hb5wY9YuwXVzSkuA3W2jm3zzQdgoVL272R1K+NFsr/wY6wZJp17PzDZYefwfSwoerXIlRzTq1H88U64/3fJODZeXYZxlWBRdsjGGHCllUS5fXDMWQLNm2gi9vX9/PlUP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5884

T24gVHVlLCAyMDI2LTA3LTE0IGF0IDE0OjQzICswMDAwLCBzYXNoaWtvLWJvdEBrZXJuZWwub3Jn
IHdyb3RlOg0KPiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0
YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IFRoYW5r
IHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkgcmV2aWV3IGZvdW5kIDEgcG90
ZW50aWFsIGlzc3VlKHMpIHRvIGNvbnNpZGVyOg0KPiAtIFtIaWdoXSBNaXNzaW5nIEZEQiBvcGVy
YXRpb25zIGFuZCBvbWlzc2lvbiBvZiB0aGUgQ1BVIHBvcnQgaW4gUEdJRF9VQyBicmVha3MgdW5p
Y2FzdCBJUCB0cmFmZmljIHRvIHRoZSBDUFUuDQo+IC0tDQo+IA0KPiAtLS0gUGF0Y2ggWzRdOiBb
UEFUQ0ggbmV0LW5leHQgdjEwIDQvOV0gbmV0OiBkc2E6IGxhbjk2NDV4OiBhZGQgYmFzaWMgZHNh
IGRyaXZlciBmb3IgTEFOOTY0NVggLS0tDQo+IGNvbW1pdCA5OTZjZjM3YzBmZTI4YzM1MjQ0MmMz
YjgyYzBiNDAxOTc0YjhmNjZhDQo+IEF1dGhvcjogSmVucyBFbWlsIFNjaHVseiDDmHN0ZXJnYWFy
ZCA8amVuc2VtaWwuc2NodWx6b3N0ZXJnYWFyZEBtaWNyb2NoaXAuY29tPg0KPiANCj4gbmV0OiBk
c2E6IGxhbjk2NDV4OiBhZGQgYmFzaWMgZHNhIGRyaXZlciBmb3IgTEFOOTY0NVgNCj4gDQo+IEFk
ZCB0aGUgTEFOOTY0NVggYmFzaWMgRFNBIGRyaXZlciB3aXRoIGluaXRpYWxpemF0aW9uLCBwYXJl
bnQgcmVnbWFwIHJlcXVlc3RzLA0KPiBwb3J0IG1vZHVsZSBpbml0aWFsaXphdGlvbiBmb3IgTlBJ
LCBDUFUgcG9ydHMgYW5kIGZyb250IHBvcnRzLCBhbmQgcGh5bGluaw0KPiBpbnRlZ3JhdGlvbiBm
b3IgTUFDIHNpZGUgY29uZmlndXJhdGlvbi4NCj4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bmV0L2RzYS9taWNyb2NoaXAvbGFuOTY0NXgvbGFuOTY0NXhfbWFpbi5jIGIvZHJpdmVycy9uZXQv
ZHNhL21pY3JvY2hpcC9sYW45NjQ1eC9sYW45NjQ1eF9tYWluLmMNCj4gPiBuZXcgZmlsZSBtb2Rl
IDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAwMDAuLmIyNTM4MTM1MThjMjANCj4gPiAtLS0g
L2Rldi9udWxsDQo+ID4gKysrIGIvZHJpdmVycy9uZXQvZHNhL21pY3JvY2hpcC9sYW45NjQ1eC9s
YW45NjQ1eF9tYWluLmMNCj4gDQo+IFsgLi4uIF0NCj4gDQo+ID4gQEAgLTAsMCArMSw0NDcgQEAN
Cj4gDQo+IFsgLi4uIF0NCj4gDQo+ID4gK3N0YXRpYyBpbnQgbGFuOTY0NXhfc2V0dXAoc3RydWN0
IGRzYV9zd2l0Y2ggKmRzKQ0KPiA+ICt7DQo+IA0KPiBbIC4uLiBdDQo+IA0KPiA+ICsgICAgIC8q
IE11bHRpY2FzdCB0byBhbGwgZnJvbnQgcG9ydHMgKi8NCj4gPiArICAgICBsYW5fd3IoZnJvbnRf
cG9ydHMsIGxhbjk2NDV4LCBBTkFfUEdJRChQR0lEX01DKSk7DQo+ID4gKw0KPiA+ICsgICAgIC8q
IElQIG11bHRpY2FzdCB0byBhbGwgZnJvbnQgcG9ydHMgKi8NCj4gPiArICAgICBsYW5fd3IoZnJv
bnRfcG9ydHMsIGxhbjk2NDV4LCBBTkFfUEdJRChQR0lEX01DSVBWNCkpOw0KPiA+ICsgICAgIGxh
bl93cihmcm9udF9wb3J0cywgbGFuOTY0NXgsIEFOQV9QR0lEKFBHSURfTUNJUFY2KSk7DQo+ID4g
Kw0KPiA+ICsgICAgIC8qIFVuaWNhc3QgdG8gYWxsIGZyb250IHBvcnRzICovDQo+ID4gKyAgICAg
bGFuX3dyKGZyb250X3BvcnRzLCBsYW45NjQ1eCwgQU5BX1BHSUQoUEdJRF9VQykpOw0KPiANCj4g
W1NldmVyaXR5OiBIaWdoXQ0KPiBEb2VzIG9taXR0aW5nIHRoZSBDUFUgcG9ydCBtb2R1bGUgKEJJ
VChsYW45NjQ1eC0+bnVtX3BoeXNfcG9ydHMpKSBmcm9tIHRoZQ0KPiB1bmtub3duIHVuaWNhc3Qg
Zmxvb2RpbmcgbWFzayAoUEdJRF9VQykgcHJldmVudCB1bmljYXN0IHRyYWZmaWMgZnJvbSByZWFj
aGluZw0KPiB0aGUgQ1BVPw0KPiANCj4gU2luY2UgaGFyZHdhcmUgbGVhcm5pbmcgaXMgZGlzYWJs
ZWQgaW4gbGFuOTY0NXhfcG9ydF9zZXR1cCgpIHZpYQ0KPiBBTkFfUE9SVF9DRkdfTEVBUk5fRU5B
X1NFVCgwKSwgYW5kIHRoZSBsYW45NjQ1eF9zd2l0Y2hfb3BzIHN0cnVjdCBsYWNrcyBhDQo+IHBv
cnRfZmRiX2FkZCBjYWxsYmFjayB0byBzdGF0aWNhbGx5IHByb2dyYW0gdGhlIENQVSdzIE1BQyBh
ZGRyZXNzLCB1bmljYXN0DQo+IGZyYW1lcyBkZXN0aW5lZCBmb3IgdGhlIENQVSB3aWxsIGJlIHRy
ZWF0ZWQgYXMgdW5rbm93biB1bmljYXN0Lg0KPiANCj4gQmVjYXVzZSBQR0lEX1VDIG9ubHkgaW5j
bHVkZXMgZnJvbnRfcG9ydHMsIGl0IGFwcGVhcnMgdGhlc2UgdW5rbm93biB1bmljYXN0DQo+IGZy
YW1lcyB3aWxsIGJlIGZsb29kZWQgdG8gdGhlIGZyb250IHBvcnRzIGJ1dCBub3QgdG8gdGhlIENQ
VSwgZWZmZWN0aXZlbHkNCj4gYnJlYWtpbmcgdW5pY2FzdCBJUCBjb25uZWN0aXZpdHkgKHN1Y2gg
YXMgQVJQIHJlcGxpZXMpIHRvIHRoZSBob3N0Lg0KPiANCg0KSSB0aGluayB0aGlzIGlzIGEgZmFs
c2UgcG9zaXRpdmUuIEkgaGF2ZSBzcGxpdCB0aGUgcGF0Y2hlcyB0byBtYWtlIHJldmlldyBlYXNp
ZXIuDQpUaGUgY2FsbGJhY2tzDQoNCnBvcnRfZmRiX2FkZA0KcG9ydF9tZGJfYWRkDQpwb3J0X3Nl
dF9ob3N0X2Zsb29kDQoNCmFyZSBhZGRlZCBpbiBsYXRlciBwYXRjaGVzIGluIHRoZSBzYW1lIHNl
cmllcy4gVGhlc2UgaGFuZGxlIHVua25vd24gYW5kIGtub3duDQp0cmFmZmljIHRvd2FyZCB0aGUg
Q1BVLiBGb3Igc3RhbmRhbG9uZSBwb3J0cyBmbG9vZGluZyBvZiB1bmtub3duIHRyYWZmaWMgdG8g
dGhlDQpjcHUgY2FuIGJlIGNvbmZpZ3VyZWQgd2l0aCBwcm9taXNjdW91cyBtb2RlIGFuZCBhbGxf
bXVsdGkuDQoNCj4gPiArDQo+ID4gKyAgICAgLyogQnJvYWRjYXN0IHRvIGNwdSBhbmQgYWxsIGZy
b250IHBvcnRzICovDQo+ID4gKyAgICAgbGFuX3dyKEJJVChsYW45NjQ1eC0+bnVtX3BoeXNfcG9y
dHMpIHwgZnJvbnRfcG9ydHMsIGxhbjk2NDV4LA0KPiA+ICsgICAgICAgICAgICBBTkFfUEdJRChQ
R0lEX0JDKSk7DQo+IA0KPiBbIC4uLiBdDQo+IA0KPiAtLQ0KPiBTYXNoaWtvIEFJIHJldmlldyDC
tyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA3MTMtZHNhX2xhbjk2NDV4X3N3
aXRjaF9kcml2ZXJfYmFzZS12MTAtMC1hNDg4NmEwOGZiMTVAbWljcm9jaGlwLmNvbT9wYXJ0PTQN
Cg0K
