Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.108
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794894349;
	b=XY9lM+ktvs5tNHEIZUMhIBaoa2A7hJGTwS5nab93Bm09MDXfsB3+RDQO8+ruI3Ly6OrK
	 pd1n41X8c2OTBPjLk4OIsORIdk1TzehzNgtS6eKnd0SRHVw10KQ87P9v7ZdMZlvckcWzS
	 HPILc7eD1MxXYX9qnigNyTVzYdMVqkgcuNtD7j9HTg7SNztcjjfHQ0i6KiVYmPFG52rXF
	 Vje60aDClq2hY8tcZJnYKIZXXSLWE+4o5wP7uuSVXMr09Nq2mHGj3XZP/ZENBBsRFnobC
	 GbIhCk+N+EIbfRIMW8ny/1sIHZgMyC6TtQhqA0zPw4kJMShf0QWrSmKF7Y4CrRg8Tkg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794894349;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=mv6ZUEs1XHHU5bamJ73QmjUjV3RPAFaTgmlXC8inr/w=;
	b=xEKmiCnDAxu7mwdEXZ5xHdr0Nl+XnNvyPGAahTLvs/8iy6VKCZKy8gT23pKHB2WP9IuO
	 L31XWc7UPTTc3SYAP6o+9V2eCoGJAtUBKm5wHAiIhADxtzeUyCrrT2cA92VNqYjNDjTam
	 5203VDZb1xHxeJxQtjOjANVx6wLzlA9jCCDJDNA6w+TwxLWv/RKKLx8boNLLob3HXa1ke
	 HNK1QSrzswBFbPQZoc0QIJGO/aP40NauIn/t9qxY4M/2gsWsQMH66jS4WhurKOh9r+cRG
	 RWTGKAp1DQ2V2aRrAXh9prEx89TnH1vVuUW6scB/ToNL5WaNjRTlkEaARoDIcW9HjZQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amlogic.com;
	spf=pass smtp.mailfrom=amlogic.com;
	dkim=pass header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=sRYK3sgX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.108
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022108.outbound.protection.outlook.com [52.101.126.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F78606A32C;
	Tue, 17 Nov 2026 05:45:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3F78606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=sRYK3sgX
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PL8fv5Gl/o0nt0gX6ZckOyZ7pxd0m2nvCHRJPWThUuMZ5TBx9e11O3i3tlZWqtt5tD1GVvjM+PaKkBnB+HPAgK3cXh1aAHooRjbZoAeUkrHuKorqia84tzfTi6eAABDKd1tVDF/juOjKR4s80GAgtOT9Po2vNGSQyF20WlkIoycXiXQjRAJunAts/a/WCKPWJEzRP9xgpVu9K/+/UuOODrfXhzNOpyCg2OTXS/V9YXkxmo2Cle5Xudzd/7lAIkdd0tR/Lrlldh/VxJWz5kV7WS8QT1ZNjSpMt2IdWTQWgNlMB5l/nXQLgMO9WMzAneWuxCBFHt0CDEzjD1nkhOYIiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mv6ZUEs1XHHU5bamJ73QmjUjV3RPAFaTgmlXC8inr/w=;
 b=fQd25WgzpkoimjvJm39AdnDubOxkzQN6ECRwQ3Z8cDXJ6G3MvYyCKpMmhVE31PiMPBoR9W7tFM/fVSsbxPCRXYqTwYmAKH5ijBlXbHeekNNRUuIm+niAa7TO0mm5dvggP/K9kAjF8AiOrvOqNa8B3p/Gs/vU3zWpvmWIJVhqxFv4TGAoAO2OKV3xDmSEjpW0eCaou+IXzcLYbRr3kyAiUF1qN3UzgC3W21yfxcPmlF4NN7nZiJSH9uWmiCBA6pmLXv5I/AKVYVimIcPiXhaySrt+2EUL75sBS8rRqyRBE0OsoJPA9gmTPeryJfmiw83Va2BThMMsVh39nwfif755bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mv6ZUEs1XHHU5bamJ73QmjUjV3RPAFaTgmlXC8inr/w=;
 b=sRYK3sgXt2+2jwYkBwYjmPQFZvVUc/BHUQQfQUxaVIc00SgXzB7OU7DQEvQ8HIVQ/7CLv5UzkAEJNe9Ck/eqSO8bip986NE3lC1yoid3WKF/Ofo4afk9nVEFWmWLCu9dSvTyIeKdKgG3jVtsehR6fRv99MpRxtb8XE4N3BHm2oZnQR4B80FeUVQz7R6hlqwWHXfc01899cKzlISpXZ4SRWwATTVxxENVxqdmaQ7PniBNEh0aZogGcEnV/+6FWLXplSYmFQ0NY43/2ZX1lFHHM3AxnOfuGovScmLJOS/qqO8bcvzCtCS+k2acA+wYl8k1edVKdlcConRI9zEmmr8gPA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB5743.apcprd03.prod.outlook.com (2603:1096:400:74::7)
 by TYSPR03MB7859.apcprd03.prod.outlook.com (2603:1096:400:480::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 05:45:45 +0000
Received: from TYZPR03MB5743.apcprd03.prod.outlook.com
 ([fe80::7f51:5771:90c4:8c40]) by TYZPR03MB5743.apcprd03.prod.outlook.com
 ([fe80::7f51:5771:90c4:8c40%3]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 05:45:45 +0000
Message-ID: <f17ef3d6-fa99-4fc8-92bc-1f588f3bf179@amlogic.com>
Date: Tue, 17 Nov 2026 13:45:41 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] i3c: master: svc: Add amlogic a9 support
To: Frank Li <Frank.li@oss.nxp.com>, sashiko-reviews@lists.linux.dev
Cc: linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org, imx@lists.linux.dev, robh@kernel.org,
 conor+dt@kernel.org, Frank.Li@kernel.org, neil.armstrong@linaro.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20261116-a9_i3c-v4-0-3d3222b7128d@amlogic.com>
 <20261116-a9_i3c-v4-2-3d3222b7128d@amlogic.com>
 <sashiko-outbox-216859@kernel.org> <avsvRS6ADfbzQkpn@SMW015318>
Content-Language: en-GB
From: Junyi Zhao <junyi.zhao@amlogic.com>
In-Reply-To: <avsvRS6ADfbzQkpn@SMW015318>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR04CA0012.apcprd04.prod.outlook.com
 (2603:1096:4:197::14) To TYZPR03MB5743.apcprd03.prod.outlook.com
 (2603:1096:400:74::7)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB5743:EE_|TYSPR03MB7859:EE_
X-MS-Office365-Filtering-Correlation-Id: 87116cd7-1719-45de-36b9-08df446e05eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|7416014|1800799024|261022115727099003|10067099003|4143699003|11063799006|56012099006|261026130827099003|261026121527099003|261026135527099003|261021133027099003|261026140227099003|261028144727099003|261021135927099003|261021123027099003|261022113327099003|261022105027099003|261022075727099003|261021121427099003|261021130227099003|261102123227099003|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	uZAlu6u6Xu1o3B+2nAOUrysCW44e29f5BMxy8gyT1EUS0hc4Aan8vtPMZwxPMhAO4nHyHXx1r00FioKiuRtlrbwvvBGJVRo1FjkfWA4tu3DEAzT6Tn2dgoSR326hAoul4pfZIKoVfvHoJdPSnC5dd+eOYO66Ej1QpxIshtouZT1KFK3i81To0DVaaymKhD7EehV79FSPhayIXnTsnzq1nlB86fW1Tf9qbdx1YWtEefPVsDyIGKmIGywTDDEjfOcNFkBQ2dr65okDwl6X0Aq9MqmP4yu04XUyGbkPlhK0TNi2st/fpJdzmExwYJcz/oi6bLre9ckWbnA1e3XSEGoVCLMMQ+fJXbv6FXWqrTy1r9B3Ftg7fYCQbd4RQAbQESlAhexbboOIz188+cajaixKu6+8rLP3kyj23V2httSdlRAOqRrpyGjMIbZFgkkXdaHe1HI0C/sBNzNOVUWK1IeVSlPBmk4GbwwKYZP5C57mQP9/PjDGDur+VZV8I68fjVbmotV4uLQ+vdpAEN7SsKGXJb7/AkGcc7bTKiaC0xRk1jr5ExzZA+Pp5fSHrG55lfavMWwM2bgaR29js9G7RNdXDG33r6mS6/zpern8ec0OALM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB5743.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(7416014)(1800799024)(261022115727099003)(10067099003)(4143699003)(11063799006)(56012099006)(261026130827099003)(261026121527099003)(261026135527099003)(261021133027099003)(261026140227099003)(261028144727099003)(261021135927099003)(261021123027099003)(261022113327099003)(261022105027099003)(261022075727099003)(261021121427099003)(261021130227099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cU54VmpsY0hpakVhSUZFRm9Gc1hvOUE2NVhwOVFOUnBxT1V3d3k2T0lMYVVV?=
 =?utf-8?B?WWFyelVEZnhJekhQbThxdnBmR2U3SjdHbUNPc3Q0ejN0NG5XNW1Qcis5NnlK?=
 =?utf-8?B?RXN6TStrQStOTk85djdES1ZtSDIvS1lTaWZEV2pUMk9MbytJK1NpNXJIZi9Q?=
 =?utf-8?B?citZQkhwY1RGanpEejJuR3I3R1cxdUxlNUI2WCt5OFZmbTNWY04wQThHRUlu?=
 =?utf-8?B?ajdHZmVtYkU0b2dKd3h4ZDRreis2YkczOWVUVCtxMkZOUWp0L3lsc2U2S2sy?=
 =?utf-8?B?OU1Jc1lXNHJUcld4VDhWeCtQSDdheWMzME5RV0RDaEIrcUZKRjBQdm5pVE8z?=
 =?utf-8?B?OEtjWlRrSnIzZmVKQitoWTR6QWlBN2RIZkcxQm56eERJalQzeCtibEMvRkZN?=
 =?utf-8?B?aEJhYldkUDF5YmJxQTRPVERkQUpyUEtZVGtHaXdVOFdFOFJ1RjZkdDJteGli?=
 =?utf-8?B?Qm5OK0xLRG5odmpkQ3V3MVhkUTFOSHhOQ3VDMmxYS01QaDNsV0hVTUJoZTJU?=
 =?utf-8?B?QVNwY0NmZXJ1OXJwODVEMVBPTzJadTErbHMwL09jcFh3NlV3N3JBSENzdWEr?=
 =?utf-8?B?azdVTDdRZmFiM0Mya0l2Ny90ZHAvc3BQdXB3VmIrMFlkYmF4aWtBaEkzQXMr?=
 =?utf-8?B?dWdTaVZucC82NEo2RDUvc1dWdWFCclhoUlhQOUo5NlJRSkdGd2RNaGJmOG5v?=
 =?utf-8?B?V3ByY0V2Z3c1ZkJMQkpGWGU4c2FzNWlDTVhRY0VYYzFCYkt0R3lyWkl1SXBT?=
 =?utf-8?B?dUtsVTNjSElrU3E3NFBEaUxneTA0c3VyMnZWKzJmY21nNTYwem5YZjRaNFM0?=
 =?utf-8?B?SnM4b0k0elZOeWx5cGM4ZjFnRGlEa1h1dWgwU1hMUFNUVnJOdUVwU1lqYjFw?=
 =?utf-8?B?YnFmalY2OHhNRHg0MVptRDllUXhEb0FYdmRTbEc1YlVmMGM5Q21FSk5tYnpJ?=
 =?utf-8?B?YTdDNWZVSktzTG5hcFVib3dBeFFkcmFIMlBQM05SOWt1OWRIOWJGN1RCSm5V?=
 =?utf-8?B?VXFoL2RlbmZ0UVJKUGtjUVhZbWxodHJjelNQY1RQSW5VN0dpem8rM09KNm1J?=
 =?utf-8?B?Z2tuTXM1L2laOVhyTlJJRm5JMi9lNjh3a1N1OWd1Z1ZvUU9iNWNWYTRkZHFj?=
 =?utf-8?B?L1pkN3hnUWVoV0EwbnNFdy90eE1uYVIzOGo2K0ZHUktqcWpwWDRISXRaTllJ?=
 =?utf-8?B?dzhmTXRKSmV6QWlyMkxZL3h2Q0VBbTUrMzJSQVVhVFpSY21FL0pQWFBhNS8y?=
 =?utf-8?B?RlM4NU93RGNDTHdaVUc2N3JmTVcraHBGQXMrN1VUTS8wejA3VEwzVUJDTzdz?=
 =?utf-8?B?SGs3TEE3clZ3NGdpMG9zTTJxbHJSd2ZLSHBhbTM3cy9NNFdWcjRyajlvNHFC?=
 =?utf-8?B?OVd6cUh4N1BwZ3JzVVcvZ0VwYlRCTDdkb09QRWFCNjQyMlBrenh6SXBEOWhZ?=
 =?utf-8?B?OWUzeHc4Ykh6OFJKcThNNHpHNkdUazNQZUpZY0pqV3g3UzFvQmhZeDcxTzhS?=
 =?utf-8?B?RFZQdDQ2amsxSzFnc2VnaHNlNkVHUldwNGxNSUFsNnpjK0haZFlkUjFGWE9S?=
 =?utf-8?B?V2dHalJWY3Z2aEdNMkp4QU05Y3oyTDBiYjZLSWRhaHRXdTJWdk5tV0RDS2R0?=
 =?utf-8?B?Y1FncnR3L3BXeE5OVzFuWlU1RllFdC83V1JPTllXM1Y4K3FuNU8zY1M4Z1Zn?=
 =?utf-8?B?NCsxcTZjWXNQVGp1b0NsbjFhcGVEMkM3NGRDSDJuendhcjkzYmdOR05LK0ZV?=
 =?utf-8?B?L3dwQkszN2ZNLzJsZVRndnYrQk1IUjNSQ0RtdXYyQ2RpQ25GZkQ4Rjc4SHJk?=
 =?utf-8?B?RUxlcCs3QXZqWWl2SmpVMUFYZkNUclcwWlRJeTJSb05RamN6OTNaaWpDakw2?=
 =?utf-8?B?WFBzczhDSitpdlc3bEJCUUtteGNpdHBIdEpwckIxWE10OTY3Ukk0WG9nNVJW?=
 =?utf-8?B?YjhaTjR6dEV3aTMyUUZBMlpUZ083RWJQcno1Rk5tdnVRbzU3VkcrbzRCeEtZ?=
 =?utf-8?B?NXVvbUpjTTlQck1rVjNMTEhNTjJqRXNqWGxtQW01b1hTUkFwcnFEN1hiZlRG?=
 =?utf-8?B?R1pXZFB4TS9WSkg3bzRHclhZYm4yU1R3ZUxiY2JvaE81dC9TNVRGaWxTVkVP?=
 =?utf-8?B?RjN5M0lSb1pKelNKL3A3VmxvcEZ1US83cm4zVXh0TU0wd1BGSUxlUmNTVTNv?=
 =?utf-8?B?cHdEalZFY0lUSXV4NWtTTTVHZjhtcXJHeFZIYm03blFrNDlpb2xiVGZZd2pJ?=
 =?utf-8?B?OGM4MGVpQ3BweUR6V1hqczUrdWhNUEIyeTVlQkk4YnpTYUVhWUFRVDk1OEFa?=
 =?utf-8?B?ZTdlRS9UbThjcjdPOHllWW5Tek92QmFXMTMvWHNJYlBkQWdmZStHUT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87116cd7-1719-45de-36b9-08df446e05eb
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB5743.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 05:45:45.0642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ut7MNzlUMx9+/nwL3AQQuIHp2kBuk8szTJcDbsC8j/XMieZkhEsCLmd4ZK3FmjJnjgWg4ALH2UzP/rbaFToevg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7859

Hi frank，
    thks for the review.

On 17/11/2026 00:28, Frank Li wrote:
> [ EXTERNAL EMAIL ]
> 
> On Mon, Nov 16, 2026 at 11:12:37AM +0000, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 3 potential
>> issues to consider:
>> - [Medium] i3c: master: svc: NULL dereference of clks[0].id in
>>    aml_i3c_init()
>> - [Medium] i3c: master: svc: clocks left enabled in
>>    svc_i3c_master_remove()
>> - [Low] i3c: master: svc: duplicate fast_clk lookup in aml_i3c_init()
>> --
>>
>> commit 260aeb5a4d5c58d3bea32674062960231e4d4d2c
>> Author: Junyi Zhao <junyi.zhao@amlogic.com>
>>
>> i3c: master: svc: Add amlogic a9 support
>>
>> This commit adds support for the Amlogic A9 EE-domain and AO-domain Silvaco
>> I3C controllers, introducing a vendor_init callback to register the AO
>> variant's internal clock divider chain and configure the fast_clk rate.
>>
>>> diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
>>> index e700392f0801f..0268fc713afdf 100644
>>> --- a/drivers/i3c/master/svc-i3c-master.c
>>> +++ b/drivers/i3c/master/svc-i3c-master.c
>>
>> [ ... ]
>>
>>> @@ -2163,9 +2209,215 @@ static const struct svc_i3c_drvdata npcm845_drvdata = {
>>
>> [ ... ]
>>
>>> +   /*
>>> +    * Keep the clk bulk state balanced for the following
>>> +    * clk_bulk_disable_unprepare() calls (error paths and runtime PM).
>>> +    */
>>> +   ret = clk_prepare_enable(fclk);
>>> +   if (ret)
>>> +           return dev_err_probe(dev, ret, "can't enable fast_clk\n");
>>> +
>>> +   new_clks = devm_kcalloc(dev, master->num_clks + 1, sizeof(*new_clks),
>>> +                           GFP_KERNEL);
>>> +   if (!new_clks) {
>>> +           clk_disable_unprepare(fclk);
>>> +           return -ENOMEM;
>>> +   }
>>> +
>>> +   memcpy(new_clks, master->clks,
>>> +          master->num_clks * sizeof(*master->clks));
>>> +   new_clks[master->num_clks].id = "fast_clk";
>>> +   new_clks[master->num_clks].clk = fclk;
>>> +   master->clks = new_clks;
>>> +   master->num_clks++;
>>> +
>>> +   return 0;
>>> +}
>>
>> [Severity: Medium]
>> Can unbinding the driver leave fclk and the input clocks enabled when the
>> device is not runtime-suspended?
>>
>> svc_i3c_master_remove() calls pm_runtime_dont_use_autosuspend() and
>> pm_runtime_disable(), relying on svc_i3c_runtime_suspend() to call
>> clk_bulk_disable_unprepare().  If CONFIG_PM is disabled, runtime PM is
>> forbidden via sysfs, or hotjoin is enabled (which holds a runtime PM
>> reference not released by i3c_master_unregister()), runtime suspend does
>> not run during remove.  When devres then unregisters ao->gate.hw,
>> ao->div.hw, and ao->div_en.hw while they are still prepared and enabled,
>> clk_unregister() triggers a kernel warning and leaks the prepare and
>> enable counts on the parent pclk.
> 
> Suppose it is existing problem.
> 
Ok， not introduced by this patch.

Address it in a separate patch follow this series or create new change 
series?

>>
>>> +
>>> +/**
>>> + * aml_i3c_init - Amlogic A9 specific init, called with the clocks enabled
>>> + * @master: I3C master controller
>>> + *
>>> + * Register the AO variant's internal divider chain and round/set the fast
>>> + * clock rate for both variants.
>>> + *
>>> + * Return: 0 on success, or a negative error code.
>>> + */
>>> +static int aml_i3c_init(struct svc_i3c_master *master)
>>> +{
>>> +   struct device *dev = master->dev;
>>> +   struct clk *fclk;
>>> +   long fin_freq;
>>> +   int ret, i;
>>> +
>>> +   if (svc_has_quirk(master, AML_I3C_QUIRK_AO)) {
>>> +           /*
>>> +            * clk_bulk_get_all() preserves the DT order, and the
>>> +            * binding restricts the AO variant to exactly one clock,
>>> +            * which is always "pclk".  So clks[0] is the input of the
>>> +            * internal divider chain.
>>> +            */
>>> +           if (strcmp(master->clks[0].id, "pclk"))
>>> +                   return dev_err_probe(dev, -EINVAL,
>>> +                                        "invalid AO input clock\n");
>>
>> [Severity: Medium]
>> Can this trigger a NULL pointer dereference on master->clks or
>> master->clks[0].id?
>>
>> When a device tree node has no clocks, devm_clk_bulk_get_all() returns 0
>> and leaves master->clks as NULL, which passes the master->num_clks < 0
>> check in svc_i3c_master_probe().  Previously, the fast_clk loop in probe
>> ran zero iterations and returned -EINVAL, but aml_i3c_init() now runs
>> first and indexes master->clks[0] without checking that master->num_clks
>> is at least 1 (or equal to 1 as required by the AO binding).  In addition,
>> of_clk_bulk_get() leaves clks[i].id as NULL if clock-names is missing or
>> shorter than clocks, which would cause strcmp() here and in the fast_clk
>> loop below to dereference NULL.
> 
> This one need check.
> 

will add check.

> Frank
> 
>>
>>> +
>>> +           ret = aml_ao_i3c_tail_clocks(master, master->clks[0].clk);
>>> +           if (ret)
>>> +                   return ret;
>>> +   }
>>> +
>>> +   for (i = 0; i < master->num_clks; i++) {
>>> +           if (!strcmp(master->clks[i].id, "fast_clk"))
>>> +                   break;
>>> +   }
>>> +
>>> +   if (i == master->num_clks)
>>> +           return dev_err_probe(dev, -EINVAL,
>>> +                                "can't get I3C fast clock\n");
>>> +
>>> +   fclk = master->clks[i].clk;
>>> +   if (IS_ERR(fclk))
>>> +           return PTR_ERR(fclk);
>>
>> [Severity: Low]
>> This isn't a bug, but this fast_clk lookup and validation duplicates the
>> identical loop in svc_i3c_master_probe() that runs right after
>> vendor_init() returns.  Could a shared helper or resolving master->fclk
>> once avoid repeating the lookup?
>>
Will try.
And guards against a NULL clks[i].id, and reused by both probe() and 
aml_i3c_init().

>> --
>> Sashiko AI review · https://sashiko.dev/#/patchset/20261116-a9_i3c-v4-0-3d3222b7128d@amlogic.com?part=2

