Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010015.outbound.protection.outlook.com [52.101.85.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4438A1DFFB
	for <sashiko-reviews@lists.linux.dev>; Mon,  3 Aug 2026 12:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785761722; cv=fail; b=r6SeL1ln28c3lDIH5vO+ypeirFNR+jFejU7T/ek6Hk4GbjENMJLJmLMipnEH1BmUJh+Z6+lNgRO/1pYJNixpU2NT314LhsfEmg4DsPTocaMxniFuRYHTwBx89o3gdf0JJ32r3hvqgm6PWXgnk6xe5aED3WMLvWHz7CHj78aZfMU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785761722; c=relaxed/simple;
	bh=7beMVsgB2ajJ5SWGFyuQz7/+JWp2sCwAhOE+x4VVrcQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SxOgUKPIEGkpx7lct+2rbENFFLAfmVwkUhb0VaJm8WU788NBYniddCWFLkjmnZ8uxaLtygt6ikw3JZPCBLpypX0qVW/S7T3zVrsnKCZn5I0D31jK7Ms1gFh3RvApgehHi5CvOK7V2I9lHFToIEAZ1xd+CjF4BiLL+YqX/7alP/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=yu3GFOJI; arc=fail smtp.client-ip=52.101.85.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="yu3GFOJI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZYHFSa855Q3jtA5F6KT2YbgjhmpspsfjdyYAmt6FpOvhN1IYSKrvkPfUcRfUqVykenb6rJZEIwN+PlhoskjdTcO2IuRbVFQLy/iobdjui1fttyt01X7OFR/BVChxomgIUcBgyZuYxUivBdlLDAqLf3lqCL3CPDFvh1Tu81pCPHUS0VoYQlV8Vug4PXR+A6fQUfbzs2z+Fz+uVS0ToPD4eLzkWqkq89Q+6XJyi1yc4EFBvUdf57FY5PoJns77jhmPv7wzrUzVTiEh/5JPLm/XcM1m/bXrVWyvS1Yr4uXNvz3yeT/aQEEZZ8+gUJYVfjF0K5oJwrC7tlxjpm/DCm4NjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7beMVsgB2ajJ5SWGFyuQz7/+JWp2sCwAhOE+x4VVrcQ=;
 b=keJpSvtWMKDq9N1Yb1n+Xs6V83fKsgbTMoWPTkcBtqF2n5LgLKwHmFUCglxHDb9lI57D31KE/l4ubMiCTVNHV+4v9Z96Sj4LzSJ54+S07GMNKg8f678NsZ2UHav8RHP9ka2QNP/ZTok8h/sjkbxnWKYcBwh/45qXP8xxPpX+yDzA7OwLlCDpqnTDPufVihCr5KowPvUahJdwbD+ozCxcNpltMe4HH5p+Im9J9KBqt5Sg42eq42MWIOnlCPczyRQjYuogcvWS6d3OVTEYWDHqBvsHKtZeWFlkPYIb+1GpnCYSw9n8Qi8pO8ZKGJ4p56VGJiY4nlgc5vfKoOCohU+oRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7beMVsgB2ajJ5SWGFyuQz7/+JWp2sCwAhOE+x4VVrcQ=;
 b=yu3GFOJI48A+jOrTZ1e6uaafMmyqpsHbjte7QVBPtaMMdL/8SBEqy42Q1fK1g+4lG6HJQ7INJhGBl5oSBdCgr3Kz+ESWSDS4NTgp/EbLE6QVvoOw7xLgfA1bddQRyizmqvl4H3EibYSs7IaObXDmdcjdxyoxdFsQc8icgZEDXUfT2LOMes2honGNfH90s2t1KquYLVv3o27B/5pF1TPs4CW4F+o+mJhaCIPB8hPfpvEsG4jgikUG2vessQjJMXaG+KD9qCe4uPQJtuVrLtg+/qo5/cgPvMpoD3m2CvZuH8c7ZGoHqGSiZTqJrlH1B9k1rzbXr6mTcXxrMDEeEidODA==
Received: from BY5PR11MB3990.namprd11.prod.outlook.com (2603:10b6:a03:18d::31)
 by LVTPR11MB9912.namprd11.prod.outlook.com (2603:10b6:408:3c6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 12:55:16 +0000
Received: from BY5PR11MB3990.namprd11.prod.outlook.com
 ([fe80::2349:6631:bb47:77d3]) by BY5PR11MB3990.namprd11.prod.outlook.com
 ([fe80::2349:6631:bb47:77d3%4]) with mapi id 15.21.0270.017; Mon, 3 Aug 2026
 12:55:16 +0000
From: <JensEmil.SchulzOstergaard@microchip.com>
To: <sashiko-reviews@lists.linux.dev>
CC: <robh@kernel.org>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH net-next v10 9/9] net: dsa: lan9645x: add port statistics
Thread-Topic: [PATCH net-next v10 9/9] net: dsa: lan9645x: add port statistics
Thread-Index: AQHdEtVJGvAbPRTysUuN0K/o0Q0U8rZtGK4AgB9QTgA=
Date: Mon, 3 Aug 2026 12:55:15 +0000
Message-ID: <99cc6ec854d1ffb77472ffec42d54080870cbe29.camel@microchip.com>
References:
 <20260713-dsa_lan9645x_switch_driver_base-v10-0-a4886a08fb15@microchip.com>
	 <20260713-dsa_lan9645x_switch_driver_base-v10-9-a4886a08fb15@microchip.com>
	 <20260714144346.E55C71F00A3E@smtp.kernel.org>
In-Reply-To: <20260714144346.E55C71F00A3E@smtp.kernel.org>
Accept-Language: en-DK, da-DK, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB3990:EE_|LVTPR11MB9912:EE_
x-ms-office365-filtering-correlation-id: 81249d98-3599-4df0-1dbd-08def15e76fc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|38070700021|6133799003|4143699003|56012099006|11063799006|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 q/uFSYevTseZ98oV1Zpv/agY0W5P297yrsyZ1AEAn8JEyUeI1t1RVEHEv9VqknBA/lHweNZvaF5fzKRv551U4pB2EuIfG4zdKFWz5TzGUvbrCcyKIYoEvwy/XT63one2QD2vNJL/SAzxN5OT7BaACOO1Kkf6r61f7W7tCHHihX9Ecge81Bucewiquy48ccbZ1kn8Q7HmYG8R0pA8UvD+aBt7g8oi6nbDizDUnCAkW30js/1xdoUDt0Vv+Zapq/0jVePBhsPVipJPB+UR7ebHWBTEpyCp77sQcOv8Ef7cIlpEZL3B7fK/NywnS2Vl7mEb2entOJgCn/KZs0e6e6Nr+EFgzs95XtMaTMTgyh2mNzahTBHkmPM8ItOcyyUgj8kvgWyXqnxbAuuaS0rV4UlT3vSJzbD89CKKT2wrE3UaDfaFRuymexfrmb2ZuM4AgjkAh3roW4eyfTAzF2jXjWFzMAmwPAtuwoyPsZDp/k4jAF3gWN7VVEatXgWgGhv+IHJ9bcaBlzJ1RhjQ6CgQgCbw6wLAL35SbK4O1ZrlAzPZJDXqCAGpdi1+K034DjTlb0nh+RCUb4qurfZb1U8qdNUQ2uslpRTBL224bb7nUYh+Z1itIyLmG1zHAKBeLohl/eHNYPXBM4GgmjoKB4sSIx9wQrWYwrWZXoCObX1XxjZwykA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3990.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(38070700021)(6133799003)(4143699003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cDZEZzBZT09ObnYycWgreGljdzBQdVFzNkpRS3VEZVVZWjRORlhyWDVRa3Vp?=
 =?utf-8?B?TE1wNFNYS0NwK0lneFhpL0lEL1NqTDdlTjNMcUF4VU5ETGp4UDM0ZE5YeSs4?=
 =?utf-8?B?azF0QWluUW5YMmc4bzhFZk1mYnFNMTlvRDJZaUJ6K1VkaUcxNlNxZ3MwWnJ5?=
 =?utf-8?B?N3dEcnNpUGhEb1ZwYXpZRjB0YU9NS3NXZXVDZGNnOXluUGd1Mkg3akZNTThW?=
 =?utf-8?B?RTBmUGlFU2VzTEMvQmVxYzlmRWMwQmpqZnJMZlQwUUk2THVmYThtMnUxeith?=
 =?utf-8?B?cHRnWHM2Q01ISmNnZzRXcmdsTDlpdExSRllyQ0tzc0J3WCthdGJXWU1UU2o5?=
 =?utf-8?B?NVNBOHdhQStrdGdaR2xTZTl6aVNXVi92ZGNzWmpzRVFhay95RVZJRXlxbFQ3?=
 =?utf-8?B?QU9TSmFMQVRsQ1F2cGZrTmh3bDN0M2dkdXNNNjU3d1VDYWUzQ1NtanVIV2p5?=
 =?utf-8?B?QTNqbmw0cXRramxVOEZYbDE5bHRFYi9CWkMrTzU2ekhnRStxNFp1anNId1RK?=
 =?utf-8?B?Z1o4RE1GR1NvbzJDSDgyYUtKN0pCU3pIOXQrTERTYXlXdUlQcDkybjZaM0xP?=
 =?utf-8?B?V0xZckRVTFRVSWQxZGJCRitQZDEzTmo3ZkpFSUEzcFg0VGJiNjFZK0hQOW9I?=
 =?utf-8?B?V3lwMHFmOWdYZmZpWTI5MlA3ZkhOaW1NUE9LYmYxYzdtVHBERlZlWGZZK0ty?=
 =?utf-8?B?Q3NNbERkbE1KT0c5L2haWjhabm5sd2wxNnhIaDZQRk9XZFR1eWovQW1WZDg3?=
 =?utf-8?B?R2swWmVWZ2QxUzhwNEZkZFBzVXdOM3ZpR0x3L0lJbjZGODBlbytMR2pkNDRk?=
 =?utf-8?B?RldxcXFOajhWMlVUdFdZeExFUWZiM1RFWElVaFBJTWVGaVMxSDQ5U2lTSHpI?=
 =?utf-8?B?dWo1bUlrUEVyaThuMm82MkRKS0NWOFZRYVpBYXAwZGZnUzJENldqS0VTTERr?=
 =?utf-8?B?b0J4ZjB5Q09MOU52czE4NFlJUUZyNmk5d1BzQXpIMDl0YVhtQ1NnOGU0dEc0?=
 =?utf-8?B?S242L0I4SUVacjBWbitsWTRmRGliUVQrbkpnVmJzRGxNaEpHNExvcjYwcENq?=
 =?utf-8?B?RU9BdUhTRTRtUFhVVXNTR1YzcC9Udjd1RUwwSnBRMEdVNW5OcmVjREFuNUlZ?=
 =?utf-8?B?d0pWanBqS3FqNm9yeUErSnFLT09lT2ZmM3N5RTFyLzB3azVHTThtNXBFWkxN?=
 =?utf-8?B?cTAvbE1MV0ZTUzFmNVhrYkdBb1kvdzA5Y3NQSVhKR2tzSmNIQS83U2MzRWRk?=
 =?utf-8?B?UnJKZHloQjUxcktNWG5oanU1Q2M4VjFla2o2bkZNM2ErODRiZG5TVU12dXZn?=
 =?utf-8?B?Zjh6dVY5RzlWM2U5U2txODdGMVovcEtMbm4yV3UvVzhVbkk0MU9odlRuNFBM?=
 =?utf-8?B?RzJuRC9hTTdvSGVQbGZiQkNyWk9rSVFoTGp6aWw5aTdFWnk1c1JYNDE5dWVJ?=
 =?utf-8?B?YnFvVFlJMlVCdGM3dGJuT09laVFvN1JiUC80YnVlbzZWd0xDMkJGTVpuRUFH?=
 =?utf-8?B?NnFHeHAwRnQ5aDEvdmY4a1EwQVpEY0Z4WkZuR09mWEdjZmV2V3A4M0E3M2RV?=
 =?utf-8?B?bjNQSklVbC9lUkxDV05oVE9tNEppUUkxMVBBNkVmZDh1ZWU0Qm1HNmdxOURj?=
 =?utf-8?B?bDd5aDgwNEtqNUdPZ2pzNGFmTVgvZmxnU0dpQ04wV0tIM29sK0t0NGRBZGNW?=
 =?utf-8?B?eDk4RmRMMUYyekhvYnhGUkdQbXZPckRuV1hRMFFwQzRvQ3BTRlB1RUFhSnRm?=
 =?utf-8?B?SXE2Z21rL3Vxem1FRGw3Qytka2J4ZU5xMmw2YytMVmhWNHNzV3d1alBqK1N6?=
 =?utf-8?B?eFpJUkpWRDlrK3VLQnB2dUZZZ1VtYmdYaGl6VTB2RUYydzJoRVR1ZFNvelVm?=
 =?utf-8?B?eldzSktjSzI4ZVlWdzJaVmlWQmV4WEdpYXlENHpONFNlaktWVWpnb05TL3ND?=
 =?utf-8?B?TnJyLys2dUE2c1ZBNUs5d1U1TFFCanY1ck9ldTdJK1I1RzExeFNWaFlBZURi?=
 =?utf-8?B?UDJPbEcxdE9EbnBvWmowVmdsd3p4WjZ2MzhBZDJCTTUvOGJIb1ZPQW5iOEwy?=
 =?utf-8?B?dEhnbGpUa25UaXk5MkNrcW5KbjhGdHdRNHMycUFhOVFaK3hXODkwK2gxQWtn?=
 =?utf-8?B?bmdzaGE1TnVEUzZSM01ubkN5S2toL2pFREZSdWIzSnlvT2pVc1dDdW9Hc1hi?=
 =?utf-8?B?UGdZc0ZjcVI4a0JuL1lvWXg1cTBWVENGVk1wRnJmbUN6YmZnYmxMbkZQUUI4?=
 =?utf-8?B?bVRXcEhOVTkvZGFXMTBJUUttanU4U3RpMkpRcysvN1dVN0NWc3FWcDJFSURV?=
 =?utf-8?B?UlNtSFZ2bE1YOEZCYXJJaDVqS28vSE8ya3JmelFlTm9pdW5JdVUweUp1YkQw?=
 =?utf-8?Q?rCXZrx8DdhVkotPxwu7urXW7akLBOHtXJcQyHxIjzzFO0?=
x-ms-exchange-antispam-messagedata-1: DjkMOoTSxrBldw==
Content-Type: text/plain; charset="utf-8"
Content-ID: <9F88E73956BA9F40BA6B4CDAD95C6B80@namprd11.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 81249d98-3599-4df0-1dbd-08def15e76fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2026 12:55:15.8370
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wBNrcVKiQ0YO/nyEOTdKqlvnWpV1vVvGAlp53MKzvvaZoxm1MFjngib66hKcJt/WN4NCpoKcp0rRIqIsAq8xcUMTxmRYAOW4DdeXWR5Ia5rTPOKYR5JfB1zhEwCOSqTk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVTPR11MB9912

T24gVHVlLCAyMDI2LTA3LTE0IGF0IDE0OjQzICswMDAwLCBzYXNoaWtvLWJvdEBrZXJuZWwub3Jn
IHdyb3RlOg0KPiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0
YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IFRoYW5r
IHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkgcmV2aWV3IGZvdW5kIDEgcG90
ZW50aWFsIGlzc3VlKHMpIHRvIGNvbnNpZGVyOg0KPiAtIFtIaWdoXSBQcm9jZXNzLWNvbnRleHQg
ZnVuY3Rpb25zIGFjcXVpcmUgYHN3X2xvY2tgIHVzaW5nIGBzcGluX2xvY2soKWAgaW5zdGVhZCBv
ZiBgc3Bpbl9sb2NrX2JoKClgLCByaXNraW5nIGEgZGVhZGxvY2sgd2l0aCBzb2Z0aXJxIGNvbnRl
eHRzLg0KPiAtLQ0KPiANCj4gLS0tIFBhdGNoIFs5XTogW1BBVENIIG5ldC1uZXh0IHYxMCA5Lzld
IG5ldDogZHNhOiBsYW45NjQ1eDogYWRkIHBvcnQgc3RhdGlzdGljcyAtLS0NCj4gY29tbWl0IGU5
MjIzZjNlNjZkNmUxYTQ5Yzc2MmMxODFiNzg3ZTlkMWQ1YjExZmENCj4gQXV0aG9yOiBKZW5zIEVt
aWwgU2NodWx6IMOYc3RlcmdhYXJkIDxqZW5zZW1pbC5zY2h1bHpvc3RlcmdhYXJkQG1pY3JvY2hp
cC5jb20+DQo+IA0KPiBuZXQ6IGRzYTogbGFuOTY0NXg6IGFkZCBwb3J0IHN0YXRpc3RpY3MNCj4g
DQo+IFRoaXMgY29tbWl0IGFkZHMgc3VwcG9ydCBmb3IgcG9ydCBzdGF0aXN0aWNzIGNvdW50ZXJz
LiBJdCBpbnRyb2R1Y2VzIGEgNjQtYml0DQo+IHNvZnR3YXJlIGNhY2hlIHRvIGhhbmRsZSAzMi1i
aXQgaGFyZHdhcmUgcmVnaXN0ZXIgb3ZlcmZsb3dzIGFuZCBleHBvc2VzIHN0YW5kYXJkDQo+IGFz
IHdlbGwgYXMgcHJpdmF0ZSBldGh0b29sIHN0YXRpc3RpY3MuDQo+IA0KPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL25ldC9kc2EvbWljcm9jaGlwL2xhbjk2NDV4L2xhbjk2NDV4X3N0YXRzLmMgYi9k
cml2ZXJzL25ldC9kc2EvbWljcm9jaGlwL2xhbjk2NDV4L2xhbjk2NDV4X3N0YXRzLmMNCj4gPiBu
ZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAwMDAuLmUzOGY1MTBlYjhm
NjYNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvZHJpdmVycy9uZXQvZHNhL21pY3JvY2hp
cC9sYW45NjQ1eC9sYW45NjQ1eF9zdGF0cy5jDQo+IA0KPiBbIC4uLiBdDQo+IA0KPiA+ICtzdGF0
aWMgdm9pZCBfX2xhbjk2NDV4X3N0YXRzX3ZpZXdfaWR4X3VwZGF0ZShzdHJ1Y3QgbGFuOTY0NXgg
Kmxhbjk2NDV4LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBlbnVtIGxhbjk2NDV4X3ZpZXdfc3RhdF90eXBlIHZ0eXBlLA0KPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgaWR4KQ0KPiA+ICt7DQo+ID4gKyAgICAg
c3RydWN0IGxhbjk2NDV4X3N0YXRzICpzID0gbGFuOTY0NXgtPnN0YXRzOw0KPiA+ICsNCj4gPiAr
ICAgICBsb2NrZGVwX2Fzc2VydF9oZWxkKCZzLT5od19sb2NrKTsNCj4gPiArDQo+ID4gKyAgICAg
aWYgKCFfX2xhbjk2NDV4X3N0YXRzX3ZpZXdfaWR4X2h3X3JlYWQobGFuOTY0NXgsIHZ0eXBlLCBp
ZHgpKSB7DQo+ID4gKyAgICAgICAgICAgICBzcGluX2xvY2soJnMtPnN3X2xvY2spOw0KPiANCj4g
W1NldmVyaXR5OiBIaWdoXQ0KPiBDYW4gYSBzb2Z0aXJxIHByZWVtcHQgdGhpcyBwcm9jZXNzIGNv
bnRleHQgYW5kIGNhdXNlIGEgZGVhZGxvY2s/DQo+IA0KPiBTaW5jZSB0aGlzIGlzIGNhbGxlZCBm
cm9tIGEgZGVsYXllZCB3b3JrcXVldWUgY29udGV4dCwgaXQgcnVucyB3aXRoIHNvZnRpcnFzDQo+
IGVuYWJsZWQuIElmIGEgbmV0d29yayByZWNlaXZlIHNvZnRpcnEgZmlyZXMgb24gdGhlIHNhbWUg
Q1BVIHdoaWxlIHRoaXMgbG9jaw0KPiBpcyBoZWxkLCBpdCB3aWxsIGNhbGwgbGFuOTY0NXhfc3Rh
dHNfZ2V0X3N0YXRzNjQoKSwgd2hpY2ggYXR0ZW1wdHMgdG8NCj4gYWNxdWlyZSB0aGlzIHNhbWUg
c3Bpbl9sb2NrLCBsZWFkaW5nIHRvIGEgcGVybWFuZW50IGhhbmcuDQo+IA0KPiBTaG91bGQgdGhp
cyBhbmQgb3RoZXIgcHJvY2Vzcy1jb250ZXh0IGxvY2sgYWNxdWlzaXRpb25zIHVzZSBzcGluX2xv
Y2tfYmgoKQ0KPiB0byBwcmV2ZW50IHNvZnRpcnEgcHJlZW1wdGlvbj8NCj4gDQo+IFsgLi4uIF0N
Cj4gDQo+ID4gK3ZvaWQgbGFuOTY0NXhfc3RhdHNfZ2V0X2V0aHRvb2xfc3RhdHMoc3RydWN0IGxh
bjk2NDV4ICpsYW45NjQ1eCwgaW50IHBvcnQsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdTY0ICpkYXRhKQ0KPiA+ICt7DQo+ID4gKyAgICAgc3RydWN0IGxhbjk2NDV4
X3N0YXRzICpzdGF0cyA9IGxhbjk2NDV4LT5zdGF0czsNCj4gPiArICAgICB1NjQgKmM7DQo+ID4g
KyAgICAgaW50IGk7DQo+ID4gKw0KPiA+ICsgICAgIGMgPSBsYW45NjQ1eF9zdGF0c192aWV3X2lk
eF91cGRhdGUobGFuOTY0NXgsIExBTjk2NDVYX1NUQVRfUE9SVFMsIHBvcnQpOw0KPiA+ICsNCj4g
PiArICAgICBzcGluX2xvY2soJnN0YXRzLT5zd19sb2NrKTsNCj4gDQo+IFtTZXZlcml0eTogSGln
aF0NCj4gSXMgdGhpcyBhbm90aGVyIGxvY2F0aW9uIHdoZXJlIHRoZSBsb2NrIHNob3VsZCBiZSB0
YWtlbiB3aXRoIHNwaW5fbG9ja19iaCgpPw0KPiANCj4gRXRodG9vbCBjYWxsYmFja3MgcnVuIGlu
IHByb2Nlc3MgY29udGV4dCBhbmQgYXJlIGFsc28gdnVsbmVyYWJsZSB0byB0aGUgc2FtZQ0KPiBz
b2Z0aXJxIHByZWVtcHRpb24gcmFjZSBhcyB0aGUgd29ya3F1ZXVlLg0KPiANCj4gWyAuLi4gXQ0K
PiANCj4gPiArLyogQ2FsbGVkIGluIGF0b21pYyBjb250ZXh0ICovDQo+ID4gK3ZvaWQgbGFuOTY0
NXhfc3RhdHNfZ2V0X3N0YXRzNjQoc3RydWN0IGxhbjk2NDV4ICpsYW45NjQ1eCwgaW50IHBvcnQs
DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHJ0bmxfbGlua19zdGF0
czY0ICpzdGF0cykNCj4gPiArew0KPiA+ICsgICAgIHN0cnVjdCBsYW45NjQ1eF9zdGF0cyAqcyA9
IGxhbjk2NDV4LT5zdGF0czsNCj4gPiArICAgICB1NjQgKmM7DQo+ID4gKw0KPiA+ICsgICAgIGMg
PSBTVEFUX0NPVU5URVJTKGxhbjk2NDV4LCBMQU45NjQ1WF9TVEFUX1BPUlRTLCBwb3J0KTsNCj4g
PiArDQo+ID4gKyAgICAgc3Bpbl9sb2NrKCZzLT5zd19sb2NrKTsNCj4gPiArDQo+ID4gKyAgICAg
c3RhdHMtPnJ4X2J5dGVzID0gY1tTQ05UX1JYX09DVF0gKyBjW1NDTlRfUlhfUE1BQ19PQ1RdOw0K
PiANCj4gW1NldmVyaXR5OiBIaWdoXQ0KPiBUaGlzIGlzIHRoZSBzb2Z0aXJxLWNhbGxhYmxlIHBh
dGggbWVudGlvbmVkIGFib3ZlIHRoYXQgY29tcGxldGVzIHRoZSBkZWFkbG9jaw0KPiBzY2VuYXJp
byBpZiBpdCBwcmVlbXB0cyB0aGUgd29ya3F1ZXVlIG9yIGV0aHRvb2wgb3BlcmF0aW9ucyBob2xk
aW5nIHN3X2xvY2suDQo+IA0KDQpJIHRoaW5rIHRoaXMgaXMgYSBmYWxzZSBwb3NpdGl2ZSwgc2lu
Y2UgLm5kb19nZXRfc3RhdHM2NCBpcyBub3QgY2FsbGVkIGZyb20gc29mdGlycQ0KY29udGV4dCwg
c28gdGhlIGRlYWRsb2NrIGNhbiBub3Qgb2NjdXIuIE9jZWxvdCBhbmQga3N6IGFsc28gdXNlIGEg
c3RyYWlnaHQgc3Bpbl9sb2NrDQpmb3IgdGhlIHNhbWUgcHVycG9zZSBoZXJlLg0KDQo+IC0tDQo+
IFNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2
MDcxMy1kc2FfbGFuOTY0NXhfc3dpdGNoX2RyaXZlcl9iYXNlLXYxMC0wLWE0ODg2YTA4ZmIxNUBt
aWNyb2NoaXAuY29tP3BhcnQ9OQ0KDQo=
