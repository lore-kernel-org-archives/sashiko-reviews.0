Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013008.outbound.protection.outlook.com [40.107.162.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B83401A18;
	Thu, 30 Jul 2026 11:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785409517; cv=fail; b=cfQli9Osa/g0zqYciQPLHhnvjgVZtgj+E8WRtQmCdCMwO92AFlyWQsK9fslPFtq5jLr2L1ORnuBBHmd1KAv2g9HE1ji7V7USa+u7WlGJ2eDMjSOX1DZIkzRtAavfWz/z9G4JIfj8ckpankfBuI5hB09Pfdti8DCphW5dEGF3hRc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785409517; c=relaxed/simple;
	bh=Vcqj0ZGLfS4LgyocMVPbyYnEUu7XNnDG/gDkqacECdI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gao7926s9aSkzWtZ0HZcM6iDvu4yRuGMzhHq336K3POm1EiZ12QPJFAqVEkCqvTfhWKkufC1Mv6zQxY5hZihkXg5P+8nJUn/4u0OjCHe5avwXWj908ZJEJzDTODWZvrZoJy3vHLfEUVRV0DR3VDxg5AC3ZAvugEoqT1JYP0AwOA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=DcDid2UW; arc=fail smtp.client-ip=40.107.162.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="DcDid2UW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=odLhUa0bMxN05lFzM0n14jF2pNfKCP0CKOo7O6tuDL8LVa+KsjH1/vEgZ3PqfqBtxlUt6waAP+uhaEy2eRYRVhYyHmK0DJktz/wErZleHSUN+YzCzdYz1GlUUG5NxHKlXu+62LH+nZBccsUcLbWfQw0pEGWBqlfrJtoXcRQQkwJnUFj0N+M/MWC4T4vLHoSerRcd8RQCP6AOqFOj6nispczuCubxMdB8eaL354o+TG5+N0SdJBMJfx4MaPSxPTAJ21Olr4TBjVAVH9Yv/tirwlg02eOqG8F4oEjcijeTu4NoXNuw5cxPkfyaeYMJx2t422MOcx3ahHCBMWvH9zmujQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vcqj0ZGLfS4LgyocMVPbyYnEUu7XNnDG/gDkqacECdI=;
 b=LMucOIRlbbpuO2kb1hQM6H2Cz/Bpkg5qgwP0DEN6QARI9RkULUN0YRnWpPOcMU4PfU4oU5SJI239m5EznRe9TDulf8k0NwSJSypHgo10wpGEaz3itdxcZ5SIbHO/Tm3YkFi5FFMnP9jdihiCjRQ/RVCB7+ON6CbgMmYGj3PiBxBFQEQ7teCzjH5kbdK3Q90aJMBUQ99TJ7E6QfxMdFM3IrvEGGDtaTznu40PaLL5EfqweF/gJqdRj0yF8AXsXuCuDOKwr63usJS17x+nR5710QVyYQc6fuw9/4yr2AV3e4EbJACUybDsCbQi2qPCcs7tQ9kTVYZJ125SqeTMThjQvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vcqj0ZGLfS4LgyocMVPbyYnEUu7XNnDG/gDkqacECdI=;
 b=DcDid2UWGf0C72dpNVqFRyh5zJHHib1KKG/tOh6SaRQnjNWoYdgUtK///5+e7H9ZlfL0EX7nSJcT0A/OzhgRwwdzVVs3FBw99udNcOdvH5kqKivOIV21EdfYO3pingydNrj4KuPgomrMekgOnFnwScBi0zsl5ozJk4tIUuvGhWF8FgXzjNfW0ZQbiUhbsTWVeqZPsq7qFbGfp3lxV+2T89MHba2glaB0FKA9UjFNUiRUpPJQHl6LuZWP3UXrLsB0QaVsDuQixSd8srYjWYxGkq3SS/9ed2Mv6FGfnNEck960YzTmGuofESDwSU6molQWD9VkA+iCbWkTsLGnXrkGxw==
Received: from GV2PR04MB12271.eurprd04.prod.outlook.com (2603:10a6:150:32a::5)
 by DU4PR04MB11032.eurprd04.prod.outlook.com (2603:10a6:10:58a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.14; Thu, 30 Jul
 2026 11:05:12 +0000
Received: from GV2PR04MB12271.eurprd04.prod.outlook.com
 ([fe80::3b38:4ed4:2164:c035]) by GV2PR04MB12271.eurprd04.prod.outlook.com
 ([fe80::3b38:4ed4:2164:c035%5]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 11:05:12 +0000
From: "Pankaj Gupta (OSS)" <pankaj.gupta@oss.nxp.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"Pankaj Gupta (OSS)" <pankaj.gupta@oss.nxp.com>
CC: "robh@kernel.org" <robh@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"Frank.Li@kernel.org" <Frank.Li@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>
Subject: RE: [PATCH v32 6/7] arm64: dts: imx8ulp: add secure enclave node
Thread-Topic: [PATCH v32 6/7] arm64: dts: imx8ulp: add secure enclave node
Thread-Index: AQHdH8lvjr52APsI0E6qYkYEBg67WLaFW0YAgACGqwA=
Date: Thu, 30 Jul 2026 11:05:12 +0000
Message-ID:
 <GV2PR04MB1227166A1DADACE988C92C9F095C92@GV2PR04MB12271.eurprd04.prod.outlook.com>
References: <20260730-imx-se-if-v32-0-95f56dff4ba9@nxp.com>
 <20260730-imx-se-if-v32-6-95f56dff4ba9@nxp.com>
 <20260730024505.078AD1F000E9@smtp.kernel.org>
In-Reply-To: <20260730024505.078AD1F000E9@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR04MB12271:EE_|DU4PR04MB11032:EE_
x-ms-office365-filtering-correlation-id: 0eaa1bbb-af38-4b32-849d-08deee2a6d6f
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|366016|19092799006|376014|13003099007|38070700021|18002099003|22082099003|3023799007|10067099003|11063799006|4143699003|56012099006;
x-microsoft-antispam-message-info:
 3mCYvXIqeFIPcYPfi/8qHZrumbH44iurtNNku/NDE58UdSO+AVKHNDgg2HQ2n96xY+tcxvZuPXKcd8b6zy9uXjrZ4PwrgHyGiIhv7KKMurDg2qVV6dBp43KBG8BwLIjhvWBLnh0n/VHSWNmlhE825iIuK3PxyiYckN79rystG65EeQiCZHtOi5ke8nBPc55PUV47rbqHlKH3xojIbPyRDMRNvnHtqDk6eCB182W47SFX04DRSKAsHx2gQTx3g9ZfQMzCc2SlDI0oIntCBrF1zmXbFUy8jFgZmmUZopuu4ha7nUaTiFZlerLm3QtqcoOSB8Yer4R9rZCn428dpaX9LeE6cgQc4+/WuMZsazf/03EZhbvIE5Q4oSywxHfSvdPU7svZ4w0BeFBGSuByehmtL3n33YqOrqsh4w0ltVZPXbmnDB38+2gHgeRIs7GDPqcmrs2npoXW1T4C2hpJrC67tBI6Zq0SCLD4d8W80iV0OEKibPwI0qy8D9lvLXZhJ2qDhvZnJx3IBi046LZyFWiSRRsHE5w/S1PEEVSTTeug64Jga7RB3rijUp9UjFFygRey4Z/CruAmbp2PDDJyypRAfNzQYknG5sA10+iwgvx2JpPPXAznzvLsASmH8BGdf9bUgmXlGm9XU4eycoe39oCXX0NM1Akh4r9UDvskvOtcjwM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12271.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(19092799006)(376014)(13003099007)(38070700021)(18002099003)(22082099003)(3023799007)(10067099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OHVneFN4S2ZQK2gySHoyVEk0bnI3b1NyTW45Szg2QzRLQ3YxVmNUMVZzMENY?=
 =?utf-8?B?N2p6elJVdFJ0cmkxY3dCTGZqVk42TytFZk0xTXQ0UDAweEJVTjUzaG9ueXR3?=
 =?utf-8?B?SHpGN3owY09PR3I1TklFY3MrU3NldElZbkF1UW1uMHB6TlhBWXljZk5GUmtG?=
 =?utf-8?B?U25qdlV5alBYNCtXZ0tZZ3MvYmY1SHBLWGN5ekJhaVlOWDZIRlA2VHV2b1lG?=
 =?utf-8?B?ZlU1bDcwRUx5czlMbzFRVEhGQUp1WEpKTXB4RC95anlZT2w2Vk5qbytmUElh?=
 =?utf-8?B?b0JTZXQ4cEd4bTRuVjBJN2h1OUxBSUNqY01sck1yVWpRdVZpcXdjaFRwUjBv?=
 =?utf-8?B?aExPTzRsV2VvMHRvLzA5RTY5YnJxOXJxc0RxUFkvZVZYQVRwclNBSDZjNEhG?=
 =?utf-8?B?ajIzK3R0Ri83UkVpOHVTL0xNTGxHMWplRDdTcVZzS1hFYWFKVUFyUHpoNFBj?=
 =?utf-8?B?ZUl2bDJiODdUUVJnaWpUc2R2NmZzWHQvSDVzdjA2N0dXVFAwMEpRRllqU21K?=
 =?utf-8?B?L2dYYVNlaTJueVBHOGU4RGsxOGt4cGVGQnhPL0FRYjlqOVo1VFdNZ3hIdXNG?=
 =?utf-8?B?bVkvTURMZmI3WUFMaUM4VFhidkc2MDlGbFh4dmlTNXlDK1RLTVdJMitDanFC?=
 =?utf-8?B?U1ZlWFl0Y2JWYWhGT09YY1hJMUZCMzZRVDhSSkxPWUtyV3FQTU5TQk40VUhy?=
 =?utf-8?B?YzdneU1NaFNlQ2t5TGU2UEhFSWZsbUI5blh6S1M3WWxONW9NVlFsb2JUaERI?=
 =?utf-8?B?a1MrekpyOXV3SHd3bHAyMExzUUc4L29PclRWLzJKbTZ3MVlMVmk0TStSR3Jo?=
 =?utf-8?B?SysvQUVKNmF5Z1daM3BOM052NGV4c3ZOdHhTUURGejFFRm1ISFExWHVwQUlF?=
 =?utf-8?B?MlBDYkwzamZNc3N3SHh5alRGenh5bC83L3IvUnQ2bDRxb3l0VHRRMjJGUW5X?=
 =?utf-8?B?M0xYTkRtUGhMTTQrcS9KL2QxdkxoSWE1aDNId29PQVFucC9DWmVUd1JJRDZ5?=
 =?utf-8?B?bjhwQndHbjF6ekJBTEo4RW1pbmhFT1g5c25odFZuQlJWZmo3SWVtZFczbDFi?=
 =?utf-8?B?cVVVcUJsV2Zybk1QZEQraGxJMEtLUHpYSzB0MmV0QVB6aTV3VzNWZy9FbkJv?=
 =?utf-8?B?bUZWNVQ0bVlqeHhnNDhnV3k3L3lyc1VZOUxzUTJGbkhod3NVV2plK04wcm9l?=
 =?utf-8?B?eVZzeStsSDEzOEtNQWtuaXRLM2hjaVgrZTA0Z2ZrakhON2p3R1BOWXZjNUtl?=
 =?utf-8?B?UWh6ZURQejFSMGJkcmljY0tSVXY2dzZwaUR3SFlaL2hMNjhpWi94TE85bWow?=
 =?utf-8?B?QVZTcWRqSTVXUXkwVHVQRHp2R2d2Uy9YQVJ4bmwrRS9kRjluM3BNRGd5Wk43?=
 =?utf-8?B?aUEzOTNFbElzbzBpUVdrS1hwSS9rU0ZTSnFscnVVSXQ2RGx0VGoybE5OSjJ0?=
 =?utf-8?B?YVNJQVZaRWE5R0RLZG8rUE9LMVFvcXhDTjBlZCt1ZmxKQnJnM3BOMmU0SnJV?=
 =?utf-8?B?RDhUbHoxZTFUSkwyVkRka0VGa2s5NzE5RHBEL1A3Q3JVcnc5eVN3RU1pRWM0?=
 =?utf-8?B?WDg1UXIra1NiV0p6aTFzS1ZLTTFIdVA4NWFubmkrNlViVElJdkN1dWw3b2FZ?=
 =?utf-8?B?enRwUzE0SjF4aVBHL2dMRGE3MlpUclZlY204WE9EVHJXQUhmN1ZCeS82SFBB?=
 =?utf-8?B?dlE3OUdPRjNnaDQ4QUpzWDZna2lRS2lIK1lhVGROenBTUExiNGRIL3JveG9n?=
 =?utf-8?B?VEtKNEFjMDBmdk9rK3NNby92Y3gwcjlOZG1adDNScUxGR1c2c2h5MFlLSDlQ?=
 =?utf-8?B?b0prZ2NzWDRYeFFJc0tmaCtkdUpKVTh5ckRHUHBsVC92bjdNLzNSVUNEWVl2?=
 =?utf-8?B?ZEJTWHJlSzVTQkd5VGdLVVEyWGNvMVFmSnNHSHk1WUFiVVNTaUF3SGdidkdm?=
 =?utf-8?B?aHlQQ0xHWWVGWDYxOSs2bEdOcEVSZ1VhMDZKNVRMcU5KRE5sR1phZXVwWE5K?=
 =?utf-8?B?ZmNLODRwL3FYR2plSXdQb01BN20xS1RycUxGUTdXbzJBakNwMkExY3lCMUZQ?=
 =?utf-8?B?eEs1dVRhb2lSYmJScGRKY3M4aE1QSUtwRlBGTm85UW5HNHE4UU1CQ1hldTk5?=
 =?utf-8?B?SVV6WEQxamF0andrSWNJRkRQaG9kTlVOSTNGN0lzL0hKcnBzeTVhZEhMay9a?=
 =?utf-8?B?S0Ezci9UeWdMVjZZZ0JqQWxjcXhPaXN3VGs3TDlCVjd0WG1KQVVrV1Q4K0Z2?=
 =?utf-8?B?L3pRSFNkaVR5MHhiZmVlSVlpOUxRNVVUSHpTV25MQ2RQU3ZLNUdqNGpUK0ds?=
 =?utf-8?Q?AEJwNkm32S+PpQ3ljG?=
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
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12271.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eaa1bbb-af38-4b32-849d-08deee2a6d6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2026 11:05:12.4856
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fADYbIv951QacJlr0Tbwbf4iEPIZ6QKp3BGF1Nl24Lt79c3HY/vVHrwCIC17wh7FrSnM/MLeNCiJ809GVW5D5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11032

PiBhcm02NDogZHRzOiBpbXg4dWxwOiBhZGQgc2VjdXJlIGVuY2xhdmUgbm9kZQ0KPiANCj4gVGhp
cyBwYXRjaCBhZGRzIHRoZSBFZGdlTG9jayBFbmNsYXZlIChFTEUpIHNlY3VyZS1lbmNsYXZlIG5v
ZGUgdG8gdGhlDQo+IGkuTVg4VUxQIFNvQyBkdHNpLiBUaGUgbm9kZSBpcyBrZXB0IGRpc2FibGVk
IGJ5IGRlZmF1bHQgc28gaXQgZG9lcyBub3QgaW1wb3NlDQo+IGEgcmVzZXJ2ZWQtbWVtb3J5IHJl
cXVpcmVtZW50IG9uIGV2ZXJ5IGJvYXJkLg0KPiANCj4gQ2xvc2VzOiBodHRwczovL3Nhc2hpa28u
ZGV2LyMvcGF0Y2hzZXQvMjAyNjA3MjQtaW14LXNlLWlmLXYzMC0wLQ0KPiBjZThiYTI1NjY5MmNA
bnhwLmNvbT9wYXJ0PTYNCj4gDQo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMv
ZnJlZXNjYWxlL2lteDh1bHAuZHRzaQ0KPiA+IGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2Nh
bGUvaW14OHVscC5kdHNpDQo+ID4gaW5kZXggYzZkMWJiOWVkZjM4OC4uMzgyMzNkZDc0ZWUzMyAx
MDA2NDQNCj4gPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4dWxwLmR0
c2kNCj4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4dWxwLmR0c2kN
Cj4gDQo+IFsgLi4uIF0NCj4gDQo+ID4gQEAgLTE4NSw2ICsxODUsMTQgQEAgc2NtaV9zZW5zb3I6
IHByb3RvY29sQDE1IHsNCj4gPiAgCQkJCSN0aGVybWFsLXNlbnNvci1jZWxscyA9IDwxPjsNCj4g
PiAgCQkJfTsNCj4gPiAgCQl9Ow0KPiA+ICsNCj4gPiArCQloc20wOiBzZWN1cmUtZW5jbGF2ZSB7
DQo+ID4gKwkJCWNvbXBhdGlibGUgPSAiZnNsLGlteDh1bHAtc2UtZWxlLWhzbSI7DQo+ID4gKwkJ
CW1ib3gtbmFtZXMgPSAidHgiLCAicngiOw0KPiA+ICsJCQltYm94ZXMgPSA8JnM0bXVhcCAwIDA+
LCA8JnM0bXVhcCAxIDA+Ow0KPiA+ICsJCQlzcmFtID0gPCZzcmFtMD47DQo+ID4gKwkJCXN0YXR1
cyA9ICJkaXNhYmxlZCI7DQo+ID4gKwkJfTsNCj4gDQo+IFtTZXZlcml0eTogTG93XQ0KPiBXaWxs
IHRoaXMgY2F1c2UgYSBkZXZpY2V0cmVlIHNjaGVtYSB2YWxpZGF0aW9uIHdhcm5pbmcgZHVyaW5n
IGR0YnNfY2hlY2s/DQo+IA0KPiBCZWNhdXNlIHRoZSBkdC1iaW5kaW5nIHNjaGVtYSByZXF1aXJl
cyB0aGUgJ21lbW9yeS1yZWdpb24nIHByb3BlcnR5IGZvciB0aGUNCj4gImZzbCxpbXg4dWxwLXNl
LWVsZS1oc20iIGNvbXBhdGlibGUgc3RyaW5nLCBvbWl0dGluZyBpdCBoZXJlIG1lYW5zIGFueSBi
b2FyZA0KPiB0aGF0IGluY2x1ZGVzIGlteDh1bHAuZHRzaSB3aXRob3V0IGVuYWJsaW5nIHRoZSBl
bmNsYXZlIHdpbGwgZmFpbCB2YWxpZGF0aW9uLA0KPiBldmVuIHRob3VnaCB0aGUgbm9kZSBpcyBk
aXNhYmxlZC4NCj4gDQpJbiB0aGlzIHNlcmllcyBpdCBkb2VzIG5vdCBmaXJlLCB0aG91Z2g6IHRo
ZSBvbmx5IGJvYXJkcyB0aGF0IGJ1aWxkDQppbXg4dWxwLmR0c2kgKGlteDh1bHAtZXZrLmR0cywg
YW5kIDl4OS1ldmsgd2hpY2ggaW5jbHVkZXMgaXQpIGFsc28NCiNpbmNsdWRlIGlteDh1bHAtZmly
bXdhcmUuZHRzaSwgd2hpY2ggb3ZlcnJpZGVzICZoc20wIHdpdGgNCidtZW1vcnktcmVnaW9uID0g
PCZlbGVfcmVzZXJ2ZWQ+JyBhbmQgc3RhdHVzID0gIm9rYXkiLiBkdGJzX2NoZWNrIHJ1bnMNCm9u
IHRoZSBmaW5hbCBhc3NlbWJsZWQgLmR0Yiwgc28gdGhvc2UgRFRCcyBjYXJyeSBhIGNvbXBsZXRl
IG5vZGUgYW5kDQpwYXNzIGNsZWFubHkuIEkgaGF2ZSBydW4gYG1ha2UgZHRic19jaGVja2AgZm9y
IGlteDh1bHAgYW5kIHRoZXJlIGlzIG5vDQpuZXcgd2FybmluZy4NCg0KDQo+IENvdWxkIHdlIGF2
b2lkIHZhbGlkYXRpb24gd2FybmluZ3MgYnkgZGVmaW5pbmcgYSBkdW1teSBtZW1vcnktcmVnaW9u
LCBvcg0KPiBieSByZXN0cnVjdHVyaW5nIGhvdyB0aGlzIG5vZGUgaXMgaW5jbHVkZWQgZm9yIGJv
YXJkcyB0aGF0IGRvIG5vdCB1c2UgdGhlDQo+IGVuY2xhdmU/DQo+IA0KTm8sIGFkZGluZyBhIGR1
bW15IG1lbW9yeS1yZWdpb24gLSBwb2ludGluZyBhIHJlYWwgZGV2aWNlIGF0IGENCmZha2UvZW1w
dHkgcmVzZXJ2ZWQtbWVtb3J5IGlzIG1pc2xlYWRpbmcgYW5kIGNhbiBtYXNrIGEgZ2VudWluZSBt
aXNzaW5nDQpwb29sLg0KDQpSZXF1ZXN0IHlvdSB0byBjb25zaWRlciB0aGlzIGFzOiBub3QgYW4g
aXNzdWUuDQo+ID4gIAl9Ow0KPiA+DQo+ID4gIAljbTMzOiByZW1vdGVwcm9jLWNtMzMgew0KPiAN
Cj4gLS0NCj4gU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNo
c2V0LzIwMjYwNzMwLWlteC1zZS1pZi12MzItMC0NCj4gOTVmNTZkZmY0YmE5QG54cC5jb20/cGFy
dD02DQo=
