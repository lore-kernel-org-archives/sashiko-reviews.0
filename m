Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011061.outbound.protection.outlook.com [52.101.65.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640A844E64E;
	Wed, 29 Jul 2026 11:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785323205; cv=fail; b=ZDdNTOok2YYLDD8p5AXge/iyUjF8uc5do0saYKkb6dqNWA9IOMY4++UV6XJJWQiz8pk0oaArRb1ngtBBmlrQXZfPUbYMMa12oUxhRnfhFUikIQrld/ewPwXF0Wq597Z8nvM3szBJXEYq7gbmrSUlrft7GlBAflayV66dH/C6HGk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785323205; c=relaxed/simple;
	bh=WuqBtR5LjG9US7O8ecQBof5LfytsTewYklQSPQ6jB7s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JdkuH3N0tE8/U36ken8MOzhDW06u1qusQO5Hx8SGehvT4j/lwROUxMYT2ipXtiLyWNPbIbUqFIzvNjduas5PodpJ+hjoo5i3QmZuTNWSfWhx+rQ4PQ/KhcdFbywQtb8FmA329njp8fyiZJhrtwquQJpgdndKP5Pz+ZBQohx+ors=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=LwlQez8B; arc=fail smtp.client-ip=52.101.65.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="LwlQez8B"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PnOKqjWU+6bu9jVK6hngaiObtgERcrGI4c+iC0YOBeDSXLAxyYorvfxCqjp6yDtVWTqAn4HW0TnKCdZ5VUsqHLd/K36yQqPOT2uNxNNwvZypMYrHOzhQRW/e6WyK7ATnnegGq+D6/3B1YFHJ9epYysWFbr9q+1dXD/TYgUx0/7A8Y1drQ6KIwmwEzQg0vI7lqEGEVwSudo/P7A04z5v/+4kcgREuz12pvuoPTnhSLXQp0dh8LeWBGDo/FO1Q5jzE7kos9woY/i/7KYc/xuAUSWxLZZfur94sGuo989cM9vPsxTp2oFGAvfM7ZtTQQglpWCdMTVDzKNt6tyK+YJTQXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WuqBtR5LjG9US7O8ecQBof5LfytsTewYklQSPQ6jB7s=;
 b=MOBGgVJT3kGoVzxOQrRyW99E1D+B63M0Os4y2AXmG7NNe3TIl3hzq1INjeSvi4gPIN0cbn9+/xl3rfcIlCtJveziPAeKfT+lu0KNksFcWNR2Wrj01VVF+mkrrXtZx87xJBWHu8SKrAJh44Yj6VKLCh4/JtMR7L8vHNoU44UnfMtVSDwBf2GiHIlhLEeViHsIqaaAN8lr9n9V3S3Ev8+pO/YjuqErUHNkd+iUuY7Dgn9hgTxmxCVmj/vpWwpshdm4EETkl3x/2CAMKbQaHPN/tjONg49EAettIszCQvPYjyiQidzY+ThXVraIuVlIs2s3Ume1Y8EFbQ6/eijqTcnxkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WuqBtR5LjG9US7O8ecQBof5LfytsTewYklQSPQ6jB7s=;
 b=LwlQez8BVEdALDfcPKEBb4Q7OMJ2mXnjMNRKFzH1vNM8tujifczy+GBcNH79qB2grEi73w81sXabaNbym6mH1OMHf5P5hFQ2ASIaaF9wlcZI313rckjLsP3xKYzDIn43Amh+CaB+6MWEe8jyXSP6MXKAJvSM3iRqru9x0J0ygzMoQE5wQM++Zs9g8vuKQA80cmsxUeGPnbgkqP0dUkhx8ZPoyZ5udqw5RSWFDRSxNOqnvM7L0o/HTDahU+WTfc/IIupeyyKv1vnAIs+9FNItt2OVd5Rk3KLMirXCeXrRbFaOTls3etDIxCWagUpM6TczX5bcaKMnW4l4nfgb2+AXBQ==
Received: from DU2PR04MB8677.eurprd04.prod.outlook.com (2603:10a6:10:2dc::14)
 by VI2PR04MB10836.eurprd04.prod.outlook.com (2603:10a6:800:276::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 11:06:39 +0000
Received: from DU2PR04MB8677.eurprd04.prod.outlook.com
 ([fe80::9cc3:2ef9:9259:e963]) by DU2PR04MB8677.eurprd04.prod.outlook.com
 ([fe80::9cc3:2ef9:9259:e963%4]) with mapi id 15.21.0245.012; Wed, 29 Jul 2026
 11:06:39 +0000
From: Bough Chen <haibo.chen@nxp.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"Bough Chen (OSS)" <haibo.chen@oss.nxp.com>
CC: "imx@lists.linux.dev" <imx@lists.linux.dev>, "Frank.Li@kernel.org"
	<Frank.Li@kernel.org>
Subject: RE: [PATCH v2 2/3] spi: spi-nxp-fspi: enter stop mode before
 reconfiguring MCR0 and DLL
Thread-Topic: [PATCH v2 2/3] spi: spi-nxp-fspi: enter stop mode before
 reconfiguring MCR0 and DLL
Thread-Index: AQHdHnn8mtV/xpfGAUqE7UZWq2EG2raCuUGAgAGeQSA=
Date: Wed, 29 Jul 2026 11:06:39 +0000
Message-ID:
 <DU2PR04MB867754D5DDA9867511732A5490CA2@DU2PR04MB8677.eurprd04.prod.outlook.com>
References: <20260728-fspi-clock-v2-0-dbe786a4a6eb@nxp.com>
 <20260728-fspi-clock-v2-2-dbe786a4a6eb@nxp.com>
 <20260728102317.E11301F000E9@smtp.kernel.org>
In-Reply-To: <20260728102317.E11301F000E9@smtp.kernel.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR04MB8677:EE_|VI2PR04MB10836:EE_
x-ms-office365-filtering-correlation-id: b8217398-eab8-4500-fb95-08deed6176d4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|23010399003|22082099003|18002099003|4143699003|56012099006|11063799006|3023799007|4133799003|38070700021|6133799003|10067099003;
x-microsoft-antispam-message-info:
 kV8tCDPeQi8OvR2iSFz7LZjwMvLHHWzYFUNkXMFqf1twIqYbbrtXMaJdY5V/mQfctnVlvdLdN/IW4L6TU/ixg63W5x9Qx5meBA/U8f4UMJsWrbszH/7DFiHmlqCGjzekRY4cLxXnaLe1ceRIblr3mrCR/xUHP+CSg3LEM6GC2Pdf1NnwhoEBj1JTx9hTo39ji3Dr3NnQZDsiiKwPMw1TDghD+HRUUcP/ZDDVAN9G5IcOOPmLts5ykqSAN/1+TnbLOabbumlZ/4TA3qTN3UOX0v317kwhULRg1c6xFB6/9mDBjV4daPkeKeRpiylhxqAMZLD+/STWfDJ1C68LuJ5V3VTtsgxR2+WBQMLWBqgCj0216rqjr6uPUD2Ruy5cL0v1gDzqXCgWw59OvI+k/KvDOx4/6mLw0ovC+WExQrrneFXlXFNlk7LJutGypa1/ll7UaR4/L53Pl8u3E8xLW0cbq1/Y5Sqg1PWegwvng5zv00gJ3995TTy8Dyz7lTqJZt4hrrykHQvVMseT7Pr2vSkkGg8zJSPPTpBQQtqh7fJ0di1MYASbgo0ttSrKvfeXqR3pKKMAGvpVMj7wYndVBPw5eKzhJy8tT+/94BvSi9sdWbIfm15e34GRQbr5OlZMlROydiDDK0CveQKrluxf+1P4K7P2C3SLa40XGz+akTckRmQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8677.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(23010399003)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006)(3023799007)(4133799003)(38070700021)(6133799003)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?ZkRSRnFjYXhOZnYxcEl2UDk1UzRiamRscTkvQ3VnQnlraW1DSWsya0VXYzhh?=
 =?gb2312?B?YVA5ME9XRzlRQzJqOXBVOHZIVTdUQkpFUHJRWlMwdXF1bC9DRSs3ZWZlNHho?=
 =?gb2312?B?OE1mTVlEVUtRK1VmMVVoaHBubzJNbG9rRW01ZXpheGhjUUIyMTQwUEVURS90?=
 =?gb2312?B?NTFiQ21EUjJCV0ZjLzBHUU1CMUdrdFBRanU4UnBtSUQ4YlBha1JmZ0ZnWks2?=
 =?gb2312?B?bk1UVmxvTlcyWHFEWUF4TTgxTm8xSzc4a0pFLzNIMzBwUmd0UXcvQ2hiOTlo?=
 =?gb2312?B?L081TnRuQ0J3M3ZPcnlQTG9WZEdZT091S2FrN0JSY2pTRVE5WFdZeHJFdmdF?=
 =?gb2312?B?ZEN0UlZpN1g3SWlzaVI1UkUvZ2FmUFdWci9wZkMwd0N0VjcxTWM2c3daNTZD?=
 =?gb2312?B?YzJ0NE1TUnhqSm1BS0ZVVTM5T2lLOGVnbmI4Rit2OEpoVS9MOE5iRGhYN2cw?=
 =?gb2312?B?azgzZXN2ZE1meGpIcWZ6eUY4SmRUbUlJT0t3dzZkbW9TcnNxSzNnNk9QN3RT?=
 =?gb2312?B?NHQ2WUZ6bHRpSjl1NDU3aGhkQ1lvdWtRby9JVnZuaGRhbloyWVBOeWdaRWp4?=
 =?gb2312?B?cGxaMUsvUTRkYldjQTlFc1M4bDN6Y3ZndndhUkYwZ2oxREhDVWZtWWR2V1R3?=
 =?gb2312?B?K0VHVlNrMlZCcTdkU0dTRmJwajVSTHljS3ljVUFkd00vYzdqTTA1eXVBL3VL?=
 =?gb2312?B?V0ExLzVBSXc5MmRiN0hkaGZhUUdjZHU1Z2FtQWp6aEptbmpqcVNqT3hVVHJ0?=
 =?gb2312?B?WmR1dUs5enJoU3FYek90ZEFSeG1JdDdZeTI2UVpIeUlYaUl0T29HeExkSDN4?=
 =?gb2312?B?ZnQ5akpqWHVCbmlqWEY1d2wyMTBwNzJXZy9zZ3VXY1FxeWRmTCtoNW1hSVFF?=
 =?gb2312?B?RjB6em9BY1k1TDFlbFpUK0J0NnlvWVIxRGJjWEI5blpxUElvdWRkZ0NkY3pE?=
 =?gb2312?B?QTZrT09LRy9NTWhpYytiMUpCZGFnVkJOMVd0M2dnZzBZRGxucGxnRFpvTWpL?=
 =?gb2312?B?Q1JxK0JzQjNrTU9uakpzcjFxK0xRV2s0M0tNajJSbHVoTGZwcEU2MjhEOUgv?=
 =?gb2312?B?OG5EU2liU3VSMFdxeEx3aVF4NUx5bUF1VW5ZU3IvaUpBZElnN0RlVC9ueVNs?=
 =?gb2312?B?Yko2TTh3WjFjeDRuNUhvYUYxRTZDVXplaVNXYjg4TGZnbU50amErK3RiQVpH?=
 =?gb2312?B?Z21wamtLV0ZYTkcvQmRkOHBPOU9XRENnYktkaThSbTVqWmtrU3VDRnZ3WTdJ?=
 =?gb2312?B?OHRpTURYM09FQUw0SnAra2xHZUpMczdib2FPbjlEYXkrbWtHS2ZkVmhZNzc3?=
 =?gb2312?B?L3NwdTBKZG1tc2dLYTV2VE9BbWw5TmRmYVA5RmJUd0NUanhrUmVWUytGVk9X?=
 =?gb2312?B?V0RrMHJNNXJKUnhDQjBJbjZTR2xSSHovL3ZtZzI5WEpLaUU4cm1sTUR0cXNl?=
 =?gb2312?B?UnJBUzdGdkN0bm51ZUI3VG5WU2pVTGg3MW5uYzZhT1dQM2FIYVdrNFM4ZDhO?=
 =?gb2312?B?Y0dqOUVsbi9KMzc0blNzbkVRdlhaN2gveG9sb0tkZ0E1dVZRSWxUZnZVcGhO?=
 =?gb2312?B?NzJNUFpTQVpMcnk1V2hOdjhFYWw2QTdVeEFQMFdpL0RmL2M1R0ZQdXZRRlNQ?=
 =?gb2312?B?bHdGUjhxRU1WL3Z3UjBpOEw4SGt2S2g3ekZKM1ZXMjNnQ240R3RYVlQzYVhT?=
 =?gb2312?B?bGhvZWhqSkxEVjBYazQwdmxGMkJSdlY1cnBzRVpkdmpCVis5eWMya3BUUVJD?=
 =?gb2312?B?UytrN0tQYldJSkJNNzVGc2FZSVB3Q00rTDZEdXIzZEltYlU3MHVLR08wK2dx?=
 =?gb2312?B?RjVORk5BYWVkbFRqc21ra0MzdGFpc2dQWkhXQTVzdjlOaHVqeXB6REVjSW5h?=
 =?gb2312?B?c1JtNU9ZajdQYTAwR2tBYkhySjRXRlo2VEx1RlR2TmF5MVEvaUgzZ3BEVFA5?=
 =?gb2312?B?cjRzRTdEWjFNbzUwTFlRazdsbVBTZXhYU013SW9pNlhyTWdvRFhYWnBUWEp1?=
 =?gb2312?B?Wm1MTll2dDB5Tk9wcVE1VkV3N21ZSUR3dktKOHE0dEZMZkNQd1hHT3c5VkZQ?=
 =?gb2312?B?cll2Nkh3OVIveXAzZ1FZWktMZ29tUkNLSFFkQXc4U0UySVJFK3FFbW92b0Jm?=
 =?gb2312?B?bGdKdEhNTzMvUFJnN1pKQ0ZFWFdvVitFcjNnS016cWJBRTNBOU00RGpoQ1JJ?=
 =?gb2312?B?WUVjR1FaeWx1YnRXcCtQU3VnNHVtaEtMVlZ6T0pzUFlTcktMZ0RlemFEUXBT?=
 =?gb2312?B?blhwNHdrSHpPMHc0YU5ScGVTY3kwQW5aUFEzcXBiS0piRUtPdDVpYU90MGYw?=
 =?gb2312?Q?tp98j1hgq44BJAL92U?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8677.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8217398-eab8-4500-fb95-08deed6176d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2026 11:06:39.3929
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JvObDXWGDSzOeqLlkZ07Ltrhk8IHCwo0ddO8U8RfKjXx8nlP1zR4Tu+isxmUXTVCIbx/mXGFZ8QiJeqZWS1t2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10836

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBzYXNoaWtvLWJvdEBrZXJuZWwu
b3JnIDxzYXNoaWtvLWJvdEBrZXJuZWwub3JnPg0KPiBTZW50OiAyMDI2xOo31MIyOMjVIDE4OjIz
DQo+IFRvOiBCb3VnaCBDaGVuIChPU1MpIDxoYWliby5jaGVuQG9zcy5ueHAuY29tPg0KPiBDYzog
aW14QGxpc3RzLmxpbnV4LmRldjsgRnJhbmsuTGlAa2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSZTog
W1BBVENIIHYyIDIvM10gc3BpOiBzcGktbnhwLWZzcGk6IGVudGVyIHN0b3AgbW9kZSBiZWZvcmUN
Cj4gcmVjb25maWd1cmluZyBNQ1IwIGFuZCBETEwNCj4gDQo+IFRoYW5rIHlvdSBmb3IgeW91ciBj
b250cmlidXRpb24hIFNhc2hpa28gQUkgcmV2aWV3IGZvdW5kIDEgcG90ZW50aWFsIGlzc3VlKHMp
DQo+IHRvIGNvbnNpZGVyOg0KPiAtIFtIaWdoXSBFcnJvciBwYXRocyBpbiBueHBfZnNwaV9zZWxl
Y3RfbWVtKCkgbGVhdmUgdGhlIEZsZXhTUEkgbW9kdWxlDQo+IHBlcm1hbmVudGx5IGluIHN0b3Ag
bW9kZS4NCj4gLS0NCj4gDQo+IC0tLSBQYXRjaCBbMl06IFtQQVRDSCB2MiAyLzNdIHNwaTogc3Bp
LW54cC1mc3BpOiBlbnRlciBzdG9wIG1vZGUgYmVmb3JlDQo+IHJlY29uZmlndXJpbmcgTUNSMCBh
bmQgRExMIC0tLSBjb21taXQNCj4gNDM5MWNjYjdjNzNjMDQ4OWFjMGI2ZjcxNGE3MDczYmIyYjA4
YjNjMQ0KPiBBdXRob3I6IEhhaWJvIENoZW4gPGhhaWJvLmNoZW5AbnhwLmNvbT4NCj4gDQo+IHNw
aTogc3BpLW54cC1mc3BpOiBlbnRlciBzdG9wIG1vZGUgYmVmb3JlIHJlY29uZmlndXJpbmcgTUNS
MCBhbmQgRExMDQo+IA0KPiBUaGlzIHBhdGNoIG1vZGlmaWVzIG54cF9mc3BpX3NlbGVjdF9tZW0o
KSB0byBlbnRlciBzdG9wIG1vZGUgYnkgc2V0dGluZw0KPiBNQ1IwW01ESVNdIGJlZm9yZSByZWNv
bmZpZ3VyaW5nIHRoZSBSWCBzYW1wbGUgY2xvY2sgc291cmNlIGFuZCBETEwgY29udHJvbA0KPiBy
ZWdpc3RlcnMuIEl0IHRoZW4gZXhpdHMgc3RvcCBtb2RlIG9uY2UgdGhlIHJlY29uZmlndXJhdGlv
biBpcyBjb21wbGV0ZQ0KPiBhY2NvcmRpbmcgdG8gdGhlIHJlZmVyZW5jZSBtYW51YWwuDQo+IA0K
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3NwaS9zcGktbnhwLWZzcGkuYyBiL2RyaXZlcnMvc3Bp
L3NwaS1ueHAtZnNwaS5jDQo+ID4gaW5kZXggNmRlNmQ0MzJjZGNiMi4uYTQyNmI4ZDkyMTkzYSAx
MDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3NwaS9zcGktbnhwLWZzcGkuYw0KPiA+ICsrKyBiL2Ry
aXZlcnMvc3BpL3NwaS1ueHAtZnNwaS5jDQo+IFsgLi4uIF0NCj4gPiBAQCAtODk2LDYgKzg5Nywx
NSBAQCBzdGF0aWMgdm9pZCBueHBfZnNwaV9zZWxlY3RfbWVtKHN0cnVjdCBueHBfZnNwaQ0KPiA+
ICpmLCBzdHJ1Y3Qgc3BpX2RldmljZSAqc3BpLA0KPiA+DQo+ID4gIAlkZXZfZGJnKGYtPmRldiwg
IlRhcmdldCBkZXZpY2UgW0NTOiV4XSBzZWxlY3RlZFxuIiwNCj4gPiBzcGlfZ2V0X2NoaXBzZWxl
Y3Qoc3BpLCAwKSk7DQo+ID4NCj4gPiArCS8qDQo+ID4gKwkgKiBQZXIgdGhlIEZsZXhTUEkgcmVm
ZXJlbmNlIG1hbnVhbCAoaW5pdGlhbGl6YXRpb24gc2VxdWVuY2UpLCBNQ1IwIGFuZA0KPiA+ICsJ
ICogdGhlIERMTCBjb250cm9sIHJlZ2lzdGVycyBzaG91bGQgYmUgY29uZmlndXJlZCB3aGlsZSB0
aGUgbW9kdWxlIGlzIGluDQo+ID4gKwkgKiBzdG9wIG1vZGUgKE1DUjBbTURJU10gPSAxKS4gRW50
ZXIgc3RvcCBtb2RlIGJlZm9yZSByZWNvbmZpZ3VyaW5nDQo+IHRoZQ0KPiA+ICsJICogUlggc2Ft
cGxlIGNsb2NrIHNvdXJjZSBhbmQgdGhlIERMTCwgdGhlbiBleGl0IHN0b3AgbW9kZSBhZnRlcndh
cmRzLg0KPiA+ICsJICovDQo+ID4gKwlyZWcgPSBmc3BpX3JlYWRsKGYsIGYtPmlvYmFzZSArIEZT
UElfTUNSMCk7DQo+ID4gKwlmc3BpX3dyaXRlbChmLCByZWcgfCBGU1BJX01DUjBfTURJUywgZi0+
aW9iYXNlICsgRlNQSV9NQ1IwKTsNCj4gPiArDQo+ID4gIAlueHBfZnNwaV9zZWxlY3Rfcnhfc2Ft
cGxlX2Nsa19zb3VyY2UoZiwgb3BfaXNfZHRyKTsNCj4gPiAgCXJhdGUgPSBtaW4oZi0+bWF4X3Jh
dGUsIG9wLT5tYXhfZnJlcSk7DQo+ID4NCj4gWyAuLi4gXQ0KPiA+IEBAIC05MjgsNiArOTM4LDEw
IEBAIHN0YXRpYyB2b2lkIG54cF9mc3BpX3NlbGVjdF9tZW0oc3RydWN0IG54cF9mc3BpICpmLA0K
PiBzdHJ1Y3Qgc3BpX2RldmljZSAqc3BpLA0KPiA+ICAJZWxzZQ0KPiA+ICAJCW54cF9mc3BpX2Rs
bF9vdmVycmlkZShmKTsNCj4gPg0KPiA+ICsJLyogRXhpdCBzdG9wIG1vZGUgbm93IHRoYXQgTUNS
MCBhbmQgdGhlIERMTCBoYXZlIGJlZW4gcmVjb25maWd1cmVkLg0KPiAqLw0KPiA+ICsJcmVnID0g
ZnNwaV9yZWFkbChmLCBmLT5pb2Jhc2UgKyBGU1BJX01DUjApOw0KPiA+ICsJZnNwaV93cml0ZWwo
ZiwgcmVnICYgfkZTUElfTUNSMF9NRElTLCBmLT5pb2Jhc2UgKyBGU1BJX01DUjApOw0KPiA+ICsN
Cj4gDQo+IFtTZXZlcml0eTogSGlnaF0NCj4gRG9lcyB0aGlzIGxlYXZlIHRoZSBGbGV4U1BJIG1v
ZHVsZSBwZXJtYW5lbnRseSBpbiBzdG9wIG1vZGUgaWYgdGhlIGNsb2NrDQo+IGNvbmZpZ3VyYXRp
b24gZmFpbHMgZWFybGllciBpbiB0aGlzIGZ1bmN0aW9uPw0KPiANCj4gSWYgY2xrX3NldF9yYXRl
KCkgb3IgbnhwX2ZzcGlfY2xrX3ByZXBfZW5hYmxlKCkgZmFpbHMsIHRoZSBjb2RlIHJldHVybnMg
ZWFybHkNCj4gd2l0aG91dCBleGVjdXRpbmcgdGhpcyBleGl0IGJsb2NrOg0KPiANCj4gICAgICAg
ICByZXQgPSBjbGtfc2V0X3JhdGUoZi0+Y2xrLCByYXRlKTsNCj4gICAgICAgICBpZiAocmV0KSB7
DQo+ICAgICAgICAgICAgICAgICAvKiAuLi4gKi8NCj4gICAgICAgICAgICAgICAgIG54cF9mc3Bp
X2Nsa19wcmVwX2VuYWJsZShmKTsNCj4gICAgICAgICAgICAgICAgIHJldHVybiByZXQ7DQo+ICAg
ICAgICAgfQ0KPiANCj4gQmVjYXVzZSB0aGUgZWFybHkgcmV0dXJucyBoYXBwZW4gYmVmb3JlIHRo
ZSBzdG9wIG1vZGUgaXMgY2xlYXJlZCwgdGhlDQo+IGhhcmR3YXJlIG1vZHVsZSBpcyBsZWZ0IGRp
c2FibGVkIHNpbmNlIEZTUElfTUNSMF9NRElTIHJlbWFpbnMgc2V0Lg0KPiANCj4gSWYgdGhpcyBl
cnJvciBvY2N1cnMsIGEgc3Vic2VxdWVudCBTUEkgdHJhbnNmZXIgbWF0Y2hpbmcgdGhlIHByZXZp
b3VzDQo+IHN1Y2Nlc3NmdWwgc3RhdGUgY291bGQgaGl0IHRoZSBlYXJseS1yZXR1cm4gZmFzdCBw
YXRoIGF0IHRoZSB0b3Agb2YNCj4gbnhwX2ZzcGlfc2VsZWN0X21lbSgpLCBza2lwIHRoZSBoYXJk
d2FyZSByZWNvbmZpZ3VyYXRpb24sIGFuZCBhdHRlbXB0IHRvDQo+IGV4ZWN1dGUgYSB0cmFuc2Zl
ciB3aGlsZSB0aGUgaGFyZHdhcmUgaXMgc3RpbGwgZGlzYWJsZWQuDQoNClJlYXNvbmFibGUsIHdp
bGwgZml4IGluIG5leHQgdmVyc2lvbi4NCg0KUmVnYXJkcw0KSGFpYm8gQ2hlbg0KPiANCj4gLS0N
Cj4gU2FzaGlrbyBBSQ0KPiByZXZpZXcgoaQgaHR0cHM6Ly9ldXIwMS5zYWZlbGlua3MucHJvdGVj
dGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGDQo+ICUyRnNhc2hpa28uZGV2JTJGJTIz
JTJGcGF0Y2hzZXQlMkYyMDI2MDcyOC1mc3BpLWNsb2NrLXYyLTAtZGJlNzg2YTQNCj4gYTZlYiU0
MG54cC5jb20lM0ZwYXJ0JTNEMiZkYXRhPTA1JTdDMDIlN0NoYWliby5jaGVuJTQwbnhwLmNvbQ0K
PiAlN0MyMzg1MDczZTFjZmU0M2YwZDU0ZTA4ZGVlYzk1MTA3MyU3QzY4NmVhMWQzYmMyYjRjNmZh
OTJjZDk5Yw0KPiA1YzMwMTYzNSU3QzAlN0MwJTdDNjM5MjA4MzIyMTQ5MDk2MTQ5JTdDVW5rbm93
biU3Q1RXRnBiR1oNCj4gc2IzZDhleUpGYlhCMGVVMWhjR2tpT25SeWRXVXNJbFlpT2lJd0xqQXVN
REF3TUNJc0lsQWlPaUpYYVc0ek1pSXMNCj4gSWtGT0lqb2lUV0ZwYkNJc0lsZFVJam95ZlElM0Ql
M0QlN0MwJTdDJTdDJTdDJnNkYXRhPXkxbnRGWVdOTmoNCj4gd2N2S2RIYUp1SVNkclpZNWExcWpt
MFgyaVFLYiUyQmVmSnclM0QmcmVzZXJ2ZWQ9MA0KDQo=
