Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013051.outbound.protection.outlook.com [52.101.83.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9048E371065;
	Thu, 23 Jul 2026 04:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784781539; cv=fail; b=Rf+krX8zBIyzeCKEPWhYAlewQ5tvvX9lw7SrZUqHQpFX4Cw0aoG0kaV8AC9G6+oNzKXLfNGk0oSt6S/w+dZvfjjFmUo0QpA8inxx3tjlu0xOxG7Ijv70/NWSPXXK7hc9KrZZBZuju0bZB7LpTWY7+Uup1uSgBLXVOrZ3WPdmBK0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784781539; c=relaxed/simple;
	bh=Y9OuvekTYgq9ZFQ9A1h86kEhex4pFoZQBTT9JKc3lBA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cnBaqAIRWtxgCDiEk2Jj2sejqNlrPZfXref4MxADWGt6PAGbCWP7oCkhz3NmyleN3uHScgB84gRA7oIKDgOizvik7CTSmBjIXV0hNA+45wCTSb0gnZ4bhA28G9HJHHuq9Qo3Iyn2QWsp6uZuZxRv/IluJck9indllyUC8yl5OkI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=UI0L9RDY; arc=fail smtp.client-ip=52.101.83.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="UI0L9RDY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FKypKN4xecAkxRj2G1ztDZkRupS/IxPUL/b48xdvRHf47wA03DRSHrUlTqpLbqbe9fu8dIhY0/i5k+4IxT/zGwPrfvMi+rV3vngkE1y4UqGoqdF0wAFFUnVgb/alAmWJ9CqaZEmsPYUrx3xZapqRr1MVTH2QzEZ4ygQT2Rr5tT0u49zx8sjNv/vCfvZQ/l3Bl4HXJJDNGiNSZeyN15fbL60z6lxKGCtQFhRO9w4AYBFTIG5HsUb1A3yd36XJBqLbPIG3OnXnOV08gyVcXav1jts144PL/HoYts4cgnHFSDZGlX37Asq4jOFbGCoI0vwdYqEbjrD4u/vODRNE+vE8EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y9OuvekTYgq9ZFQ9A1h86kEhex4pFoZQBTT9JKc3lBA=;
 b=ip0R2PU0tm6+U6sWmgYQyXFwODpxc6+1ktnuC5jUFLKeFoyf+qXhNDSXDt6E7U0esLBwF7G5vxJjxGI1Q8ygAE/a4crbabk0y4ILjTm9vAjqqXZiioCCJQbBgHx3EJJcRy3BKAVNBrSu/k7w3VbAvjMkNaPP08h1cSPgTPUDqO14/uNviCMxYQde2nHX1505VbDanQWrFcuhbhDVWT61eM5nhsOYZSVx3aY5gV86HCq07LkRdv/4N0AAtGnzSIxWuqo3k4kXZ8trx7uPHzRag5TI/csSx/zNp5rv3rkoAZzxvXfhsLmgjvJCjrg/l0AS8ixFjjMLiBdwvbMel10fZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y9OuvekTYgq9ZFQ9A1h86kEhex4pFoZQBTT9JKc3lBA=;
 b=UI0L9RDYau/h9dJoWVfA3/u7W1ly/Nih5G4xLljVy3jKAoCoJYlWQ1iPEheBVyBz0RU1w53ItRqQCMYikC8TGIOem/JlgmE3hg93JjGlVEt42Jey6lyk66a8A3UV1Wn2gCFunNdO/+4z6XoBIqKh3uEuR1BN6NYruhwmAN2oD/LVx9zoU8hJfxrF7IkD3MPKa9evkTTUIaVhGtOTMKraLwoT7fR5juYB5fPXSlBiABQmleuD7bYzJqGyExgbN69UJaJUJjCVt2hIkcQeMA771OV2r1o0f6npajDxmrMgTMCyVGuKoJzrLwLA32weELlrxxOge1y9IXf7DVtur+FjZQ==
Received: from AMBPR04MB12334.eurprd04.prod.outlook.com (2603:10a6:20b:732::5)
 by VI1PR04MB6894.eurprd04.prod.outlook.com (2603:10a6:803:13a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 04:38:39 +0000
Received: from AMBPR04MB12334.eurprd04.prod.outlook.com
 ([fe80::9b4f:ab4e:94c3:c457]) by AMBPR04MB12334.eurprd04.prod.outlook.com
 ([fe80::9b4f:ab4e:94c3:c457%4]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 04:38:39 +0000
From: "Zhipeng Wang (OSS)" <zhipeng.wang_1@oss.nxp.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"Zhipeng Wang (OSS)" <zhipeng.wang_1@oss.nxp.com>
CC: "robh@kernel.org" <robh@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "Frank.Li@kernel.org"
	<Frank.Li@kernel.org>
Subject: RE: [PATCH v5 3/3] clk: imx: imx8qxp: add soft dependency on SCU
 power domain driver
Thread-Topic: [PATCH v5 3/3] clk: imx: imx8qxp: add soft dependency on SCU
 power domain driver
Thread-Index: AQHdGkfbUzHy/H5ykUWsMNWgqnmpyrZ6XxSAgAAjYpA=
Date: Thu, 23 Jul 2026 04:38:39 +0000
Message-ID:
 <AMBPR04MB1233452C915AC013AEDF8FE41EBC02@AMBPR04MB12334.eurprd04.prod.outlook.com>
References: <20260723020524.1886806-1-Zhipeng.wang_1@oss.nxp.com>
 <20260723020524.1886806-4-Zhipeng.wang_1@oss.nxp.com>
 <20260723022025.C557B1F000E9@smtp.kernel.org>
In-Reply-To: <20260723022025.C557B1F000E9@smtp.kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AMBPR04MB12334:EE_|VI1PR04MB6894:EE_
x-ms-office365-filtering-correlation-id: 3fa433d7-c85b-4a94-a700-08dee8744451
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|19092799006|376014|366016|56012099006|38070700021|11063799006|10067099003|22082099003|18002099003|6133799003|4143699003;
x-microsoft-antispam-message-info:
 wJDC3NaqzMiNnZ/w2K7y2iNcjUslyqvTFyOM1s2gGPVdnTW/wEVmnYzMLlPYWtqhkH7+5nK+JWvlZaA5PBwEWWfPYBFIiJTBOC6itPP1shb6inAhkOV7vuifPVdmBXCKrD3JOZ01xsZc9+Om58dI31OXwM5QgQMkfv9+lAde+hX/z0USg4BLu3pMJpitSwLigFjeLpBAghbwk2NSm9WgFAXJCcbsbXApRXIhK3cvNME+7YUxKXAcoIdRtGmrADCNRpYNcPPss8zQEcBDtO9oO33UnOPIiHIhBy8N+7TuDOXEDufheUcvdpMyNsQnDNX6acPnhtjwpmywtzOYwXXBPfKucvpFsFD0nP9CSdAe/7AP6RoDeRpWvthegQcmX/ziRFqE7GRaPRCUcGNRSRQGJkt5NAm1CxjI7e1Xu8JWh2+cjjEwHvCcmcKoTBci/6gYt8ppfL7+5ZT7aREk4IivDUG+xIaH5IHzjTTPloogP0z63IWoo3AjMknE0xERik4dMzGTqPmhMJnD3uGN9NOD90SLYHpAQBqUVg6KfHJrXz3j3cg9/26ol04ref0ugPL5PeIGJH57JJneeghda7P2T0yDTb5cFspYaBW9Xyxbnv+q13KeRczkEVzOqWjh0YgSF8LyFBU5F1edHrdfzbCJ6CUmUxqz3EBdJNLusBXPwfs=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR04MB12334.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(19092799006)(376014)(366016)(56012099006)(38070700021)(11063799006)(10067099003)(22082099003)(18002099003)(6133799003)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?anRVa015OUZ0N0ROTnhNYllDK3JBQTBPcmV0WGdSeS9NUENTamFSZU4wdzZI?=
 =?utf-8?B?YmhXYkl2YWN6eXlvV0dCN0hOcXhNT1JyUWVuZFBDUUYwSnZVWVRuRUkxdTEx?=
 =?utf-8?B?d3JsUDN5eE04SzBmOFlLYzdYQnU1dmZzM1pXNWwvdmRGRGdhNGhkcHE3WFJL?=
 =?utf-8?B?aURKZGI5UGduSkpKb1JsTFVEVVlualBaUUlYMVZZQXV6bHdldm9MbFdySmJN?=
 =?utf-8?B?ditKVTh5OGVqQXdNME9vZ1o0L0pVbWYvOFRsTnliWldtTS9yUGdUUzlEUTFG?=
 =?utf-8?B?WVE2eFNYS3lGSXdOUXVkTGdqWnZ4U0I0RWU1ZXk4OFBUbjdWdTlOZ1lrQ3I3?=
 =?utf-8?B?bldubkNlTkdVU1lSYS80dkpkV0VhNXJBc2pDRjh1a2oycXAwcnpQa2ZOayta?=
 =?utf-8?B?WmJ0em50QWt5UnV5blJ4UzZMM21vd2FJTVl4dUZuNlB3Zmk1RHZSVVNLcGpK?=
 =?utf-8?B?Ty9zb2w1L0JUazZ2cVEyL1ZQYlRrdURTZ3l1SmU3alFxQ3lvMWJqNUlVRnd0?=
 =?utf-8?B?RTArbEVNdk1tT0RpWFpPMk1vTXhtSHhuaWZINzNyUWZhRWhsMkdQeUErMkVr?=
 =?utf-8?B?Z2JzbUJuRWIzS3FCbkRieTR6NEZsV29aRnMzZ1lJQUZ0WE9sU2kxMXpyMkhr?=
 =?utf-8?B?dUV3R2VIYU5EZUNaMVN2QUtRSkk5OGdCN0VjbXNrMTdMOWFNclRXaU9zczFN?=
 =?utf-8?B?bHRVNEtlcE9zVCt5RDk4Rk8xSFpEenRmNksyVmhqejUxUmJTb2dqcjdlMFZ2?=
 =?utf-8?B?QWJpK3dzTzh4MlVhUm9vZm9BRXF5V0tveDE3V3V4TG9hMmZhN2V4Q0tWOFh3?=
 =?utf-8?B?aDhwMXVHY3R6cVhEOGRFMzZOWU85YWxlL2Vya3ZZS3JEZkl5L0Q1T1dubzdz?=
 =?utf-8?B?bXFKWUQ2WmJrOWJqd01SZFZGLzB3YW1DL1BoeHpaL1AzdDNtbEROemZvK3Rq?=
 =?utf-8?B?dnZ4S3dzZE5naXhZUnBURkl5R1M1NldsMW9KRTNPZVpVekVsalExRXFhMk50?=
 =?utf-8?B?amNrU1JXZ2JCWHVtalZzeWt0cGFQUUJFYmJIZ0pnQ1hBWnhRN1AxUHhDZGt2?=
 =?utf-8?B?anp3eWVOa2FxK1paNllKaGlQakRGRWxOUnJZajdySk81a0xQT01henNENXpa?=
 =?utf-8?B?NEE4VE90emt0Q0JBQ1Z0Vnc2S1NKVmpmYUZUeHRlMXlqNEpZMzFzN3hudlNU?=
 =?utf-8?B?Z0U2VU41bzlZSkx3STVYQi90eE11S091cVd5d3g3QlcrY0tFQXJsN2l1RVpx?=
 =?utf-8?B?MXhNL0pDT1dQNEF0bko4RzVTRjhhZ0U5eUxkZThrcUJpeHV2UlQrSElmMVZK?=
 =?utf-8?B?elZlOEMxZ2JLbVNXT3FwUitMODhrTWV1c2ZnM0pDVlZSTklnUE4wZmFmUFh0?=
 =?utf-8?B?cnhReElkN2ExcGYyWCtHWmxBQWpManI2QjNScTAvRG41OHZaL1VaNXJmbGd5?=
 =?utf-8?B?ZmZzMnI0NkpSd2FveDNhc282anhHOWJUS3FZNTh4U0pKYXV1Zk4yM01wVlRS?=
 =?utf-8?B?Q3d6bmxIaHlxTGI4dkRJblU2MnR6UkV2eDc3T1Rvb1FkdzZvelgxOTIzSlpz?=
 =?utf-8?B?M0VZNUFyUFRQUXRRYk9RMWpvZ0RvY0xJUm1Wd2JzT2dYenkrRzJWT0Vwd2dQ?=
 =?utf-8?B?OUpSck5kQzJhYW50VjFQeS85VXZVUllqNXk0SFdtM01iblQ3aU9pZWpwZThL?=
 =?utf-8?B?aUhsWmhnbDU3L1VXL3hxS1lWZVBYT0JIRDAyVlYyZ2NFWXUxUVlBNnlyZ0FJ?=
 =?utf-8?B?UVA3cVBmQjNEYU11WjlqYWEwak1lRU9Sb1VML0ZlaFp0MGlvT1ZST2Z4QkZj?=
 =?utf-8?B?SkZ5NER6dGlHbHd4YW1kWTczWE16eDhFREI3QUQ0NXdYRUY4Y29sYnBuWnNB?=
 =?utf-8?B?UkFYVFZIYmtra2RnbjNrTThGSU84QTc5Wmdhb3QxQTgxSTJVK09kd0NPRDRO?=
 =?utf-8?B?Q29yNzRDMmVrVUcvcFdUSU9BMzd2VG50RkpvSVBwWSszZnlLZGIycDZ6UzUz?=
 =?utf-8?B?SW5sTDcyT2dyc2NlcVhUNDNDL3hGZUFXWnFCazZKWG5Id3NRVElBdmp4ajM3?=
 =?utf-8?B?cGFyWGE4YmtDc0ZmQ2lTMHliOGxKcUU0S3V4c09kZDVHUWdoWTRtalJmL1pE?=
 =?utf-8?B?S1BEOWJtY0EzOURGeUhWMmtIWmJFcngvVDlIeWtRa1N6WVBrZGNkWEZlRUpN?=
 =?utf-8?B?NTdEeUdwUjFrejlRQ2UwbmI3WnFaT05JL09hcVd3NkZ6dCswWE84S3lwOFhi?=
 =?utf-8?B?aXZBeEpsNTBhNWRoNnIrNWNVT3o4SGN2eGNtdm0zZ05hZnZTVEs4R1F0Mmpa?=
 =?utf-8?B?MGZhUmNGemFwT05ZV3poMTZmbmE4NlFvTzlmWmpjRFkzaGNnYU43UT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AMBPR04MB12334.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fa433d7-c85b-4a94-a700-08dee8744451
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2026 04:38:39.2648
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s03nHzM8Fp500saIXUoj7FV3Gdg6VnjQBne2jYjV+LUCEfYAGRVahQWZ/WcWAqJSKjHLkx21caw2fOf8skc9oA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6894

PiBUaGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNoaWtvIEFJIHJldmlldyBmb3Vu
ZCAxIHBvdGVudGlhbCBpc3N1ZShzKSB0bw0KPiBjb25zaWRlcjoNCj4gLSBbSGlnaF0gUmVseWlu
ZyBvbiBNT0RVTEVfU09GVERFUCBmb3IgZHJpdmVyIHByb2JlIG9yZGVyaW5nIGlzIGFuDQo+IGFu
dGktcGF0dGVybiB0aGF0IGZhaWxzIHRvIGd1YXJhbnRlZSByZXNvdXJjZSBhdmFpbGFiaWxpdHkg
YW5kIGlzIGNvbXBsZXRlbHkNCj4gaW5lZmZlY3RpdmUgaW4gYnVpbHQtaW4vbW9kdWxlIGNvbmZp
Z3VyYXRpb25zLg0KPiAtLQ0KPiANCj4gLS0tIFBhdGNoIFszXTogW1BBVENIIHY1IDMvM10gY2xr
OiBpbXg6IGlteDhxeHA6IGFkZCBzb2Z0IGRlcGVuZGVuY3kgb24gU0NVDQo+IHBvd2VyIGRvbWFp
biBkcml2ZXIgLS0tIGNvbW1pdA0KPiBiMjNjZjNhYjhhYjA0Zjg1MmY0OGQxZmQ3MmI0YjRmYTkx
NGE4Y2QwDQo+IEF1dGhvcjogWmhpcGVuZyBXYW5nIDx6aGlwZW5nLndhbmdfMUBueHAuY29tPg0K
PiANCj4gY2xrOiBpbXg6IGlteDhxeHA6IGFkZCBzb2Z0IGRlcGVuZGVuY3kgb24gU0NVIHBvd2Vy
IGRvbWFpbiBkcml2ZXINCj4gDQo+IFRoaXMgY29tbWl0IGFkZHMgYSBNT0RVTEVfU09GVERFUCB0
byBlbnN1cmUgdGhlIFNDVSBwb3dlciBkb21haW4NCj4gbW9kdWxlIGxvYWRzIGJlZm9yZSB0aGUg
Y2xvY2sgbW9kdWxlLiBUaGlzIGlzIGludGVuZGVkIHRvIHdvcmsgYXJvdW5kDQo+IGZhaWx1cmVz
IHdoZW4gYXR0YWNoaW5nIHBvd2VyIGRvbWFpbnMgdG8gY2xvY2sgZGV2aWNlcyBiZWZvcmUgdGhl
IHByb3ZpZGVyDQo+IGhhcyBwcm9iZWQuDQo+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Ns
ay9pbXgvY2xrLWlteDhxeHAuYw0KPiA+IGIvZHJpdmVycy9jbGsvaW14L2Nsay1pbXg4cXhwLmMg
aW5kZXggYzc4MTQyNWEwMDVlZi4uMTczMDJlZTYyOGI3Ng0KPiA+IDEwMDY0NA0KPiA+IC0tLSBh
L2RyaXZlcnMvY2xrL2lteC9jbGstaW14OHF4cC5jDQo+ID4gKysrIGIvZHJpdmVycy9jbGsvaW14
L2Nsay1pbXg4cXhwLmMNCj4gPiBAQCAtMzczLDMgKzM3Myw0IEBAIG1vZHVsZV9leGl0KGlteDhx
eHBfY2xrX2V4aXQpOw0KPiA+IE1PRFVMRV9BVVRIT1IoIkFpc2hlbmcgRG9uZyA8YWlzaGVuZy5k
b25nQG54cC5jb20+Iik7DQo+ID4gTU9EVUxFX0RFU0NSSVBUSU9OKCJOWFAgaS5NWDhRWFAgY2xv
Y2sgZHJpdmVyIik7DQo+IE1PRFVMRV9MSUNFTlNFKCJHUEwNCj4gPiB2MiIpOw0KPiA+ICtNT0RV
TEVfU09GVERFUCgicHJlOiBzY3VfcGQiKTsNCj4gDQo+IFtTZXZlcml0eTogSGlnaF0NCj4gRG9l
cyB0aGlzIHNvZnRkZXAgYXBwcm9hY2ggZnVsbHkgcmVzb2x2ZSB0aGUgaXNzdWUgaWYgb25lIGRy
aXZlciBpcyBidWlsdC1pbiBhbmQNCj4gdGhlIG90aGVyIGlzIGEgbW9kdWxlPw0KPiANCj4gUmVs
eWluZyBvbiBtb2R1bGUgbG9hZCBvcmRlcmluZyBkb2Vzbid0IGd1YXJhbnRlZSByZXNvdXJjZSBh
dmFpbGFiaWxpdHkgaWYgdGhlDQo+IGtlcm5lbCBpcyBjb25maWd1cmVkIHdpdGggQ09ORklHX0NM
S19JTVg4UVhQPXkgYW5kDQo+IENPTkZJR19JTVhfU0NVX1BEPW0sIG9yIGlmIHRoZSBwb3dlciBk
b21haW4gcHJvdmlkZXIgc2ltcGx5IGRlZmVycyBpdHMNCj4gcHJvYmUuIElmIHRoZSBwb3dlciBk
b21haW5zIGFyZSBub3QgYXR0YWNoZWQsIHRoZSBjbG9ja3MgYXJlIHN0aWxsIHJlZ2lzdGVyZWQN
Cj4gYW5kIGV4cG9zZWQuDQo+IEFjY2Vzc2luZyB0aGVtIHdpdGhvdXQgYW4gYWN0aXZlIHBvd2Vy
IGRvbWFpbiBjYW4gbGVhZCB0byBoYXJkd2FyZSBoYW5ncy4NCj4gDQo+IExvb2tpbmcgYXQgZHJp
dmVycy9jbGsvaW14L2Nsay1zY3UuYywgaXQgYXBwZWFycyB0aGUgcm9vdCBvZiB0aGUgcHJvYmxl
bSBpcyB0aGF0DQo+IGlteF9jbGtfc2N1X2FsbG9jX2RldigpIGlnbm9yZXMgdGhlIGVycm9yIGlu
c3RlYWQgb2YgcHJvcGFnYXRpbmcgaXQ6DQo+IA0KPiBpbXhfY2xrX3NjdV9hbGxvY19kZXYoKQ0K
PiAgICAgLi4uDQo+ICAgICByZXQgPSBpbXhfY2xrX3NjdV9hdHRhY2hfcGQoJnBkZXYtPmRldiwg
cnNyY19pZCk7DQo+ICAgICBpZiAocmV0KQ0KPiAgICAgICAgIHByX3dhcm4oIiVzOiBmYWlsZWQg
dG8gYXR0YWNoZWQgdGhlIHBvd2VyIGRvbWFpbiAlZFxuIiwgbmFtZSwgcmV0KTsNCj4gICAgIC4u
Lg0KPiANCj4gV291bGQgaXQgYmUgc2FmZXIgdG8gcHJvcGFnYXRlIHRoZSBlcnJvciAobGlrZSAt
RVBST0JFX0RFRkVSKSB3aGVuDQo+IGlteF9jbGtfc2N1X2F0dGFjaF9wZCgpIGZhaWxzLCByYXRo
ZXIgdGhhbiByZWdpc3RlcmluZyB0aGUgY2xvY2sgaGFyZHdhcmUgaW4gYQ0KPiBicm9rZW4gc3Rh
dGUgYW5kIHJlbHlpbmcgb24gbW9kdWxlIGxvYWQgb3JkZXI/DQo+IA0KPiAtLQ0KPiBTYXNoaWtv
IEFJDQo+IHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA3MjMw
MjA1MjQuMTg4NjgwNi0xLVpoaXBlbg0KPiBnLndhbmdfMUBvc3MubnhwLmNvbT9wYXJ0PTMNCg0K
VGhlIGkuTVg4UVhQIFNDVSBjbG9jayBkcml2ZXIgaGFzIGEgbm9uLXN0YW5kYXJkIGFyY2hpdGVj
dHVyZSB3aGVyZQ0KfjEyMCBjbG9jayBwbGF0Zm9ybSBkZXZpY2VzIGFyZSBkeW5hbWljYWxseSBj
cmVhdGVkIHZpYQ0KcGxhdGZvcm1fZGV2aWNlX2FsbG9jKCkgaW4gaW14X2Nsa19zY3VfYWxsb2Nf
ZGV2KCkuIFRoZXNlIGRldmljZXMNCmhhdmUgbm8gb2Zfbm9kZSwgc28gZndfZGV2bGluayBjYW5u
b3QgZXN0YWJsaXNoIGRlcGVuZGVuY2llcw0KYXV0b21hdGljYWxseSAodW5saWtlIGUuZy4gUXVh
bGNvbW0gR0NDIHdoaWNoIGRlY2xhcmVzIHBvd2VyLWRvbWFpbnMNCmluIERUIGFuZCBnZXRzIGF1
dG9tYXRpYyBwcm9iZSBvcmRlcmluZyB2aWEgZndfZGV2bGluaykuDQoNClJlZ2FyZGluZyBDT05G
SUdfQ0xLX0lNWDhRWFA9eSArIENPTkZJR19JTVhfU0NVX1BEPW06IHdoZW4NCklNWF9TQ1VfUEQg
aXMgYnVpbHQgYXMgYSBtb2R1bGUgYW5kIENMS19JTVg4UVhQIGlzIGJ1aWx0LWluLCB0aGUNCmNs
b2NrIGRyaXZlciBwcm9iZXMgYXQgZGV2aWNlX2luaXRjYWxsIGJlZm9yZSB0aGUgcG93ZXIgZG9t
YWluDQptb2R1bGUgaXMgbG9hZGVkLiBIb3dldmVyLCB0aGlzIG1peGVkIGNvbmZpZ3VyYXRpb24g
aXMgbm90IGENCnByYWN0aWNhbCBkZXBsb3ltZW50IC0gaW4gR0tJIGJvdGggYXJlIG1vZHVsZXMs
IGFuZCBpbiB0cmFkaXRpb25hbA0Ka2VybmVscyBib3RoIGFyZSBidWlsdC1pbi4gVGhlIHN1YnN5
c19pbml0Y2FsbCgpIGluIHBhdGNoIDIgY292ZXJzDQp0aGUgYnVpbHQtaW4gY2FzZSwgYW5kIE1P
RFVMRV9TT0ZUREVQIGNvdmVycyB0aGUgbW9kdWxlIGNhc2UuDQoNClByb3BhZ2F0aW5nIC1FUFJP
QkVfREVGRVIgZnJvbSBpbXhfY2xrX3NjdV9hdHRhY2hfcGQoKSB3b3VsZCByZXF1aXJlDQpyZXdv
cmtpbmcgdGhlIGVycm9yIGhhbmRsaW5nIGFjcm9zcyBhbGwgMTIwIGlteF9jbGtfc2N1KCkgY2Fs
bCBzaXRlcw0KaW4gdGhlIHByb2JlIGZ1bmN0aW9uLCB3aGljaCBjdXJyZW50bHkgaWdub3JlIHRo
ZSByZXR1cm4gdmFsdWUuIFRoaXMNCmlzIGEgbGFyZ2VyIGFyY2hpdGVjdHVyYWwgY2hhbmdlIGJl
dHRlciBzdWl0ZWQgZm9yIGEgc2VwYXJhdGUgc2VyaWVzLg0KDQpNT0RVTEVfU09GVERFUCBpcyBj
b25zaXN0ZW50IHdpdGggdGhlIGFwcHJvYWNoIHVzZWQgYnkgUXVhbGNvbW0ncw0KZ2NjLXNkbTg0
NSAoY29tbWl0IDFkOTA1NGUzYTRmZCkgZm9yIHRoZSBzYW1lIGNsYXNzIG9mIHByb2JsZW0uDQoN
CkJScywNClpoaXBlbmcNCg==
