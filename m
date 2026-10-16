Received: from dispatch1-us1.ppe-hosted.com (dispatch1-us1.ppe-hosted.com [148.163.129.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6B13148D2
	for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 00:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.129.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792112150; cv=fail; b=aiDtH0cOqXJWTMBUrlLFS2FESpwxAil9cmTXNwOnIHED2Kw1V55bqa3f1AwQK8zZ42Hq2A5bYoucjHblVjx5GIn45MbGQCxbots5xXNUf5SFSZlcI5HWRGfSRe6eILAAUElp3QiS6FMBO9ICl+6qAf4qfFGLxvpdC3zdpE4fpGI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792112150; c=relaxed/simple;
	bh=e+UZaYz+Jocz/drBhWXLK61dtCWM6l6vjbeGNtD8ISE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YyCQymBde03zwduJGzqTjBiHvwp+6hArL013GqBUKyk359NA49NB6oA4UFSkr4ucxnjIPMrfBhS5c9kUdEIDpLFMDLqVXqk7LmVRdmHhUT6m4zJANE9gPHE5MAd8QUxnd7PGzb8M/gLQ9wqEEdKfNRtkRPDRKdzdsMFMNJ8QuDg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sitime.com; spf=pass smtp.mailfrom=sitime.com; dkim=pass (2048-bit key) header.d=sitime.com header.i=@sitime.com header.b=DMEGRjax; dkim=pass (2048-bit key) header.d=Sitime.onmicrosoft.com header.i=@Sitime.onmicrosoft.com header.b=e7vjRjZl; arc=fail smtp.client-ip=148.163.129.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sitime.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sitime.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sitime.com header.i=@sitime.com header.b="DMEGRjax";
	dkim=pass (2048-bit key) header.d=Sitime.onmicrosoft.com header.i=@Sitime.onmicrosoft.com header.b="e7vjRjZl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sitime.com;
 h=cc:cc:content-transfer-encoding:content-transfer-encoding:content-type:content-type:date:date:from:from:in-reply-to:in-reply-to:message-id:message-id:mime-version:mime-version:references:references:subject:subject:to:to;
 s=mail; bh=e+UZaYz+Jocz/drBhWXLK61dtCWM6l6vjbeGNtD8ISE=;
 b=DMEGRjaxaVM2/VqXjYX1PyXuJsfT524FhDUG/+aK6xuzVC+GXD+dy/DTomMAZrTW0yiPNHkSCLwbuhmI6svUBZVdwbGUcMzISpWyZjq6ifa3LbIY2PhIKYMoce/Jc3GPoCZsbfYePM24ISqMLtQmcBLPrMA5FahdHZd86Ktfdb3pkRU/dVGxiB2t7cANkqZZK8CunZehNTWYhCn0m1Epp1fRpy0j0IrK9Q1ZcxpFhEl7n6nytraEuiOb5scKO21vlx67wABGph4xTeDP78lTtNubVsGi1plWjh64Bi6uRWBeyLhbmimaOTFocR3XhO/JPBXux/LF+vj93SQUvI8DTA==
X-Virus-Scanned: Proofpoint Essentials engine
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11020104.outbound.protection.outlook.com [40.93.198.104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTPS id 3E8E6C006B;
	Fri, 16 Oct 2026 00:55:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B58Sw8+2r8UOGqIWpjZtV7M3x2YKDZB+pyJr5EaVsM0wXI8C08Dc6jci0a65sJzNoDKmJTBJxBU9XatIawcJX4+/UFAhF0vcn5h9fi8fhvB/jw1woza5/losd9kScLeJvYYNReYZ7d9vsKY5cQ3xYjwc4iJSHevYmWb08IW+hbsm4+sLn1JQ7me816lw+cLB2J3W7oEfM5iZWXux7GbEqKefWhWLc35bZzATKeyy4gSnNcsJ7gkKNcvkiSzdfDHkNv5JMJhGBxGLlEtYPDiiMErz35Eecopxs/pfm75x4ck3HVyI4hBofDdk3evDx4kXwar8kl0CADUrFBsI2mMN2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e+UZaYz+Jocz/drBhWXLK61dtCWM6l6vjbeGNtD8ISE=;
 b=ktCUfXYsJbpNl1i9nVEr/vLTEV33f1sL/YEmtxMG3G24GnPti3Ntlcb8A7kDkWik4+KqDupmPBnwl+turlLU9dLhtmYczKy8+Y/IS6ZtMif+1h6CSJNyEF8MBEVTdORDLLise8TQ7jfg2xz9XrEDHjMZ25pEYKshMue07FY4yAGiuKEYUSg2d/HzH0tKn8x9fXC/TfyQOOZRhHSV3VWS2F2A9bl/CNGv6fnWa92Z08IevOLIpE2c3f9IayNlA6Ft8p/lSTTPkz60PBKH3d7VzliOuTHd3SsilwS2RnSFdhs2SVCUbLHTJFSHgUa/pBFzViCC8Imh1En2lrJoZKu3RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sitime.com; dmarc=pass action=none header.from=sitime.com;
 dkim=pass header.d=sitime.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Sitime.onmicrosoft.com; s=selector1-Sitime-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e+UZaYz+Jocz/drBhWXLK61dtCWM6l6vjbeGNtD8ISE=;
 b=e7vjRjZlJ69AuSFn/UEnP1sP2ZdSMs+3PtLX/vJWWdkYK7dTPRfJxUd9JdyIZO4tXg5bL2IFMEcORUJVygMbVQPg7Dvue6DcIFVGrQc5fSqKaQ0cE6mo9nyuogt5OzI1sxYX0tbLjIJQrqJ58mO4G3hUOPrTLJrQHn56CeJ5E3/gx8eQakHLh7MfchaibiEslo9lvRJXknO+xAo7K+s93hfO9WT1E6MTr8v0HbCm2Bne0vygsi5XKobyQJCTp6gkCXDQO9Wuz+ueuqmXgva6N9wuWGU7Qvj89+IjaSYbfC2/qFBdrnwJSF1EXfp/62xA2Qe0o/0O5XD9qlnSR1TwZg==
Received: from LVWPR20MB994915.namprd20.prod.outlook.com
 (2603:10b6:408:3bf::16) by MN0PR20MB4789.namprd20.prod.outlook.com
 (2603:10b6:208:3c7::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Fri, 16 Oct
 2026 00:55:45 +0000
Received: from LVWPR20MB994915.namprd20.prod.outlook.com
 ([fe80::9551:3864:128b:8c01]) by LVWPR20MB994915.namprd20.prod.outlook.com
 ([fe80::9551:3864:128b:8c01%4]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 00:55:45 +0000
From: Ali Rouhi <arouhi@sitime.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: Jiri Pirko <jiri@resnulli.us>, Vadim Fedorenko
	<vadim.fedorenko@linux.dev>, Arkadiusz Kubalewski
	<arkadiusz.kubalewski@intel.com>, Ivan Vecera <ivecera@redhat.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Lad Prabhakar
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Carolina Jubran
	<cjubran@nvidia.com>, Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net-next v13 10/12] dpll: sit9531x: add support to adjust
 output phase
Thread-Topic: [PATCH net-next v13 10/12] dpll: sit9531x: add support to adjust
 output phase
Thread-Index: AQHdW2QBMpf/Nfqgokq9o7XSBNs1Arb9o5wAgAG3vAA=
Date: Fri, 16 Oct 2026 00:55:45 +0000
Message-ID: <20261016005541.11374-5-arouhi@sitime.com>
References: <20261013224131.27149-1-arouhi@sitime.com>
 <20261013224131.27149-11-arouhi@sitime.com>
 <sashiko-outbox-171998@kernel.org>
In-Reply-To: <sashiko-outbox-171998@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sitime.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LVWPR20MB994915:EE_|MN0PR20MB4789:EE_
x-ms-office365-filtering-correlation-id: 2ef92afc-ccd5-4d1a-3fe2-08df2b2035f4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|38070700021|5023799004|56012099006|261009223027099003|4143699003|18002099003|10067099003|6133799003|22082099003|3023799007;
x-microsoft-antispam-message-info:
 Xrd+OqAWR2fPhn+fDGiKlVt+pB0RRq48WlboyI0tDPSfcl+GkDp0g6rsMtm4MMDp1QMaEQZl1pNY9o/qfN5GqxPPvxbIkb+1it8CuADxfACKrNTRsQjzP86g19FAH3JAVEfZ3hY5XVs6RPqvXIcUAe28mUd3Y/4G+6iSd80pXO58DOCNfTAJWfvVi5b0QFoH4oEZ5wd0gTrsc5w+Udc39lcZLjxgEnX6EE4lYX6KUxlxqi1ApAk6D8ytvEVqKRSLFHDYH2iR3jfCD+eDkxmVLt1z4j0FVFhBFegycMVN12v79alQF8RV/mywpff7vkrd78FaWF1u5jvkOHzPORQ1XXffDWn7rQFtToLRJrYwrfB1gLaLoihGdBhCKajoxldWaG+N42m3yh4wPHirNV4FkKnlDDMtTSIvbSL5KzrU8YoZIcDS+rhlW0V8X9gS/sMPSvLgNOeJvXGTFD4k9lrY5SKsWpxY3bmaNmIIrCuMCdkOw+dW6cSk+uWxGQHn2ojYid1/0vujralE0jYycQaMQxO4ZpLbFkEMW7+hZcl2aM4JUQOwmLEljSufdXk5HQ2fPMCtv8+izuiOkMTUyjTsLmSRVJkkiwyi7H3hb/Bw+9mUwK8VNz2+M5tnoT7s3yIbav5Eewr1CKl5D+J3JolLTHvCZOkEMP/CDaQzl0kmb7n1ugdf+TUnk4d4v9w8UdWk0WY7Yj1RbWMf74NrPaglqMi8bX4FmJIub3LrQBrugks=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LVWPR20MB994915.namprd20.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(38070700021)(5023799004)(56012099006)(261009223027099003)(4143699003)(18002099003)(10067099003)(6133799003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YXdlU3lKS0FNQVpHY3J1Sk1rM3QreDJ6TktJUVJqdW9UemVBZjRjcVFob2tB?=
 =?utf-8?B?TjZQM2FLWFBOR0JuOGRvQ0FoMCt4K1RsTlA0ay9QMHZCSHNRS0ZmcUxMUDZ0?=
 =?utf-8?B?UFZ6MmZaTEhEUlVPNDNmOUxZYjM1cUJCTlBhQnlQS3ZBdjJlRmpmN1hacHRn?=
 =?utf-8?B?WVJRQzVZQjBmaFdpZGo3V0svaWhVdmY1V1dvWklNWENDUHFKRStTWEtMdVIr?=
 =?utf-8?B?TVFqendGdjVsMkxyaG5xYXU2NmlPWU1KdHFRc0lteDBMZGJJZndzZTNLQTF3?=
 =?utf-8?B?Z1hjb201TWZleTd5NDBBU0FPYVNTeEYvZFMycW1mbjBRZEVEMjdMcHNPNzQy?=
 =?utf-8?B?TEV6ejZ1MXFPRzhrTkZlRG8vVG5lTWZsZnBuN0pmTGs3QTduTEozOSt0eDR4?=
 =?utf-8?B?UjM0c2cySTdBeVJXSzh6d3R1VWlhcUx6QzJqSTR5cWpjNm1ZaXgwZFRmbmtQ?=
 =?utf-8?B?WWtKRmlINVMvd1NFU0tTV1c4UkpYV3JGM1lmM2JrZTNadjRlMXJtMW5lYkJy?=
 =?utf-8?B?ei9MUVVyZk5wMlg1NDB5SE5tcmFxWFhwWnVIWlQ4UGhDZjNVSEk1TlU0QVhE?=
 =?utf-8?B?VlcvRmFLMlZmMUp1aG5lbnE4MHdVYkxiZ2c2ZytBeSt6QmdsaHZKTXlyaU9z?=
 =?utf-8?B?dVkveXpJRElXU3orMUtmVk5JRHJYTkIxdVA0RWx4V09ieFNSVGdNME0zWDdm?=
 =?utf-8?B?S2MwS0JpbDhoc2FNU0FaWFpjUFRSNWVvMkMzVk1DSWFoa1hYQnMvVDNJNWlm?=
 =?utf-8?B?ZGNCditqaFFLbHAxV2tlTWpHaWl4Mm9uUkxzWUQxdFhoajJPc1pXSXkvTktr?=
 =?utf-8?B?NE5yLzZLMXI4U1NvOUdXMWVlOTgwcFYrbmNlUHVsdEJXVUM3dzdLN3Nqb1dW?=
 =?utf-8?B?cys4emJNb0hGdTIwV3RFbG5tL0lSZUlMelJqMGlsT3pKanVmREcyTmx5c1Va?=
 =?utf-8?B?Mit3TWNQbk5JV0lOUUI4SnVXNXhuVm9GUXh3eHlwQmdlRHN5QjByTE9FUFZk?=
 =?utf-8?B?QklBWTRQdUFLRzBER1l2YXp6dzNOMXRtMk02TldSdmZ0Q0pyOFdkVlNjRkVU?=
 =?utf-8?B?Tk9iUWdMcnpza3IwVWJCbk54ZlAzcVRSZHdubjdSZTlDSnV0bUpSTGRjWHNo?=
 =?utf-8?B?RzNMZHV1S3ZkTE1Qd0NtVGptV3l3dy9DL0lLNkx1dVhUK25acVFHVlJURzlG?=
 =?utf-8?B?TjMyYys2UE5HZVAvbXVxR2RzblJ6eHdoNFZiQkJTWkJCbU40Zk16TC82aGMx?=
 =?utf-8?B?U2YyYXRkSUduUlBodDVveUZlZmQvWU54UlZ0Y3BEU29XQnV6cGFxMjlYYm9I?=
 =?utf-8?B?L3JmVGg0SERQVDFCcTBpQkJTaThEVVk4RXVLazl6cys3T1hoekd3eERsVUlL?=
 =?utf-8?B?WG9TRTNWL0lmd1pDTCt0RkNMWE5wTGhkSlhmR1NmM3JTbTRud1FYSWNOTUxj?=
 =?utf-8?B?QnYwMU9lYWMveE5vdXpXQm9tSjNiNktWdGhiWk9lV1VNQ2lEZ2pSU1NITWxC?=
 =?utf-8?B?SCtCdHRXWnVPTlQvTzliZkVWS3BEWkplaUFVVFcvTHhodDBGZFRpTmYyeGFB?=
 =?utf-8?B?ZFlTM2szQnJ3Wk00M0xzdVZ1czNobDNVUW9WMVBqdkRRdDhJOEF3N240a0JL?=
 =?utf-8?B?bUc0K0xwa0puemxBczFneUJ5VDlBR3pyWXA4L0VCRlhCZVl4T3pBeDlDT3Js?=
 =?utf-8?B?M3ExclAzTmMwbjAzT0pFNjgzeHpjeElkMUwrMEk5WkZGMDVJZGRtVGRaeXF2?=
 =?utf-8?B?eVZFVVVlL25LRHFuWEhjaHhXTU9YeEgxa0JWRXdVV0dFMC84WnJ1bEdpVnB1?=
 =?utf-8?B?OG96ZUV2M1lYMkRLL0VkbVlhZWRzdzJOaThtTHFwVFJwSGVTcHNxS2U4RFdH?=
 =?utf-8?B?UmIwdE1ZODNQSUQ2VVBKT1d4dE4veHo4Zktva01kZDV4azVMNllxeHkwRG92?=
 =?utf-8?B?QXRBYnQ5emRaYXp5elkzZTBrU2xFOXRGRFYxUmFMbjB4QjMyajJTQ2d6KytM?=
 =?utf-8?B?OVNnVTJ6bXd6N09yRGpmZzFKOWNydFlidGpHb2FlM1hzUnI2Nm4vNWNFaTBN?=
 =?utf-8?B?RjBINGlpZmdiMWtZN3RHRTN1QkdHVXhjOFpQYXFJM3hqQUpPMWNidDU5M2Jm?=
 =?utf-8?B?QjlPeXVTWG90Vm8vaUpNeWhNSi9LcE9sQzRSV2dJTGY1OGdkUDcyaEtrdm83?=
 =?utf-8?B?dGFMbm1ENkExVUJrS3hYQXJqVGNyOU1PanlNZjQ0Sk44T0pkY3FlakRBbEZD?=
 =?utf-8?B?b2J3dmxlekJ4TmVWVzF2RTZCeUxwWXhxcG5qRm5Td3NGd3Zici9KZzA0S0lw?=
 =?utf-8?Q?3A5hTLQKP0k7uWyrZB?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	0Pl2e79jewnOMFQlviWFMh5DNsPhj+/XTjtReoUpeLhT/AIvI/hrTeuXayhchdtTARDq59dE0PrvnN9XeUlURQ1WVf+4u4o3Gfq2Cf2jVYu0JSMWtjC6JYL0SadKejPnHxRxE8veTQom7NsvV6YDCcquJsg7UzixjFpyoIt4ubSqcV7Ej55jS48FRyK0Ru+4TW7Uf5TrA+sreO5vdD+GgmndxdXVMTSH9Iigfy2StN20zic/2RRuSt07qJWpKHjkuKX13GWlyzv6m7wdKGvfE7socpzduC32QDDDO2afq0JV1aDXMxulfVtm2kxSBq2Tdkdwze3wYw1bcsBe03LFEg==
X-OriginatorOrg: sitime.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LVWPR20MB994915.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ef92afc-ccd5-4d1a-3fe2-08df2b2035f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2026 00:55:45.1136
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8fb55916-cf10-4b0d-96f4-cf3952657263
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5/yJYTzE4XKbHPD4oItqJTNyOuECiaXj4/qnd1CD9DIS0ZHkRDXLiqvNL8IPNIkSkfcwn0zrjxbs9YO7oEpDUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR20MB4789
X-MDID: 1792112147-RDvf2_8lWgFO
X-PPE-STACK: {"stack":"us1"}
X-MDID-O:
 us1;ut7;1792112147;RDvf2_8lWgFO;<arouhi@sitime.com>;b258b95cf5ef1e870c44c71acb0e4bbc
X-PPE-TRUSTED: V=1;DIR=OUT;

T24gV2VkLCAxNCBPY3QgMjAyNiwgc2FzaGlrby1ib3RAa2VybmVsLm9yZyB3cm90ZToNCg0KUmVw
bHkgaW5saW5lLiAgVGFraW5nIHRoZSB0aHJlZSBIaWdoIGZpbmRpbmdzIHRvZ2V0aGVyIGZpcnN0
LCBzaW5jZQ0KdGhleSByZXN0IG9uIHRoZSBzYW1lIHByZW1pc2UsIHRoZW4gdGhlIHR3byBNZWRp
dW0uDQoNCj4gW1NldmVyaXR5OiBIaWdoXSBEb2VzIHRoaXMgdHJpZ2dlciBhbiB1bmludGVuZGVk
IHBoYXNlIGZsdXNoIG9uIFBMTCAwDQo+IHdoZW4gYSBmcmVxdWVuY3kgY2hhbmdlIGlzIGFwcGxp
ZWQgdG8gYW4gdW5yb3V0ZWQgcGluPyBXaGVuIGFuIG91dHB1dA0KPiBwaW4gaXMgbm90IHJvdXRl
ZCB0byBhbnkgUExMIGJ5IHRoZSBib290IGNvbmZpZ3VyYXRpb24sDQo+IHNpdDk1MzF4X291dF9z
dGF0ZV9mZXRjaCgpIGluaXRpYWxpemVzIGl0IHdpdGggcm91dGVkID0gZmFsc2UgYW5kDQo+IHBs
bF9pZHggPSAwLiBTaW5jZSBzaXQ5NTMxeF9vdXRwdXRfZnJlcV9zZXQoKSBkb2VzIG5vdCBjaGVj
ayBpZiB0aGUNCj4gcGluIGlzIHJvdXRlZCwgcGxsX2lkeCA9IDAgaXMgcGFzc2VkIHRvDQo+IHNp
dDk1MzF4X291dHB1dF9waGFzZV9mbHVzaCgpLCB3aGljaCB3aWxsIGZvcmNlZnVsbHkgcmVzdGFy
dCB0aGUNCj4gZGl2aWRlcnMgZm9yIGFsbCBhY3RpdmUgb3V0cHV0cyBkcml2ZW4gYnkgUExMIDAu
DQoNCj4gW1NldmVyaXR5OiBIaWdoXSBEb2VzIHRoaXMgbG9naWMgZmFpbCB0byB2ZXJpZnkNCj4g
c2l0ZGV2LT5vdXRbb3V0X2lkeF0ucm91dGVkIGJlZm9yZSBwcm9jZWVkaW5nIHdpdGggcGxsX2lk
eCA9IDA/DQo+IEdldHRlciBmdW5jdGlvbnMgbGlrZSBzaXQ5NTMxeF9vdXRwdXRfcGhhc2VfcmVh
ZCgpIGNvcnJlY3RseSBjaGVjaw0KPiAhc2l0ZGV2LT5vdXRbb3V0X2lkeF0ucm91dGVkIGFuZCBh
Ym9ydCB3aXRoIC1FTk9EQVRBLCBidXQgdGhpcw0KPiBmdW5jdGlvbiBwcm9jZWVkcyB0byBjYWxj
dWxhdGUgYW5kIHdyaXRlIHJlZ2lzdGVyIHZhbHVlcyBhZ2FpbnN0IFBMTA0KPiAwIGZvciB1bnJv
dXRlZCBwaW5zLg0KDQo+IFtTZXZlcml0eTogSGlnaF0gU2luY2UgdGhlIGhhcmR3YXJlIGxhY2tz
IGEgcGVyLW91dHB1dCBmbHVzaA0KPiBtZWNoYW5pc20sIHRyaWdnZXJpbmcgdGhpcyBwaGFzZSBm
bHVzaCB3aXRoIHBsbF9pZHggPSAwIGZvciBhbg0KPiB1bnJvdXRlZCBvdXRwdXQgd2lsbCBmb3Jj
ZWZ1bGx5IHJlc3RhcnQgdGhlIGRpdmlkZXJzIGZvciBhbGwgYWN0aXZlDQo+IG91dHB1dHMgbGVn
aXRpbWF0ZWx5IGRyaXZlbiBieSBQTEwgMC4gQ291bGQgYSB1c2VyIGludGVyYWN0aW5nIHdpdGgN
Cj4gYW4gdW5yb3V0ZWQsIGRpc2Nvbm5lY3RlZCBEUExMIHBpbiB0cmlnZ2VyIHZpc2libGUgZWRn
ZSBqdW1wcyBhbmQNCj4gaGFyZHdhcmUgZGlzcnVwdGlvbiBhY3Jvc3MgdW5yZWxhdGVkIGFjdGl2
ZSBvdXRwdXRzPw0KDQpBbiBvdXRwdXQgdGhlIGxvYWRlZCBjb25maWd1cmF0aW9uIHJvdXRlcyB0
byBubyBQTEwgaXMgbmV2ZXINCnJlZ2lzdGVyZWQgYXMgYSBwaW4sIHNvIG5laXRoZXIgc2V0dGVy
IGNhbiBiZSBjYWxsZWQgZm9yIG9uZS4NCm91dFtdLnJvdXRlZCBpcyBzZXQgb25seSBieSBzaXQ5
NTMxeF9vdXRfc3RhdGVfZmV0Y2goKSBhdCBwcm9iZSwgYW5kDQpzaXQ5NTMxeF9kcGxsX3Bpbl9p
c19yZWdpc3RyYWJsZSgpIHJlcXVpcmVzIGl0IGJlZm9yZSBhIHBpbiBvYmplY3QgaXMNCmNyZWF0
ZWQuICBUaGUgcGluIGNhbGxiYWNrcyBhcmUgdGhlIG9ubHkgY2FsbGVycyBvZg0Kc2l0OTUzMXhf
b3V0cHV0X2ZyZXFfc2V0KCkgYW5kIHNpdDk1MzF4X291dHB1dF9waGFzZV9hZGp1c3Rfc2V0KCku
DQpwbGxfaWR4IDAgaXMgdGhlcmVmb3JlIG5ldmVyIHJlYWNoZWQgb24gYmVoYWxmIG9mIGFuIHVu
cm91dGVkIG91dHB1dCwNCmFuZCBubyBmbHVzaCBpcyBpc3N1ZWQgb24gUExMIEEgZm9yIG9uZS4N
Cg0KVGhlIGFzeW1tZXRyeSBpcyByZWFsIGFzIGEgbWF0dGVyIG9mIHN0eWxlOiB0aGUgZ2V0dGVy
cyB0ZXN0IHJvdXRlZA0KYW5kIHRoZSBzZXR0ZXJzIHJlbHkgb24gcmVnaXN0cmF0aW9uIGluc3Rl
YWQuICBBZGRpbmcgdGhlIHRlc3QgdG8gdGhlDQpzZXR0ZXJzIGhhcyBubyBjYWxsZXIgdGhhdCBj
YW4gZXhlcmNpc2UgaXQsIHNvIGl0IGlzIGxlZnQgZm9yIGEgbGF0ZXINCnNlcmllcyByYXRoZXIg
dGhhbiBhZGRlZCBoZXJlIHVudGVzdGVkLg0KDQo+IFtTZXZlcml0eTogTWVkaXVtXSBXaGVuIHBy
Z19jb21taXQoKSBmYWlscywgdGhlIGRyaXZlciBtYXJrcw0KPiBwaGFzZV9zdGFsZSA9IHRydWUg
YnV0IG9taXRzIHNldHRpbmcgZmx1c2hfcGVuZGluZyA9IHRydWUgKHVubGlrZSB0aGUNCj4gZXF1
aXZhbGVudCBlcnJvciBwYXRoIGluIHNpdDk1MzF4X291dHB1dF9waGFzZV9hZGp1c3Rfc2V0KCkp
LiBDb3VsZA0KPiB0aGlzIGxlYXZlIHRoZSBvdXRwdXQgZGl2aWRlciBwZXJtYW5lbnRseSB1bmFs
aWduZWQ/IElmIHRoZSBkcml2ZXINCj4gc3RhdGUgdHJhY2tpbmcgbG9zZXMgdGhlIHBlbmRpbmcg
Zmx1c2ggcmVxdWlyZW1lbnQsIGEgc3Vic2VxdWVudA0KPiBtYW51YWwgcGhhc2Ugc2V0IHJlcXVl
c3QgY291bGQgYmUgZmFsc2VseSB0cmVhdGVkIGFzIGEgbm8tb3AgYW5kDQo+IGRyb3BwZWQsIHBy
ZXZlbnRpbmcgcmVjb3Zlcnkgd2l0aG91dCBzZXR0aW5nIGEgZHVtbXkgcGhhc2UgZmlyc3QuDQoN
Cj4gW1NldmVyaXR5OiBNZWRpdW1dIFNpbWlsYXJseSB0byB0aGUgY29tbWl0IGZhaWx1cmUgYWJv
dmUsIGlmDQo+IHNpdDk1MzF4X291dHB1dF9waGFzZV9mbHVzaCgpIGZhaWxzLCB0aGUgY2FjaGUg
aXMgbWFya2VkIHN0YWxlIGJ1dA0KPiB0aGUgcGVuZGluZyBmbHVzaCByZXF1aXJlbWVudCBpcyBu
b3QgcmVjb3JkZWQuICBXaWxsIGEgc3Vic2VxdWVudA0KPiByZXRyeSB3aXRoIHRoZSBzYW1lIHRh
cmdldCBwaGFzZSBpbmNvcnJlY3RseSBoaXQgdGhlIGNhY2hlIHBhdGggaW4NCj4gc2l0OTUzMXhf
b3V0cHV0X3BoYXNlX2FkanVzdF9zZXQoKSBhbmQgc2tpcCB0aGUgcmVxdWlyZWQgZmx1c2g/DQoN
CkFncmVlZCBvbiBib3RoLCBhbmQgdjE0IHNldHMgZmx1c2hfcGVuZGluZyBvbiBib3RoIHBhdGhz
LCBhcyB0aGUgcGhhc2UNCnNldHRlciBhbHJlYWR5IGRpZC4NCg0KT24gdGhlIGZhaWxlZCBmbHVz
aCwgdjE0IGFsc28gc3RvcmVzIHRoZSBkZWxheSB0aGF0IHdhcyBjb21taXR0ZWQNCmluc3RlYWQg
b2YgbWFya2luZyB0aGUgY2FjaGUgc3RhbGUuICBBIHN0YWxlIG1hcmsgd291bGQgaGF2ZSB0aGUN
CmdldHRlciBwdWJsaXNoIHRoZSBuZXcgZGVsYXkgYW55d2F5LCBhZnRlciB3aGljaCB0aGUgY29y
ZSB3b3VsZCB0cmVhdA0KYW4gaWRlbnRpY2FsIHJldHJ5IGFzIGEgcmVxdWVzdCBmb3IgdGhlIHZh
bHVlIHRoZSBkcml2ZXIgaGFkIGp1c3QNCnJlcG9ydGVkLCBhbmQgdGhlIHJlYWxpZ25tZW50IHdv
dWxkIG5ldmVyIHJ1bi4NClRoaXMgZW1haWwgbWVzc2FnZSBhbmQgYW55IGF0dGFjaG1lbnRzIGFy
ZSBmb3IgdGhlIHNvbGUgdXNlIG9mIHRoZSBpbnRlbmRlZCByZWNpcGllbnQgYW5kIGNvbnRhaW4g
cHJvcHJpZXRhcnkgYW5kL29yIGNvbmZpZGVudGlhbCBpbmZvcm1hdGlvbiB0aGF0IG1heSBiZSBw
cml2aWxlZ2VkIG9yIG90aGVyd2lzZSBwcm90ZWN0ZWQgZnJvbSBkaXNjbG9zdXJlLiBBbnkgdW5h
dXRob3JpemVkIHJldmlldywgdXNlLCBkaXNjbG9zdXJlLCBjb3B5aW5nIG9yIGRpc3RyaWJ1dGlv
biBvZiB0aGUgaW5mb3JtYXRpb24gaW5jbHVkZWQgaW4gdGhpcyBtZXNzYWdlIGFuZCBhbnkgYXR0
YWNobWVudCBpcyBwcm9oaWJpdGVkIGFuZCBtYXkgYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90
IGFuIGludGVuZGVkIHJlY2lwaWVudCwgcGxlYXNlIGNvbnRhY3QgdGhlIHNlbmRlciBieSByZXBs
eSBlbWFpbCBhbmQgcGVybWFuZW50bHkgZGVsZXRlIGFuZCBkZXN0cm95IHRoZSBvcmlnaW5hbCBt
ZXNzYWdlIGFuZCBhbnkgYXR0YWNobWVudHMsIGFuZCBhbnkgcHJpbnRvdXRzIG9yIGNvcGllcyBv
ZiB0aGUgbWVzc2FnZSBhbmQgYXR0YWNobWVudHMgdG8gdGhlIG9yaWdpbmFsIG1lc3NhZ2UuIFRo
YW5rIHlvdS4NCg==
