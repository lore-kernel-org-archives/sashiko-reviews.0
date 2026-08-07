Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010014.outbound.protection.outlook.com [52.101.193.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1579547A875
	for <sashiko-reviews@lists.linux.dev>; Fri,  7 Aug 2026 13:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786110252; cv=fail; b=ScGBMXoMlZkX/h7UQRS7RBnyWJuyF2WXKCk4qpgValAG/dQpkhhkFiS1HSUD/D3iRNhMKT3mhFsjabYsaO646irjhwrNzFYCw7uX+cm8mp9hBYK9YwK0PwFclbYJ52Pe2aO0DYKzvGa1YsLqFun04bY11TcqOn4scWDCTsqQp7s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786110252; c=relaxed/simple;
	bh=I4g2WADAptHnQB2ULgrVResrcaXa+gcxMRMd5UECbaQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pb7KURasD4C0/KF7lhAM4WTHr6QTZ1Rcn9MmuBcErslYT54NZR3nk5Fwa7woFoJecsy2aiXNh8VrQxmOtWGY017nWahK99XJ5ak5FH6hKvkuTxF49gHQFgrU/GMBydL7ejPQPiJ/ld2zzrfkiTwm1aUdSUU1KJoaSbvpZ/tpz28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=wstWCYOa; arc=fail smtp.client-ip=52.101.193.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="wstWCYOa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GZXJ5BEcyC+aU6o9EOfrhkS3qFmH2Gi+xV9I4mDN6Txe0OX3Sihl6t6M1U2Kvej6nGLvPEk8MOaRMxD7Q9xGAyQRb+gDrhYe8efyVL5mK2YeGg4R6TjzV46UOVBKQRrRU+6d3Y2yr0oE/gIZpWDz/3jUMBviDDFj+OSINESEgjN2KYEOgf3SyuvewIF7ov74++XD2+Ob6FvyXLM6r3ROiWKB4lMy8uWkN/0LtauletnGXQRiR/VctFpsjAu2p4fJbRZTW+UdmO+QR5yX9cje6GHoD69aCL7WBQN1TEq4CpWKK7Arxm4gikQvZzNGluUdkUHCjUjzeqhLrVN+RL/Bsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I4g2WADAptHnQB2ULgrVResrcaXa+gcxMRMd5UECbaQ=;
 b=Usr9nACYGudk0gzDhfjUbVfmscCphpZVLoKRS7I+8VAVOelFZo9hu3SI1Ms/7tWwy4qibhDinfHF2y74F57JqYHNW1Cu0Mnmytp+KEJ1t40UNjF+oXR3MRp1mET4yFF+JIkLwbjKl37xUU4jlt5h++gVkcol1Jsb3N+jzcmn8yx+Bzsud7kfUmBREpkuorUVH2RlAOweX1z47JFlUD5aTO4j6E8UcI1wuei5RfBNADt238nUic5tzVfOTEHOXkK9gymqJsi36gbBF4DDt9YQEs1rmm34O6h2GJV5r8WNMAxN2Y2Onohd3gl7crSPHaE5OS7dUmxeZDvXN5ye9x4QJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I4g2WADAptHnQB2ULgrVResrcaXa+gcxMRMd5UECbaQ=;
 b=wstWCYOaT9dDcM9pfdqD8gmycyX6N9XV0h5hkHMC+meirvL3Hq+1GEUQFXAncMYhVGvfuOJXmw7snHx+nZswQ/mSPgWVwYgwPE7QeeudfKn+8F9pRHts3YUEJyyESbrnJLBRdF4E7BpjpsDz/d3cfoLBxbC+XNjaPG5cxZwto9z3R6A+QUHElWjZhh0U1rG4a2GdgVAANqs29pcgwKZ86PSgoQs01eYtDaVUBpYuLiZn6BWwQarvGzwuo0JzICDOAxV8rlzTIy0JnuSeXHIY5gekpwyZOqSnstteM7SOxSm9OLCAq0anSI5Xp5EqwKBNvrDjJ3sLNiUApd4YdEDxpA==
Received: from BY5PR11MB3990.namprd11.prod.outlook.com (2603:10b6:a03:18d::31)
 by DM4PR11MB8203.namprd11.prod.outlook.com (2603:10b6:8:187::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.24; Fri, 7 Aug
 2026 13:44:01 +0000
Received: from BY5PR11MB3990.namprd11.prod.outlook.com
 ([fe80::2349:6631:bb47:77d3]) by BY5PR11MB3990.namprd11.prod.outlook.com
 ([fe80::2349:6631:bb47:77d3%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 13:44:01 +0000
From: <JensEmil.SchulzOstergaard@microchip.com>
To: <sashiko-reviews@lists.linux.dev>
CC: <robh@kernel.org>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH net-next v11 5/9] net: dsa: lan9645x: add bridge support
Thread-Topic: [PATCH net-next v11 5/9] net: dsa: lan9645x: add bridge support
Thread-Index: AQHdJOgZAhqWNOEduE2GzIpZ++N6z7aRGLqAgAGDDoA=
Date: Fri, 7 Aug 2026 13:44:01 +0000
Message-ID: <55a7fa85aed544e9652fce746a6c57bd61791331.camel@microchip.com>
References:
 <20260805-dsa_lan9645x_switch_driver_base-v11-0-007ebc983a0a@microchip.com>
	 <20260805-dsa_lan9645x_switch_driver_base-v11-5-007ebc983a0a@microchip.com>
	 <20260806143840.00FCC1F00A3A@smtp.kernel.org>
In-Reply-To: <20260806143840.00FCC1F00A3A@smtp.kernel.org>
Accept-Language: en-DK, da-DK, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB3990:EE_|DM4PR11MB8203:EE_
x-ms-office365-filtering-correlation-id: f5a42646-ff65-4db4-e40a-08def489f037
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|38070700021|56012099006|11063799006|10067099003|4143699003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 7fkwQSitOAW2YuT+ErVOPUD1T8zOl6FIhD00cPWPo+lFEt8MnIU26rMopqCIj7sgU+iKiYtMzEjHIAHdujYKZ1vicSjPvEr52EVSaZMZwwn92L5FyTo/KJTurWupihYJnP7tk2bLU1a4F8rBJSZFn8DORztovDq4taycJWNhgZ6b8rqJlRlO+7j0nQ6aqhbaBcrd++uDYs3hBuYl8+BP2uakdi5EJR6a0A+xnQn+LcAMPCR3UpSFiDUJk/llxtlytfN6z7KHsthA1AR/Bo4xBqJyLYuNj19VGBPrJKdwkT9Hak0ESA1V285v50FzT3unwc5jh+9tg9g3hx2Pnc8vDvRNOTSK1srr21ikVf6Jbj24QkGkeP+HxA8kbpbLxcPvYXWayHOdCRHyK0bFdE30MmFI501vhYxA597LGv3kNabIjTrr7fAfAXsvAVBNduCkQ5K98LyyLQs/BWliFuuEI4ixtleLo+iw/20K+SK7OSZiW05UVAflk+lNlRoLzk31+Xfq74MCt+vGK0okWcR7Y5u0MwrEEdiPvRS06qyIMmvxdDJtV+nGW/pOtrhEKWvKSdt8L5uz2Rb+OQx0eaXNS8/GOhIzNoto8zWYWlSJC3UOD1sBgw9gbR5ucIrUNvUiss+cjFlIz9gWSULyfMhkauWZiiInpRq2lX02+LfruCY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3990.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(38070700021)(56012099006)(11063799006)(10067099003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QlVvNGFjMm1Vb1Nqc2dJU2NIY090eTNiUFBVSmx3KzdyRUlKekNMYnlCUEtz?=
 =?utf-8?B?VndxTFpUQjBrbGZnQ1NRMUNKa2NvNUw4Q2pOZlpoMjF0RG5ybnFxdDBPdTEw?=
 =?utf-8?B?ck13bDRGT3o3YnRLT3RDNWFKcHUzaVQ0dzRMeW9VYm4zVVoxZklHUGt4K3pY?=
 =?utf-8?B?dUtmbU5TQkJQbDI3MUdDN0VtOHAxRm44Lzl2YUt5cjFXSnc4OTBZamFJN3BE?=
 =?utf-8?B?emFFMlJ1b2xLcVZUNjM4b0hxM1FiVFFsUUNHZEg1U09zWlBUSGZCUTZHeUov?=
 =?utf-8?B?TnFqUVJ4S3daZFZxaWRHcHhKRGdqUExIajdrZi9hTTV5ckJjdzFuNlFqcG5F?=
 =?utf-8?B?dDJodFZ1dVZxYUN2YUE4UUh2ZVpHcmMyVTdTRWxTSmR6ZlFNZUZVOWxJMUhn?=
 =?utf-8?B?QmFkSXc3ekZIeTBHMCtabUkveis5RDI1TVRUZHBRb2RMblMyQWwwSXBRSnZ6?=
 =?utf-8?B?UkRUVjlKT2VRdlRBTk85Q1lZdUFTbFVaU28xRWNuM1J0bkdGTi9xM0ZWb2VU?=
 =?utf-8?B?M1N4a3ZaWUFmZEJOc05xZGRmem9FVFFuc3hKUTJXeEErQkdlaDl5Mk5HMjdx?=
 =?utf-8?B?bHJ4cGxUeTVFN3l5WXVSUEFPVHRJYWNyRllHY3BiWkl6MGdIMHJ2NEhzRWRV?=
 =?utf-8?B?RmVDZVhPYjNMaHNBZFdtUC9Zckh4WkRUY3FDK3VoN1MxR2FmWWViNmR5Ui9j?=
 =?utf-8?B?dHlsUmtGampIb3NOZnYxamhpTHdFQk9NUDBDdi9oQk5YeUxsUEtCbVZSMTdv?=
 =?utf-8?B?Q0lWTHllbUVKdXNOakZaaElJNjVtZ0Jpd1doNDVoYUE2bWVKMlFPeVdwS2dz?=
 =?utf-8?B?T3VoTEdnMTVIdGhDdHM0ZnRRTkFNN0FwRWZMaENWbEtQMmJrcEk2eWN1T2dX?=
 =?utf-8?B?WElVYjhYVm92YmFOcnUxR25FTEl6cXB5QVU5TnhkMnRIejJjOEFRNXNkUFoy?=
 =?utf-8?B?OExPUDl2bVdlSTQ5RGUzakpaUTU5eEtEcERNa2M2czR4UUtTdGZJNVNsRXhv?=
 =?utf-8?B?M05rZkhKWEdMak5rN1lsM2R3SWNXTFpIblJwUVBOM0IvcmgxVFVTbnZOcDBY?=
 =?utf-8?B?dTI3NS9vUzhxK08rd1Nuc1BHVVAwdXdEa1dtOXhDeTdDaGtqMmpna2NuY2tB?=
 =?utf-8?B?NlNBd3UvZzhNMFpGdVh1RFdCVjFjcFdhbDJ0TDBNV0RraEJGTkVHWG5YUEhN?=
 =?utf-8?B?T2k1b0RRREkrRGdQY0tuVXlKVS9xRjZJRUFIb3hIV093YXN5Uk1NSzFXcVpW?=
 =?utf-8?B?eVRGSnlLendhQ3d0UkcrcHpRT0E0SVJ0UHR6TFpMNVQxU2NKRlpZY25nR1RC?=
 =?utf-8?B?T2ZhVUtQRHppM3RQbVNrSm9mZVJ6RzV1MjJkaWRlM3lyd0hDSHFaYTJrYWJm?=
 =?utf-8?B?Z2lybFRxQWZGZ29rbWZneGhwMHV0QUZ3RGg3NnFqZjlYNlJpTlVOT1RQUjlq?=
 =?utf-8?B?dHBYMGRYejlTdnRPRUdOamdGQzRMK09iM1ZpZVRjZmw1SC9YeWVpRDJXODVs?=
 =?utf-8?B?ZmY4UU5HMzUvRUJTUk5jdDZDbS9EcEdxcW1OZFR2UUhyZTRyL3lvTUdjWGRN?=
 =?utf-8?B?QUFnaFVHQTl1S3VzVUdtcXNuRjYwZHBESTJyVTNNR3NiamM5Z1BPU0Zrcmk5?=
 =?utf-8?B?OW82d3N6UzRkZ2JSN0RQdGt4VGduZFVVdGwrUm5nYnZVU2JGeXZxUVVIYVEx?=
 =?utf-8?B?NGVocUJZTk9UaUo1S3ZnK2cyMzdVMGl2TlpyUFNhV0hXS3U3aDYzY2grTStY?=
 =?utf-8?B?VW9Qb3lZd2hubENNQS94YmtIeEZiWmYzczVUd3ViSzljUlo4V05QSndpWC9u?=
 =?utf-8?B?bDRXY0ZKS0xoNnU1NkJjSVQ0Si9CRzlGYnBaN3gxU0MwTDVNZnZlZ0tYNnJG?=
 =?utf-8?B?djNKZFV4VCtFZHFmSkxMaGQ0S2NqOEFiU2lGcFpGMVRrb3pBd2NPa1p0MUVU?=
 =?utf-8?B?MmNEUmFpMStqYXVvSzM3ZnVvVmYvcG9tVkxXUHFzQWdib3Rya3hHKzlneUV2?=
 =?utf-8?B?dmRFT3Y1R2U1b3hkclduUHl0d05zK2dkeVBZMTQ1ZFZ3U245aUtNMlNpN3Vi?=
 =?utf-8?B?VXczd3FobXJEN0VDZXFSRUNvM0N2MEs5SERKSWwwL1lKVWJ6RVJyYmhIdFV0?=
 =?utf-8?B?OWJuOGs2emJ0M0drUkF1d3JvTmtZYW9XSldPdFVYd1B2VjlINUUzMGdiWWJ2?=
 =?utf-8?B?S3VLWHNHR0RmT3VWd2puRys3REdyV2N3VmtFRzlSS2kzUHJoMzlWcHNRZUF4?=
 =?utf-8?B?TjJQYU13RHZITWdzMmdWMWhtU0J2Z1ZMT1FDV3psTHZCUjNLcTR3TmtER2Jl?=
 =?utf-8?B?cWZPNlRHTFNzVFpnbEVudFplRmlHUTI3NDZJZWs2MEhHaUZSQ1RZNWtRYU9y?=
 =?utf-8?Q?VQ4/4mcZDNwnJBPyb+cOrp3e9l8r6Rujwwlcg3A+03KxM?=
x-ms-exchange-antispam-messagedata-1: bPIkopryajoSrg==
Content-Type: text/plain; charset="utf-8"
Content-ID: <A25CE1B00163C747902A496D6410C78D@namprd11.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f5a42646-ff65-4db4-e40a-08def489f037
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2026 13:44:01.0589
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cGLSYjifIbBB8e81NR4mLpfXUE/sONYLgGTYkcL+hqit/9cwpTjMxC+vY4wMMmdKQ8XaqqCjlYsjjQzJtB0aGpILzNRwZRcGYuNVWmV1pQ7wFnI2GRTUTLA/LMzNKgVU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8203

T24gVGh1LCAyMDI2LTA4LTA2IGF0IDE0OjM4ICswMDAwLCBzYXNoaWtvLWJvdEBrZXJuZWwub3Jn
IHdyb3RlOg0KPiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0
YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IFRoYW5r
IHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkgcmV2aWV3IGZvdW5kIDEgcG90
ZW50aWFsIGlzc3VlKHMpIHRvIGNvbnNpZGVyOg0KPiAtIFtIaWdoXSBIYXJkd2FyZSBsZWFybmlu
ZyBpcyBub3QgZGlzYWJsZWQgd2hlbiBhIHBvcnQgbGVhdmVzIGEgYnJpZGdlLCBjYXVzaW5nIGNy
b3NzLXBvcnQgRkRCIHBvbGx1dGlvbiB0aGF0IGJyZWFrcyBzb2Z0d2FyZSBicmlkZ2luZy9yb3V0
aW5nIGZvciBzdGFuZGFsb25lIHBvcnRzLg0KPiAtLQ0KPiANCj4gLS0tIFBhdGNoIFs1XTogW1BB
VENIIG5ldC1uZXh0IHYxMSA1LzldIG5ldDogZHNhOiBsYW45NjQ1eDogYWRkIGJyaWRnZSBzdXBw
b3J0IC0tLQ0KPiBjb21taXQgZjk1OTAwM2YwNjc5MDA4NDMyNDc5YTE1ZmY0YjI1NzQ3ZWRlMzgy
Ng0KPiBBdXRob3I6IEplbnMgRW1pbCBTY2h1bHogw5hzdGVyZ2FhcmQgPGplbnNlbWlsLnNjaHVs
em9zdGVyZ2FhcmRAbWljcm9jaGlwLmNvbT4NCj4gDQo+ICAgICBuZXQ6IGRzYTogbGFuOTY0NXg6
IGFkZCBicmlkZ2Ugc3VwcG9ydA0KPiANCj4gQWRkIHN1cHBvcnQgZm9yIGhhcmR3YXJlIG9mZmxv
YWRpbmcgb2YgdGhlIGJyaWRnZS4gV2Ugc3VwcG9ydCBhIHNpbmdsZQ0KPiBicmlkZ2UgZGV2aWNl
Lg0KPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZHNhL21pY3JvY2hpcC9sYW45NjQ1
eC9sYW45NjQ1eF9tYWluLmMgYi9kcml2ZXJzL25ldC9kc2EvbWljcm9jaGlwL2xhbjk2NDV4L2xh
bjk2NDV4X21haW4uYw0KPiA+IGluZGV4IGIyNTM4MTM1MThjMjAuLmMxNDVkMjhmZmJiOTkgMTAw
NjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9uZXQvZHNhL21pY3JvY2hpcC9sYW45NjQ1eC9sYW45NjQ1
eF9tYWluLmMNCj4gPiArKysgYi9kcml2ZXJzL25ldC9kc2EvbWljcm9jaGlwL2xhbjk2NDV4L2xh
bjk2NDV4X21haW4uYw0KPiBbIC4uLiBdDQo+ID4gQEAgLTI4Miw2ICszMDUsMjgyIEBAIHN0YXRp
YyB2b2lkIGxhbjk2NDV4X3BvcnRfcGh5bGlua19nZXRfY2FwcyhzdHJ1Y3QgZHNhX3N3aXRjaCAq
ZHMsIGludCBwb3J0LA0KPiBbIC4uLiBdDQo+ID4gK3N0YXRpYyB2b2lkIGxhbjk2NDV4X3BvcnRf
YnJpZGdlX2xlYXZlKHN0cnVjdCBkc2Ffc3dpdGNoICpkcywgaW50IHBvcnQsDQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBkc2FfYnJpZGdlIGJyaWRnZSkN
Cj4gPiArew0KPiA+ICsgICAgIHN0cnVjdCBsYW45NjQ1eCAqbGFuOTY0NXggPSBkcy0+cHJpdjsN
Cj4gPiArICAgICBzdHJ1Y3QgbGFuOTY0NXhfcG9ydCAqcDsNCj4gPiArDQo+ID4gKyAgICAgcCA9
IGxhbjk2NDV4X3RvX3BvcnQobGFuOTY0NXgsIHBvcnQpOw0KPiA+ICsNCj4gPiArICAgICBtdXRl
eF9sb2NrKCZsYW45NjQ1eC0+ZndkX2RvbWFpbl9sb2NrKTsNCj4gPiArDQo+ID4gKyAgICAgbGFu
OTY0NXgtPmJyaWRnZV9tYXNrICY9IH5CSVQocC0+Y2hpcF9wb3J0KTsNCj4gPiArDQo+ID4gKyAg
ICAgLyogTGFzdCBwb3J0IGxlYXZpbmcgY2xlYXJzIGJyaWRnZSBkZXYgKi8NCj4gPiArICAgICBp
ZiAoIWxhbjk2NDV4LT5icmlkZ2VfbWFzaykNCj4gPiArICAgICAgICAgICAgIGxhbjk2NDV4LT5i
cmlkZ2UgPSBOVUxMOw0KPiA+ICsNCj4gPiArICAgICBfX2xhbjk2NDV4X3BvcnRfc2V0X2hvc3Rf
Zmxvb2QobGFuOTY0NXgpOw0KPiA+ICsgICAgIGxhbjk2NDV4X3VwZGF0ZV9md2RfbWFzayhsYW45
NjQ1eCk7DQo+ID4gKw0KPiA+ICsgICAgIG11dGV4X3VubG9jaygmbGFuOTY0NXgtPmZ3ZF9kb21h
aW5fbG9jayk7DQo+ID4gK30NCj4gDQo+IFtTZXZlcml0eTogSGlnaF0NCj4gRG9lcyB0aGlzIGNv
ZGUgbmVlZCB0byBjbGVhciBwLT5sZWFybl9lbmEgd2hlbiBhIHBvcnQgbGVhdmVzIHRoZSBicmlk
Z2U/DQo+IA0KPiBXaGVuIGEgcG9ydCBpcyByZW1vdmVkIGZyb20gdGhlIGhhcmR3YXJlIGJyaWRn
ZSwgaXRzIGxlYXJuaW5nIHN0YXRlIGluY29ycmVjdGx5DQo+IHJlbWFpbnMgZW5hYmxlZC4NCj4g
DQoNCkl0IGRvZXMgbm90IHJlbWFpbiBlbmFibGVkLiBUaGUgRFNBIGNvcmUgcmVzZXRzIHRoZSBi
cmlkZ2UgcG9ydCBmbGFncyBvbg0KYnJpZGdlIGxlYXZlLCBsZWFybmluZyBpbmNsdWRlZCwgYW5k
IGl0IGRvZXMgc28gYmVmb3JlIGl0IHB1dHMgdGhlIHBvcnQNCmJhY2sgaW50byBCUl9TVEFURV9G
T1JXQVJESU5HLg0KDQpkc2FfcG9ydF9icmlkZ2VfbGVhdmUoKSBlbmRzIGluIGRzYV9wb3J0X3N3
aXRjaGRldl91bnN5bmNfYXR0cnMoKSwgd2hpY2gNCmNhbGxzIGRzYV9wb3J0X2NsZWFyX2JycG9y
dF9mbGFncygpIGZpcnN0IGFuZCBkc2FfcG9ydF9zZXRfc3RhdGVfbm93KGRwLA0KQlJfU1RBVEVf
Rk9SV0FSRElORywgdHJ1ZSkgc2Vjb25kLiBCUl9MRUFSTklORyBpcyBpbiB0aGF0IGhlbHBlcnMg
bWFzaw0KYnV0IG5vdCBpbiBpdHMgdmFsLCBzbyB0aGUgZHJpdmVyIGlzIGNhbGxlZCB3aXRoIG1h
c2sgPSBCUl9MRUFSTklORywNCnZhbCA9IDAsIGFuZCBsYW45NjQ1eF9wb3J0X3NldF9sZWFybmlu
ZygpIGNsZWFycyBwLT5sZWFybl9lbmEgYW5kIHdyaXRlcw0KQU5BX1BPUlRfQ0ZHLkxFQVJOX0VO
QSA9IDAgaW1tZWRpYXRlbHkuDQoNClNvIGJ5IHRoZSB0aW1lIGxhbjk2NDV4X3BvcnRfYnJpZGdl
X3N0cF9zdGF0ZV9zZXQoKSBldmFsdWF0ZXMNCg0KICAgICAgKHN0YXRlID09IEJSX1NUQVRFX0xF
QVJOSU5HIHx8IHN0YXRlID09IEJSX1NUQVRFX0ZPUldBUkRJTkcpICYmDQogICAgICBwLT5sZWFy
bl9lbmENCg0KcC0+bGVhcm5fZW5hIGlzIGFscmVhZHkgZmFsc2UgYW5kIGhhcmR3YXJlIGxlYXJu
aW5nIHN0YXlzIG9mZi4gQ2xlYXJpbmcNCml0IGluIGxhbjk2NDV4X3BvcnRfYnJpZGdlX2xlYXZl
KCkgd291bGQgYmUgcmVkdW5kYW50Lg0KDQoNCg0KPiAgSWYgdGhpcyBwb3J0IGFuZCBhbm90aGVy
IHBvcnQgYXJlIGxhdGVyIGFkZGVkIHRvIGEgc29mdHdhcmUNCj4gYnJpZGdlIChmb3IgZXhhbXBs
ZSwgaWYgdGhlIGhhcmR3YXJlIG9ubHkgc3VwcG9ydHMgb25lIG9mZmxvYWRlZCBicmlkZ2UpLCB0
aGUNCj4gRFNBIGNvcmUgdHJhbnNpdGlvbnMgdGhlIHN0YW5kYWxvbmUgcG9ydCB0byBCUl9TVEFU
RV9GT1JXQVJESU5HLg0KPiANCj4gQmVjYXVzZSBwLT5sZWFybl9lbmEgd2FzIG5vdCBjbGVhcmVk
IGR1cmluZyBicmlkZ2UgbGVhdmUsIHRoZSBjYWxsIHRvDQo+IGxhbjk2NDV4X3BvcnRfYnJpZGdl
X3N0cF9zdGF0ZV9zZXQoKSB3aWxsIGluY29ycmVjdGx5IHJlLWVuYWJsZSBoYXJkd2FyZQ0KPiBs
ZWFybmluZyBmb3IgdGhlIHN0YW5kYWxvbmUgcG9ydDoNCj4gDQo+ICAgICAgICAgbGVhcm5fZW5h
ID0gKHN0YXRlID09IEJSX1NUQVRFX0xFQVJOSU5HIHx8DQo+ICAgICAgICAgICAgICAgICAgICAg
IHN0YXRlID09IEJSX1NUQVRFX0ZPUldBUkRJTkcpICYmIHAtPmxlYXJuX2VuYTsNCj4gDQo+ICAg
ICAgICAgbGFuX3JtdyhBTkFfUE9SVF9DRkdfTEVBUk5fRU5BX1NFVChsZWFybl9lbmEpLCAuLi4N
Cj4gDQo+IFRoaXMgY2F1c2VzIHRoZSBwb3J0IHRvIGxlYXJuIE1BQyBhZGRyZXNzZXMgaW50byB0
aGUgc2hhcmVkIEhPU1RfUFZJRCBGREIgdXNlZA0KPiBieSBzdGFuZGFsb25lIHBvcnRzLiBXaGVu
IHRoZSBvdGhlciBzb2Z0d2FyZS1icmlkZ2VkIHBvcnQgKHdoaWNoIGV4cGVjdHMgdG8NCj4gc2Vu
ZCB1bmtub3duIHVuaWNhc3QgdHJhZmZpYyB0byB0aGUgQ1BVKSByZWNlaXZlcyB0cmFmZmljIGZv
ciBhIE1BQyBkeW5hbWljYWxseQ0KPiBsZWFybmVkIGJ5IHRoaXMgcG9ydCwgdGhlIGhhcmR3YXJl
IHJlc29sdmVzIHRoZSBkZXN0aW5hdGlvbi4NCj4gDQo+IEhvd2V2ZXIsIHNpbmNlIFBHSURfU1JD
IGZvciBzdGFuZGFsb25lIHBvcnRzIGlzIDAsIHRoZSBwYWNrZXQgaXMgc2lsZW50bHkNCj4gZHJv
cHBlZCBpbiBoYXJkd2FyZSBpbnN0ZWFkIG9mIGJlaW5nIGZvcndhcmRlZCB0byB0aGUgQ1BVLCBi
cmVha2luZyBuZXR3b3JrDQo+IGNvbm5lY3Rpdml0eSBmb3IgdGhlIGZhbGxiYWNrIHNvZnR3YXJl
IGJyaWRnZS4NCj4gDQo+IC0tDQo+IFNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlr
by5kZXYvIy9wYXRjaHNldC8yMDI2MDgwNS1kc2FfbGFuOTY0NXhfc3dpdGNoX2RyaXZlcl9iYXNl
LXYxMS0wLTAwN2ViYzk4M2EwYUBtaWNyb2NoaXAuY29tP3BhcnQ9NQ0KDQo=
