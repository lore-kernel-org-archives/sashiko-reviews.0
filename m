Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013010.outbound.protection.outlook.com [40.93.201.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6363FF1DB
	for <sashiko-reviews@lists.linux.dev>; Thu,  4 Jun 2026 10:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780570404; cv=fail; b=CA8GbZPT2otdUCncopeoVzZ0i/m170HtQ9RE+NoYnonro2x/VW2yvXkL5zmCsSIA2e0/5d7ZuBIzVBKRn0T8Efdlhiphfnp3tEW1ZhH5FSslBlJlSw5evqYHhEi7ua1RKtanZic2W3HfDwbk3pQhzsLMRNXSR4cVXPl4kIv9Qxs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780570404; c=relaxed/simple;
	bh=Pr9lbZhpqUjwsLMxdDk64dggigCmfwhJhVwyM1EJVUY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BfUmN8+rPYcg+lvj/cW4hGGdvYh/XEHtD/vUGug3QRrhYQQrMBbEvLcxEZMe3PMhY3WtFWSEZ5A5vsic6obqpRUa66KaEdeaLYlxXywBc+ii2+w2KCC5y4CnbT8MiUG8R0CXNoLrLU65cxC/RA0l7p7AQ+3goc8clp+w9kIUsnQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=ff3ybvhr; arc=fail smtp.client-ip=40.93.201.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="ff3ybvhr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=quAsop76w+6qURXnqLU/ikt4iA0mo8LG9MQiQZnKkcl+7OoArRTslhTrYSVmDxikFgQ8AdLRVlLGd+BFETp3XHuvZQzjL4R4GHH80Z+J/dY/APaHlaZtts5ekAgeb/DSUjg9qelJDdE55ibcLygB9e5vIstxJGwMB7i0RRmNC6nvZB7HLW8wJJ0qJ7BudZOFaRHueSsWnNtudAn/+xm617fohHJCIJQpuDIsy5LmEehzU7WXpWFcL/HhUKir9QePFil9St1HTWjw8IWiOu6V/WT8CZLkLQZj30Wl3cPs/twV5rEJPuthemK+CRlvJP4y6jCStbj7yomHENN45p31vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pr9lbZhpqUjwsLMxdDk64dggigCmfwhJhVwyM1EJVUY=;
 b=OJgHCBwZolEBTMtm89xK4i/paZ9tqissQki9LnLB6kQbZCV+eoz6PxdjUjY0Tis72HJt8wDEf05y6e+YdYGsz3i+Pf1wTgSXz2W1o4x/X3zCYDDLlIdbiSnW0T1Ugbh+mrN3hfFsCZCGNFYBzzqbtw7LuCNzeL4e5vWc5D0SiOHcuVpfuKOzGlFPKYCfPz8kA7RFXfcQ32uMZhidxA8R5N2bP2j/PH8Pbv0FrkToYYrEazdd9C0oQCict4LV1Ie39FAvVRhiW3Jx+jVAK0yAtSjMqsjvZDrZ6T2pWuQNddI4cjdzpHG0V/ltRMV9lpzWz+mHiLiUlrzY1eSf8tNuHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pr9lbZhpqUjwsLMxdDk64dggigCmfwhJhVwyM1EJVUY=;
 b=ff3ybvhrHlutsb0AzDVeyWSKR9ZIobLLEmZYxwY2qUb2R4/oht72s4p9n+MzQh6z1kygtqr5gBClrPrzKdxf7VyEmZ0x9QdY8wnwmxuG0azBZRFwSernLk2ucWbXI+optiw/tNg1olSoDd2VyqPf+DuPJODgqLOKtW1vLKbOZ85MIMge9hEUKICuwg1kwIGuXurngAcKPCjt3oQeXI+Jyh4nrbjrHt+Bmzih8PQxGw4Me2l91+tgqIkkTHP/gDFHimTOkaVIiQFNlHtGrqerE4pq6TgkuZ1nZtrRDrGiFc24yfOdfB0zoNQ/F8+rIwtw3vdOIxx4qnSJe4+Qc3U7pQ==
Received: from DM3PPF9623118BD.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f3a) by DS0PR11MB7506.namprd11.prod.outlook.com
 (2603:10b6:8:151::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Thu, 4 Jun 2026
 10:53:20 +0000
Received: from DM3PPF9623118BD.namprd11.prod.outlook.com
 ([fe80::ad98:5674:dd4c:875d]) by DM3PPF9623118BD.namprd11.prod.outlook.com
 ([fe80::ad98:5674:dd4c:875d%6]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 10:53:20 +0000
From: <Manikandan.M@microchip.com>
To: <Frank.li@nxp.com>, <sashiko-reviews@lists.linux.dev>
CC: <conor+dt@kernel.org>, <devicetree@vger.kernel.org>, <robh@kernel.org>
Subject: Re: [PATCH v7 3/5] i3c: mipi-i3c-hci: add microchip sama7d65 SoC
 compatible with the required quirk
Thread-Topic: [PATCH v7 3/5] i3c: mipi-i3c-hci: add microchip sama7d65 SoC
 compatible with the required quirk
Thread-Index: AQHc7ChYt+HQ2BQ9w0yNGgYrJRptvbYeiMCAgA0AywCAAr7YAA==
Date: Thu, 4 Jun 2026 10:53:19 +0000
Message-ID: <5a4c037e-5988-49ca-8fcc-7abaf79cf1d4@microchip.com>
References: <20260525092405.1514213-4-manikandan.m@microchip.com>
 <20260525102331.8AE921F00A3A@smtp.kernel.org>
 <ah8LiLPXssB5VYjm@lizhi-Precision-Tower-5810>
In-Reply-To: <ah8LiLPXssB5VYjm@lizhi-Precision-Tower-5810>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF9623118BD:EE_|DS0PR11MB7506:EE_
x-ms-office365-filtering-correlation-id: 615386c6-6c54-4593-e13b-08dec2277da2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|4143699003|11063799006|5023799004|22082099003|18002099003|38070700021|56012099006|6133799003;
x-microsoft-antispam-message-info:
 pcDwS0BMUKhyI1vQAEJZeC14rkWj4YovND6rt6iw8jjEHIwUqQRUforZOB6rXSVQW95P7ZS2+rTasLAdyNwv2qO1Ve/7rX5Vgvu6aHsZN0ZfYhvCS9Kovs+rGFiSx1b3vfROEvVUJZ0Bn7PxhsrWxefodJZjHbjdPvo8BWJEjPizRUkRkz3XaXV+LIHx89q3FzxIiS7PfRXwxKSe+HSW7G7rHTWXnAx+7T7VxVgMwEzxIoZpRZ/Vvyup0IAPe8IqRVsA5X+Kt5zKEcckb6+zxvpz27m51Za2Thm4O44v3FI0nsNfWo2Fz7niCWsQQRtCnf72x28oiVCqeCtmrRldCse+SNgWX+dI93BQIHaemAacLbJHyDwN4lr8gtLcYlRR9sJ1ccet0sFrXVKr34wQzLYkteeguSsDFuRKb90WeiTiNy8eE7nQC5LaA/x64NMIyjPcGKxWgDA+lm1TsoTNNUmbKPHfeDh+NzyyMNnlxukoMQvJ2Tpc9SBtsvbE0XvPzuKtdaf5xxs8ZOESN8dgWI94f7hRm9CTGe60E1ENq3hxApNx+ySEv0jE6+cx1aqZm4mF13KFhnTt9fXiU+hfXEbhFDJr3lEOfDRPL1oT3KE7wDg4TbJs/J+SJxzgEwAeG8qtok+tJutJ+9zAqmUjOUNpweRp1ISpmtqUvt19dbAwaUDBe5AQSlrcJ0sb0rEbR2Cf3l6lxbfsBSSbko43eg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PPF9623118BD.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(4143699003)(11063799006)(5023799004)(22082099003)(18002099003)(38070700021)(56012099006)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VVI0UG9OWWgwL1g0d1lURjdGNjVlUmNrSG0yL09LMmxHeXFUSWtCOWhyelc0?=
 =?utf-8?B?WXlaMFVSQzgwZDJYY1BKTU15RThiWEo3UmlubGwybVNJNEN5eEVNdkZmd3Ju?=
 =?utf-8?B?dlAyYkVtQU1hVVpGc28rdGpFbUlxVU8rTEpyejNPMVU3Nm9ZaGJ0RGJQSTRk?=
 =?utf-8?B?bjJkbkZzVStIemNrU1FORXdPNVc5WWszaXJvV0hLME8xUHRXRDBBYXdxL0Ji?=
 =?utf-8?B?WWJxK0d0VlQzcEltTDJUUTFyQ0lYZ2ZhcFRjZUVkUzZVa1d2QkRTSjNzWFI0?=
 =?utf-8?B?QjZKNGxEVmMwMGZJKzRJYnZ6SitoMVZCdGxoSXh6Umxya3JPcUVpcVd5ZjhQ?=
 =?utf-8?B?SWxnVWQzc3AxOGR2WHkrQ1p4SHA0amk0M1UwMU1POTFUOVZtc0tUV0tZb0xN?=
 =?utf-8?B?eSs5V1hXdDUzUGdEaE9CLzd1NENGSHJneWpJMmtkNmpWdG1JV0w1YUYzQzVK?=
 =?utf-8?B?SElOUzhsSXRpWS9JalRzWG02ZThvOVY0bnoyS0hzbWJpdTBKQ25XZmsyWDJY?=
 =?utf-8?B?aUVBUjFnRmV3WXFaVnVDVWlLTkpwRlJaTVQ5MXQ2OVR4aGh4QU5lRG9SYWtz?=
 =?utf-8?B?SkZuZ2NreWdSK0NuelBlM1JVSThsSzJ1eXUxMDhwRlI1WFo3Zmo2UE5vV1px?=
 =?utf-8?B?VWpCakMwcnZGN0twWGVONUIyWTg4bGNiTkdMTGtoTnVVWDZrSFh3Kzc2T0x0?=
 =?utf-8?B?dkt0QTE5emo5R2ZCWUxKWE5kOTcrUy83c0k2dGVEN1dsOHFCNVZTRG5RNkg3?=
 =?utf-8?B?eG04OXp4MU84M1AwYVgvRTgzVHFNOXpnVU1VV1N1QkxNbk51SSs3MmF0Y3gr?=
 =?utf-8?B?bTZzMDZwODY1bWlEWGh6ZUtlR0JXekc1ZFBBRUo5aVdxb2NzeE4zRENlSTEz?=
 =?utf-8?B?WWhDck94T1M0RFBNMDlkc2dLZ1dpaXdiY0FNZElkRDdFZ3h2eTR2UEpSZHdv?=
 =?utf-8?B?QjY0d0NaeVZlY0F3M2gxRVpQYkJJSXRETGhWbEkrbEhFUlZYMnFaWE1saUIv?=
 =?utf-8?B?dHhOV0JMWlY1YjJqNHp3M3VSZ3d2NmoybEFFVTFVN3BWOVFXWC9wVFZJNVdR?=
 =?utf-8?B?MVM4TUJKQm9FMmtRSEZ1L2NySThhcW0xU082dmFyRmxITzRrYVJUa3dGRnZV?=
 =?utf-8?B?bWp0VUE1SnNvbXFoOHN0YXdTbk9zb3YxaXVqQzdaYmFUVmtYYVo4aDdsTGQ0?=
 =?utf-8?B?clVuQkRVb2R2cVNPMkllSiswOGNudHRQM1duaGRFbjQ5aDIvSGxxV2xxQ3Rx?=
 =?utf-8?B?OERDalhnVE1ZTkFnQXV5bHF0bEhiR0lwL24zM0JEWmxZblFFZllOeVlvdFZp?=
 =?utf-8?B?VXc1T25SRktiRVkzZ1lDQWFuREhjRkV0a3ViOFVpR3dqUHRRc0E3SUQzb3p0?=
 =?utf-8?B?MGFCbEk1M3pxdUVFV0pVSmNpemIydTN2Rm5iRmxlUEl0RFUyWVB1RnBhR2d4?=
 =?utf-8?B?M01GeXZBZzlhSm1WdjdqaUkra1Z6N2JtR2p5eWhRd1VpYzBPYnI0Vk94WExT?=
 =?utf-8?B?elZ5amZWam1PVEVuTkpMdU1vTlR5dmczZEFoTTV5MnV2ckEzTFluc1NOTERk?=
 =?utf-8?B?dHArZUdERjROQ2ZBNjRkOWY3VkFWc2NkQXBjRk1XNEZaOHRuQUNFLzQzbE5s?=
 =?utf-8?B?TVFhd3VZOGJLcktZQnUyQmY3aXNPR3VmVURKU3dVSXZaL0hyQ25NTFRxNDQy?=
 =?utf-8?B?aWtTVnVUZFo5WWZUV2lNY2JrNDRJMDh4cnJsSk5KV2NqOG5sNVE0NGFKQllY?=
 =?utf-8?B?Zk1BTzF0ZWNBN1ZCSzZFdVJlUTEwRWJLVW1YV3c3ZjhjbVBLeG1tZkNLY0c0?=
 =?utf-8?B?VzBxYmtPSUg3cGlNQ3Y2bnozUVFMS3BXanIyZUhRRXo5SnZublFocjhYQ2lP?=
 =?utf-8?B?czNGQlNieDF2SkFhTldKeDFUUlhGMUpZN0o4L0N2WFRFdGt0djdhRzRYSkph?=
 =?utf-8?B?U2FWcG5YVjlSSHRyQTBnaWpwdzZQck40VVFpRUFENHBqaVNnNFlBWFhFWU1J?=
 =?utf-8?B?NHRKa3lMNkU0OGpGeVprd2RVQTB4VXFJTjBmVUhwOXBEQTVXOTZWcTJ6MFB4?=
 =?utf-8?B?M2VIS1NISnNpZ2NwUzExV25RUCtPOUJyOGczeGtIanorbmZQRk81NFppMmc4?=
 =?utf-8?B?a3RGVGhnSDRpWDc5NjI3YTRMaThhSCtEMm02OUh4K0hhbkZXTW5YNW1kMWFr?=
 =?utf-8?B?NDIzc3ZKMEhvakVRcTR0dW0xdVV6MUlxZURCMlNtNTVFQ3E0L25RdDEzWElN?=
 =?utf-8?B?S0hSVk5ITkZEMUpZaFczQmNFZ0ppU2hlajNyb0pzR3FCMFNsRlZsRWt1NkNs?=
 =?utf-8?B?Ny9Zb0VCNDVoSnZycHlLOEhDeEliREhkditnNGwrMCsrZVYyODZsZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3A91AC3AF5BBF5469FB7A710DA619B86@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF9623118BD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 615386c6-6c54-4593-e13b-08dec2277da2
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2026 10:53:20.0044
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RYk2uXiZ6QQV9kI0WBhyclRPRaq3TCShYKFIlRA1/PXmMyq+bVQ/wR84Xig0dmAqnpzoX7DIboaMOCPzDVC2Z/LXiYrcf6vTBXl52LYw5M4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7506

SGkgRnJhbmssDQoNCk9uIDAyLzA2LzI2IDEwOjI3IHBtLCBGcmFuayBMaSB3cm90ZToNCj4gRVhU
RVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVz
cyB5b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBPbiBNb24sIE1heSAyNSwgMjAy
NiBhdCAxMDoyMzozMUFNICswMDAwLCBzYXNoaWtvLWJvdEBrZXJuZWwub3JnIHdyb3RlOg0KPj4g
VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6DQo+PiAtIFtIaWdoXSBSZXVzaW5nIEFN
RC1zcGVjaWZpYyBoYXJkY29kZWQgdGltaW5nIHF1aXJrcyBmb3IgYSBNaWNyb2NoaXAgU29DIHdp
bGwgcmVzdWx0IGluIGluY29ycmVjdCBJM0MgYnVzIGZyZXF1ZW5jaWVzLg0KPj4gLS0NCj4+DQo+
PiBjb21taXQgOGRhYjliOWVkYzQ5YzAyMTQ4MDBlYzQ4MzcyOTAwYWUwYjViYmFlNA0KPj4gQXV0
aG9yOiBNYW5pa2FuZGFuIE11cmFsaWRoYXJhbiA8bWFuaWthbmRhbi5tQG1pY3JvY2hpcC5jb20+
DQo+Pg0KPj4gaTNjOiBtaXBpLWkzYy1oY2k6IGFkZCBtaWNyb2NoaXAgc2FtYTdkNjUgU29DIGNv
bXBhdGlibGUgd2l0aCB0aGUgcmVxdWlyZWQgcXVpcmsNCj4+DQo+PiBUaGlzIGNvbW1pdCBhZGRz
IHN1cHBvcnQgZm9yIHRoZSBNaWNyb2NoaXAgc2FtYTdkNjUgU29DIEkzQyBIQ0kgbWFzdGVyIElQ
Lg0KPj4gSXQgaW50cm9kdWNlcyBjbG9jayBhY3F1aXNpdGlvbiBkdXJpbmcgcHJvYmUgYW5kIGFw
cGxpZXMgc3BlY2lmaWMgcXVpcmtzDQo+PiB0byB0aGUgbmV3IGNvbXBhdGlibGUgc3RyaW5nLg0K
Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2MvbWFzdGVyL21pcGktaTNjLWhjaS9jb3Jl
LmMgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvbWlwaS1pM2MtaGNpL2NvcmUuYw0KPj4+IGluZGV4IGI3
ODFkYmVkMjE2NTAuLjRjZGYyYWJkNDIxOTcgMTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy9pM2Mv
bWFzdGVyL21pcGktaTNjLWhjaS9jb3JlLmMNCj4+PiArKysgYi9kcml2ZXJzL2kzYy9tYXN0ZXIv
bWlwaS1pM2MtaGNpL2NvcmUuYw0KPj4gWyAuLi4gXQ0KPj4+IEBAIC05NjksNiArOTcwLDcgQEAg
c3RhdGljIGludCBpM2NfaGNpX2luaXQoc3RydWN0IGkzY19oY2kgKmhjaSkNCj4+PiAgIHN0YXRp
YyBpbnQgaTNjX2hjaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPj4+ICAg
ew0KPj4+ICAgICAgY29uc3Qgc3RydWN0IG1pcGlfaTNjX2hjaV9wbGF0Zm9ybV9kYXRhICpwZGF0
YSA9IHBkZXYtPmRldi5wbGF0Zm9ybV9kYXRhOw0KPj4+ICsgICBzdHJ1Y3QgY2xrX2J1bGtfZGF0
YSAqY2xrczsNCj4+PiAgICAgIHN0cnVjdCBpM2NfaGNpICpoY2k7DQo+Pj4gICAgICBpbnQgaXJx
LCByZXQ7DQo+PiBbIC4uLiBdDQo+Pj4gQEAgLTEwMDEsNiArMTAwMywxMSBAQCBzdGF0aWMgaW50
IGkzY19oY2lfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4+PiAgICAgIGlm
ICghaGNpLT5xdWlya3MgJiYgcGxhdGZvcm1fZ2V0X2RldmljZV9pZChwZGV2KSkNCj4+PiAgICAg
ICAgICAgICAgaGNpLT5xdWlya3MgPSBwbGF0Zm9ybV9nZXRfZGV2aWNlX2lkKHBkZXYpLT5kcml2
ZXJfZGF0YTsNCj4+Pg0KPj4+ICsgICByZXQgPSBkZXZtX2Nsa19idWxrX2dldF9hbGxfZW5hYmxl
ZCgmcGRldi0+ZGV2LCAmY2xrcyk7DQo+Pj4gKyAgIGlmIChyZXQgPCAwKQ0KPj4+ICsgICAgICAg
ICAgIHJldHVybiBkZXZfZXJyX3Byb2JlKCZwZGV2LT5kZXYsIHJldCwNCj4+PiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAiRmFpbGVkIHRvIGdldCBjbG9ja3NcbiIpOw0KPj4+ICsN
Cj4+PiAgICAgIHJldCA9IGkzY19oY2lfaW5pdChoY2kpOw0KPj4gWyAuLi4gXQ0KPj4+IEBAIC0x
MDMxLDYgKzEwMzgsOSBAQCBzdGF0aWMgdm9pZCBpM2NfaGNpX3JlbW92ZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2KQ0KPj4+DQo+Pj4gICBzdGF0aWMgY29uc3QgX19tYXliZV91bnVzZWQg
c3RydWN0IG9mX2RldmljZV9pZCBpM2NfaGNpX29mX21hdGNoW10gPSB7DQo+Pj4gICAgICB7IC5j
b21wYXRpYmxlID0gIm1pcGktaTNjLWhjaSIsIH0sDQo+Pj4gKyAgIHsgLmNvbXBhdGlibGUgPSAi
bWljcm9jaGlwLHNhbWE3ZDY1LWkzYy1oY2kiLA0KPj4+ICsgICAgIC5kYXRhID0gKHZvaWQgKiko
dWxvbmcpKEhDSV9RVUlSS19QSU9fTU9ERSB8IEhDSV9RVUlSS19PRF9QUF9USU1JTkcgfA0KPj4+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEhDSV9RVUlSS19SRVNQX0JVRl9USExEKSB9
LA0KPj4NCj4+IFtTZXZlcml0eTogSGlnaF0NCj4+IFdpbGwgYXBwbHlpbmcgSENJX1FVSVJLX09E
X1BQX1RJTUlORyB0byB0aGlzIE1pY3JvY2hpcCBTb0MgcmVzdWx0IGluDQo+PiBpbmNvcnJlY3Qg
STNDIGJ1cyBmcmVxdWVuY2llcz8NCj4+DQo+PiBUaGlzIHF1aXJrIHR5cGljYWxseSBpbnZva2Vz
IGFtZF9zZXRfb2RfcHBfdGltaW5nKCksIHdoaWNoIHdyaXRlcyBoYXJkY29kZWQNCj4+IHRpbWlu
ZyBkaXZpc29ycyAoMHgwMGNmMDBjZiBmb3IgT3BlbiBEcmFpbiBhbmQgMHgwMDE2MDAxNiBmb3Ig
UHVzaC1QdWxsKSB0bw0KPj4gdGhlIGNvbnRyb2xsZXIncyB2ZW5kb3Itc3BlY2lmaWMgcmVnaXN0
ZXJzLiBUaGVzZSBmaXhlZCB2YWx1ZXMgd2VyZQ0KPj4gY2FsY3VsYXRlZCBmb3IgYSA5TUh6IEkz
QyBidXMgZnJlcXVlbmN5IGFzc3VtaW5nIGFuIEFNRCBwbGF0Zm9ybSdzIHNwZWNpZmljDQo+PiBm
aXhlZCBpbnB1dCBjbG9jayBvZiByb3VnaGx5IDQwMCBNSHouDQo+IA0KPiBMb29rIGxpa2UgbWFr
ZSBzZW5zZS4gSXMgaXQgdHJ1ZT8NCj4gDQoNCkR1cmluZyB0aGUgSTNDIHNlbnNvciBzbGF2ZSBp
bnRlZ3JhdGlvbiwgYSBzaW1pbGFyIE9EIGFuZCBQUCB0aW1pbmcgDQpjb25maWd1cmF0aW9uIHdh
cyByZXF1aXJlZCwgc28gdGhlIHZhbHVlcyBoYWQgdG8gYmUgY2hvc2VuIHdpdGggcHJldmlvdXMg
DQppbXBsZW1lbnRhdGlvbiBhcyByZWZlcmVuY2UgYXQgdGhlIHRpbWUuIEdvaW5nIGZvcndhcmQs
IGEgZHluYW1pYyB0aW1pbmcgDQpjb25maWd1cmF0aW9uIGFwcHJvYWNoIHdvdWxkIGJlIHRoZSBt
b3N0IHJlbGlhYmxlIGFuZCByb2J1c3Qgc29sdXRpb24uDQoNCkkgYW0gY3VycmVudGx5IHdvcmtp
bmcgb24gaW50ZWdyYXRpbmcgZHluYW1pYyB0aW1pbmcgcmVnaXN0ZXIgdXBkYXRlcyANCmJhc2Vk
IG9uIHRoZSBjb3JlIGNsb2NrIGFuZCBJM0MvSTJDIGJ1cyBjbG9jayBmcmVxdWVuY2llcyB3aXRo
IENMSyANCnF1aXJrcywgYW5kIHdpbGwgc2hhcmUgdGhlIHBhdGNoIHNlcmllcyBzaG9ydGx5Lg0K
DQpUaGFuayB5b3UgZm9yIHlvdXIgY29vcGVyYXRpb24uDQoNCj4gRnJhbmsNCj4+DQo+PiBTaW5j
ZSB0aGUgTWljcm9jaGlwIFNvQyBhY3F1aXJlcyBpdHMgY2xvY2tzIGR5bmFtaWNhbGx5IHZpYQ0K
Pj4gZGV2bV9jbGtfYnVsa19nZXRfYWxsX2VuYWJsZWQoKSBhcyBzZWVuIGFib3ZlLCBpdHMgaW5w
dXQgY2xvY2sgcmF0ZSBjb3VsZA0KPj4gZGlmZmVyIGFuZCB2YXJ5IGJhc2VkIG9uIHRoZSBzeXN0
ZW0ncyBjbG9jayB0cmVlIGNvbmZpZ3VyYXRpb24uDQo+Pg0KPj4gU2hvdWxkIHRoZXNlIHRpbWlu
ZyBkaXZpc29ycyBiZSBjYWxjdWxhdGVkIGR5bmFtaWNhbGx5IGFnYWluc3QgdGhlIGFjdHVhbA0K
Pj4gaW5wdXQgY2xvY2sgcmF0ZSBvYnRhaW5lZCBmcm9tIHRoZSBjbG9jayBmcmFtZXdvcmsgcmF0
aGVyIHRoYW4gYmxpbmRseQ0KPj4gcmV1c2luZyB0aGUgZml4ZWQgQU1EIGRpdmlzb3JzPw0KPj4N
Cj4+PiAgICAgIHt9LA0KPj4+ICAgfTsNCj4+PiAgIE1PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIGkz
Y19oY2lfb2ZfbWF0Y2gpOw0KPj4NCj4+IC0tDQo+PiBTYXNoaWtvIEFJIHJldmlldyDCtyBodHRw
czovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA1MjUwOTI0MDUuMTUxNDIxMy0xLW1hbmlr
YW5kYW4ubUBtaWNyb2NoaXAuY29tP3BhcnQ9Mw0KDQotLSANClRoYW5rcyBhbmQgUmVnYXJkcywN
Ck1hbmlrYW5kYW4gTS4NCg0K
