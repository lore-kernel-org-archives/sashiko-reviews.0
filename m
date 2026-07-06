Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013068.outbound.protection.outlook.com [52.101.72.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C3437BE78;
	Mon,  6 Jul 2026 01:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783302181; cv=fail; b=JkhmEXfA1GlOXhzve2Herl5IJNYCEJ9WJuE0aVjIhEJ7WYp2ffx/VAEq9WzFLjgGWwBCz+x6N4y90oLW/GZcYsayLArgzTyWtUfkk9GcLDyxfjchY+79G3RWX252yS89xurGQADH4fJyL6WTf0xdt8SchReysybpJ0inirN+Gps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783302181; c=relaxed/simple;
	bh=8m2NMGbZv0CGIx+rKJCnmf6IsQpcRRdMxXI8tKmqeoo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EmZCNGJx4EcOz7EP/FfpSmU7D/OI7T5zc6J1jr4NdByo5wxwLFgDzT4AMmFraEoh+MUeiweSdgiY96NOZMq3iU/2mXzADInM6YBhJum7S8brFPqdl7ac/t+fZCXxxBtYiox1gPtxONTtK5ijtR9VsXGkaUY/MEGci3crCzvq3qA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=NKOyTY5j; arc=fail smtp.client-ip=52.101.72.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="NKOyTY5j"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wFdmirAq1bOdHUbp8ctaaW5aet+OYjXWrH8oY31Qmqb8ekSiUdBgifG4Pw6TILbwt/N6IG9VPoUMNlnpodzNNrekVL8Mnee06Q2rDS/O1To/nkTYZPEOcyJhVTRWXvZEgo9/da+K0k+GUXTgu0Q0F9ShoBHlmITC9nJfzl5zv+s3j2WScGwgtCmwVa4WFUIm9WMxDbzLOER40nBT5T5PVIsGMOqH+k7s79KdI96Sc2mMU7D4Keic/KuHwZmowJ5AeR+oYAEAKgmx0ZHbz1o7Strboh7n9esPS0n4f/f6PeXs6R+g7s+PR2+EkTTUKloLb1KR0B7CRV5P2eBbyHThhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8m2NMGbZv0CGIx+rKJCnmf6IsQpcRRdMxXI8tKmqeoo=;
 b=YZY+NYFgjJrEHbqlGTxFov/zISsRCDH457cH0LtNmphCP8AywKwRhXc+7TP+1BZtxRhInNjav8/SZn3MMYPrrv0UkWvcY5iIOIJ34xIwBKHhAS8TIrELhetkuUpUAkOCEo5nmAJVJMh/9BABJd/4i+Fo78V7QmVupTIYxblrSDXrBJKVb5m7imEBD+YW0BqbCEkEUCw18X+69tRYzDQYE/aHWP2VkYd4VVkuk3pVnOuDNy5UlSnWmfgIUpH5DplgI0xOFPPF9UFk5oFOE7TNbuit19aBbTPckxnrcsJ/eaEAJqS+v6+IV+zkosbfETVU6ccX/gSk4h2GQIrjXAKcOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8m2NMGbZv0CGIx+rKJCnmf6IsQpcRRdMxXI8tKmqeoo=;
 b=NKOyTY5jPCpBO91ii6QXj3E5AypbmJ+p5e6limMw6vnvls+2TI+hWY3W8fR5KTbPulglOexR7l7twhDQVmAYBOibZLIbX9mSjWYfT1rSg/4Psl4uj7BDwtNYlMRfKt+Yfe/3KTqI55ys3brDMbT0A2IVTfPJUuu1tm0Pv/N25K3+XE/I4MQxBDnqvXQq4qGbiYqTri+EjWOBsPV3Vlz18rJh92YdIicyCNutSzgiHMZDsQS9cmPtp8cE5V1k/cf/5Cv0VztWci11bPfTobv/TdnC/ZjQZoDfYZZqDN/QQ5x5loHI2iQLoqoaB0fQjVgDnW1F97G+X+SJkJ/oBbWFYw==
Received: from GV2PR04MB11739.eurprd04.prod.outlook.com
 (2603:10a6:150:2fc::18) by AM9PR04MB7714.eurprd04.prod.outlook.com
 (2603:10a6:20b:2dd::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Mon, 6 Jul
 2026 01:42:56 +0000
Received: from GV2PR04MB11739.eurprd04.prod.outlook.com
 ([fe80::71c2:937b:d466:174a]) by GV2PR04MB11739.eurprd04.prod.outlook.com
 ([fe80::71c2:937b:d466:174a%6]) with mapi id 15.21.0181.008; Mon, 6 Jul 2026
 01:42:56 +0000
From: "Wei Fang (OSS)" <wei.fang@oss.nxp.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>, "Wei
 Fang (OSS)" <wei.fang@oss.nxp.com>
CC: "Frank.Li@kernel.org" <Frank.Li@kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>
Subject: RE: [PATCH v3 net-next 10/14] net: enetc: refactor SI VLAN
 promiscuous mode configuration
Thread-Topic: [PATCH v3 net-next 10/14] net: enetc: refactor SI VLAN
 promiscuous mode configuration
Thread-Index: AQHdCti67f/+BMg6kk2Dv6pjWUoljrZdLkiAgAKNjHA=
Date: Mon, 6 Jul 2026 01:42:56 +0000
Message-ID:
 <GV2PR04MB11739EFE77C0DBCA6532293EA88F12@GV2PR04MB11739.eurprd04.prod.outlook.com>
References: <20260703101328.550714-1-wei.fang@oss.nxp.com>
 <20260703101328.550714-11-wei.fang@oss.nxp.com>
 <20260704104346.232751F000E9@smtp.kernel.org>
In-Reply-To: <20260704104346.232751F000E9@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR04MB11739:EE_|AM9PR04MB7714:EE_
x-ms-office365-filtering-correlation-id: 3389e056-f46e-4848-4929-08dedaffe731
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|19092799006|23010399003|366016|38070700021|18002099003|22082099003|11063799006|4143699003|56012099006|6133799003;
x-microsoft-antispam-message-info:
 Lnqdla6VVX5zlq4VyH5ffI4/NFOJSgYQrbXHvZ7F68VU6HyN65FoAwXOZwGeVie9Qy5M0AuCDbG43qwciUbk8Ctb0U2OOXJ3uRcdu4Pq3V6WC4VJAkTVutv3xukRO34pvKKJ/12osoZ4khMeMUpVdTJLfLVsg8qtKtSP/dW6M+6V9Fv+Oyad8Csg9X3V6mVkBBNptuvi9IMhMmdTVM8ssoLn3DfJllfMVwl/c47wAc4NWsNeJHUts4o/O/+IUfJBAq48tWXyk+LEYrUM8RXkYHmUAQ/HBwgCdjRBg0VHkZfA1sfSVQxS8zaEfcVyvQw/PqOkVvowaJ8lPiSY6hJdExh5YHVWDrxHSXPfLnyyod1zIT01vSANGKXYKfdeyCBZ1Ql7vrd/5knKCWnfF8teyZefsgBhi+MTJd2uIEgfU1BT41J5nx7ofomLVH8tI6QgdBUp0rngABeA6318YL0v93OwbhcLAbEtqmLpmDojxsGCpIqCRFcRoaWKgHjE46EUF+ioS2LmXEBo146qyx1JOHZiJvLAnqC5L0RIuPt6KkYrdEf1GChOFyzFhjjO+hqn+9FuGgSCN8VJLz0UNHtt4P7B0uvo0ytphQHJePGDmp8a+RbR3PTtgCPxI4YwTt3QPM+wXfil0fu/X3NuiZ4zSAaI/99uP90+re8MkysOT9J58A/WlKWkq/J0rP8DO6z6vKM6b10MiFQj9Hk8XYqGxND03dyW+fJJ39hZFHNS4rw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11739.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(19092799006)(23010399003)(366016)(38070700021)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Q1VPKzdZbVM4aGFiM3BhYStOMEx1eU82YzFOek0zMHhTaGNoSU9ZT3AzSG0r?=
 =?utf-8?B?dVBNLzNpKytJWlZwUkw0NEUvOFFEU2k1VFYxcUcwdjBpUzhaQjl2YzE0Ylpy?=
 =?utf-8?B?K3c5cGFWQzl0TENGbWpUaTZ0czJuMnRmQW4xaDFhVjVRQjljbkVYM3lmK1dl?=
 =?utf-8?B?VFlyM3ZTeThLc2Y1QTdxbjZjZzJGWGNTc2NVUFJrdUtCUmFxd2c1dm9MN0xQ?=
 =?utf-8?B?NEdwVzdwUHFEMnRtU1JEWnpJMWVpbytaME82c2V3Q21VVGZZZitkYXN5ZGFI?=
 =?utf-8?B?RzhmaWdjZURRdUtkdlVBQWlWTm1aMitBbGh3NGFEZDZweFpmVmd0alZaeGdO?=
 =?utf-8?B?c21mRXBJcTBWRzdTL0dTZm1ucVJDbkZrZW9Lak5CLzdYM0ZaQzVoYSsrSWs4?=
 =?utf-8?B?RG9QUWwrV3pEUzBGc3ZiQkZNQ2J1cFZLRElmUHc0ZUlyT3NFamZzVHlybkZG?=
 =?utf-8?B?N2o4QjYvTDZmdGJ1d252eXcvelc5Nk5nTkFSUEZRWHpzOVBOZzVlNlRkdENF?=
 =?utf-8?B?V1poRU9nZFk0U3d2alB0bXIxRzhKdXdVcGsvVnhMaXBlUzRzOCtrN2xmeEpC?=
 =?utf-8?B?NWswWTVIM2YvSjZ2dkRRMDhBUDZNWlhWYzJFanRCbjB0SkVxckMvbERQdVJi?=
 =?utf-8?B?TlIwdHJ3S214YmFQK1RuMFZLQ29YWTI2QVRSeGxlcWdpdU5DZTIxMDcvVE1S?=
 =?utf-8?B?RTRPN0FkQ0VZbnlJL0hFQ2xQYUhZRmcyY2E5RVNVRlQ2RFBNRkl1SDVrdVlS?=
 =?utf-8?B?RU9Mem50T3cyZVV3Y25VaGxiSWt1SG5paFFUckc3b0E4aUQ0QjVDTFVWTmJV?=
 =?utf-8?B?UXE4TEhsZkluUlF5Rm1qaGNaSllVdGl3QW45WHV5ejlaQ2hIU3FtV2Y3UGpo?=
 =?utf-8?B?clJlRUdXRHoxc1MvUVBxdW9zaUpzVVdyaDhmMEtQbmVJVlYwV3JnNnI0QVc0?=
 =?utf-8?B?QzR1YTRlRGlJNVpjWVJLcjhuVDNDVnl2NUNPcmR5dTFta2VXUm9hT3ZnSDli?=
 =?utf-8?B?eXpDb29XdWUrWmhzYTRRRXBIakV2NFJOYnljT3JzNUZQVGNvalM1cFlPUEJM?=
 =?utf-8?B?ajlwL2JqV2FwR2Z2bTZmV0E5TzF1VzRhMHM2V1JCaFpDUTBYT2tjejZ0V3Ji?=
 =?utf-8?B?bE96Wm1LTUlTNUpMN0tROG8rWkZHaUJhUktHSit3dEUxZWIxZE9Hbk84OWQ1?=
 =?utf-8?B?MGxwTldLaTVwQ1k0STlTUmk5VlUxSmh2b3NOYXh3V29uWUtqMlJrd1JyWW56?=
 =?utf-8?B?bVJBb3NJcThVYXdrQ2s0cWxLVkY1dkI1ZVJnSEcwTHFkZnJmUjRlRlFtanVX?=
 =?utf-8?B?TFVPUHhka3N6QmltZ3VlNU9kOHdxTVA5VnF0YXorWWk5N2ZiUUJlVk5aZk5U?=
 =?utf-8?B?VGNnbHkxNU5RTU9saXRNWTJ0WmFkZ0NUcS9rc05wQ1RoMjdxTGUrSjhsVUxk?=
 =?utf-8?B?cXJlZ00vZENodEN0RUs5YUlxZnpBVFJwUkVmUXREMWs0cjRmRzRjaGI5VFUw?=
 =?utf-8?B?NFk2UTlqS3Z4am1ma3NDNk55QmhhV0FHWGFQRlE0WXhkUXllY1VIR2JmRGEw?=
 =?utf-8?B?dWp3RHRPQW9EbXhXOE10R0Z0OXhDS3dRK0EvVWY2Q0RQZkZmWkdwV096MzdE?=
 =?utf-8?B?cWMwSnRxTXJMTDJ2V1RXc0ZNRVptcVU3S1hhbFRacDVkTE1SblhpeUpseDFI?=
 =?utf-8?B?M0trekdMYVpYcG5MZHVPd0YwcDRid2xrVitQNTN4SC9ZbU5qQ2tGNFVJOUhp?=
 =?utf-8?B?Ymk5TGlNZnluaEc0aWtQeWJZMGwzalNRZkRqOXNhV0lET0ZxV3NGQkZpekhv?=
 =?utf-8?B?RWx0dUlyZ1p6UGIwcHI1L0FZb3Y2ZTVUblFVMXk4WVpJc2tXRU5qT3dYemxL?=
 =?utf-8?B?bWp5aXpYTkQxZTBtUi82L0hWOGwwZS9nS3I1cXNaQWJUUmxqY01RUktmTVYr?=
 =?utf-8?B?UUdmK3h1dGxLeHcvUHlOZ1RBYkNqMndrMXQwZEZwRVM2S3lla24vcU1LR0FG?=
 =?utf-8?B?MWpoUlgxQVFGTzJKTElJbzVJVHVoZjExaTN2ZVRiWU9XKy9VYWozNmRmbDEv?=
 =?utf-8?B?WS9HdnZ3M3Jlb2dNR0pVTlBpTTJaSWkySE80QlZCdTEwVGpRL1pVQmtCdG04?=
 =?utf-8?B?YTVpaGZBMHJBM2RheklwaFRQMWErSjdCQXVxc2dqR014WGFsc04xQkwzL1Nr?=
 =?utf-8?B?ckRvWkJVTzNRWWRmVHlzVEJEK3dVemZNaXZtbjEyekFUVURkRE9lbWQ1aEpI?=
 =?utf-8?B?RHNNVHpEYmpucUxFN0w1emJGcGlvQVlod0pmWjVXekw5Vit0SXFDRTBiZFda?=
 =?utf-8?Q?kM4xEQLstMPBPvsZJm?=
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
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11739.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3389e056-f46e-4848-4929-08dedaffe731
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2026 01:42:56.3400
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /wHabx88ohTqTN4MOw/z4XMCV6iIKudwYHd2q7sELwp7w5Dyv9mzYqwQNR2DeOsErajAy1EP92qTQBsF1G0A/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7714

PiBjb21taXQgNjQ2NDMxNzM3YTVmNDllMDhiYTJkOWZmMTc5NGU3ZTc0ODlkYjEyOQ0KPiBBdXRo
b3I6IFdlaSBGYW5nIDx3ZWkuZmFuZ0BueHAuY29tPg0KPiANCj4gbmV0OiBlbmV0YzogcmVmYWN0
b3IgU0kgVkxBTiBwcm9taXNjdW91cyBtb2RlIGNvbmZpZ3VyYXRpb24NCj4gDQo+IFRoaXMgY29t
bWl0IHJlbW92ZXMgdGhlIGVuZXRjX3NldF92bGFuX3Byb21pc2MoKSBmdW5jdGlvbnMgYW5kIHJl
cGxhY2VzDQo+IHRoZW0gd2l0aCBhIHVuaWZpZWQgZW5ldGNfc2V0X3NpX3ZsYW5fcHJvbWlzYygp
IGZ1bmN0aW9uLiBJdCBhbHNvIHJlbW92ZXMNCj4gdGhlIHZsYW5fcHJvbWlzY19zaW1hcCBmaWVs
ZCBmcm9tIHN0cnVjdCBlbmV0Y19wZiB0byBzaW1wbGlmeSB0aGUgbG9naWMuDQo+IA0KPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9mcmVlc2NhbGUvZW5ldGMvZW5ldGNfaHcu
aA0KPiBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L2ZyZWVzY2FsZS9lbmV0Yy9lbmV0Y19ody5oDQo+
ID4gaW5kZXggNjZiZmRhNjBkYTljYi4uMTZkYTczMmRjNWRlOCAxMDA2NDQNCj4gPiAtLS0gYS9k
cml2ZXJzL25ldC9ldGhlcm5ldC9mcmVlc2NhbGUvZW5ldGMvZW5ldGNfaHcuaA0KPiA+ICsrKyBi
L2RyaXZlcnMvbmV0L2V0aGVybmV0L2ZyZWVzY2FsZS9lbmV0Yy9lbmV0Y19ody5oDQo+ID4gQEAg
LTE4NSw5ICsxODUsOCBAQCBlbnVtIGVuZXRjX2Jkcl90eXBlIHtUWCwgUlh9Ow0KPiA+ICAjZGVm
aW5lICBQU0lQTU1SX1NJX01BQ19NUChuKQlCSVQoKG4pICsgMTYpDQo+ID4NCj4gPiAgI2RlZmlu
ZSBFTkVUQ19QU0lQVk1SCQkweDAwMWMNCj4gPiAtI2RlZmluZSBFTkVUQ19WTEFOX1BST01JU0Nf
TUFQX0FMTAkweDcNCj4gPiAtI2RlZmluZSBFTkVUQ19QU0lQVk1SX1NFVF9WUChzaW1hcCkJKChz
aW1hcCkgJiAweDcpDQo+ID4gLSNkZWZpbmUgRU5FVENfUFNJUFZNUl9TRVRfVlVUQShzaW1hcCkJ
KCgoc2ltYXApICYgMHg3KSA8PCAxNikNCj4gPiArI2RlZmluZSAgUFNJUFZNUl9TSV9WTEFOX1Ao
bikJQklUKG4pIC8qIG4gPSBTSSBpbmRleCAqLw0KPiANCj4gW1NldmVyaXR5OiBIaWdoXQ0KPiBD
YW4gdGhpcyByZXN1bHQgaW4gYSBzaGlmdC1vdXQtb2YtYm91bmRzIGlmIG4gPj0gMzI/DQoNCk5v
LCB0aGUgaGFyZHdhcmUgaGFzIDE2IFNJcyBhdCBtb3N0Lg0KDQo+IA0KPiA+ICsNCj4gPiAgI2Rl
ZmluZSBFTkVUQ19QU0lQTUFSMChuKQkoMHgwMTAwICsgKG4pICogMHg4KSAvKiBuID0gU0kgaW5k
ZXggKi8NCj4gPiAgI2RlZmluZSBFTkVUQ19QU0lQTUFSMShuKQkoMHgwMTA0ICsgKG4pICogMHg4
KQ0KPiANCj4gWyAuLi4gXQ0KPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJu
ZXQvZnJlZXNjYWxlL2VuZXRjL2VuZXRjX3BmLmMNCj4gYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9m
cmVlc2NhbGUvZW5ldGMvZW5ldGNfcGYuYw0KPiA+IGluZGV4IGRiMmE4MDBhN2FhZjAuLmFmYzAy
ZWQ2MmM3NzAgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvZnJlZXNjYWxl
L2VuZXRjL2VuZXRjX3BmLmMNCj4gPiArKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9mcmVlc2Nh
bGUvZW5ldGMvZW5ldGNfcGYuYw0KPiA+IEBAIC00MiwyNCArNDIsMjAgQEAgc3RhdGljIHZvaWQg
ZW5ldGNfcGZfZGVzdHJveV9wY3Moc3RydWN0IHBoeWxpbmtfcGNzDQo+ICpwY3MpDQo+IA0KPiBb
IC4uLiBdDQo+IA0KPiA+IC1zdGF0aWMgdm9pZCBlbmV0Y19zZXRfdmxhbl9wcm9taXNjKHN0cnVj
dCBlbmV0Y19odyAqaHcsIGNoYXIgc2lfbWFwKQ0KPiA+ICtzdGF0aWMgdm9pZCBlbmV0Y19zZXRf
c2lfdmxhbl9wcm9taXNjKHN0cnVjdCBlbmV0Y19zaSAqc2ksIGludCBzaV9pZCwNCj4gPiArCQkJ
CSAgICAgIGJvb2wgcHJvbWlzYykNCj4gPiAgew0KPiA+IC0JdTMyIHZhbCA9IGVuZXRjX3BvcnRf
cmQoaHcsIEVORVRDX1BTSVBWTVIpOw0KPiA+ICsJc3RydWN0IGVuZXRjX2h3ICpodyA9ICZzaS0+
aHc7DQo+ID4gKwl1MzIgdmFsOw0KPiA+DQo+ID4gLQl2YWwgJj0gfkVORVRDX1BTSVBWTVJfU0VU
X1ZQKEVORVRDX1ZMQU5fUFJPTUlTQ19NQVBfQUxMKTsNCj4gPiAtCWVuZXRjX3BvcnRfd3IoaHcs
IEVORVRDX1BTSVBWTVIsIEVORVRDX1BTSVBWTVJfU0VUX1ZQKHNpX21hcCkgfA0KPiB2YWwpOw0K
PiA+IC19DQo+ID4gKwl2YWwgPSBlbmV0Y19wb3J0X3JkKGh3LCBFTkVUQ19QU0lQVk1SKTsNCj4g
Pg0KPiA+IC1zdGF0aWMgdm9pZCBlbmV0Y19lbmFibGVfc2lfdmxhbl9wcm9taXNjKHN0cnVjdCBl
bmV0Y19wZiAqcGYsIGludCBzaV9pZHgpDQo+ID4gLXsNCj4gPiAtCXBmLT52bGFuX3Byb21pc2Nf
c2ltYXAgfD0gQklUKHNpX2lkeCk7DQo+ID4gLQllbmV0Y19zZXRfdmxhbl9wcm9taXNjKCZwZi0+
c2ktPmh3LCBwZi0+dmxhbl9wcm9taXNjX3NpbWFwKTsNCj4gPiAtfQ0KPiA+ICsJaWYgKHByb21p
c2MpDQo+ID4gKwkJdmFsIHw9IFBTSVBWTVJfU0lfVkxBTl9QKHNpX2lkKTsNCj4gPiArCWVsc2UN
Cj4gPiArCQl2YWwgJj0gflBTSVBWTVJfU0lfVkxBTl9QKHNpX2lkKTsNCj4gDQo+IFtTZXZlcml0
eTogSGlnaF0NCj4gSWYgc2lfaWQgPj0gMzIsIHdpbGwgdGhpcyBzaWxlbnRseSBmYWlsIG9yIGNv
cnJ1cHQgdGhlIFZMQU4gcHJvbWlzY3VvdXMgc3RhdGUNCj4gZm9yIFNJIDA/DQo+IA0KDQpzaV9p
ZCB3b24ndCBiZSA+PSAzMiwgdGhlIGhhcmR3YXJlIGNhbiBvbmx5IHN1cHBvcnQgYSBtYXhpbXVt
IG9mIDE2IFNJcywNCndoaWxlIHRoZSBjdXJyZW50IFNvQ3Mgc3VwcG9ydCBhIG1heGltdW0gb2Yg
b25seSAzIFNJcy4NCg0KPiBTaW5jZSB2YWwgaXMgYSAzMi1iaXQgaW50ZWdlciwgZXZlbiBvbiA2
NC1iaXQgYXJjaGl0ZWN0dXJlcyB3aGVyZSBCSVQoKSB3b24ndA0KPiBvdmVyZmxvdywgdGhlIHJl
c3VsdCBnZXRzIHRydW5jYXRlZCB3aGVuIGFwcGxpZWQgdG8gdmFsIGhlcmUuIE9uIDMyLWJpdA0K
PiBhcmNoaXRlY3R1cmVzLCB0aGUgc2hpZnQgd3JhcHMgKGUuZy4gMSA8PCAzMiBiZWNvbWVzIDEg
PDwgMCksIHdoaWNoIHdvdWxkDQo+IGluYWR2ZXJ0ZW50bHkgbW9kaWZ5IHRoZSBzdGF0ZSBmb3Ig
dGhlIFBGIGluc3RlYWQgb2YgdGhlIHRhcmdldCBWRi4NCj4gDQo+ID4NCj4gPiAtc3RhdGljIHZv
aWQgZW5ldGNfZGlzYWJsZV9zaV92bGFuX3Byb21pc2Moc3RydWN0IGVuZXRjX3BmICpwZiwgaW50
IHNpX2lkeCkNCj4gPiAtew0KPiA+IC0JcGYtPnZsYW5fcHJvbWlzY19zaW1hcCAmPSB+QklUKHNp
X2lkeCk7DQo+ID4gLQllbmV0Y19zZXRfdmxhbl9wcm9taXNjKCZwZi0+c2ktPmh3LCBwZi0+dmxh
bl9wcm9taXNjX3NpbWFwKTsNCj4gPiArCWVuZXRjX3BvcnRfd3IoaHcsIEVORVRDX1BTSVBWTVIs
IHZhbCk7DQo+ID4gIH0NCj4gDQo+IFsgLi4uIF0NCj4gDQo+ID4gQEAgLTQ0MSwxMCArNDM3LDkg
QEAgc3RhdGljIHZvaWQgZW5ldGNfY29uZmlndXJlX3BvcnQoc3RydWN0IGVuZXRjX3BmDQo+ICpw
ZikNCj4gPg0KPiA+ICAJLyogc3BsaXQgdXAgUkZTIGVudHJpZXMgKi8NCj4gPiAgCWVuZXRjX3Bv
cnRfYXNzaWduX3Jmc19lbnRyaWVzKHBmLT5zaSk7DQo+ID4gLQ0KPiA+ICAJLyogZW5mb3JjZSBW
TEFOIHByb21pc2MgbW9kZSBmb3IgYWxsIFNJcyAqLw0KPiA+IC0JcGYtPnZsYW5fcHJvbWlzY19z
aW1hcCA9IEVORVRDX1ZMQU5fUFJPTUlTQ19NQVBfQUxMOw0KPiA+IC0JZW5ldGNfc2V0X3ZsYW5f
cHJvbWlzYyhodywgcGYtPnZsYW5fcHJvbWlzY19zaW1hcCk7DQo+ID4gKwlmb3IgKGludCBpID0g
MDsgaSA8IHBmLT50b3RhbF92ZnMgKyAxOyBpKyspDQo+ID4gKwkJZW5ldGNfc2V0X3NpX3ZsYW5f
cHJvbWlzYyhwZi0+c2ksIGksIHRydWUpOw0KPiANCj4gW1NldmVyaXR5OiBIaWdoXQ0KPiBEb2Vz
IHRoZSBkcml2ZXIgdmFsaWRhdGUgb3IgYm91bmQgcGYtPnRvdGFsX3ZmcyBhbnl3aGVyZSBiZWZv
cmUgdGhpcyBsb29wPw0KPiANCj4gSWYgdGhlIGhhcmR3YXJlIG9yIGh5cGVydmlzb3IgYWR2ZXJ0
aXNlcyBhIFRvdGFsVkZzIHZhbHVlID49IDMyLCB0aGlzIGxvb3ANCj4gd2lsbCBwYXNzIGFuIHVu
Ym91bmRlZCBpbmRleCB0byBlbmV0Y19zZXRfc2lfdmxhbl9wcm9taXNjKCkgYW5kIHRyaWdnZXIg
dGhlDQo+IHNoaWZ0IGlzc3VlcyBhYm92ZS4gVGhlIHByZXZpb3VzIGltcGxlbWVudGF0aW9uIHNh
ZmVseSBib3VuZGVkIHRoaXMgYnkgdXNpbmcNCj4gYSBoYXJkY29kZWQgMHg3IG1hc2suDQoNCnBm
LT50b3RhbF92ZnMgaXMgZ290IGZyb20gcGNpX3NyaW92X2dldF90b3RhbHZmcygpLCB3aGVuIENP
TkZJR19QQ0lfSU9WIGlzIGRpc2FibGVkLA0KcGYtPnRvdGFsX3ZmcyB3aWxsIGJlIDAuIFdoZW4g
Q09ORklHX1BDSV9JT1YgaXMgZW5hYmxlZCwgcGYtPnRvdGFsX3ZmcyBpcyBhY3R1YWxseQ0Kb2J0
YWluZWQgZnJvbSB0aGUgUENJX1NSSU9WX1RPVEFMX1ZGIHJlZ2lzdGVyLCB3aGlsZSB0aGUgRU5F
VEMgaGFyZHdhcmUgb25seQ0Kc3VwcG9ydHMgYSBtYXhpbXVtIG9mIDE1IFZGcy4NCg0K
