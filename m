Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.135.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793710169;
	b=x3d4ZYgAqRcOOTnbHFmLU1Vf3wkkyIvD0gW9FByp7Z5zc/4r8VsjQ4N53ZX3OZuLnG7L
	 MZolqSVIqV0mLx8VXOS1vaaStX046Pb9+wKVqbXyI0HARJxO+A9iRkZ9MFoQtiKHajqeG
	 sY3Ohg/XwZ5WRu0y8Z0mb8CYK+Hk5CB1Av8/VmpR7M3yFr3ZfrFPb1Yozo61eA7pqLSOh
	 n9WT2oW6R77GWntFcrEMxI4Vp5rfAGRCIQ6KOOBwkvkd4a0hgPocrcV8XT4/1PCsZrh4h
	 tGnalyO5UNU5CzhZ9qVNHXex6MgbrCF8TSMscA6X/PHBkszTArMIZXLtDpOp8670g1w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793710169;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 X-MS-Has-Attach:X-MS-TNEF-Correlator:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:
	 x-ms-exchange-antispam-messagedata-1:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ljSM4W2HDGpSfMktKybsed+wk5IjJnJtk1Wbp+MV97I=;
	b=r7VZqR95Q1MWQXRH/5R+lFGiY+Etthkl7F6z20pYR/Y5U6ToeCRnZbvvcOmsojvrk8Ob
	 Vvk92J5f0JF60OxjzQsjvvrg6NISKVB4a2eDrlGQj6JnjzOHwWf3q7gAGHKmO4OaIUQan
	 Ia5RvU89JD5p9iRNORm0cAeRbQ01F504fSxBpBbnPxSafN+dgaYnEKe2c6Bag78tePvcz
	 gcRtTrH69gDmcb9RCJmolAFqbMKyCoQnxtGu4d5wLY2TYUfynEXFHXdwiCTI5RT5yEp0H
	 q6olNU8xcqqazZEO6YMSzwMOHxStmYOt265FkwuvagdHXTyO0oYapN2622szynbuynw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=j3MQUdsx;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=qLk13DRK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.135.77
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DA8606A326;
	Tue,  3 Nov 2026 12:49:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83DA8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=j3MQUdsx;
	dkim=pass (2048-bit key, unprotected) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=qLk13DRK
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3ClpHZ2650624;
	Tue, 3 Nov 2026 07:49:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=ljSM4W2HDGpSfMktKybsed+wk5IjJnJtk1Wbp+MV97I=; b=j3MQUds
	xSt8BAK6pE+e89Q9dqdiz9qxB4EhDo40dKV1AaJ0w/InYnQ28yfdral3Us8DDCUx
	Huw127ccdpWfC7Wk2/tYcY1IRqaC9j3gyq02h8OVEXMqlsoVAyshOuQ4mrrDIcE5
	8Ia2Y81wNZ87RgJRM97tFFdOTaDMyd4OLwtBFS039bLrrYwl7kfWTZFSlswVrm0o
	5P+J1LcUOBmlAHgqBtA3ixYuNEcklbDNp3Vw5kujUJWYVZ23Yknn465Cup9zIT1C
	kc53BokZsdBNjChUGvsLOI2txWBbd2eZWK03HffGh+8wGMHXuY7MGfRF+30Q7fMJ
	Oj1U10OXvi9zMlQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=ljSM4
	W2HDGpSfMktKybsed+wk5IjJnJtk1Wbp+MV97I=; b=qLk13DRK6A7ZDZl1oqXHn
	xT+pO5IXAmUcaQz275ehdL13sK5MlWUzXc/pG3RVcTfV/6ZtWX0bzXbW91z+//69
	ubi79WjhG1NLuZ1rqPck+R7jW+xEaom/ul45lPCdUqDumnKZGz0Q3JPdEq8h0mkM
	qDlyKL47BYt8H5w7Fp5Vkt3UWqO9RF259oYrA1ZrQpiM9jJe++zZMbFF+gTEX3cF
	FEYtcAYHfDmsMVODuaF0VdxCVoS+jvDLofbQ1kxLnYU/ZB/eYHrAJD7t+Unk0g9k
	LrwVwwXK3dlN0KQQ4/kmLgnBrhrAe6387MjydXQudwhFu+Q7vkKAQ3OQ6jVGW9NG
	A==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012041.outbound.protection.outlook.com [40.107.209.41])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4hq0trvty6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 03 Nov 2026 07:49:25 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RPzm+uEllerfymd0+0p2z4vYAgre1K4GIqgIjGEhUSopgfCPyOMMk/x+WKWKREqaXV6mcVp2ZOEAZ3ZedZXRWNV8H2XuQ0WxgOxvMwmUiIgYBFYx6bD29gMaxevBwh//YFR8NmNI7REiMINBYh1DY21JFyvOfj3PQM7MLzcPgx66Lfyu6P1Xky2g1+eumQy6SNXJie+dxEd1z+35N8dY4WE1Iec8HspuF1YM8NcsSkCVaGhlDDnOkQmdDSqW30bYPcAePVan7gRkjgMiBOJwG41tM7+kUP/8+j/TATY/QEQqLYSh2EdIRa98HtDMrPGHy2h2VG7tuXC9Kl7AjDLZOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ljSM4W2HDGpSfMktKybsed+wk5IjJnJtk1Wbp+MV97I=;
 b=AdqewdndoeUS1x0+3OXlO8IdX/KxFgfr0066kwL6g+cYXUFI5duQSGAL0mURplVB9ci8vvW/ccVoqW/CzNlTtenmUfJxpvNeuYSRHiT3V4ljKG+27uwHGi+78HJDMaMAFixK/smjxOHQaK1DqmKpOlYaB2BaDLuzPKNTtbqhknC0lUHeaBSv1ZFZmuonlDB1kxCOaIIvRX0MeRwLhMCXWEH1wBKIBAOjZ3MPdnGlsQlzVuSuCaCqKDyGagB8lF2+wOjxtfFR986omiM5XJQF/u2OBEuuQn4KkI0+vJy73DLVHiqAm1BExC3pamrAphfNxVb21FT3H1JT0Q8FD1vnVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from LV9PR03MB8414.namprd03.prod.outlook.com (2603:10b6:408:367::23)
 by BY5PR03MB5032.namprd03.prod.outlook.com (2603:10b6:a03:1eb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 12:49:22 +0000
Received: from LV9PR03MB8414.namprd03.prod.outlook.com
 ([fe80::d661:7c16:d052:cc81]) by LV9PR03MB8414.namprd03.prod.outlook.com
 ([fe80::d661:7c16:d052:cc81%2]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 12:49:22 +0000
From: "Sabau, Radu bogdan" <radu.sabau@analog.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "robh@kernel.org" <robh@kernel.org>,
        "conor+dt@kernel.org"
	<conor+dt@kernel.org>
Subject: RE: [PATCH v5 6/8] iio: imu: adis16607: Add FIFO-based
 buffered/triggered capture
Thread-Topic: [PATCH v5 6/8] iio: imu: adis16607: Add FIFO-based
 buffered/triggered capture
Thread-Index: AQHdaqwobZM8Xy+3TUGsGHhJAu+T07caiPKAgAHCneA=
Date: Tue, 3 Nov 2026 12:49:22 +0000
Message-ID:
 <LV9PR03MB8414C2FF2D57612F53621689F7692@LV9PR03MB8414.namprd03.prod.outlook.com>
References: <20261102-adis16607-v5-0-4f98b0d271ac@analog.com>
 <20261102-adis16607-v5-6-4f98b0d271ac@analog.com>
 <sashiko-outbox-193205@kernel.org>
In-Reply-To: <sashiko-outbox-193205@kernel.org>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV9PR03MB8414:EE_|BY5PR03MB5032:EE_
x-ms-office365-filtering-correlation-id: e76966f6-5932-4c68-b68b-08df39a8e28e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|10070799003|6133799003|10067099003|22082099003|18002099003|38070700021|56012099006|5023799004|11063799006|4143699003|261026121527099003|261021123027099003|261026140227099003|261009223027099003|261022105027099003|261102123227099003|261028144727099003|261021121427099003;
x-microsoft-antispam-message-info:
 Ke7Fxk0c1R7pZz09iSjXshzrnn0RXMYbBuUgZyD65q4tSBWg9GriMoO0+xAobB5yfGlXDfFS9weLrJsfeVx4HKRSOdvNM3M4Spr07Izs2Rfnre9/l12CGl5Zo7z7GhoaHX2EOTNeDlz+te3iNZoj8QbS0uTgoWT2uqJrY8nXVcopuh2GYtAIDjhftaUFLRLxNevnomILepZVoy5frFeznaFJj3aRVWQ/G1KdTuU7KRp+t2u5W1FU8HNXqwQpygT10uJ5YYm0+P1X9LiF8pa1qUvnBjIfkISOmxLaPVnZKjH8PVLGSj0DDgdY5xYsGiNgSOVPi97iKf+IV7DXBvXrOEJGgRH6FlfgqILJoxZDEg1ucgkfV4yv9t2qllEAiuo02iFSqKqbQtVsfPnFunCJXhIsXxagFJLla0tpd7jvvavev6M7KErSdO9hJ6YbcidWLz4OSBQieSk0hQ34sw2DIeup/jPJ6ubgnZ4MygojE8Mgco/HwJncjk/4HNqfSaftj2cgpsHtyCm+YHQ0BvkbJfyp0OUauPq4jeT6TSkL68DIA3JoXJ0w7AB0cNkxiuJJeiVSyhzJDQHtNIYOV1L/mab2zhc9sVqqw1aUJE1CeJgkxNa03jOiqqXWQTaTOeiqNfVPG2bSuMqc/lW5+qFpnJ1RnF7vdbigZ8kjGaoFwH2TSaQPuTkd1DBe2ZJFAHHMviEXC0Ea1z0pwieW5mhOfFN/SE3JeZqT0Hsuh8+a5tU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV9PR03MB8414.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10070799003)(6133799003)(10067099003)(22082099003)(18002099003)(38070700021)(56012099006)(5023799004)(11063799006)(4143699003)(261026121527099003)(261021123027099003)(261026140227099003)(261009223027099003)(261022105027099003)(261102123227099003)(261028144727099003)(261021121427099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UGFBUGx5ZW96U2ZkUGV2Sm5NRlp6WHU4R1NkSFNJc245MHNwUU14amVZWjRP?=
 =?utf-8?B?L21HbExNczdEemVNVmptcUlYaDFFUWxKQlo3a2c3RW00c3ZvNm9QQVRyVGlZ?=
 =?utf-8?B?ZlAyZk1mWFJ5NXd1T085Y0RMK3NZZmprSXVIRFBYNHFBNW1UK0xCbXRKY2VG?=
 =?utf-8?B?Tm1CekpRRFplTXZWRDhWK0c5SVJqQVdDRFpKM1RDREhxOUlFWkczSVFVdWhp?=
 =?utf-8?B?ZEFGTWdKTmZBb0pCUWN3T1FFQm1oZTRTZVRrQTEzeEhOMlpjQm1jNlh1SVZR?=
 =?utf-8?B?bmZCN0JhSGJhbzExOTBpUHNUaXV4N1J3bnJodGVDZWU0LzRkUVRtRThFSzRD?=
 =?utf-8?B?WmJXMWlLZTVTVDNCWW5mcXJwZWlISFc3bUdzZVFpYzlrb3NNdnJUbm5uWjlL?=
 =?utf-8?B?TjlrTXVqMlZ5dVZ2UEFTeHhrZC9EeExSY2Zhd1AzOEN4eFFzblZTUVUwb1VE?=
 =?utf-8?B?cHRqNUtMUlZMS0E2N1Q1RE1NQkY4NkdyM01pbFlHOWMyKzc2NWthSXczOEti?=
 =?utf-8?B?bi9zRHpyek9EOFlMZktyNVI3Y1hXS1doQmQyMXcyUVpRYmdrcWlQODZ6eXlJ?=
 =?utf-8?B?Y05IaUlBNTJaTTNibjJiWm9VdzkrcnRKVlpFbnVYOVRzU1A0cllqNHcwMjY3?=
 =?utf-8?B?WmRsbFB0cUVvaFpsUFEvVGZiR1gyOGl6NlFoMDh5ZU1iVWx5dkZiWURuSWJ4?=
 =?utf-8?B?YWVJZ0tya2pJWlEwYkhQdnJqRTN0cVB5dysyUGVKcDNHSjdiSHU5S2s0Sklj?=
 =?utf-8?B?OUptZkJ2U29OQnJnOUpkSHYxYlEraEczQ1c2M0lsWTg0Z01nWlJmb3BMSDY1?=
 =?utf-8?B?VnIzeW5VbEtHb3lxdm91SlYyVlJYUVNydlBzbElCbEkzcW5ESU5JbFZrSU8y?=
 =?utf-8?B?bTVUNnhLeVJVL1hXZ1Jxb2FlODZCOVZWRlhwazAvcU8vZFdmSGwySXRxMUcz?=
 =?utf-8?B?cnIwQzZvWkJZdlA1cXQ1RDl3UVh5SncwVDBZdFNUUTdYNkN6cjM1ZlhiZXJO?=
 =?utf-8?B?bWNnMVdWRTI5bHRPRlUyUU5FTllaTzNRTVB4VGdEdE0zZkFoQTJjUC9IRGVF?=
 =?utf-8?B?eEVNMFhsWndtK2xhdGRDTzRMMFFQZzdMSnBzY3hSeWp5YmpkMi9xTUFHMC9T?=
 =?utf-8?B?QlVFYUNNYlZ2cVN4YysyMVE4T3NWdGF0SjAwVjl4V0M0Vy90L2plU1FCUzF1?=
 =?utf-8?B?Z1R1Y1IwM0cybGpHL1FNcVAvbUxjWDVEY2NmYy9jYVFpOTNjdklVQURrSTBm?=
 =?utf-8?B?TFd6QS8zelErRzdxb2pkWjRQNmY2VlFkUlY3RU9JdHBCU0V4eC9jTmQxdVc4?=
 =?utf-8?B?S3l0S2poN2FsVHoyckpDYzByZjRGWmltZHA2bWR3MG5GVXFPZkhDcnhZSk9S?=
 =?utf-8?B?UWpGYzIxUkxqSnFKU1duU3VMVXFmaUN5YmFULzZOQ210a090VDhOQ2NpTVZH?=
 =?utf-8?B?bWxyNEpVMlM5eUIydm5lRFArc3ZSWE8rcFlUNFlZVUVOYTVNVDdyLzZ6MDBw?=
 =?utf-8?B?Wm91a0hseEpmdEVxTXBSS3FtTlc3VURERGhsZlVXSmNlYTN2K1RJc082bGU2?=
 =?utf-8?B?OWlqK0Jua1RBVHR1V1VOaVZzNEx3eExkR2p3SEpEY1o1SGk4eW1rN0F0UDhl?=
 =?utf-8?B?RnlrNEg5cjRlbHFHRUxucmpOWW9hT3hiR3M4Z3Y3NlBXRi9FWHBMQXlwdjIv?=
 =?utf-8?B?NFFUR0I0VlFHbTlhM25zdWVpSHNUbUYycDNOVndnV0FWakI2T3JtVU03RXhj?=
 =?utf-8?B?djZPVVoyanUzTnN2RFZkc2tUdG1WWTVaT0Vqd1BZeWtNWkI2c2JkU0FsMldr?=
 =?utf-8?B?V3JCcExCSkIyNTFETFJzblNTUkZYMWVrMlFXeGNNQ0wwdU9vR3p0bUViQTFD?=
 =?utf-8?B?Z2dyQ0toeGhHN2dQdUlmVTBsbVFvTkgrdU85ZTByOHJzdUxkSGlWcU8yZ0U3?=
 =?utf-8?B?K3hYMkQycFBkVkVmN2M5N01DK1hhSDZDb3hEK2R5TVhSMmI1NHNtV1g0d05K?=
 =?utf-8?B?UE84WHd1bnplcUlDWkdUVWg2RGFoU1JJS0NoS1ZGeVJ4U0huUHl5SEhqUGhN?=
 =?utf-8?B?R21keEhjQjM5RHI3a1A2RGZ5akNNQUpsODlacmtSaXB5NHptbmQySGduY3JV?=
 =?utf-8?B?ZE82dzliYTFWbUxaNnBLTVVaem9EUWFKUU9Sd2tlUmZJUFUxb29xSXJvb3Qr?=
 =?utf-8?B?TWFKSXQ0YktwYmk1SEU1ZGRlM3pSZk9YaXROMW4vQmhaMThGeGF6YjQ5MVFH?=
 =?utf-8?B?dzhQM25pbEFQT3hNR0o0bCtCaUh4Q1ptS3hValdLd2NsMXpNcU9qMlJoTG1V?=
 =?utf-8?B?YUkvcTZBbTcwcmI1dFZJLzU1cFVkNDgzVWJvM1UxaDIxR3Y1ZWZvVjRjV21T?=
 =?utf-8?Q?TTAaq6LYUPJAgKMts2sysHDPIVyD6NOTxcIgZs/NHXb7B?=
x-ms-exchange-antispam-messagedata-1: uUqP4q3ZRsZVUw==
Content-Type: text/plain; charset="utf-8"
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
X-Exchange-RoutingPolicyChecked:
	wgLlJQlcE5f4AcGJVHwTlyxf35kJmKEc5zpTzLAg76JQNSC1IJU5iSprjvYEV8p8akgKV6OyKisADr+WiVO9Q+Eb30RMgAWyZsUDMQ0EAJ8gTyrFNlYeGouCmPz/06GKwyTTG6m1kYuUXnST/5tBJZHpMOuqFQV1WxHLwT3fC20210vv0JCf3+pECdzkaCa1x708BYclwpIc84e7jfQ+JJQn5iLX5jQQLIZJGfksQUODXeaLxaynuohEMXAjHgftIYfZTbzNatyEr/19bqPkGkLSWb13a7czVymU9jjWqyqFr1sZ6YRSW7v8cseBFOwwVkAAAzTS44zbpqWDmO9zJA==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV9PR03MB8414.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e76966f6-5932-4c68-b68b-08df39a8e28e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2026 12:49:22.8051
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zBwKLOGhE9VebpWorTchXvTOIW46G4qHinXAKOQXd80uhEbVUCgsc8clls7hfsmDweuFdtP/XXev4lH83r7iCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5032
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1MCBTYWx0ZWRfX1y76R1LnSPdl
 U6/Q0u99ICmfLW8xBD1gYkfVTFNWwDZoYFlBhrWPEhZn9GVd9gvavEg24a3jbKfSJWj3q0MzexO
 tnu2E1WNmfJbIFkCB6kc8yUYbjIcRl04Fe1tj/S9pAWk81EG52O9Hx77hX2Q1+Zw7TjV8K4eUvY
 sdGoFhpYTZxaQVnTqUXxvorriOTTgKJGRcSH2NmIpuSwiOTQr2CtCnGqbkgTwLMe9pHXQ0rCLrX
 YoNt0PrDiPbpAXKIohDFMOPPe69m2y4rFH+Uxz3GrW3IGwRgwQYFypAivMTD0TWGtiFa6gzrsER
 s1u12n9ZERsNFs7g3Pj8hRpDLKmmIuBsrIF8MAPtnpXu11S+rCHw0cAJOU+4P4B85cMllBjL45f
 v4N+v/INBMxFyHCPfRkN5LWHofji05BkOlRQ/M5XBxGcgJ9CeN1nqn+9ptGJJNiU6HrgWVCiRNR
 kFzwTlqdfiga3hAJWLA==
X-Proofpoint-GUID: cDofUexIrN1y1fBwseKuR148wyrko9Hl
X-Proofpoint-ORIG-GUID: cDofUexIrN1y1fBwseKuR148wyrko9Hl
X-Authority-Analysis: v=2.4 cv=P/OvFSAu c=1 sm=1 tr=0 ts=6ae9d855 cx=c_pps
 a=hT+s7xQkU6anaY/BUKCaTQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=N--XFCr6TIEc_64PeIT2:22 a=VwQbUJbxAAAA:8 a=KKhR5bb24EbuhLqDVOsA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1MCBTYWx0ZWRfX27DXz39yh+oX
 fNI/ghp2II8bY9vD5kefdaKiXPRUDlbaFEGkWbtG6N6zy0o+c0YrBoNwqeoy1CoJTuuXfjs1pVl
 MK1RpXVPyrjdbk19OF1eS/431o2hBPSyrtF6bq6GS5JcqOxW/75I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011 suspectscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030050

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBzYXNoaWtvLWJvdEBrZXJuZWwu
b3JnIDxzYXNoaWtvLWJvdEBrZXJuZWwub3JnPg0KPiBTZW50OiBNb25kYXksIE5vdmVtYmVyIDIs
IDIwMjYgMTE6NDcgQU0NCg0KLi4uDQoNCj4gPiArCXN0LT5hZGlzLmlycV9mbGFnID0gSVJRRl9U
UklHR0VSX0hJR0g7DQo+ID4gKw0KPiA+ICsJcmV0ID0gZGV2bV9hZGlzX3NldHVwX2J1ZmZlcl9h
bmRfdHJpZ2dlcl93aXRoX2F0dHJzKCZzdC0+YWRpcywNCj4gaW5kaW9fZGV2LA0KPiA+ICsNCj4g
YWRpczE2NjA3X3RyaWdnZXJfaGFuZGxlciwNCj4gPiArDQo+ICZhZGlzMTY2MDdfYnVmZmVyX29w
cywNCj4gPiArDQo+IGFkaXMxNjYwN19maWZvX2F0dHJpYnV0ZXMpOw0KPiANCj4gW1NldmVyaXR5
OiBIaWdoXQ0KPiBEb2VzIHNldHRpbmcgaGFzX2ZpZm8gPSB0cnVlIGluIGFkaXMxNjYwN19kYXRh
IGNvbWJpbmVkIHdpdGggYSBsZXZlbC1oaWdoDQo+IGludGVycnVwdCBhbmQgZGV2bV9hZGlzX3Nl
dHVwX2J1ZmZlcl9hbmRfdHJpZ2dlcl93aXRoX2F0dHJzKCkgaW4NCj4gYWRpczE2NjA3X3Byb2Jl
KCkgY2F1c2UgYSBrZXJuZWwgd2FybmluZyBhbmQgYSBsZXZlbC1JUlEgc3Rvcm0gd2hlbg0KPiBi
dWZmZXJlZA0KPiBjYXB0dXJlIGlzIGVuYWJsZWQ/DQo+IA0KPiBXaGVuIGFkaXMtPmRhdGEtPmhh
c19maWZvIGlzIHNldCwgZGV2bV9hZGlzX3Byb2JlX3RyaWdnZXIoKSBpbg0KPiBkcml2ZXJzL2lp
by9pbXUvYWRpc190cmlnZ2VyLmMgcmVxdWVzdHMgdGhlIHBoeXNpY2FsIFNQSSBpbnRlcnJ1cHQg
YXMgYQ0KPiB0aHJlYWRlZCBJUlEgd2l0aCBpaW9fdHJpZ2dlcl9nZW5lcmljX2RhdGFfcmR5X3Bv
bGwoKSBhcyB0aGUgdGhyZWFkIGZ1bmN0aW9uOg0KPiANCj4gCWlmIChhZGlzLT5kYXRhLT5oYXNf
ZmlmbykNCj4gCQlyZXQgPSBkZXZtX3JlcXVlc3RfdGhyZWFkZWRfaXJxKCZhZGlzLT5zcGktPmRl
diwgYWRpcy0+c3BpLQ0KPiA+aXJxLA0KPiAJCQkJCQlOVUxMLA0KPiANCj4gCSZpaW9fdHJpZ2dl
cl9nZW5lcmljX2RhdGFfcmR5X3BvbGwsDQo+IAkJCQkJCWFkaXMtPmlycV9mbGFnIHwNCj4gSVJR
Rl9PTkVTSE9ULA0KPiAJCQkJCQlpbmRpb19kZXYtPm5hbWUsDQo+IAkJCQkJCWFkaXMtPnRyaWcp
Ow0KPiANCj4gTWVhbndoaWxlLCBkZXZtX2FkaXNfc2V0dXBfYnVmZmVyX2FuZF90cmlnZ2VyX3dp
dGhfYXR0cnMoKSByZWdpc3RlcnMNCj4gYWRpczE2NjA3X3RyaWdnZXJfaGFuZGxlcigpIG9uIGEg
c2VwYXJhdGUgdmlydHVhbCBzdWJpcnEgdGhyZWFkIHZpYQ0KPiBkZXZtX2lpb190cmlnZ2VyZWRf
YnVmZmVyX3NldHVwX2V4dCgpIHdpdGggaWlvX3BvbGxmdW5jX3N0b3JlX3RpbWUoKSBhcyBpdHMN
Cj4gdG9wLWhhbGYgaGFuZGxlci4NCj4gDQo+IFdoZW4gdGhlIGxldmVsLWhpZ2ggREVWX05PSyBp
bnRlcnJ1cHQgZmlyZXMsIGlycV90aHJlYWRfZm4oKSBydW5zDQo+IGlpb190cmlnZ2VyX2dlbmVy
aWNfZGF0YV9yZHlfcG9sbCgpIGluIHByb2Nlc3MgY29udGV4dCB3aXRoIGxvY2FsIENQVQ0KPiBp
bnRlcnJ1cHRzIGVuYWJsZWQuIFRoYXQgY2FsbHMgaWlvX3RyaWdnZXJfcG9sbCgpIC0+IGdlbmVy
aWNfaGFuZGxlX2lycSgpIC0+DQo+IGhhbmRsZV9zaW1wbGVfaXJxKCkgLT4gaGFuZGxlX2lycV9l
dmVudCgpIC0+IF9faGFuZGxlX2lycV9ldmVudF9wZXJjcHUoKSwNCj4gd2hpY2ggcnVucyBpaW9f
cG9sbGZ1bmNfc3RvcmVfdGltZSgpIGFuZCB0aGVuIGhpdHMgdGhlIGhhcmRpcnEtY29udGV4dCBj
aGVjaw0KPiBpbiBrZXJuZWwvaXJxL2hhbmRsZS5jOl9faGFuZGxlX2lycV9ldmVudF9wZXJjcHUo
KToNCj4gDQo+IAlpZiAoV0FSTl9PTkNFKCFpcnFzX2Rpc2FibGVkKCksImlycSAldSBoYW5kbGVy
ICVwUyBlbmFibGVkDQo+IGludGVycnVwdHNcbiIsDQo+IAkJICAgICAgaXJxLCBhY3Rpb24tPmhh
bmRsZXIpKQ0KPiAJCWxvY2FsX2lycV9kaXNhYmxlKCk7DQo+IA0KPiBNb3JlIGltcG9ydGFudGx5
LCBfX2hhbmRsZV9pcnFfZXZlbnRfcGVyY3B1KCkgb25seSB3YWtlcyB0aGUgc2VwYXJhdGUNCj4g
cG9sbGZ1bmMNCj4gY29uc3VtZXIgdGhyZWFkIGZvciBhZGlzMTY2MDdfdHJpZ2dlcl9oYW5kbGVy
KCkgYXN5bmNocm9ub3VzbHkgYW5kIHJldHVybnMNCj4gaW1tZWRpYXRlbHkuIGlpb190cmlnZ2Vy
X2dlbmVyaWNfZGF0YV9yZHlfcG9sbCgpIHRoZW4gcmV0dXJucyBJUlFfSEFORExFRA0KPiB0bw0K
PiBpcnFfdGhyZWFkX2ZuKCksIHdoaWNoIGNhbGxzIGlycV9maW5hbGl6ZV9vbmVzaG90KCkgYW5k
IHVubWFza3MgdGhlIHBoeXNpY2FsDQo+IGxldmVsLWhpZ2ggc3BpLT5pcnEgbGluZSBiZWZvcmUg
YWRpczE2NjA3X3RyaWdnZXJfaGFuZGxlcigpIC0+DQo+IGFkaXMxNjYwN19maWZvX2RyYWluKCkg
aGFzIHJ1biBhbmQgcmVhZCBBRElTMTY2MDdfUkVHX0RJQUdfU1RBVCBvdmVyDQo+IFNQSS4NCj4g
DQo+IEJlY2F1c2UgREVWX05PSyByZW1haW5zIGFzc2VydGVkIGhpZ2ggdW50aWwgQURJUzE2NjA3
X1JFR19ESUFHX1NUQVQgaXMNCj4gcmVhZCBpbg0KPiBhZGlzMTY2MDdfZmlmb19kcmFpbigpLCB1
bm1hc2tpbmcgc3BpLT5pcnEgaW1tZWRpYXRlbHkgYWZ0ZXIgd2FraW5nIHRoZQ0KPiBjb25zdW1l
ciB0aHJlYWQgY2F1c2VzIHRoZSBsZXZlbC1oaWdoIGludGVycnVwdCB0byByZS1maXJlIGluIGFu
IGludGVycnVwdA0KPiBzdG9ybSAoYW5kIGNhbiBzdGFydmUgdGhlIGNvbnN1bWVyIHRocmVhZCBv
biBhIHNpbmdsZSBDUFUpLiBJbiBhZGRpdGlvbiwNCj4gYmVjYXVzZSBubyB2YWxpZGF0ZV90cmln
Z2VyIG9yIHZhbGlkYXRlX2RldmljZSBjYWxsYmFjayBpcyBzZXQsIGJpbmRpbmcNCj4gYW5vdGhl
ciBkZXZpY2UgdG8gdGhpcyB0cmlnZ2VyIG9yIHZpY2UgdmVyc2Egd291bGQgbGVhdmUgbm90aGlu
ZyByZWFkaW5nDQo+IEFESVMxNjYwN19SRUdfRElBR19TVEFUIHRvIGNsZWFyIERFVl9OT0suDQo+
IA0KPiBTaW5jZSBoYXJkd2FyZSBGSUZPIGNhcHR1cmUgaXMgdGhlIG9ubHkgYnVmZmVyZWQgbW9k
ZSBzdXBwb3J0ZWQgYnkgdGhpcw0KPiBkZXZpY2UsIHNob3VsZCBhZGlzMTY2MDdfcHJvYmUoKSBy
ZWdpc3RlciB0aGUgYnVmZmVyIHdpdGgNCj4gZGV2bV9paW9fa2ZpZm9fYnVmZmVyX3NldHVwX2V4
dCgpIGFuZCByZXF1ZXN0IHRoZSB0aHJlYWRlZCBJUlEgZGlyZWN0bHkNCj4gaW5zdGVhZCBvZiBn
b2luZyB0aHJvdWdoIGFuIElJTyB0cmlnZ2VyPw0KPiANCg0KVGhpcyBvbmUgY2F1Z2h0IG15IGV5
ZSBhIGJpdC4NClRoZSBtZWNoYW5pc20gZGVzY3JpYmVkIGlzIGFjY3VyYXRlLCBidXQgaXQgY29t
ZXMgZnJvbSBhZGlzbGliJ3MgaGFzX2ZpZm8NCmRpc3BhdGNoIHJhdGhlciB0aGFuIGZyb20gdGhp
cyBkcml2ZXI6IGRldm1fYWRpc19wcm9iZV90cmlnZ2VyKCkgcmVxdWVzdHMNCnRoZSBwaHlzaWNh
bCBsZXZlbCBJUlEgdGhyZWFkZWQgd2l0aCBpaW9fdHJpZ2dlcl9nZW5lcmljX2RhdGFfcmR5X3Bv
bGwoKQ0KZm9yIGV2ZXJ5IGhhc19maWZvIHBhcnQsIHNvIHRoZSBhZGlzMTY0NzUgRklGTyB2YXJp
YW50cyB0YWtlIHRoZSBzYW1lIHBhdGguDQoNClRoZSBleHRyYSBpbnRlcnJ1cHRzIGFyZSB0aGUg
c2FtZSBsZXZlbCBjb25kaXRpb24gYmVpbmcgZGVsaXZlcmVkIGFnYWluDQpiZWZvcmUgdGhlIGhh
bmRsZXIgaGFzIHJlYWQgRElBR19TVEFULiBUaGV5IGFyZSBoYXJtbGVzczogaWlvX3RyaWdnZXJf
cG9sbCgpDQpkb2VzIG5vdGhpbmcgd2hpbGUgdGhlIHRyaWdnZXIgaXMgc3RpbGwgaW4gdXNlLCBh
bmQgdGhleSBzdG9wIGFzIHNvb24gYXMgRElBR19TVEFUDQppcyByZWFkIGFuZCBERVZfTk9LIGRy
b3BzLg0KVGhlIHNhbXBsZSBwYXRoIGlzIG5vdCBhZmZlY3RlZCwgc2luY2UgdGhlIGRyYWluIHN0
aWxsIHJlYWRzIERJQUdfU1RBVCBmaXJzdA0KYW5kIHBvcHMgdGhlIGNvbXBsZXRlIHNhbXBsZXMu
DQpBIGtmaWZvIGJ1ZmZlciB3aXRoIGEgZGlyZWN0IHRocmVhZGVkIElSUSwgd291bGQgcGVyaGFw
IHNhdm9pZCB0aGUgaXNzdWUsDQpidXQgaXQgbWVhbnMgZHJvcHBpbmcgYWRpc2xpYidzIGJ1ZmZl
ciBhbmQgdHJpZ2dlciBoZWxwZXJzIGluIHRoaXMgZHJpdmVyLCBhbmQNCkknZCByYXRoZXIga2Vl
cCBpdCBjb25zaXN0ZW50IHdpdGggdGhlIG90aGVyIGhhc19maWZvIHVzZXJzLg0KDQo=
