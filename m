Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011059.outbound.protection.outlook.com [40.107.74.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0BA26B2DA
	for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 22:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778797939; cv=fail; b=b6SrUS8nTCdxR/cehE6cvNQgJlgQ3c7th8n40Mi9sIk4DOV5yepAQ2ursr+8TwEWopYi//lwX/jxiQMTM57CliEiV/Aqr2Vy/QoCIa0EJY9JGnqa0GAO8VXFBo4sNiuuLOWM/kOGo3hkd+qi46yqqGGnkv70ITzFX3vzLY5/+Us=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778797939; c=relaxed/simple;
	bh=JDo9cv9aNucv030l41x/RIlgQ0gqw59+gfj2xb8OZrs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=l6hNR5oBOCXPwX7qXpswAa7DPmHWfHiupZR3LCf4sco61NtkYrX2VDBaAGztpMXDbE/4E2pYf81UYnNQvNmxvOHv7imrwCdtnQBc4sOAtJ1LblnocqYeItmpUZ35Zgzz3rhLOQ+T/7dS1xsOQ4BNIknbrQvQ5WnGEKERk4acwzQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=TJp3pHG0; arc=fail smtp.client-ip=40.107.74.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="TJp3pHG0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S0DKK0qOFcuwWmHQG0GfN6QzMoMk7X1xnaLYLOJCaX864ZUGWS3K6ArUOMyXT10AV6oWVrFrKGNOmnEYHJfq6WEj1VIRWD3ijdWO3Di3CZaZKaV8C0F9Mu0amavcC6n2LVpJC5sN7Sd8ImPPh3tKZ/yKfIbron/yll95azCZA6Wf9VnI/u6bkQrT4dBaExf8oSbmYqqs5HEafWb+NEA3iGEmgEe62jcyt1vWKzRsBfT9QL+rf2CT1vFGU/AL3NTXwuzsJUoOaakHr5LoAir+RYY9hd56x7Qx8s81aC7dB4//w1gCaxN3dkNuE2CKFlKmjc2wmIfoeHRhWBmkFxKcOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JDo9cv9aNucv030l41x/RIlgQ0gqw59+gfj2xb8OZrs=;
 b=KsPM+rRb3MWvu2froOXxHrZrno6ILH1VZqin9iYjblWFvXOsj7hp/wDbDNdj4xe1XmdbxpmG932jCw8CG6XDPqB4FJ7fd+lJEDHlx0B2tVyrFRykQNXi5LTOi2JAXZzjHEMDgA8+C5L3TjvuAmNyqclPTC5DWdI5ITN66HSVabVw7hFvFH+WqpimJS1pjE3T7x78OQOJu/7Dxgoib/9Sbv9DjVTHynuF1MwdPePdjMKneyLOzLpT3U9g7b/pCPkQNKeqGFNNZkk9AynkEOdaPirzIK5Pw6T04J18ldABEfumJPssk3rt+gI5VSjlSL99l/NfYkn3OVk5HDnJmcLOcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JDo9cv9aNucv030l41x/RIlgQ0gqw59+gfj2xb8OZrs=;
 b=TJp3pHG0apWDs/iWPgBhGhLU6XDxgBjpRYT6brnhDY8g0l+Kh/HvxlrzvJpey367efpjiR7j3qDw8W+o5c6uix0nrVQtK3BARlr/SnkFa0WR2SQC5u651KFssSfqwwIZs9cDmaCfcBeAfEaofXjrdwW80uH2bchF9rG9u7tUclI=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TY7PR01MB13694.jpnprd01.prod.outlook.com (2603:1096:405:1ee::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 22:32:12 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.20.9913.012; Thu, 14 May 2026
 22:32:12 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: wsa+renesas <wsa+renesas@sang-engineering.com>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>
Subject: RE: [PATCH v6 06/16] ASoC: rsnd: Add audmacpp clock and reset support
 for RZ/G3E
Thread-Topic: [PATCH v6 06/16] ASoC: rsnd: Add audmacpp clock and reset
 support for RZ/G3E
Thread-Index: AQHc4j0d76VlJsoMcESTQtPqkOqDdLYMuJiAgAFlGrA=
Date: Thu, 14 May 2026 22:32:12 +0000
Message-ID:
 <TY6PR01MB17377FAF48B62E87223FE36A3FF072@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260512182631.3842065-7-john.madieu.xa@bp.renesas.com>
 <20260514011106.22465C19425@smtp.kernel.org>
In-Reply-To: <20260514011106.22465C19425@smtp.kernel.org>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|TY7PR01MB13694:EE_
x-ms-office365-filtering-correlation-id: 8e02838d-2008-4b49-7d71-08deb208a4ab
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|11063799003|4143699003|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 RBNkOaVuCyn8viVM3C8Nvh/KDjDE7d03EFnL63yC0px3dqyd1wV1jQsaYkGNfE6Dy3MdS9tqAJlm+mKvDxmSmSMohrTZc3w2Z6doG5nXm5dQvak5Nv28Rsq1OqXXEcxLJMQduao+nIglMoMzYlfNfL0zaSuubLCGNGv2yp3HINeozGZlQFz+h2rYkxvKHDvddQp9lbsOFWY2C15cR1HU6ennIll9/UVQaqfV9cyBs63s2omY2sjMdmbrzQZ96nRZnXTNhFIx2z42j4mDC4S9FdcQ5/+YZugj2MgEisc3r47lzsQIQ6fCNB3talNnjYeLLgsJYZfaTx6LusH9BGjbNBkTokFwSOI6oD0n3L4Q+5BnFIAMz4G61InuLgJnZ6LQr6LbMe7zHhonQn7vunoO9LD18v1Z0tjgQWnLyk0s/8rmq6LxN//3Eca1jrHEgmmTXhSmnEercF4YbXq8a7fO6gA5ULGxeCEF+4RIWlg2gC1Ebi7GrCTa4b/Z1qvMhGcKgTb7+H7qR24bjACJRJ7FSxrBRfhXG3yesE1YMVV9TmsO0xjmiCF9lh95dCCr0THcvvnOzwUSNJ+mX21x9nIomcEeBAilZrDp/u71tqBPhQWLbQzsfYZFkd8atNQ5T3uWERzv6g0xXJp2MYgSkRmbC7ejwCT9BMWHiAe/3GOsslkgTW5caqjd42mBRMBPIG6ZBjKk8xgz9uxiELSk02j55X/lWUjnlb7GueX/jymjoU+3ZIitEbAncEHVyO3ih8gE
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(11063799003)(4143699003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SXpUSU5EYzJ2WWlDMU1jRXdHTGVveWJ0UWxVV1Y5Q0dhdkZlajFQdE5jQ2xR?=
 =?utf-8?B?b0VoSS92Z2Q2Y25IOEFWK0szM1BIU3RNVTRLcE9YMWg1Z01yYkhpREhYUklW?=
 =?utf-8?B?WDVQbUwvcnJCMXc0dnVEQzZKeklNOGk1YnVhVFBxY0lXdDRDRWFmcUpGQnRh?=
 =?utf-8?B?azVPNDRwcldOSlZWc0w5WmswSElVWFVwUDgxTjRBWElRTUpYaFp3d0IzOThy?=
 =?utf-8?B?bmhSaG5RU0RBZjNYVGt5Z016SDdnWUNBaFZoK08yODJqbGdFOEh6U0xrZ3M3?=
 =?utf-8?B?UnFSY3dmajRqcVgxa1FXYW9Wd0F2c2JleExxT1hySTJETGh5b1oxNFFRaEJF?=
 =?utf-8?B?Y2JPUG5RMmVDZXZLcmtrMjZya0prd1BXOEJ3NnNKNmdVV2RTRDdtcDRmbXpk?=
 =?utf-8?B?ZUQzSTd6NWtXcm9DVGwvSWI3RlFFTXBiZjlTSTUyd0ZObVZmSXdrYXBCZ1Nu?=
 =?utf-8?B?MHU0c3VOaGJ5dFB2V25GeFl4SUNPN2Y0ZWh1Z2pyWUczOHRCeS9WVXNldDRh?=
 =?utf-8?B?d2NWNVlxczJGTUR4VkxwcEN6eWpwLzFqZFcyM3pXUUY5NzAyeWlmQWJUYzEz?=
 =?utf-8?B?VmFRbmhwTDlpa0JkV2hQUi83Uk9nNmo4Q3dLSXJRcjJvNmx6RGhGZlpQNmRV?=
 =?utf-8?B?eGlWT3ZtWmRqOWY5K2pkYlBuUmJBQ0ZmTjY5VkUzOW1WN2k3aXplbk92WG0r?=
 =?utf-8?B?NStPY2JKVGluRzFyVit0STFUZW5OdU5BTGJDMnY0Z3pUTzhtaWxpdGtmWTBT?=
 =?utf-8?B?L2dreStSekNweHZORHgrakUzdjU4QWVjUkhRVWU4Ukx1bVVDSlhwUDA3Mzkr?=
 =?utf-8?B?aTY1SEpLa1Y4SjBYS1Z4NUV0RnJKVlhMOVVUbWRlNEw1WVlReWZzY1Q1RGg3?=
 =?utf-8?B?L1ZSY3BybUtFbHIycHMvVVAzTktScjd4ODcxcy8zSS9KZU1UaEJkVXVGVXNU?=
 =?utf-8?B?OHZ2MWhYbUdud1E0YThVUXM2c0xhVlgzRUZ1cEprOGhUem9HbXpGdVQyaXlY?=
 =?utf-8?B?UFcxNm82bm4zeHVtWlBkZCtSM0RTRk1wd05nTklmNDBua2RkSUNxa2twSEFB?=
 =?utf-8?B?QWZ3TWdQdHRPTjFPTEVSaHM4ekc5RVhzWXd5VTQ1V2JnM3FqVTFsNjJtQ1h6?=
 =?utf-8?B?NGxlN1EvZEFFaXljUEN2ZTZIVURNejBLYllQdmpwbk9jcGxaSzdEckt4TWlu?=
 =?utf-8?B?b2pZMzAxSkJxM1F3RkRWeS8vRUg2SW9GcEkyeEpsTTd1d0ZnUGRsZ2Z3Yldy?=
 =?utf-8?B?TXkzL0xISTF4TzlMN1ljWVpWM0pZeExNbFc3TGplWUplayt4eHhBZ0V1QnVa?=
 =?utf-8?B?SGhwTE1SSmRHcTZSZ0NOV0Z3Sk5rSXBhTVFFSUxMY0xJVkg5cEpoL0RpUmg5?=
 =?utf-8?B?VnFUL09ma1Q4d21qbHJFaGNrTDRlMmxwQnh2V2JoR1Fza0JOVmJWbGJOUTdJ?=
 =?utf-8?B?WlU2RDFrNkhuQVdRN3NNNytlcGZEdmNpRkNQZ1ZqdzdaM1JLTXg3UTlIUnBM?=
 =?utf-8?B?ZTh4QnNObXZDeXdPbXozb3lzQXdxOEs2RkRocWZYWjdnWXZMUVdKOVBKRzlK?=
 =?utf-8?B?QWxvbGFadTluTVZrd0UycGxpT1hobnpUeFFoREIxd210WGxIRGgvN3ZzNFFI?=
 =?utf-8?B?Q3hMOG5oVE5zblRkVVpPYk1TTU4wa1lPRGhnKzlQYUJ6bVJ5bjJTZ1AxTWN6?=
 =?utf-8?B?NmtCcUszZ3BCVkhrS3pMRG9yMWlwVmlvV2Z0NUZDQXJ0cW1lSDlJZU55Sk1N?=
 =?utf-8?B?bGN0UDN4RkVlckY5YXhkZXN4RHdQaTBobEZ0S1JTaVZIMk9yVmhnQVdWTVR0?=
 =?utf-8?B?VGhuMWFFbHdsbmhxOTQzeE5OUWVwUXFZcXhwMUNXUFRYNXFydGZtbHN6QWRu?=
 =?utf-8?B?MmVISVVTMUdSVFJWTDloR3VtWWc3cWR1WnczNzFXT01ZaEora25wejFzT1Yz?=
 =?utf-8?B?dkJzSlQzdlpNMk5SaFBzVUZQSE0rYmtHbVg0RnpNcFNCSGNqeDFtaDZtd0ZJ?=
 =?utf-8?B?TEZTdzUrZU1Wd0VHWEpLMXA3akxveDJZVDRaRVJ2Y2IwSGhmekE2SlRONTlk?=
 =?utf-8?B?dWM5ZUFoYmc3SXRvZEgrN1ViL0JkcTJYS0ZPcXJmZ3JrYlhvWU5XVWg2MENi?=
 =?utf-8?B?Sy9xVCtpWmNoWHplSVByUFZmanlHNE54aFBDRVk1WDRBQWxianBJOHBMQ2Zz?=
 =?utf-8?B?RmwxS3pNSldUaHAvSUoxc3ZPZHpvT2pHdEhmZ3JWcTFLTVlXTnBxbE8xUVcv?=
 =?utf-8?B?S0VweGNndDE1QTNKN1JGZWRnK1hNUzdvdHAvZnpXMnBVNURIVGJ3RjNxQURq?=
 =?utf-8?B?U1NpbHhrZ0FBSC93aEhlMTYxRGVueVdBTnhFSktKd2JKU3A0azV1ejlDRkhs?=
 =?utf-8?Q?eE8Gkto6sCFO5ebo=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e02838d-2008-4b49-7d71-08deb208a4ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2026 22:32:12.4751
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: acRe6S90FMHeNc+u24oiZB3TTmD30Ug06B39+dYUKj0nEY++66kgGU8/myqNKFOcLnvPznMx0uTHIlp8Fje0O/83qudFz6/mfyroeQMgExs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB13694

SGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogc2FzaGlrby1ib3RA
a2VybmVsLm9yZyA8c2FzaGlrby1ib3RAa2VybmVsLm9yZz4NCj4gU2VudDogRG9ubmVyc3RhZywg
MTQuIE1haSAyMDI2IDAzOjExDQo+IFRvOiBKb2huIE1hZGlldSA8am9obi5tYWRpZXUueGFAYnAu
cmVuZXNhcy5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjYgMDYvMTZdIEFTb0M6IHJzbmQ6
IEFkZCBhdWRtYWNwcCBjbG9jayBhbmQgcmVzZXQNCj4gc3VwcG9ydCBmb3IgUlovRzNFDQo+IA0K
PiBbWW91IGRvbid0IG9mdGVuIGdldCBlbWFpbCBmcm9tIHNhc2hpa28tYm90QGtlcm5lbC5vcmcu
IExlYXJuIHdoeSB0aGlzIGlzDQo+IGltcG9ydGFudCBhdCBodHRwczovL2FrYS5tcy9MZWFybkFi
b3V0U2VuZGVySWRlbnRpZmljYXRpb24gXQ0KPiANCj4gVGhhbmsgeW91IGZvciB5b3VyIGNvbnRy
aWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQgMSBwb3RlbnRpYWwNCj4gaXNzdWUocykg
dG8gY29uc2lkZXI6DQo+IC0gW01lZGl1bV0gUmVzb3VyY2UgbGVhayAoY2xvY2sgYW5kIHJlc2V0
KSB3aGVuIGZhbGxpbmcgYmFjayB0byBQSU8gbW9kZQ0KPiBkdWUgdG8gbWlzc2luZyBtZW1vcnkg
cmVzb3VyY2UuDQo+IC0tDQo+IA0KPiBjb21taXQgOWQzMzY1YzAxM2ZiNWUwODA4YTZiMGNhMmJi
ZjE0ZWQzNWU0NzI1MA0KPiBBdXRob3I6IEpvaG4gTWFkaWV1IDxqb2huLm1hZGlldS54YUBicC5y
ZW5lc2FzLmNvbT4NCj4gDQo+IEFTb0M6IHJzbmQ6IEFkZCBhdWRtYWNwcCBjbG9jayBhbmQgcmVz
ZXQgc3VwcG9ydCBmb3IgUlovRzNFDQo+IA0KPiBUaGlzIGNvbW1pdCBhZGRzIGdsb2JhbCBhdWRt
YWNwcCBjbG9jayBhbmQgcmVzZXQgbWFuYWdlbWVudCBpbg0KPiByc25kX2RtYV9wcm9iZSgpIGZv
ciBSWi9HM0UgdXNpbmcgb3B0aW9uYWwgQVBJcy4NCj4gDQo+ID4gZGlmZiAtLWdpdCBhL3NvdW5k
L3NvYy9yZW5lc2FzL3JjYXIvZG1hLmMNCj4gPiBiL3NvdW5kL3NvYy9yZW5lc2FzL3JjYXIvZG1h
LmMNCj4gPiAtLS0gYS9zb3VuZC9zb2MvcmVuZXNhcy9yY2FyL2RtYS5jDQo+ID4gKysrIGIvc291
bmQvc29jL3JlbmVzYXMvcmNhci9kbWEuYw0KPiBbIC4uLiBdDQo+ID4gQEAgLTg2NCw2ICs4Njcs
MjUgQEAgaW50IHJzbmRfZG1hX3Byb2JlKHN0cnVjdCByc25kX3ByaXYgKnByaXYpDQo+ID4gICAg
ICAgaWYgKHJzbmRfaXNfZ2VuNChwcml2KSkNCj4gPiAgICAgICAgICAgICAgIGdvdG8gYXVkbWFw
cF9lbmQ7DQo+ID4NCj4gPiArICAgICAvKg0KPiA+ICsgICAgICAqIEF1ZGlvIERNQUMgcGVyaS1w
ZXJpIGNsb2NrIGFuZCByZXNldCBmb3IgUlovRzNFLg0KPiA+ICsgICAgICAqIFRoZXNlIHVzZSBv
cHRpb25hbCBBUElzLCBzbyB0aGV5IGdyYWNlZnVsbHkgcmV0dXJuIE5VTEwNCj4gPiArICAgICAg
KiAobm8gZXJyb3IpIG9uIHBsYXRmb3JtcyB3aG9zZSBEVCBkb2VzIG5vdCBwcm92aWRlIHRoZW0u
DQo+ID4gKyAgICAgICoNCj4gPiArICAgICAgKiBFbmFibGUgdGhlIGNsb2NrIGZpcnN0IHNvIHRo
ZSBibG9jayBzZWVzIGEgc3RhYmxlIGNsb2NrIG9uDQo+ID4gKyAgICAgICogdGhlIHdheSBvdXQg
b2YgcmVzZXQsIHRoZW4gZGVhc3NlcnQgdGhlIHJlc2V0IGxpbmUuDQo+ID4gKyAgICAgICovDQo+
ID4gKyAgICAgZG1hYy0+YXVkbWFwcF9jbGsgPSBkZXZtX2Nsa19nZXRfb3B0aW9uYWxfZW5hYmxl
ZChkZXYsICJhdWRtYXBwIik7DQo+ID4gKyAgICAgaWYgKElTX0VSUihkbWFjLT5hdWRtYXBwX2Ns
aykpDQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIFBUUl9FUlIo
ZG1hYy0+YXVkbWFwcF9jbGspLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgImZhaWxlZCB0byBnZXQgYXVkbWFwcCBjbG9ja1xuIik7DQo+ID4gKw0KPiA+ICsgICAgIGRt
YWMtPmF1ZG1hcHBfcnN0YyA9DQo+ID4gKyAgICAgICAgICAgICBkZXZtX3Jlc2V0X2NvbnRyb2xf
Z2V0X29wdGlvbmFsX2V4Y2x1c2l2ZV9kZWFzc2VydGVkKGRldiwNCj4gImF1ZG1hcHAiKTsNCj4g
PiArICAgICBpZiAoSVNfRVJSKGRtYWMtPmF1ZG1hcHBfcnN0YykpDQo+ID4gKyAgICAgICAgICAg
ICByZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIFBUUl9FUlIoZG1hYy0+YXVkbWFwcF9yc3RjKSwN
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJmYWlsZWQgdG8gZ2V0IGF1
ZG1hcHAgcmVzZXRcbiIpOw0KPiA+ICsNCj4gPiAgICAgICByZXMgPSBwbGF0Zm9ybV9nZXRfcmVz
b3VyY2VfYnluYW1lKHBkZXYsIElPUkVTT1VSQ0VfTUVNLA0KPiAiYXVkbWFwcCIpOw0KPiA+ICAg
ICAgIGlmICghcmVzKSB7DQo+ID4gICAgICAgICAgICAgICBkZXZfZXJyKGRldiwgImxhY2sgb2Yg
YXVkbWFwcCBpbiBEVFxuIik7DQo+ID4gICAgICAgICAgICAgICByZXR1cm4gMDsgLyogaXQgd2ls
bCBiZSBQSU8gbW9kZSAqLw0KPiANCj4gRG9lcyB0aGlzIGNvZGUgbGVhayB0aGUgY2xvY2sgYW5k
IHJlc2V0IGlmIHRoZSBkZXZpY2UgdHJlZSBwcm92aWRlcyBhDQo+IGNsb2NrIGJ1dCBsYWNrcyB0
aGUgbWVtb3J5IHJlc291cmNlPw0KPiANCj4gQmVjYXVzZSByc25kX2RtYV9wcm9iZSgpIHJldHVy
bnMgMCBvbiB0aGlzIGZhbGxiYWNrIHBhdGgsIHRoZSBvdmVyYWxsDQo+IHByb2JlIHN1Y2NlZWRz
IGFuZCBkZXZtIHdpbGwgbm90IGNsZWFuIHVwIHRoZSBhY3F1aXJlZCByZXNvdXJjZXMuIFRoaXMN
Cj4gbGVhdmVzIHRoZSBjbG9jayBwZXJtYW5lbnRseSBlbmFibGVkIGFuZCB0aGUgcmVzZXQgZGVh
c3NlcnRlZC4NCj4gDQo+IEFkZGl0aW9uYWxseSwgc2luY2UgcHJpdi0+ZG1hIGlzIG5vdCBzZXQg
YmVmb3JlIHRoZSBlYXJseSByZXR1cm4sIHRoZQ0KPiBjbG9jayBjYW5ub3QgYmUgZGlzYWJsZWQg
ZHVyaW5nIHN5c3RlbSBzdXNwZW5kLg0KPiANCj4gQ291bGQgdGhlIG1lbW9yeSByZXNvdXJjZSBj
aGVjayBiZSBwZXJmb3JtZWQgYmVmb3JlIGFjcXVpcmluZyBhbmQgZW5hYmxpbmcNCj4gdGhlIGNs
b2NrIGFuZCByZXNldD8NCg0KV2lsbCByZW9yZGVyIHRvIGNoZWNrIHRoZSBtZW1vcnkgcmVzb3Vy
Y2UgZmlyc3QsIGFuZCBhY3F1aXJlDQphdWRtYXBwIGNsb2NrL3Jlc2V0IG9ubHkgYWZ0ZXIgaXQg
aXMgY29uZmlybWVkIHByZXNlbnQuIFRoZQ0KZmFsbGJhY2sgYHJldHVybiAwO2AgdGhlbiBleGl0
cyB3aXRob3V0IGhvbGRpbmcgdGhlbS4NCg0KV2hpbGUgYXQgaXQ6IHRoZSBzdWJqZWN0IHNheXMg
ImF1ZG1hY3BwIiBidXQgY29kZSwgRFQgcHJvcGVydHkgYW5kDQpyZXNvdXJjZSBuYW1lIGFyZSBh
bGwgImF1ZG1hcHAiLiBXaWxsIGFsaWduIGV2ZXJ5dGhpbmcgb24gYXVkbWFwcC4NCg0KUmVnYXJk
cywNCkpvaG4NCg0K
