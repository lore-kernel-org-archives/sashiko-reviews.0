Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012048.outbound.protection.outlook.com [52.101.66.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C0A27466A;
	Thu,  8 Oct 2026 03:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791430034; cv=fail; b=kf1MeNsEa+lNqYqsNuBue+ON4/fQIZkTnCPuyvVbArKzykeiyhRdQSGK8p6YLWp+D647K4HjQkrsEaldYkLYMjGp8yyUD+s8Clh7We3x4tNk+dIoQmw+AoFFFAhjR6RPSygqTMY0rX2LpFrwQC5B2DF1MJVGwxDxHHpwtXui3MQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791430034; c=relaxed/simple;
	bh=9DPDkq0k8BKpPun+nLeS0H3JM3AVYc6N8Ea6o9XM0ug=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Q88k1eWX9IgDbDOffkciQmbUmbGCGuC39Qer+/5p1VZl9WQpiJSVIqHy7hK31HlYNqOY0/b+6vczX2VFc/eDxmJGddGE3c9RWwnUSAGhQiyMwfwKapPFaGsGx9iBHDLqHzxi4fn3hwqMDVHadeGhiRQxVoarUxw1UWFh2K7aTfc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YchOURAW; arc=fail smtp.client-ip=52.101.66.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YchOURAW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U0HnAiicEOkPoTZ0rovo4S4lbYJvLlYiwzV8wDw/FRSnfSQ+1RH9dYeJJQ+uJImCcbUueHDWkJd33e4Ob+78xuOKNzyzPYGc93IAkQzBnJUfAhTdKH0JFrzqfVGuXfObSNRPnVRPIUVzRdjrc5KTvlgb/GAPWJRoZlbOO3lRf0Y+93ws+9UQlTjs+VAa1nm1bElDSX6h5Bt7yg1hMfRdOJHZfcWpjgUfA5ugj0pxjlQKbajqY70mJPa9rwQDb1Ihq3yQ+xZMlYKOXnW2fvaETmP++/152TYSWhC7SLaWqg/SObQ/d1ZgT26Es937D3cOw+dK7ldGHLHph2/ykctmtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9DPDkq0k8BKpPun+nLeS0H3JM3AVYc6N8Ea6o9XM0ug=;
 b=FVnoZjptQi+TK5v4AI2ZR9donCM3ZcuOoymmfYEaAxksFqwEydQy/hQlw/+wUofeInEKEHVyysGoH5Bj4bSCByfhtdoBsr+SoMPkAIivhWCTBmHjHsaXX+g1lqrHXCB29LqDrnxrVzNOKVUGYqCsTwVtFxbuDSkGwiamb703YxsdGF6l9W1F2nbbS/54VMh5+jMgJCHaJmDdnjtDpit3WJMPEBt3G1DWIXAg8OYkUjvol7zLwVL/GjP6Tp38nZwutmKIIpeiPZ5qwbabjc+lGsb8uu8dbqcO3vqFu8VoR/KWexjJkQVejFzjeOfTtYPQ84fZOaALd3loSs+Zw+C17g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9DPDkq0k8BKpPun+nLeS0H3JM3AVYc6N8Ea6o9XM0ug=;
 b=YchOURAWOoXR1bUDZJBjYoF986/9oi18lAsavpOPhQxguAXB7h7hlSTBwoFkSiBs5fUaJSn7sr5B68yyc6U4TTss9S7I09Dz4pu+Yhz7vxsZ5lvIVEAEdjI9f0cDTJx1oBTnkAhecGIXMAMIz+zkltfmd79Ho3GzlY70XjTNuniIcYpE1oKjAZsEeowHm4z1oZQZPq93x17cxbWmDvwWaqZHnxf7+r4KlO893W8e1q+DuE4Cb3r2MyI4RQb10xmiqN0xg/20A8CmHXmf2K3IC8Uf2ypb7dLN/h6vB96jGaZZxiSYjJfeVrg/hO/RUVjZXFRUEGl6cLjhplqocsEDyA==
Received: from AS4PR04MB9338.eurprd04.prod.outlook.com (2603:10a6:20b:4e6::17)
 by AM9PR04MB7570.eurprd04.prod.outlook.com (2603:10a6:20b:281::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 03:27:10 +0000
Received: from AS4PR04MB9338.eurprd04.prod.outlook.com
 ([fe80::7c4c:9c56:8552:f680]) by AS4PR04MB9338.eurprd04.prod.outlook.com
 ([fe80::7c4c:9c56:8552:f680%6]) with mapi id 15.21.0496.010; Thu, 8 Oct 2026
 03:27:10 +0000
From: Wei Fang <wei.fang@nxp.com>
To: Marek Vasut <marex@nabladev.com>, "sashiko-reviews@lists.linux.dev"
	<sashiko-reviews@lists.linux.dev>
CC: "Frank.Li@kernel.org" <Frank.Li@kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>
Subject: RE: [net-next,PATCH] enetc: Set eMDIO MDC rate to 2.5 MHz only on
 i.MX95
Thread-Topic: [net-next,PATCH] enetc: Set eMDIO MDC rate to 2.5 MHz only on
 i.MX95
Thread-Index: AQHdUfXK300phESj5kSdvLl0aM8yprbrCqGAgAAoJICAB9KzMA==
Date: Thu, 8 Oct 2026 03:27:10 +0000
Message-ID:
 <AS4PR04MB93380800DF5CFFEE1F5D8ECF88932@AS4PR04MB9338.eurprd04.prod.outlook.com>
References: <20261001223947.60189-1-marex@nabladev.com>
 <20261003013406.536AF1F00898@smtp.kernel.org>
 <20232ace-d9a8-4082-b553-8e029ab63963@nabladev.com>
In-Reply-To: <20232ace-d9a8-4082-b553-8e029ab63963@nabladev.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR04MB9338:EE_|AM9PR04MB7570:EE_
x-ms-office365-filtering-correlation-id: f7be8d8b-065d-4d4a-b231-08df24ec099a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|1800799024|366016|376014|23010399003|18002099003|22082099003|10067099003|4143699003|11063799006|38070700021|56012099006;
x-microsoft-antispam-message-info:
 vu1Nk5HzyF2qs8lkhc4ks+JyuBrt6WH9+oct+xh+NmlOVnKJ5UYPq3b9W9Wo29YmyFwehxkVuiBO1yYjFRGd2+lONna8XwFYkXvPwGN91daeSpvGkNV2uA1gejb7Mh0iKnMwAwxDPAfmQUmhslUVeu88w4kwtGqTVLOggpJP8MEziwRNP1vt3Rbx7L3M6VSSj2qO+vbyDhMyAxnGmzrzNiWG4BcenrcnWRNjAZaN1Bbij24MwNEc2sVvVAxTHZm5V7J8O5gZoGhAWnwrbEPLkav9M14tI1Du2jDZDPzQz8y2wDu/gYsc/9HubBtoCmLWbOLt7eBA+tny0gFVh2PMC4z4y2UG0NHZTYonXB5xavIZbLjY+Asan+v5UCoLn7SR64yqGw/KqP3OC5ibv//JcKrk1yN+AuWBSp9Jd4IRqI3Pa4Jf6huv9ZuxWY3BXl7qpSTqDayJ5SUUNbf6wWCix3EJr8lBZECEzclLohTKLNbKmRc0kiHJaqMkjY3vHBo0RWqrA2J4qTV4UkG4JSl4Qe52q22enWTs5iC5pRw/cZ3yjEQxHnWHt8nBZ2tjbkW9m0VqCaDmMyo4Fr+5sj0PovOTFmG6ZqFJ3fj0vH1tWnwOYIVGRoC1O9Az7Ew755LnE190mOehvqUUK0Ivj6RS8vemgnwEt+F4jNoXAYxntlafZJaN1dOxve6eEe4bUKDMoGxCGFVFPxLiRXNwCLfev9WClMBisLaCKKliF8jE+6g=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9338.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(10067099003)(4143699003)(11063799006)(38070700021)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bTVaZWZPV0hqQUpSOUtDdThmcVljQVJ0ekFFWnRLY3ZFSVloeGNZeGtlSHdU?=
 =?utf-8?B?cjJwN0ErNXROdFNhUEhOVDk2b1hFT0Y4THZUREV6Q0t1R0ZXc0ZSTnhFZURJ?=
 =?utf-8?B?M2tCWG1TUnM2ZFU3dTRabVRvSEZ0dGtxUURJVzBtOTYzVnl6NjlCbFBzSE9j?=
 =?utf-8?B?bmhKRGl0clhQUkN0d0l3bGp1T2c5d1l2OW5oTS9DSEtpeUd6MVJ5Y2hmS1Zv?=
 =?utf-8?B?RmlhVENwbUlZa1JnTDVMbS9yTjMrY0dHVDNrQ3BpUHlRZ1NqWXNFb2tRYnBr?=
 =?utf-8?B?dGVUQktuRmVPWGNvZCsrM1hmM3lqSElhM2w5MnFSbDRxS1BrNjYxVlFVa1pv?=
 =?utf-8?B?WUIrb0p5WmkwMTZQdTdJU3Y3QVdrTGJHTUFhYW9oZXNlK2pUSHNlWTNYMFl5?=
 =?utf-8?B?ZlNqeFJFN3BRMzNsUFM1MDcyM0xJZGJhRFN3eFRxQ3U3M3o5OGpNM2JZWlh5?=
 =?utf-8?B?Ym5Ba2t5Q1o1TWJXdzFuaTBZT3dNYXJZK0NIMEtHbXZCSjIySnhnV2ZOd1U3?=
 =?utf-8?B?aUpDZlgyODhFVFg2aVZ0ZU1qRVJ0WWpOR01oMzhDekFvSnYyQlVranVSSDgx?=
 =?utf-8?B?cmFtY3g1bk9WeXZRRE9qMXIwWWpPRjc5NTBtUDhQUDFNZG9OdVFjWDdkSHBE?=
 =?utf-8?B?Q20wU25PM2hYVzRNWitFUVpJQTJ3YnFWTmo2VmRiRUl1eHNkMkhZSUtWbTBm?=
 =?utf-8?B?YUVGVnZ2NzZZRWE5V0ZxbVcyNWdzY1M2QSt1cHNubVBpOCszYVRrZy9aYW1t?=
 =?utf-8?B?TlllcDg0SXg2SlRjelFSU3lyNmJnVk5rNWFLcXVoQWNrWks0M2kvSWxCRzFZ?=
 =?utf-8?B?WkIzeG10emJaU292eGxWMG92djBKNDlnakRBWjFHY0UvRk9nMllZZTMxVmJ0?=
 =?utf-8?B?M3QvbzNYalhkYzZGNnEybjNmKzd2b0NpbTZvbWFDQ1k0Tm1PWG84NzdiZDRy?=
 =?utf-8?B?UGErdzFnRzRueGJxc3d4QVRGbWU4Mm5kRUZyZmc4c1dlejNEM0hqU213RVJl?=
 =?utf-8?B?VmpuS1pvMHlzYkt4TGJVQ3NwNWtMUGQzbnV1c1Bkb0ZNSmx6MDVKL2pVK0J3?=
 =?utf-8?B?eDZJVGJzSTc5cWEybVZDelREK0pBL2ZFTzJIZ09sUmxSM3IrWEkyendhdnB6?=
 =?utf-8?B?MnFycHJIS3Y3eUgzTnVudTlBa3RKVXo2bjFKUmw2MjJGNjhEdHBDUVRpNXJL?=
 =?utf-8?B?UDBUVUc1NndVTUVlMDMrelVUcGxtQzk4eXJKSStQVFMyYUNMaFFIQktEbDcy?=
 =?utf-8?B?TVBqZ2R3Z1NFTmlsMGlCOXhkNmxvNzNSQ3dpU0FscEk0ZEhwNkxyZkt6NW1L?=
 =?utf-8?B?c3hOdk1ESEpmNHRqSk1iZFB4MXNqMkloZjJ1S29DeVozZk5rN1VsY1dSdHlV?=
 =?utf-8?B?L2s1YWRIZURWbTNLdWJsdjFUL1FzWFVyUnltVit4TjF4SThPT0N4Ump1WFBT?=
 =?utf-8?B?QVpLTStVVFNKVmVzdjl6N0czL1BtSHJjVWdkWVRzYk1YYXhGT2RuRERzZ1U0?=
 =?utf-8?B?TWVRb01neXNBUnM4cndpUDhHQjVkZmhJZEZ2M05iUVJGWWJNVzdpdmdnbXVT?=
 =?utf-8?B?RHNvanp1Qm1zeGlweEppRGhzQXowbk1lZ05mWEJKOG9YWEFRbFRtM28xa1la?=
 =?utf-8?B?Uytpa1JaUUg3ZUIzbE1pWVMzLzAyd1Fwa1Y0VWc4NXBNd2dFSW93VmJBQnZy?=
 =?utf-8?B?T29kS1d2amRaeit1NWQyNWdYbEVHVEZncGVhc21pQ1Y4VzBZTE5vRnlDSVZi?=
 =?utf-8?B?YTZPdnBCYU95TFZFa0w5WUhnZmRBUVRsRUoxVkNldW1pVllJbE8wNFU4QmdO?=
 =?utf-8?B?dGo4c1cvaVl5dUJJN2Zwd29JQTVXNTRxQWtXOVpuekhUK2QzOGp0V1dueVJ4?=
 =?utf-8?B?QUwxeHFYSWJlMldSYklOMmtHb2NUVW1qS1ByMTVCMHZRTHF6R1JLZWR0SEQ5?=
 =?utf-8?B?YUZ2QjZzaFFyUFEraitJcVVXYlhjV3lHc0laRFFyN1hUWCs4dVJWaHJOQklj?=
 =?utf-8?B?aTlVWldYdWpadld1T0VFWDRwdGEyekpRZ0Rnc0dmUE42MVNseSt4NWx0eHE1?=
 =?utf-8?B?bmNLYnZxeGNhUVkxS3E3QkhQVmV2bmxMSlZvUXFidEtpWW5xU1pmeXBqaC9K?=
 =?utf-8?B?SnpFZWVzQ05MU0QyV2xBck1oTzJDU3prbGpYd0pZWGhZdVI1NThacWtENmJq?=
 =?utf-8?B?UXZOVGRxZHR5Ty9CeEtCT2ZBdEYwTGFWRTFQS3FDdHVTL3BodXorVXFiL1pu?=
 =?utf-8?B?bVRiNjB6d0ZSWDNyQ2lVd1ZCeXFVMmwxUGJsdnNWUk1mWWNhK3E0RnpqMTE2?=
 =?utf-8?Q?3rEE3CTbzYgqy8ZpfS?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9338.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7be8d8b-065d-4d4a-b231-08df24ec099a
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2026 03:27:10.1364
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vtp7SzcnvTRvLKS85d3rvjIQBKj3ydt+dv0OePknTDmugbKfah0pGGk+ob5b4uZJD/aHmSR/ZtexKFSECOxt9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7570

PiBPbiAxMC8zLzI2IDM6MzQgQU0sIHNhc2hpa28tYm90QGtlcm5lbC5vcmcgd3JvdGU6DQo+ID4g
VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8NCj4gY29uc2lkZXI6DQo+ID4gLSBbSGlnaF0gbmV0OiBl
bmV0YzogdW5pbml0aWFsaXplZCBtZGNfZGl2IGJyZWFrcyBNRElPIGZvciBub24tUENJDQo+ID4g
dXNlcnMNCj4gPiAtLQ0KPiA+DQo+ID4gY29tbWl0IDMyNGVlYWNjMmVjMGNiMWZkOThlOWYzYWM5
NmYyZmU3ZjY1M2FlNzgNCj4gPiBBdXRob3I6IE1hcmVrIFZhc3V0IDxtYXJleEBuYWJsYWRldi5j
b20+DQo+ID4NCj4gPiBlbmV0YzogU2V0IGVNRElPIE1EQyByYXRlIHRvIDIuNSBNSHogb25seSBv
biBpLk1YOTUNCj4gPg0KPiA+IFRoZSBjdXJyZW50IGVNRElPIE1EQyByYXRlIGlzIDIuNSBNSHog
b24gaS5NWDk1IEIwLiBJdCB3YXMgcG9pbnRlZCBvdXQNCj4gPiBieSBOWFAsIHRoYXQgdGhlIE1E
QyByYXRlIGlzIGRpdmlkZWQgZG93biBmcm9tIGNsb2NrIG9mIGRpZmZlcmVudA0KPiA+IGZyZXF1
ZW5jeSBhbmQgdXNpbmcgZGlmZmVyZW50IGRpdmlzaW9uIHJhdGlvIG9uIGRpZmZlcmVudCBTb0Nz
Lg0KPiA+IENvbmZpZ3VyZSB0aGUgaS5NWDk1IGVNRElPIE1EQyByYXRlIHRvIDIuNSBNSHogdG8g
bWF0Y2ggdGhlIDgwMi4zDQo+ID4gc3BlY2lmaWNhdGlvbiBhbmQgcmVpbnN0YXRlIHByZXZpb3Vz
IGRpdmlkZXIgcmF0aW8gZm9yIGFsbCBvdGhlciBTb0NzLg0KPiA+DQo+ID4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL25ldC9ldGhlcm5ldC9mcmVlc2NhbGUvZW5ldGMvZW5ldGNfbWRpby5jDQo+ID4+
IGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvZnJlZXNjYWxlL2VuZXRjL2VuZXRjX21kaW8uYw0KPiA+
PiBpbmRleCBhOTBhMDRhNDdiZWZkLi43ZWQ5YjkxMjBmNDQ3IDEwMDY0NA0KPiA+PiAtLS0gYS9k
cml2ZXJzL25ldC9ldGhlcm5ldC9mcmVlc2NhbGUvZW5ldGMvZW5ldGNfbWRpby5jDQo+ID4+ICsr
KyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L2ZyZWVzY2FsZS9lbmV0Yy9lbmV0Y19tZGlvLmMNCj4g
PiBbIC4uLiBdDQo+ID4+IEBAIC02Myw3ICs2Myw3IEBAIGludCBlbmV0Y19tZGlvX3dyaXRlX2My
MihzdHJ1Y3QgbWlpX2J1cyAqYnVzLCBpbnQNCj4gcGh5X2lkLCBpbnQgcmVnbnVtLA0KPiA+PiAg
IAl1MTYgZGV2X2FkZHI7DQo+ID4+ICAgCWludCByZXQ7DQo+ID4+DQo+ID4+IC0JbWRpb19jZmcg
PSBFTkVUQ19FTURJT19DRkc7DQo+ID4+ICsJbWRpb19jZmcgPSBFTkVUQ19FTURJT19DRkcobWRp
b19wcml2LT5tZGNfZGl2KTsNCj4gPg0KPiA+IFtTZXZlcml0eTogSGlnaF0NCj4gPiBEb2VzIHRo
aXMgY29kZSBicmVhayBNRElPIGNvbW11bmljYXRpb24gZm9yIG5vbi1QQ0kgdXNlcnM/DQo+ID4N
Cj4gPiBUaGUgbWRpb19wcml2IHN0cnVjdCBpcyBhbGxvY2F0ZWQgYW5kIHplcm8taW5pdGlhbGl6
ZWQgYnkgZHJpdmVycyBzdWNoDQo+ID4gYXMgdGhlIGVuZXRjIFBGIGRyaXZlcg0KPiA+IChkcml2
ZXJzL25ldC9ldGhlcm5ldC9mcmVlc2NhbGUvZW5ldGMvZW5ldGNfcGZfY29tbW9uLmMNCj4gPiBp
biBlbmV0Y19tZGlvX3Byb2JlKCkgYW5kIGVuZXRjX2ltZGlvX2NyZWF0ZSgpKSwgdGhlIERTQSBO
RVRDIGRyaXZlcg0KPiA+IChkcml2ZXJzL25ldC9kc2EvbmV0Yy9uZXRjX21haW4uYyBpbiBuZXRj
X3BvcnRfY3JlYXRlX2VtZGlvX2J1cygpKSwNCj4gPiBhbmQgdGhlIE9jZWxvdCBkcml2ZXIgKGRy
aXZlcnMvbmV0L2RzYS9vY2Vsb3QvZmVsaXhfdnNjOTk1OS5jIGluDQo+ID4gdnNjOTk1OV9tZGlv
X2J1c19hbGxvYygpKSB2aWEgZGV2bV9tZGlvYnVzX2FsbG9jX3NpemUoKSBvcg0KPiA+IG1kaW9i
dXNfYWxsb2Nfc2l6ZSgpLg0KPiA+DQo+ID4gU2luY2UgdGhpcyBwYXRjaCBvbmx5IGluaXRpYWxp
emVzIG1kY19kaXYgaW4gZW5ldGNfcGNpX21kaW9fcHJvYmUoKSwNCj4gPiBtZGNfZGl2IHJlbWFp
bnMgMCBmb3IgdGhlc2Ugb3RoZXIgZHJpdmVycy4NCj4gPg0KPiA+IFdoZW4gZW5ldGNfbWRpb193
cml0ZV9jMjIoKSBhbmQgb3RoZXIgTURJTyBhY2Nlc3NvcnMgdXNlDQo+ID4gRU5FVENfRU1ESU9f
Q0ZHKG1kaW9fcHJpdi0+bWRjX2RpdiksIHRoZSBNREMgY2xvY2sgZGl2aXNvciB3aWxsIGJlIHNl
dA0KPiA+IHRvIDAgaW5zdGVhZCBvZiBhIHZhbGlkIHZhbHVlIChsaWtlIDY2KS4gVGhpcyByZXN1
bHRzIGluIGEgY2xvY2sgcmF0ZQ0KPiA+IHRoYXQgdmlvbGF0ZXMgdGhlIElFRUUgODAyLjMgMi41
IE1IeiBsaW1pdCwgYnJlYWtpbmcgUEhZIHByb2JpbmcgYW5kDQo+ID4gbGVhdmluZyBuZXR3b3Jr
IGludGVyZmFjZXMgdW51c2FibGUuDQo+ICtDQyBXZWkgLS0gdGhpcyBpcyBub25zZW5zZSwgcmln
aHQgPyBPY2Vsb3QgaXNuJ3QgZXZlbiBOWFAgPw0KDQpObywgT2NlbG90IHN3aXRjaCBpcyBpbnRl
Z3JhdGVkIGluIExTMTAyOEEsIGFzIGEgUENJZSBmdW5jdGlvbiBvZiBORVRDIElQLg0KDQo=
