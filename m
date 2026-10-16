Received: from dispatch1-us1.ppe-hosted.com (dispatch1-us1.ppe-hosted.com [148.163.129.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD8064A8C
	for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 00:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.129.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792112147; cv=fail; b=RsEeGLoaIXZzUE57I5q6vUKsXGohdaDWJ0DvXjH0sgWFTPF/wubQfiDhwenCh/VmYKZfT3VzrYJ0bkQAV3kf5OZtChBIAMlw5Pj3VaZdj2t+nEtbPbi54jMq01LPlxuO+9vFVFLua1dmrHqN1VTykYw/429pxIxGAFHOzbmUD5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792112147; c=relaxed/simple;
	bh=yZV4bx+gDhfJuAW2U0ClM18zSw+nTrZR9aXQvbP/ZoY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pkAWdSacCXMvLNjVxzGOrpVmRcyUL/l8jd2qKWSmN1o269uYyH7vY9amDliSl3iHQyUO9lCcE3t2wjH314AZECBmKmBQTR9QW+TQKmdqbxrLiJAB035B7cvApEOIC/cjy1lqyWiD0RH8dEg7ewUjpyrXmKIJCGlyQjnIzTnnJNM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sitime.com; spf=pass smtp.mailfrom=sitime.com; dkim=pass (2048-bit key) header.d=sitime.com header.i=@sitime.com header.b=NnQhJydC; dkim=pass (2048-bit key) header.d=Sitime.onmicrosoft.com header.i=@Sitime.onmicrosoft.com header.b=uEKXgtcr; arc=fail smtp.client-ip=148.163.129.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sitime.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sitime.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sitime.com header.i=@sitime.com header.b="NnQhJydC";
	dkim=pass (2048-bit key) header.d=Sitime.onmicrosoft.com header.i=@Sitime.onmicrosoft.com header.b="uEKXgtcr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sitime.com;
 h=cc:cc:content-transfer-encoding:content-transfer-encoding:content-type:content-type:date:date:from:from:in-reply-to:in-reply-to:message-id:message-id:mime-version:mime-version:references:references:subject:subject:to:to;
 s=mail; bh=yZV4bx+gDhfJuAW2U0ClM18zSw+nTrZR9aXQvbP/ZoY=;
 b=NnQhJydCANGDadxYjNT4zJ36RYwjTKmsqz8PhDAuXypNOKjIB+BjQ0wFk1BUFyB0XGVWiGAqt09+gga48TcWWsEyaVO/8VGzVvrkxFSCx40Nbn+2TP2ga3B00ZbA6paYxrgYNWG2rdyraqpSNFSZEfDlw38Pip0eXcHjeVB8lfGBJiKI3TLmVg9tMdaASxZ0mzlPWR4vFgxuRT5nmlWiUXW1vRNYbZKZvBtKpTmm5SLv20wR/wsQrJBfBmuN/ugAgXU1WSGXQt3t6f6qs8xnjbAeyFhawuQC+4tptne6GDpPrpl6f1FSQWivlroyD+i4+Zwvt5QTsLaHjfp1RRysyA==
X-Virus-Scanned: Proofpoint Essentials engine
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11020125.outbound.protection.outlook.com [40.93.198.125])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTPS id 4F74CC006F;
	Fri, 16 Oct 2026 00:55:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d+DaoLVR6nwaxjW6TnC6e25M0mwagvzjdXJ/XzkVRwdDxSlNZi0jFrUuFI3WmQnbuwUiS++zhxu3teedC8LU3P8Zq60fKf81RoNgPXVzbGtc7mT8fQegvtTL+drEN/GxSOoE6FMQfDkbNdqmTP0pVQex3JPnZoW/wIExMRJ+09GKHRaYg1zhbKBP3cBt//qURXC7x11u+BU63fottcUHdnDqhSSxYeb/gez287z19HbGMBIp/aIRpF7j9yy2Afqmw7jUBFOV1WtNeQWcx/wqDTqr9UijSCiYNEKsRFf1KK9FlLWcxrwKV4vvQbK8uQa1nAfH55mmjckphaLqnVedww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yZV4bx+gDhfJuAW2U0ClM18zSw+nTrZR9aXQvbP/ZoY=;
 b=YlQBWwXl6ZxXcBqrVmxDfjrsgdVflhjEKDmY/9S6SNVL/eDvNKielV7Qc0mla/2toBdelfSq4LmhyJxEiS3u2+UvWRqyB1wUkh/pKfrD3kATtaUEuFghPL/S1e7fB+e/0CnVuAK1lWXOCzp6dibyxjQxR1UZchbGKRad/UUlYpPOTeSYFnHmYsF7lQENlYHQa6hLK9WABOlBfsMKAzTcL7SQyLfqzudD+ime+HxG+yWvJWD8Nrtys1rWlLhBztS6QISm3dNFe27GFyZy5tEfHevOezN0aR97L6c3pFdc97Q7OTOHDyU8yQ3Yw3yhTzn4Y8p3QgqQVqVY2x/hynEP/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sitime.com; dmarc=pass action=none header.from=sitime.com;
 dkim=pass header.d=sitime.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Sitime.onmicrosoft.com; s=selector1-Sitime-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yZV4bx+gDhfJuAW2U0ClM18zSw+nTrZR9aXQvbP/ZoY=;
 b=uEKXgtcrmVcFPOWfL/J+yaAOT/KsDQh1teq3JYeL9CNA3ltVuj3DiZddG1EV09xq/5SV61C10fSpkw6WBHkFSf5HJSa6AuyqAtsQXiGNWXyL023hcIAWeZCUn4ZwVWCpfZ6nBr8xmOBURgDX691ntWHDerkuuNcAg2sVxXY3nQIurg7XKggXXFmU8jmfP+wsobrMfZelT0dTjb6loKbaI7qJKnoyZPesWhC85d/n3sminmoMT2Hu78FWsQ9QZTyEauGE9Q9SJiVx/5LRDuq1Pfn6aXYz/v6XImStZV4udj/1pRcPUCVuf+9gEUfJer1mQUQDEsKcnoPGTnIcAPZlng==
Received: from LVWPR20MB994915.namprd20.prod.outlook.com
 (2603:10b6:408:3bf::16) by MN0PR20MB4789.namprd20.prod.outlook.com
 (2603:10b6:208:3c7::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Fri, 16 Oct
 2026 00:55:42 +0000
Received: from LVWPR20MB994915.namprd20.prod.outlook.com
 ([fe80::9551:3864:128b:8c01]) by LVWPR20MB994915.namprd20.prod.outlook.com
 ([fe80::9551:3864:128b:8c01%4]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 00:55:42 +0000
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
Subject: Re: [PATCH net-next v13 02/12] dt-bindings: dpll: add SiTime SiT95316
 clock generator
Thread-Topic: [PATCH net-next v13 02/12] dt-bindings: dpll: add SiTime
 SiT95316 clock generator
Thread-Index: AQHdW2P/9ZE6kK9KDUy1mF8AMssy67b9o5uAgAG3uAA=
Date: Fri, 16 Oct 2026 00:55:42 +0000
Message-ID: <20261016005541.11374-1-arouhi@sitime.com>
References: <20261013224131.27149-1-arouhi@sitime.com>
 <20261013224131.27149-3-arouhi@sitime.com> <sashiko-outbox-171992@kernel.org>
In-Reply-To: <sashiko-outbox-171992@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sitime.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LVWPR20MB994915:EE_|MN0PR20MB4789:EE_
x-ms-office365-filtering-correlation-id: cbe35ef2-2661-4e09-32f3-08df2b20346a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|38070700021|261009223327099003|56012099006|261009223027099003|261009221727099003|4143699003|261009220027099003|261009221227099003|18002099003|10067099003|22082099003|3023799007;
x-microsoft-antispam-message-info:
 t4DoXus6R442ZZfH0SOVVA5PWz82P3k9GyLh5BThg81GtGHIa6m+u8UnvHpgtZ7EH0MXip5uUFRtSjm3ptMCbpSdL0s/0RiUzyWfDl+6uVZKwLswUrKuTpi4wx3bTEqRxQ0Cqu2oOdqkaCBLk1UEi9XzrQz8pQ+kmLjeAl8Dmv0hjALyr5dE0w01XtDL2Udk2ECcLj1lQgazmbpWZA9h3cCyNkuuYX6a1ojRHdRH2Y3tObSUnZ94WEBFZmZKKVjNTCc1LvQnSgHHUU68PyweATcpXffRBToMAkv6ZHo4xivxTLPr26NTqQO1+tsafAo13boI1H3hGHlXk6whQU0cgnOtVtG9TF1VeW9w03aafy6TjQJj14EBRWTyzDBstz3M9cnajXU4ymv3jQGn3jznYCsjsRVtZSfvV7Wa/U24KxbvUYMbsbYQjUTwr8vUtwrhLqQhRfHhzy3McZ1H6m/50n8IvJS1pYBE5G0CAPNhBKW2bBa/JnQWK9HT7JgIJxA7DS8drte2/eg55ZHSCHy2INyU5Jsr/HXFpI1KxH6z75610LcizSJcrdyaip6ZA0t+S/el5rSpCzAyDxhvTAV/iCozvNtrvoZaLpwWRPUH4fgsJE20g2lAJyQ1vI9RmPfdQgnICui+JeJN73QTLAPTw3DSTVVa0WT9jvt88o3CKNF6vvCV/9Z8L/KYtkdyovXC9X+wJQBkfGlpj4cHOEjkHA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LVWPR20MB994915.namprd20.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(38070700021)(261009223327099003)(56012099006)(261009223027099003)(261009221727099003)(4143699003)(261009220027099003)(261009221227099003)(18002099003)(10067099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZkhwdjVRZjVJWlQ1WFdXZWgrSFpDWWkxUUNOUm5YWm0xdjY1OE1hUXM2engw?=
 =?utf-8?B?VHcxOStKUllRRitScGVpMjZjbnkvMC9oSDNWejZldk9Ccjk2VkxIS3BvejhU?=
 =?utf-8?B?ekljRVMzSnBNNFBOR09aYllZeW01ZDNPei9IUERGT2NBL1I5Q1ppQmUrNUt2?=
 =?utf-8?B?elhobHk1S2xvMzdUT2VvaXRxeHR0eVJnTmQ4YVhsd2FVMzhSK2VIZ3pzcTZk?=
 =?utf-8?B?d05hVEs4K1NwbUV3bEM0ZVJJcmlJcmltMDJxNjFiK3E5M053Z2s3VkNaNXh4?=
 =?utf-8?B?MXdMZlJBZy9TcHBKNUtuc2Z6WjZ4RnhpdFV3M2JIRW5yNkhobkFqN24yNHlT?=
 =?utf-8?B?SjFNS1dySk55THdJU2pnRDVuQWZSRDM1dWgwVlJDWmphY3VsTUpkWFAvd3Bz?=
 =?utf-8?B?NW9BaitxWW8wT3FYMkJpeFByNWhIYlNFSnVOejBzdlFwa2ZsTWpRNU9JdmpT?=
 =?utf-8?B?RjhjUjBDQUg4d21wN0RPVlpieFhWUzZ2NENRY3B5NmMzTmVMTmVYVTBoN2hC?=
 =?utf-8?B?YWZVZTl6dWtJeUNOT1ZRRzd2bHlmK2kxdXJRaktVRy9ibE5FZDFtOGU3aFY1?=
 =?utf-8?B?VmlhQy9wR2laV1NYUG1Sams3d0puOStHcmExY2hkRFJpckdsZ1dKeFRjTVIx?=
 =?utf-8?B?TzArRFVxVGErZWdzR1czSUMycjY4TzJJc3YvWXNCaWwrL2FadjcyanEzM0pu?=
 =?utf-8?B?dmt3UEl5MVIyY25FQnBzRmQ3WkpRbTVzUzJleEZBWXZKS0JkVjZNVWxlL2pB?=
 =?utf-8?B?aFlxaWR0L2t5ZkFnY2hwRjZSODRkblA4QitheUd4cktEenZkb2tHemdXN0di?=
 =?utf-8?B?dE5pN0NvYkFOQjM2WnVWcktxRjNXa1o3Ym1WUG9PZEppYWRMOFJsRld2NG11?=
 =?utf-8?B?RE0xcGZOZldxdjNiMnRabjE2RFdxZ0F1SU40QThlN042TGRNSW5VVkhqOWpj?=
 =?utf-8?B?dWdsbHF5V2g0RTlMaWZ2N0FJWXFJaCs5anE2aWozL0RIcUhWTGxJcWNCT1Jy?=
 =?utf-8?B?WVJOZWFESDJLOHRVL05XQmsxWEdoS0ptSEF5eEl6TXp3bXNCaENobFg4RjhL?=
 =?utf-8?B?RnRXQkFZd05iTzlBSWFsZlUxUSs0QVplVzdFc3hFVCtZanppblI5bDBFZHRm?=
 =?utf-8?B?akxyelhKcWhOQXJuNno5S25Ic3Bob0JnTll3QnVzaHcxTzNVVWVueHZKeEJL?=
 =?utf-8?B?R2xiTDI1RitlQkVxWTVaUXNkMkRDTW5uQ0tHYmJyd0c2dWkzZDJpa1l6eVlt?=
 =?utf-8?B?aEFJNnZ1dDRsMXA0TGM3b1c1OVRMUFJFQ0tyWWs5TDI3dkhMcUdxTFFLRStL?=
 =?utf-8?B?WDAwbjJWa1ZBTTkxQTVTb0sxRE52ZFZsTHoxaUtFN21yZG1EL25JcnZMcDJN?=
 =?utf-8?B?N2l0akVxVWNWVXFGVVZSR2MvSUFaNVNhc2thdnNlYXNqR3U4SjA3MDZXOFFQ?=
 =?utf-8?B?Um83TVkxeG10bU5KRGpONi9najR1Nlk0WHhwM3U5TGxmWm05OGJmYjlRZHEr?=
 =?utf-8?B?U0NVRWR6WGwzZHdyVkpzanlrOEdKMWsxeCtwSDltZ2tqZ21Bb0tJLzBQVzlJ?=
 =?utf-8?B?azE2b0wycHlTVnVWQ1pvWTkwM1Zqb0ZoQWxRQWVBWWxuUTRsQ1JiRG0walc0?=
 =?utf-8?B?eUVnVnczcE93aGh2MlhiVVFKOGRKNllmMldjRzJZWlNJMndRcU1lUDZ3Tkls?=
 =?utf-8?B?WWVTbCthZy9LQk1NSXN6blhkOFFqKzRwVmx0eUhjT2Jnc2NUbXlpcmlrTHN4?=
 =?utf-8?B?KzAwTmJuMTMzNDFFZzREajRQdlBkWllZWXlMQWVNOU02b2lISkRKRFZ0U01I?=
 =?utf-8?B?THpzNzhhcHlKejZjSmlIY1JEVWRnVUJwbzQvL0taVVYvNWtleDFJNDkrVDBy?=
 =?utf-8?B?RDV2KzhzNEo5Ly9pTFdYY3dRNXByeXlCR0o1ZFFkTlJZNUtMdG1lMkNEQUhQ?=
 =?utf-8?B?c1pSZ2R0TmlHVkdjWjlnZWFwZWJVVmtjZUc4Z3ZnYnRXdS9CZ1l5YzhFbGxG?=
 =?utf-8?B?L2VYNWVoRnlralBwbFI2T09JVDJvT01FOG1IM3pOODZyMkxyalVlcE45YjBr?=
 =?utf-8?B?dEFlV1lTTEhGcDUvQkRiT21Zd3J3MXR6OHh4bWh6Y0lwOS80RVlnbTFsaTd5?=
 =?utf-8?B?RVg2TXg4RW8vRlIrOEVxOWJVMzFtZUFGdlA4dmxLb2xxRU5nRmdOcU9GeTNJ?=
 =?utf-8?B?SlNBWWVRV3ZmVkpKZW5DTHhncmhqb0hsN0NJV3RwY3pVZnpTUFdUNWRzcHU5?=
 =?utf-8?B?WWpWNENQNFZCK0NLb2JyRFVHMVdGcnZCbE9UUTMxbTJTRE9HSEJBTUd2QTFW?=
 =?utf-8?Q?hg2sJN6GHhNMwJeHlk?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	rhJzU6Cqxq+i/ePiWwPjLxbo8e26e83Kknn/2A3ZUHI0TffsRaFnLsvtPnKraJadZDyTdqPLAi28BWL0svlLIwZnJxbY3Ozn4Wd1F03BhOF59SxvCjmAx7hPrvcTtdDNMhxe2ERGbhKkD57o/kREbOxH/WhzBUvZZ0QtmAzki/fYdaoNLXUD0XPhvulVAtqh65qvNIS1PfGbBKRnAFGi8f6ueQrwZZP/4ke0paFOSxAAK7zbeSHby4RAlE8j3KhL5U5elQnMVgUBEGxOKC+fzjqb97+W+faHKdX3Y6ERj5lsnH3yzhyoMc6nhon/HolO5gDGVmD1fQDj4D8eD1ObJA==
X-OriginatorOrg: sitime.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LVWPR20MB994915.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbe35ef2-2661-4e09-32f3-08df2b20346a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2026 00:55:42.6991
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8fb55916-cf10-4b0d-96f4-cf3952657263
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nXz8e859dK4KTIz7316nDA9c4joD/CPHYAO2MzkdtaRu0HXocGErBadf3JA05du9M6I2qMKJ8JQTT8rqliqWJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR20MB4789
X-MDID: 1792112145-JFqd0pXDOLHp
X-PPE-STACK: {"stack":"us1"}
X-MDID-O:
 us1;ut7;1792112145;JFqd0pXDOLHp;<arouhi@sitime.com>;b258b95cf5ef1e870c44c71acb0e4bbc
X-PPE-TRUSTED: V=1;DIR=OUT;

T24gV2VkLCAxNCBPY3QgMjAyNiwgc2FzaGlrby1ib3RAa2VybmVsLm9yZyB3cm90ZToNCg0KUmVw
bHkgaW5saW5lLg0KDQo+IFtTZXZlcml0eTogTG93XSBUaGUgZGVzY3JpcHRpb24gc3RhdGVzIHRo
aXMgbXVzdCBiZSBhIHNpbmdsZSBlbnRyeSwNCj4gYnV0IHNob3VsZCB0aGVyZSBiZSBhIG1heEl0
ZW1zOiAxIGNvbnN0cmFpbnQgdG8gc3RydWN0dXJhbGx5IGVuZm9yY2UNCj4gdGhpcz8gV2l0aG91
dCBpdCwgYSBkZXZpY2UgdHJlZSBub2RlIHByb3ZpZGluZyBhbiBhcnJheSBvZiBtdWx0aXBsZQ0K
PiA2NC1iaXQgZnJlcXVlbmNpZXMgZm9yIGFuIGlucHV0IHBpbiB3aWxsIHNpbGVudGx5IHBhc3Mg
c2NoZW1hDQo+IHZhbGlkYXRpb24uDQoNCkFncmVlZCwgYW5kIHYxNCBhZGRzIGl0Lg0KDQpUaGUg
ZXhhbXBsZSB3YXMgdGhlIHByb2JsZW0sIG5vdCB0aGUgc2NoZW1hLiAgVGhlIHJhdGVzIHdlcmUg
d3JpdHRlbg0KL2JpdHMvIDY0LCBhbmQgc3VwcG9ydGVkLWZyZXF1ZW5jaWVzLWh6IGlzIGEgMzIt
Yml0IHR5cGUsIHNvIGVhY2ggcmF0ZQ0KZGVjb2RlZCBhcyB0d28gY2VsbHMgYW5kIG1heEl0ZW1z
OiAxIGZhaWxlZCBvbiB0aGUgZXhhbXBsZSBpdHNlbGY6DQoNCiAgaW5wdXQtcGluczpwaW5AMDpz
dXBwb3J0ZWQtZnJlcXVlbmNpZXMtaHo6IFtbMF0sIFsxMDAwMDAwMF1dIGlzIHRvbyBsb25nDQoN
ClJvYiBIZXJyaW5nIGFza2VkIGZvciB0aGUgMzItYml0IHdpZHRoIG9uIHRoaXMgcGF0Y2ggaW5k
ZXBlbmRlbnRseS4NCldpdGggdGhlIGV4YW1wbGVzIGNvcnJlY3RlZCB0aGUgY29uc3RyYWludCBo
b2xkcywgYW5kIGl0IGlzIGluIHYxNCBvbg0KdGhlIGlucHV0IHBpbiBsaXN0LiAgVGhlIG91dHB1
dCBwaW5zIGtlZXAgYW4gdW5ib3VuZGVkIGxpc3QsIHNpbmNlIGFuDQpvdXRwdXQgY2FuIGJlIHNl
dCB0byBhbnkgb2Ygc2V2ZXJhbCByYXRlcy4NClRoaXMgZW1haWwgbWVzc2FnZSBhbmQgYW55IGF0
dGFjaG1lbnRzIGFyZSBmb3IgdGhlIHNvbGUgdXNlIG9mIHRoZSBpbnRlbmRlZCByZWNpcGllbnQg
YW5kIGNvbnRhaW4gcHJvcHJpZXRhcnkgYW5kL29yIGNvbmZpZGVudGlhbCBpbmZvcm1hdGlvbiB0
aGF0IG1heSBiZSBwcml2aWxlZ2VkIG9yIG90aGVyd2lzZSBwcm90ZWN0ZWQgZnJvbSBkaXNjbG9z
dXJlLiBBbnkgdW5hdXRob3JpemVkIHJldmlldywgdXNlLCBkaXNjbG9zdXJlLCBjb3B5aW5nIG9y
IGRpc3RyaWJ1dGlvbiBvZiB0aGUgaW5mb3JtYXRpb24gaW5jbHVkZWQgaW4gdGhpcyBtZXNzYWdl
IGFuZCBhbnkgYXR0YWNobWVudCBpcyBwcm9oaWJpdGVkIGFuZCBtYXkgYmUgdW5sYXdmdWwuIElm
IHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCwgcGxlYXNlIGNvbnRhY3QgdGhlIHNl
bmRlciBieSByZXBseSBlbWFpbCBhbmQgcGVybWFuZW50bHkgZGVsZXRlIGFuZCBkZXN0cm95IHRo
ZSBvcmlnaW5hbCBtZXNzYWdlIGFuZCBhbnkgYXR0YWNobWVudHMsIGFuZCBhbnkgcHJpbnRvdXRz
IG9yIGNvcGllcyBvZiB0aGUgbWVzc2FnZSBhbmQgYXR0YWNobWVudHMgdG8gdGhlIG9yaWdpbmFs
IG1lc3NhZ2UuIFRoYW5rIHlvdS4NCg==
