Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.135.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793710985;
	b=JkvHCi7KOS6jeJ/zgqL9HVXn5G3w3hRxX/A6pLroxiXcKmQewUxbe368SWmo4vMijtjp
	 9dI4wBbnQns7LsIGMQ01hBueF2wM9szBYuxZjdZVAa1i/gtykGDAjKqq7wLefLPDX9Y1L
	 2p5wHizzjZavo/PrAOQ1UL5MCLPVqPJuBAvV2txcMs/S0Atobq8oxqyv4fL3a4ysfozqu
	 3PH5dPp3EM5s8KpY0hwiOSKfpCzcl+8hrGWsq0zxqdKHGaLio1s5UDcLlPbJ4h/0OJOAQ
	 EfNMQ8WGiSuwg7GVVqx6PK6PXbNsPNtaljCkrvx7upMfY1rZiG43c2JOspqYVuCQtJA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793710985;
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
	bh=j3Lvy1XgrrNXJvziIwgaAIhhPJc1bPhbFFNq0cy3AXI=;
	b=DI/uPxRvuwvnJsVOvro/5Dlxm/1qh+sim6tYHw8krLQ31KQhBJ3/G1P+tumj/8By8xhW
	 AYT8OsbAPZVNE7wJBAsoRTf6leocMaf3p0QhPVasPPZmLWtmAcEay5AADe0brRfXfcG3O
	 4KjWRNrVf48X2ugYu4qnlD3/TkW431FLjSAn2BrNoywdpNElyfhkb60AJe1y5omxTJQRa
	 O4GhLnVv5TfTvhjJqJRVlK+MdNOQGOXTdHl31PaKjL3zYXgXSN4A+Cei5tnmSSA35dCI8
	 MAEuvG8RpGq01Hdx315pw51GgEN8MsTAj3wl4vDDiFo0Cx0rp7YPMtbXVb9vt0Rxk/g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=Z0iIKdmA;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=IXFayvIb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.135.77
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56EB606D801;
	Tue,  3 Nov 2026 13:03:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B56EB606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=Z0iIKdmA;
	dkim=pass (2048-bit key, unprotected) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=IXFayvIb
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3Cln3p2650583;
	Tue, 3 Nov 2026 08:03:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=j3Lvy1XgrrNXJvziIwgaAIhhPJc1bPhbFFNq0cy3AXI=; b=Z0iIKdm
	AneDPkknjrdBG1CuLLKr2RZyVJ18ACfQAtmGssaiGGrcV92JWossbZaZ0YITRJhN
	NR2ZT8USgBy2iMZzR81nDslM4Do5BtvAxbo3X6SrPcodmZcU0qbQgEWHaxEeSnl5
	mq2aPCiYGW4aziJUcS+scW7jgOEpTBW1UFOt60paEOGATefjJMrAAKF+4Oz5xnxh
	WIXci7Jabd425M8ofNuvufR28GfPjGCueNIBmDANvl159OZE6lDjTIjukORfkubE
	h5PLAwBij3oH6efFeM4nwXag0xxpTnZbGe044D3Kn8imV1ygF8/3ZvJKcO0l+RhL
	j3rKdkI1IJbmSdA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=j3Lvy
	1XgrrNXJvziIwgaAIhhPJc1bPhbFFNq0cy3AXI=; b=IXFayvIbV+BBhRgwgXiR4
	lSMnvL3PKmDSoXunBeQzvJcijnE/U0mBIwAyDUgk2U97QoiwsolBdWvJQHeI8YqO
	LwiuOgeciYuwDTRUBuQ8suNDDqMJQHAQfhF+mi71lF/uCXmZpTvtDlVKP5zKQjff
	yNDKEwY9M6K/0+xfCLcwxehmzpYLtDJxj6nYTwWDag2q+qdhM+5p4+uJtjjE0+xM
	YAVMosZXX+J2wAspwMVN3h+WA034Fu18th7eCMdbBctm3ZsfP8OnRQhwvEuT3zvv
	7YkksRdsgf0+HoStGSJdBgRKUebo8l+X8QLnCd5RUz/+GpyxSP+sw4ziHAv0DDBJ
	Q==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011026.outbound.protection.outlook.com [40.107.208.26])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4hq0trvwfa-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 03 Nov 2026 08:03:00 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O7AioWT/WZLaXUVvJys7iW2qxBzph/q8uZTlvMRxpF8clqQ9sBRy8bMgmdP+22Uwb2gxdho1F95y9l5fqnCnbWOG/lER3CZRZoEjjETyTMVXopmcaz3fzsDOnNUBz/sf+QsHCh3K2CecWJnUB/LeDt0VOdZYL1eWycg+2S9ilQ3Oz/VXpwdwftFJyQ1+v1TSRTC4wJLvnRDfzbVRxohtDWu3hmbId/Uy9bFMHaIJqQ2WpmZuiH43qrPVM8ywT4RNGECTZ5gbipUzflLxAyJ4uS/3cscFDjM/+texqzFh/G4Qjfhg1QzGSyloucKrrQvRJV8XFfFbl+Cw0k/uA+QHwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j3Lvy1XgrrNXJvziIwgaAIhhPJc1bPhbFFNq0cy3AXI=;
 b=ghdP1nlWbMK3VnoLWDH2e10B9T7HUV/JvVfyeBFISxNGJ24EJ35TuUTdxjNLEA53H3dUTT1kxbpW+quPgxKRegqJ8UBAHv8aIAlCBmqPiD/KZW0BBrs11mmel243zMekwv3eWtig78CaVc/uqQAkIuXqkefywrnE7M9hZn2zgKBevukAXiQUZH1o84Wb6WGODb19fRKiaBvoFz0REeuSe3+x7yWIk62WfhaugNOnpMfTq15dfd8r3C5M1Iahe4APjKtf9y/nGYS+O7f1dsPU6vl5qnSAP/na8xw2lJfMBPpOAzdhITSyPFiG8MKoW6WNflzPCmn5hqS0xzzaCLdfQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from LV9PR03MB8414.namprd03.prod.outlook.com (2603:10b6:408:367::23)
 by EA8PPF24EE45EA1.namprd03.prod.outlook.com (2603:10b6:30f:fff5::847) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 13:02:57 +0000
Received: from LV9PR03MB8414.namprd03.prod.outlook.com
 ([fe80::d661:7c16:d052:cc81]) by LV9PR03MB8414.namprd03.prod.outlook.com
 ([fe80::d661:7c16:d052:cc81%2]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 13:02:57 +0000
From: "Sabau, Radu bogdan" <radu.sabau@analog.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "robh@kernel.org" <robh@kernel.org>,
        "conor+dt@kernel.org"
	<conor+dt@kernel.org>
Subject: RE: [PATCH v5 7/8] iio: imu: adis16607: Add external clock sync
 support
Thread-Topic: [PATCH v5 7/8] iio: imu: adis16607: Add external clock sync
 support
Thread-Index: AQHdaqwpS2sVGk8qfUCbOpP3umfWircah6UAgAHJ2BA=
Date: Tue, 3 Nov 2026 13:02:57 +0000
Message-ID:
 <LV9PR03MB841491B8FE60377D884EE974F7692@LV9PR03MB8414.namprd03.prod.outlook.com>
References: <20261102-adis16607-v5-0-4f98b0d271ac@analog.com>
 <20261102-adis16607-v5-7-4f98b0d271ac@analog.com>
 <sashiko-outbox-193198@kernel.org>
In-Reply-To: <sashiko-outbox-193198@kernel.org>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV9PR03MB8414:EE_|EA8PPF24EE45EA1:EE_
x-ms-office365-filtering-correlation-id: 99420dc6-b303-4d79-cd40-08df39aac7ea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|10070799003|18002099003|56012099006|22082099003|261009223027099003|261022105027099003|38070700021|4143699003|11063799006|10067099003|261028144727099003|261026121527099003|261026140227099003;
x-microsoft-antispam-message-info:
 qRs/IqrRRMxvpd7jJ+RAijasgUWV3xIAZhhkZW6qu+lnttJRJT13C/MDVevl1PSD4KYuyj1c7UduFLvvyexiea+iTT99rLzxvGv4MQRVOle/oWgHDNoBuRF6ER45M36kR/EdstQ7YayDbfDJB/e1yASxlkGc6oOEM0ZTljsqUkaE3rnT2pDCiKUzHpxR8aZkoDYvq3hfh56YWN668wajCrP1YdSfm4JRZIv57BpHRC6h6VPOgjnNPnkqkXO4nssh+48wyLI74CEknMbCMIMuosZX8bYG2twFys0d0zU6wd+tZ0l0G4OShxXwH04YKAnCJZ8+dt7nGNMolhSrT7P5XUTkoYeiyolgZJhE2+lrYDQfzz+GWqXs2PLd96Lo15tBLygkJpKs0/cpBWK+F+4vJgSOQWosstlfMv0nFTa/YOdw5HUcfWpB2tV14aeEqkUKiEx/DlpdWPC1sQng5vOlpduuEPF+dCrlwUgHNEGDSNqYHl0tHLREBqKQ3wodcFr1PoLx/EYGHKE1norR7m4Xk+2lf0J8+xB4fDVNGbDtXEDPxHzwf9UDvlSIz8zIuN3mzuQd6zyAIMhJ5mkuUCVjhEUFkUg9eMVmLzDbo2w79P0CFBtv+JOH9PtwXllSDbufnHm0cYXFe1RnMmMnKHPhox2GNezstyH63qDHsmjwj3Nkev/Zy4dZElsCPyU8lieKdtGm/krjkpDP74fg6tjsX4ouKZU52Hl2LzW0yZL/l18=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV9PR03MB8414.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10070799003)(18002099003)(56012099006)(22082099003)(261009223027099003)(261022105027099003)(38070700021)(4143699003)(11063799006)(10067099003)(261028144727099003)(261026121527099003)(261026140227099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RFkwdFN2emRXOUgrUmk2QjFxelhpcGJEejFWaWJ1cG9BMWhKZ1gxQldCQ2Za?=
 =?utf-8?B?K211ZXhrb3c0TkJtMU80VjdjUk4zeCtvc09laHV4RFJiMDRubERmK0hhNEw3?=
 =?utf-8?B?alJ0Rk9ETG0yR0Z6ZHV5azBnS1F6MU5ySFlrSWhJQjBraEg4d3NwTlpsazhz?=
 =?utf-8?B?bVJ6a1NzTHFKZjBzWnpmdFVOeDZnbGRQUWhOb0pOa0F5N1oyMWVKSTN5TE9B?=
 =?utf-8?B?NTgwZlRJNG1wUmdPcHFicHFlNExlU1JPZWdFdVY5V2RHSkpqWms5UU4vYzk1?=
 =?utf-8?B?MDBsRzEwYW40SUtZaXNBWWhGMnppL1ZPUXVnVElQNkFDSTR4VzB0VGhZVjVP?=
 =?utf-8?B?MWJRUExjV0wvbDhXd0kzbmhzRFVMUlVEdmFCQkpwbjUwWGM0RUNjTkxoMFZt?=
 =?utf-8?B?bDdZTS9YUC92bmh5b2V4bTgvcHpIQjYzUTNjcXhET295djZMd2JjbU9YNSt3?=
 =?utf-8?B?QW1mbGlUQ0hGbDlFZXVtSUpmYWlRNk1oWlhZbkE5OUtwWFlKVWFOdzBqdkNo?=
 =?utf-8?B?R2pMMTVIZWRPVlppbGdoR2tmeWZlVUt1b2FNN2d0WmhTUDZxdEhQd0krSXht?=
 =?utf-8?B?MG9paGorSDFjY2k3WGszZGlqT2VDTWlNSFgxbUw2elhJeDZTUXhDKzBaMlV1?=
 =?utf-8?B?MWE4T2w4V1lSMnNmTlVOWXNTOHVGOFJGQVpkOWVxS3lLYVY5NkNHT2lhbVJ2?=
 =?utf-8?B?bTZsc0RiVElCK25teFRWNDVWOWRDYWVCVzNxeUt4WHpNQ3liak4vYzljWlBy?=
 =?utf-8?B?MXlub0p4akN5UmJvcHVVZU1tYWRuR1VuNHVCVlZ0blY2Um1ySnRQNVNSZUhu?=
 =?utf-8?B?ZVc0eE4wbTFBRlBmQk9UODFNaEZxeTV1ZW5EdldDcWpkYWhCUGdsc0g4aEhj?=
 =?utf-8?B?SmFxeTNFaWM0T1Vudm5NWStxWmJzdm9rNVF6TkIrQ1ZPU2RXV2p0UklRb0NB?=
 =?utf-8?B?K200U2xNKzI2K1B6NzB1WjZvUXRHSVhQYUkwQ0JJdXFSRFZvdWhMT2dMRDhP?=
 =?utf-8?B?aVRaZUk2WWk2em1BZnk2ZUtvdSt0bk01YkYyZE4zWFc3WiszL2dpTk5JZG92?=
 =?utf-8?B?ckZRYnFyMjhrRWFvQWVORDREWStMbEtndDZhVFRhNGd3ZnU0cVhOOUtvYzY0?=
 =?utf-8?B?UnJlallvSEJSK0tVV0p4VW9STmFwOWxzNzdzeFFjd2ZlWm5aR3huTW1PK3Jk?=
 =?utf-8?B?UmlyZlpHVm51ZWFqNHVqY21jajBYTERYV0wvSnVwbGR1ZEdvazhZZmx2djYv?=
 =?utf-8?B?ZlpqanFPeWF0Z1ZJeUFMS2kzb3RpckhFS3VWRCthelYyRWJKQjRHT3ZhY0la?=
 =?utf-8?B?UXdkeHR2N0FaQ0piL0kweXVEeEtEZ2R0dHlXVVRlTkxMM3AvelJtRkFaTWFy?=
 =?utf-8?B?d3hwL3IzOE1LSkJ5cUVMRSs4eEt2aDhZSS9FajFYbUh5THgxalFhaHBTVDZt?=
 =?utf-8?B?VUh4Wk1JbHpUOWVBcVhuSlhESFYrRFRjZ29sY1F2UmEvR0tLbGsxNThKK0s1?=
 =?utf-8?B?MFNCb2hzVmdvdlNFMVlhamlJNUY5UXVKeDJ0SnpnOVJJNDJvWThOU1MrYkdS?=
 =?utf-8?B?ZkU2RjlSd2ZpK0Z2SGtzYUVRT0ZldDQ5L2V0elBjdVMvQndpZUZEMFhNbkty?=
 =?utf-8?B?dHB6QU9ENVM5Ump1V2lpOElON091SFNoNlVqQUk4L1YzMmI3MEszN1BrSjV0?=
 =?utf-8?B?L2JkcE9jak44Y2szTEpTdkJwc3VacjZIdWh4aHd1OFVHSlhpUzE3Sy9JbS9t?=
 =?utf-8?B?OVFEVFVsZVFINkNrUlJwMkN1T0MwNEVTV2xBQnREZWdabUwvWE5NSzJjdHRR?=
 =?utf-8?B?aU5Obm91a2I0anFuTnQ0cFE2VGhjbmhkWFdYTDlCNVR1R1NFL05VYjFDOUd6?=
 =?utf-8?B?MUppS0NpQTJkZllpTmtPaTdxMmxFeC9yb2FndFNuR3VNZGMrcGRaSC9QdHJ5?=
 =?utf-8?B?VHdIUHJ2QjUzQTFpK2Q5OXpIN01YbjZxSURjUWpyWTIzZTlySWpJRm5IY3l4?=
 =?utf-8?B?QTBEZFFJVnFKYTNyb3VYTWNFbUF6WHhTejBhaDZVK1Izd2hiSThHaGFaNTln?=
 =?utf-8?B?T2hoUWxmMGFRZW5oTktGV2U5eGhhdE1FYTZiNzdnM1ZLd1Zhc2ZCdkptUlF6?=
 =?utf-8?B?MTNLWWdGTlFjUVFkcmlVTlFuSGJCWXdaYUIwK29OTHU4UjBFaHdlUnRRWnRF?=
 =?utf-8?B?Y01aVW9VNEhXU1VVTnJOYjZBbnRlaTJ4MS9CWlRnTWlYNlBVSW1kY1hna240?=
 =?utf-8?B?VkgvOGVqZmJTcDZjME1PYTU0d1dHYlBFQ3hOMk5lNjJsSGJkeU1ZdFRERExK?=
 =?utf-8?B?WTVieEJzRFYvczlFSmFoNGFqanRURlhvMVNZZ0h1eGFBNXJiVHNRWEUrYmhw?=
 =?utf-8?Q?AsydCJc42NdhiZ8+7wAvYUwQKFg6C1P8+ZmFv+YyaSDpk?=
x-ms-exchange-antispam-messagedata-1: GNFbKYHHmAFGfg==
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
	sNPeADQ74f16GPeHSv8C9+RJNIuC/BumVFHv9AN1AJMACNTeHWkpMTSdLakq2FPKzKRakkokcM8ee8Ld5CTuRoFbDKaBtthdcC79DE+5+hSy9+GsCZbMgOSjgzC3N5egX74uVzBfnPXRvW1gcdwVRRF8KnOu9Yr8i7FOMui6C9trunDpnWt9mhZhLUFfMn7gE/sCXgcnAsfVOmTLDRV4Avn/2+YTxVH5X2NMNExnZQYKHQ/mhtY7YcE/jEJX7MzbsfGKCkJu46lOffxKYA7mlV7iZ3DGHO7yTizQl26NgyPqaYHhmC4ceTKQr7UY2V/0bPnhWd8LyQc9SX4buhEgSw==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV9PR03MB8414.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99420dc6-b303-4d79-cd40-08df39aac7ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2026 13:02:57.0892
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n1vHIOLfojmWh7OTfFFHOElh1xxaOSQoQ1DCk+Gc1N1nTIvWZUXAlI+YGH8Gz5uURrgroHuHN1RPEu6ly88Mlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EA8PPF24EE45EA1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1MCBTYWx0ZWRfX1BANEjYFeyca
 p6zBRXRxnty6ocr+tuPmJsYEcS4WQeSXDT/w0B0ChAscShOctEyXrPScampJZIbu/iJeVyy5nEW
 SGxcMq/y9+miKcyBYhRZDyVXK5l6MyyHqh1xPurvYUSNmXb+cSSDzyKvRq9gP3TD9MEBTzeHVmI
 J0xzLxGDK6GwY1qLMMsOr/ercoMAb8eaFJdx6XmlXV5n4yQHjSH5Qt90125sY3oIeRn8KtFVlEj
 UBeNvWGhbuVB4mxQzbiG43nCcWxkqjy3kE5pd9YQRsbqjox92/MBVHwh0FSQ3dOXsmLdhXflK0x
 T5A6WaZ0NkWS5quTSp6Mqc795fdj5iPUiDMyFkC3H28aYidjEUO/QP/9SL7FlekzgZdTeDyVeu8
 VWm739J9mO7HuU6bp3yzngu550L9WfOvXIPh8sdarBFEYOH2a3exCePnHFWrZGDTaj2XsZ3Wnrx
 RdtA4aQCu/P36qThNbw==
X-Proofpoint-GUID: y-NuN5lNxQ1XjaXxLZE4H1CZ_qaoZrCC
X-Proofpoint-ORIG-GUID: y-NuN5lNxQ1XjaXxLZE4H1CZ_qaoZrCC
X-Authority-Analysis: v=2.4 cv=P/OvFSAu c=1 sm=1 tr=0 ts=6ae9db84 cx=c_pps
 a=uRIsUzfalb69z9iYDTnHFQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=N--XFCr6TIEc_64PeIT2:22 a=VwQbUJbxAAAA:8 a=j3y-iILTKU29pZGDRLoA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1MCBTYWx0ZWRfX+IZvjyZa1P2r
 J/vvDiC3hn6EZYfq3ucs01c8FjJfOVuBvhWOY0tEEskZ4g3CM4x35GWt4J/gTM+GqAHFXQpuzB8
 2WLTnSshm2+qrKx95OwOdA8umICFfFfeFhAxxagJP3qgsBnqremH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030050

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBzYXNoaWtvLWJvdEBrZXJuZWwu
b3JnIDxzYXNoaWtvLWJvdEBrZXJuZWwub3JnPg0KPiBTZW50OiBNb25kYXksIE5vdmVtYmVyIDIs
IDIwMjYgMTE6NDMgQU0NCg0KLi4uDQoNCj4gQURJUzE2NjA3X1NZTkNfTU9ERV9NQVNLIHwgc2Nh
bGUpOw0KPiA+ICsJCQlpZiAocmV0KQ0KPiA+ICsJCQkJcmV0dXJuIHJldDsNCj4gPiArDQo+ID4g
KwkJCXN0LT5zeW5jX3NjYWxlID0gc2NhbGU7DQo+ID4gKwkJCXN0LT5jbGtfZnJlcV9tSHogPSBj
bGtfZnJlcV9tSHo7DQo+ID4gKwkJfQ0KPiANCj4gW1NldmVyaXR5OiBNZWRpdW1dDQo+IE5vdyB0
aGF0IHN0LT5jbGtfZnJlcV9tSHogaXMgdXBkYXRlZCBhdCBydW50aW1lIHVuZGVyIHN0LT5hZGlz
LnN0YXRlX2xvY2sgaW4NCj4gYWRpczE2NjA3X3NldF9mcmVxKCkgd2hlbiBvcGVyYXRpbmcgaW4g
QURJUzE2NjA3X1NZTkNfU0NBTEVEIG1vZGUsDQo+IGNhbiBhDQo+IGNvbmN1cnJlbnQgc3lzZnMg
cmVhZCBvZiBzYW1wbGluZ19mcmVxdWVuY3kgcmFjZSB3aXRoIHRoaXMgdXBkYXRlPw0KPiANCj4g
SW4gYWRpczE2NjA3X3JlYWRfcmF3KCkgLT4gYWRpczE2NjA3X2dldF9mcmVxKCk6DQo+IA0KPiAJ
cmV0ID0gYWRpc19yZWFkX3JlZ18xNigmc3QtPmFkaXMsIEFESVMxNjYwN19SRUdfREVDX1JBVEUs
ICZkZWMpOw0KPiAJaWYgKHJldCkNCj4gCQlyZXR1cm4gcmV0Ow0KPiANCj4gCSpmcmVxID0gRElW
X1JPVU5EX0NMT1NFU1Qoc3QtPmNsa19mcmVxX21IeiwgZGVjICsgMSk7DQo+IA0KPiBhZGlzX3Jl
YWRfcmVnXzE2KCkgcmVsZWFzZXMgc3QtPmFkaXMuc3RhdGVfbG9jayBiZWZvcmUgc3QtPmNsa19m
cmVxX21IeiBpcw0KPiByZWFkLCBhbmQgYWRpczE2NjA3X3JlYWRfcmF3KCkgZG9lcyBub3QgY2xh
aW0gSUlPIGRpcmVjdCBtb2RlIGZvcg0KPiBJSU9fQ0hBTl9JTkZPX1NBTVBfRlJFUS4NCj4gDQo+
IENvdWxkIGFkaXMxNjYwN19nZXRfZnJlcSgpIGhvbGQgc3QtPmFkaXMuc3RhdGVfbG9jayBhY3Jv
c3MgYm90aA0KPiBfX2FkaXNfcmVhZF9yZWdfMTYoKSBhbmQgdGhlIGRpdmlzaW9uIHVzaW5nIHN0
LT5jbGtfZnJlcV9tSHogc28gaXQgY2Fubm90DQo+IHBhaXIgYSBzdGFsZSBvciBpbnRlcm1lZGlh
dGUgemVybyBBRElTMTY2MDdfUkVHX0RFQ19SQVRFIHZhbHVlIHdpdGggdGhlDQo+IG5ldw0KPiBz
dC0+Y2xrX2ZyZXFfbUh6IChvciB2aWNlIHZlcnNhKT8NCj4gDQo+ID4gKw0KPiA+ICAJCWlmIChk
ZWMpIHsNCj4gPiAgCQkJcmV0ID0gX19hZGlzX3dyaXRlX3JlZ18xNigmc3QtPmFkaXMsDQo+ID4g
IAkJCQkJCSAgQURJUzE2NjA3X1JFR19ERUNfUkFURSwNCj4gZGVjKTsNCj4gDQo+IFtTZXZlcml0
eTogTWVkaXVtXQ0KPiBJbiBhZGlzMTY2MDdfc2V0X2ZyZXEoKSwgX19hZGlzX3dyaXRlX3JlZ18x
Nigmc3QtPmFkaXMsDQo+IEFESVMxNjYwN19SRUdfREVDX1JBVEUsIDApIGNsZWFycyB0aGUgaGFy
ZHdhcmUgZGVjaW1hdGlvbiByYXRlIHRvIDAgYXQNCj4gdGhlDQo+IHN0YXJ0IG9mIHRoZSBjcml0
aWNhbCBzZWN0aW9uLCBhbmQgaWYgc2NhbGUgIT0gc3QtPnN5bmNfc2NhbGUsDQo+IEFESVMxNjYw
N19SRUdfVVNFUl9TWU5DIGFuZCBzdC0+Y2xrX2ZyZXFfbUh6IGFyZSBhbHNvIHVwZGF0ZWQgYmVm
b3JlDQo+IHRoZSBuZXcNCj4gZGVjaW1hdGlvbiByYXRlIGlzIHdyaXR0ZW46DQo+IA0KPiAJYWRp
c19kZXZfYXV0b19zY29wZWRfbG9jaygmc3QtPmFkaXMpIHsNCj4gCQkvKiBSZXNldCB0aGUgZGVj
aW1hdGlvbiBhY2N1bXVsYXRvciBiZWZvcmUgdGhlIG5ldyB2YWx1ZSAqLw0KPiAJCXJldCA9IF9f
YWRpc193cml0ZV9yZWdfMTYoJnN0LT5hZGlzLA0KPiBBRElTMTY2MDdfUkVHX0RFQ19SQVRFLCAw
KTsNCj4gCQlpZiAocmV0KQ0KPiAJCQlyZXR1cm4gcmV0Ow0KPiANCj4gCQlpZiAoc2NhbGUgIT0g
c3QtPnN5bmNfc2NhbGUpIHsNCj4gCQkJcmV0ID0gX19hZGlzX3dyaXRlX3JlZ18xNigmc3QtPmFk
aXMsDQo+IA0KPiBBRElTMTY2MDdfUkVHX1VTRVJfU1lOQywNCj4gDQo+IEFESVMxNjYwN19TWU5D
X01PREVfTUFTSyB8IHNjYWxlKTsNCj4gCQkJaWYgKHJldCkNCj4gCQkJCXJldHVybiByZXQ7DQo+
IA0KPiAJCQlzdC0+c3luY19zY2FsZSA9IHNjYWxlOw0KPiAJCQlzdC0+Y2xrX2ZyZXFfbUh6ID0g
Y2xrX2ZyZXFfbUh6Ow0KPiAJCX0NCj4gDQo+IAkJaWYgKGRlYykgew0KPiAJCQlyZXQgPSBfX2Fk
aXNfd3JpdGVfcmVnXzE2KCZzdC0+YWRpcywNCj4gCQkJCQkJICBBRElTMTY2MDdfUkVHX0RFQ19S
QVRFLA0KPiBkZWMpOw0KPiAJCQlpZiAocmV0KQ0KPiAJCQkJcmV0dXJuIHJldDsNCj4gCQl9DQo+
IA0KPiAJCXN0LT5zYW1wbGVfcGVyaW9kX25zID0gcGVyaW9kX25zOw0KPiAJfQ0KPiANCj4gSWYg
dGhlIHdyaXRlIHRvIEFESVMxNjYwN19SRUdfVVNFUl9TWU5DIG9yIHRoZSBmaW5hbCB3cml0ZSB0
bw0KPiBBRElTMTY2MDdfUkVHX0RFQ19SQVRFIGZhaWxzLCB0aGUgaGFyZHdhcmUgaXMgbGVmdCBy
dW5uaW5nIHdpdGggREVDX1JBVEUgPQ0KPiAwDQo+IChhbmQgcG9zc2libHkgdGhlIG5ldyBzeW5j
IHNjYWxlIGFuZCBzdC0+Y2xrX2ZyZXFfbUh6KSwgd2hpbGUNCj4gc3QtPnNhbXBsZV9wZXJpb2Rf
bnMgcmV0YWlucyBpdHMgb2xkIHZhbHVlIGZyb20gYmVmb3JlIHRoZSBjYWxsLg0KPiANCj4gV291
bGQgdGhpcyBjYXVzZSBhZGlzMTY2MDdfZmlmb19kcmFpbigpIHRvIGNvbXB1dGUgc2tld2VkIHNh
bXBsZQ0KPiB0aW1lc3RhbXBzDQo+IG9uIHN1YnNlcXVlbnQgYnVmZmVyZWQgcmVhZHM/DQo+IA0K
DQpCb3RoIGFyZSB2YWxpZC4NCg0KZ2V0X2ZyZXEoKTogY2xrX2ZyZXFfbUh6IGJlY29tZXMgbXV0
YWJsZSBpbiB0aGlzIHBhdGNoLCBzbyByZWFkaW5nIGl0IGFmdGVyIHRoZQ0KcmVnaXN0ZXIgcmVh
ZCBoYXMgZHJvcHBlZCB0aGUgbG9jayBjYW4gcGFpciBhIHN0YWxlIChvciB0aGUgdHJhbnNpZW50
IHplcm8pIERFQ19SQVRFDQp3aXRoIHRoZSBuZXcgY2xvY2sgcmF0ZS4gSSdsbCB0YWtlIHRoZSBs
b2NrIGluIGdldF9mcmVxKCkgYW5kIHJlYWQgdGhlIGRlY2ltYXRpb24gYW5kDQpjbG9jayByYXRl
IHRvZ2V0aGVyIGZyb20gZHJpdmVyIHN0YXRlLg0KDQpzZXRfZnJlcSgpOiBhZnRlciB0aGUgREVD
X1JBVEUgcmVzZXQsIGEgZmFpbGVkIHdyaXRlIGxlYXZlcyB0aGUgaGFyZHdhcmUgYW5kIHRoZQ0K
Y2FjaGVkIHNhbXBsZV9wZXJpb2RfbnMgb3V0IG9mIHN0ZXAuDQpSYXRoZXIgdGhhbiByZWZyZXNo
aW5nIHRoZSBjYWNoZSBhZnRlciBldmVyeSBzdGVwLCBJJ2xsIGtlZXAgdGhlIGN1cnJlbnQgZGVj
aW1hdGlvbg0KaW4gdGhlIGRyaXZlciBzdGF0ZSwgdXBkYXRlZCBhZnRlciBlYWNoIHN1Y2Nlc3Nm
dWwgd3JpdGUsIGFuZCBkZXJpdmUgdGhlIHNhbXBsZQ0KcGVyaW9kIGZyb20gaXQgd2hlcmUgaXQg
aXMgdXNlZCwgc28gdGhlIHN0YXRlIGFsd2F5cyBtYXRjaGVzIHdoYXQgdGhlIGhhcmR3YXJlDQp3
YXMgbGVmdCBpbi4NCg0KV2lsbCBmaXggYm90aCBpbiB2Ni4NCg==
