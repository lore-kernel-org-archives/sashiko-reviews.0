Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.133
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794796875;
	b=1rUarCu84r51p0Nbngp7N28owwu5k8Q3yVEoboiGO8fytw63e2j2HswKW2ufNuI6jx3K
	 oJTZ9EKtvgMcCxSFJE5UYWoGwW57KpQGtoD/9W9+Yd6vhAihNkapiZ5RW9rY8hw1kWUda
	 viT47HhaZKzRLFJ2PZ/3rSpadg+x0WmTcfos3g8pZzDwNK2rHrepUyBilt7acAAPgL2NB
	 ecBYqsAMTy4BD1T5VljVEyu6dJg94Gc6CVTXaNyHI2kP1KAiP+P3oYDsxTBw6Jd+lv0Nz
	 uEjFj0Vc4+dIseGP1+SeoRRPKaNN30oi1jwSBi6CyLmUr51TvR/mS0GaGFYx82GydTw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794796875;
	h=DMARC-Filter:Received:Received:From:To:CC:Subject:Thread-Topic:
	 Thread-Index:Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=kG/jdJJODTPjwVrIkHTPZZs60ATUN/3FiMBiUhyb56U=;
	b=r66WOA80w78/Evj+636ypQYj8dFcoVjFEmxi6pQNVkVu4GIQzlBicu5valpHvjbTU7JP
	 Nn/vrl/btb+W2SwLCywdF4qx71FCy1s8GWTahXW/BszebwAcPm0JNzYjuL6WjAiucCAyo
	 r+35gzbGhWoKZWJdAiWmjgHIwMGLHbWXSV0JlV1li/CW1DpI4Ac0HwtMj5P6LbxWZOsXD
	 dUJ6Y+DhxPL0DH15tnv7aPUHM5Eo5eGWNW60yED3Ff2KjqVPMqu5AWwbt4P/Lrnv4INIw
	 fcslZRxoTtN92Ackc1VU04kGLvnM3n70TA3+UDuloIRbuVI18v99SgrpI559GZCeRfw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.133
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023133.outbound.protection.outlook.com [52.101.127.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B45606A31F
	for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 02:41:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63B45606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mTbjBVwCqUPHVGslPnb8Tz5WVc5hQ4Qxt3cHiZSxFK3x5pkNRceB5gLszICJ8r4CtQgJGL7X7wckbsMNXOdeg9oBAcG54OzBqQBwheT3tABE0yxmCDoEDjTrZd2q6OdT5H6HDkdxIbuu2UOFZS7D5vzaKQNrmvbnbipYvRWlWA8gE4I5eg8nyZqHvT9mvz7LLj+omceSTnK/QIPQF9bAPLxmvGDen+V6o/pvd3p3NabkEGOmy9IiofPV+McaloGKCZF4ODlNS8Z0qmxeTCcZrSiNCmwS/dyA9Lny1bMWcoZ01lZlpq0dnaOjI5OMeicGUNglhvSiJI6MNgr9NZx0Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kG/jdJJODTPjwVrIkHTPZZs60ATUN/3FiMBiUhyb56U=;
 b=y/2/o4O2ZTYmoI77+eOniWTbCt164YT1ZB+aI4f6lnJPWgMndq+cmdbyNs5j2iVGAGrMKcZ6kfdJLi7nEIwUS4rsbb44qKYZSFYTYVK5oDPas29rdGupsyDXYRoBOQu6u/pC3t+xQwbWuMaj3H2EIcGHl9jkdWRU32mQB4qqvXIyVEyo7m6aalqwg+lIzHb9R6vcyZX1UTwN6WA3Q0fZRpTUlc4r2K7ytKLFyZXMMDjopevoqRk3ErinKwTNuyrN9m0yIBHqpfdqLSizVWsJS4BtF6+BdkCHyPe/cHIPv9MvWuDUMBhb/u2qRMhHW9bWqFvqPWkl7SwhGw317uE+uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from JH0SPRMB0074.apcprd06.prod.outlook.com (2603:1096:990:63::5) by
 TYUPR06MB6097.apcprd06.prod.outlook.com (2603:1096:400:355::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.4; Mon, 16 Nov
 2026 02:41:09 +0000
Received: from JH0SPRMB0074.apcprd06.prod.outlook.com
 ([fe80::d5a:16db:d97c:df7a]) by JH0SPRMB0074.apcprd06.prod.outlook.com
 ([fe80::d5a:16db:d97c:df7a%5]) with mapi id 15.21.0592.009; Mon, 16 Nov 2026
 02:41:09 +0000
From: Luo Liu <Luo.Liu@cixtech.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	"sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"vkoul@kernel.org" <vkoul@kernel.org>, "neil.armstrong@linaro.org"
	<neil.armstrong@linaro.org>, "olteanv@gmail.com" <olteanv@gmail.com>
Subject:
 =?gb2312?B?u9i4tDogW1BBVENIIHY0IDIvM10gcGh5OiBjaXg6IEFkZCBTa3kxIERQIFBI?=
 =?gb2312?Q?Y_driver?=
Thread-Topic: [PATCH v4 2/3] phy: cix: Add Sky1 DP PHY driver
Thread-Index: AQHdanbgq1pNi9XhWU29I66qIYDBHrcaHhYAgBWFf4CAAG65wA==
Date: Mon, 16 Nov 2026 02:41:08 +0000
Message-ID:
 <JH0SPRMB0074B8E39350D231926ECEF5F57C2@JH0SPRMB0074.apcprd06.prod.outlook.com>
References: <20261102030425.1957585-1-Luo.Liu@cixtech.com>
 <20261102030425.1957585-3-Luo.Liu@cixtech.com>
 <sashiko-outbox-192860@kernel.org>
 <179477295532.135135.3835475209766065939.b4-reply@b4>
In-Reply-To: <179477295532.135135.3835475209766065939.b4-reply@b4>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: JH0SPRMB0074:EE_|TYUPR06MB6097:EE_
x-ms-office365-filtering-correlation-id: 8b2d4bfb-1471-4aa8-db0f-08df438b11ee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|42112799006|38070700021|10067099003|4143699003|56012099006|261026140227099003|261028144727099003|261022105027099003|261009223027099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 0cOSv4f/EUkHo9fHAWQoEVMv2VMVftDKw4XLTBfeVFOX+sNHjD7dLqjwC2chTeGQR/DHXJbHBZFE9tcJ0WnpMSBSz3Wr1ZSYszgb/4yPGCnppK0L72+3aayD6GgfAMTc/yi6aktztVUFK7Gz4j5OlqitNEY+EDgftTLCUwtRT1XFE/Xx4CDl7eFVOWWGcX0MzZPxV1nzMLdVko2uszExs6aD+nAlQoL+jmB3ez7kEHIxoq/oxapP/DKgn+z0ucTCmxQPLgXeqOEHbEHDJ315Pfbpkic9UyxoQVeGEeun3fSfcTgOCXLAJWNXit9aiDFF3Qf8Rn2ZpsyXjCyciqJcaCESmTg1clok2h3OLOfkU3XA4QhdBLs/WaEbjcKkgJIU20dH6kfEp9Q4GOCJ+Qsu1KMhH7+5omZ9LfVaIKqeC7q+TNB79vKRLBepSx7ztEi+rTjN5gfKrCpZdRZX2UyZ3ctg6jXaVISLRNdsmSObswP0PXMsYqipZkNkGoEmbcOSouwL3ZQrfJD6QqAKWCF+IkDrbgTkVnGZ8frnB+2KPawk9sxUma6dyjViPUSL7vkUl9Lhj4RCLS5KvMAeKI0i62GRrF3dsNqPkdQHCMunG/aqEfzuF3b9ClEvUtI4y3ZDnWx9MpnkF/AgXsNH9a62RYBa5VCZ7svJr5Ki481icEqhMMbfIg/duzcArcBwUgaUVMOeo+2fyOl7MBDJz23NdLBlx42kZTEsyIZh9RHAybw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0SPRMB0074.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(42112799006)(38070700021)(10067099003)(4143699003)(56012099006)(261026140227099003)(261028144727099003)(261022105027099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?bWNSb1lWL2FpcWIyWXAzT2xpakVuRkdiQkJDSWEzSUhpcXllbkJUbzNyTXl2?=
 =?gb2312?B?RVZnamVtSFd0cjFCTG85akIvSGVHSWRQRkpZVkduTXV6Z1FXU25OMmR1My80?=
 =?gb2312?B?TGdkdUluS29hVGlIRzFoZ1dQUVlaeEh3dzZKSE5ZNVNLU05OZ3BHM1dZU21G?=
 =?gb2312?B?UURWVHkzUjhHcUowU2FBdE5PajhhTEhqL0RYczhyS3ZJdGFUWElUNGVWbU8x?=
 =?gb2312?B?OGFwKzdIelhRTEJLLzFRS3p3MElVVHZBRWtudE52aW5WT051bzVMTlBmaVRl?=
 =?gb2312?B?RThBSENWakVTWDBKT1FQV1kyUlZPR0ptK2hzU21JWnZqTytRYnFNaWlBRng5?=
 =?gb2312?B?RXN6UGV0R2dlOERmQnp2T0I1SjNkQ2l6NGU5b29RSGhTTGRMZHdTTjVJRDZh?=
 =?gb2312?B?K0twVGpYUUFyZWVRVXBYQk91aWkwbUdzMjh1LzdyYWR6UTQzYzZ6Q1k3NWpo?=
 =?gb2312?B?bkowSWVodkEzNVpkTFBRdGhsTkN4UHorUHBqL21CbS9scGhKR0gzaXFoZU5J?=
 =?gb2312?B?Rmd6TUlGTEc4c2tPY2hZMUdWb0t4T0JnMVZqMVV4Z29Jc3dDamlkV1dHNkRR?=
 =?gb2312?B?bFV0YXorU2hIeHMxNHE1ZFNETURhV3ZWTUZ6aWNLbFBhcVYzc01PZDZyaXNi?=
 =?gb2312?B?OHcya29JV29RWFVRcG9pYWc4UnZqZEpzT1l4YVJ6a0FoRm1USElZckMvaEox?=
 =?gb2312?B?eVJNck5uQk8wUUJ6OFZvUTJvalFuYWJJdDRoY2xVWnNXbnluNkc1RVVuNDFJ?=
 =?gb2312?B?ajl3cTVpTFZLeHh1a0d4U2p0RTcrc1FtV3FnY201SHdqK1JDK1AvVDF0S1Bw?=
 =?gb2312?B?bjZDbkNKcC9Iem5WQ2hHZVF1QTg3SWJWbFRHT0dUMk5RUlpmM0lOSFVRYUFU?=
 =?gb2312?B?R1dWYWp0dmpoU3QwNE5zb00zN2U4YmkrS0g0U0VjODZGOVhRcElnaVZKbUZv?=
 =?gb2312?B?NUZJY25abWpERUNEV0FaZktWVXRQU0luSy8yYW82QTNHbTVZOTg1aHdTS3RE?=
 =?gb2312?B?OXdQV250VjhTQytyNHRmUHNSMFUyMHcwSWEwWVU1ZFd6L2xwdU5zcjIzTm5H?=
 =?gb2312?B?RnRFQ21DcWNCWE5TREVqU0ovT2phYzhVeVVUZ3Q3VXRZMFk0bkdlMk9NK3BG?=
 =?gb2312?B?M0JnckZxdDY1MWRBWUZnN2RLaldsenM2UXlkTk9TL1VQZXJ4c2phektzWklN?=
 =?gb2312?B?QTB3dCtraEdqV2pCTURSR090ejVUSHRIMWc4UmFJZzdlSmlyallTMCtPV2da?=
 =?gb2312?B?M1kyU3ZDcVltWGV6ZlUzaTV3THlwRUdvOHgybVgxRWRhQmdQSkpzK09mS3FO?=
 =?gb2312?B?cy94WnhsWDVLNlByak45djZlTklpTk5manoyeDZqTVoyaEU3ZUtNMFQ0ektJ?=
 =?gb2312?B?MXdWYjlVVVV6WlVSQ2lNRC9veDdVVjFqQW83RXdibUN6Wllsakw3cWw5WDFQ?=
 =?gb2312?B?MEhiOFR0ZDZlUURDRmI1MFgwR2pseDNvQmFzU212WnZtQ1pXbDRFOXQ4MWpt?=
 =?gb2312?B?ZUNUWVNZY29UWTJKWGJ6U0t0YWh0bnNtdUdRRG45MmhkTVFVN1IvN2xydVdL?=
 =?gb2312?B?ZHRrMDd0dHJWT0w4N242VkhYbWZYR3VqcmxVQnVYU1lBRlBiYjVpUCtmNXZt?=
 =?gb2312?B?alhOc3U4b1d6ZHFtclBnUjZ5bTkzSWt2ZUhQZnJsN1Qwc3NCOUQyN2ZRSnhv?=
 =?gb2312?B?QnZmTUxuK3NnMDJjRlZWb2p2TFpJWFkwL3RlSzJkS0djY0d3eDdDWEV5bFkx?=
 =?gb2312?B?NHRVU21ZcFFrclBQTXIwNlpoWGlta1NGVnZZSkplVE1jSjFEMmpLY2ZnWWNG?=
 =?gb2312?B?RzJ6MS9KajZwdDdhbmZ2b1VhLytEV2pRUW9yL2xMaXN3RUxocDVMNmI2NVRK?=
 =?gb2312?B?N1dFbVNTYVNnUFRCME9lUTUzWG1MTFppUU5UanpISytWanJKbkJxdHZFQk1C?=
 =?gb2312?B?UWw4c2IyRVQ0TGQwU0VRNDVqMlpPZGhnODFWMFdaekR1aWV4ODRBWlVJSDdj?=
 =?gb2312?B?YkpjYzFiNEh1cmFobTZEblhUMExPS2x1VHJpZ2FRZnpudk1RVHFYT2YyS1ZI?=
 =?gb2312?B?Y1pqeWZ0OUNxVWlub045bXpYZ25WUTRSRjNPUWUxR0dPZ3picy9VQjc3NVNQ?=
 =?gb2312?B?RDdMWk55Um5VcWFqYU5LQk0xZ3QvaStTQ29vZFpxcGI4RmJwbjdPamF2N1F3?=
 =?gb2312?B?SzQxcjFLRk96N21ONXMzRWVWWnFiYWRtZVM0ZXVpZ1F5amZVQitKb2JZVWc1?=
 =?gb2312?B?a3VYN0htZkZNZEw1NzhpZ2dqejFQMnQ4aHhNTlhmNGZYR0JZRDFOTDU1TWFz?=
 =?gb2312?Q?XY4jG8V2dq4Xdb0R8Z?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: JH0SPRMB0074.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b2d4bfb-1471-4aa8-db0f-08df438b11ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2026 02:41:08.9525
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7uSxRC1E/WKC39juQCDByoFptBunz/jQFu1xCMFYuT+3+2kqtNZnKbsTMvKCf7nLYrtCF98N7zehpQztR+o6FA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR06MB6097

SGkgTWFuaaOsDQogICAgICAgIFRoYW5rIHlvdSB2ZXJ5IG11Y2ggZm9yIHlvdXIgcmVwbHkgYW5k
IHN1Z2dlc3Rpb25zLg0KDQo+IC0tLS0t08q8/tStvP4tLS0tLQ0KPiC3orz+yMs6IE1hbml2YW5u
YW4gU2FkaGFzaXZhbQ0KPiA8bWFuaXZhbm5hbi5zYWRoYXNpdmFtQG9zcy5xdWFsY29tbS5jb20+
DQo+ILeiy83KsbzkOiAyMDI2xOoxMdTCMTbI1SA0OjAzDQo+IMrVvP7Iyzogc2FzaGlrby1yZXZp
ZXdzQGxpc3RzLmxpbnV4LmRldg0KPiCzrcvNOiBMdW8gTGl1IDxMdW8uTGl1QGNpeHRlY2guY29t
PjsgbGludXgtcGh5QGxpc3RzLmluZnJhZGVhZC5vcmc7DQo+IGRldmljZXRyZWVAdmdlci5rZXJu
ZWwub3JnOyByb2JoQGtlcm5lbC5vcmc7IGNvbm9yK2R0QGtlcm5lbC5vcmc7DQo+IHZrb3VsQGtl
cm5lbC5vcmc7IG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc7IG9sdGVhbnZAZ21haWwuY29tDQo+
INb3zOI6IFJlOiBbUEFUQ0ggdjQgMi8zXSBwaHk6IGNpeDogQWRkIFNreTEgRFAgUEhZIGRyaXZl
cg0KPg0KPiBbxOPNqLOjsru74crVtb3AtNfUIG1hbml2YW5uYW4uc2FkaGFzaXZhbUBvc3MucXVh
bGNvbW0uY29tILXEtefX0w0KPiDTyrz+oaPH67fDzsogaHR0cHM6Ly9ha2EubXMvTGVhcm5BYm91
dFNlbmRlcklkZW50aWZpY2F0aW9uo6zS1MHLveLV4tK7teMNCj4gzqrKssO0utzW2NKqXQ0KPg0K
PiBFWFRFUk5BTCBFTUFJTA0KPg0KPiBPbiAyMDI2LTExLTAyIDAzOjIzICswMDAwLCBzYXNoaWtv
LWJvdEBrZXJuZWwub3JnIHdyb3RlOg0KPiA+IFRoYW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRp
b24hIFNhc2hpa28gQUkgcmV2aWV3IGZvdW5kIDEgcG90ZW50aWFsIGlzc3VlKHMpIHRvDQo+IGNv
bnNpZGVyOg0KPiA+IC0gW0hpZ2hdIHBoeTogY2l4OiBpbmNvbXBsZXRlIGhhcmR3YXJlIHJlc2V0
IGFuZCBzdGF0ZSBkZXN5bmMgaW4gY2l4X2RwX3Jlc2V0KCkNCj4NCj4gTG9va3MgdmFsaWQuDQo+
DQoNCkkgd2lsbCBmaXggaXQgYXQgbmV4dCB2ZXJzaW9uDQoNCkJlc3QgcmVnYXJkcywNCg0KTHVv
DQoNCg0KPiAtIE1hbmkNCg0KDQoNCrG+08q8/rywxuS4vbz+sPy6rENJWLmry761xLGjw9zQxc+i
o6zK3Leowsmxo7uko6y99rmpsb7Tyrz+1ri2qLXEytW8/sjLsunUxKGj0c+9+8jOus7OtL6tytrI
qLXEyrnTw6GitKuypaGit9a3orvyuLTWxrG+08q8/rywxuTIzrrOxNrI3aGjtMvP3tbGysrTw9Pa
1ri2qMrVvP7Iy9LUzeK1xMv509DIy9Sxo6yw/MCozrS+rcP3yLfK2siotKbA7bTLwODQxc+itcRD
SVi5q8u+1LG5pLvytPrA7cjLoaPI9MT6zvPK1bG+08q8/qOsx+vBory0zajWqreivP7Iy6OssqLT
wL7Dyb6z/dPKvP68sMv509C4vbz+oaO7pcGqzfi0q8rkzt63qLGj1qS8sMqx0NShorCyyKvQ1KGi
zerV+9DUus3O3rKhtr7Q1KOsQ0lYuavLvrbUyM66zrSryuS07c7zu/LSxcKpuMWyu7PQtaPU8MjO
oaMNCg==
