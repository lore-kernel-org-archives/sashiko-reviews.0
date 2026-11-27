Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.67
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795769490;
	b=v27IEyT8rcKNKDeOcwaNxEFiQx/vdituYurKrKmQ4If+Rpz+3nF1A/NzRF4tBNd1ATWQ
	 oZ+DKlRVO7IQT2WBlmz50I6aeGzCTBwvAID98jmjn6lCRNvL0/erxGoB9XmAuK5G31cr8
	 ak3Jy65mB5QyBTsV1uiIJNOAUPFRmcQnX1YRcw/y1fyxIXwjPfsl6ytvuCx3bTpBh/3h6
	 VjAluz6nFkZlcWSWQfQfdyG9UJEWKQ4Y82tmQAlEZkUdn1WSyeVdo+nIze53gxOfuVbyH
	 EDJbHD9S42Eqw32Lopg+C2eBlPmt7y21ygWIDR6fpI/VMHw+MLYAtS11mjezjOZ9epw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769490;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-ClientProxiedBy:MIME-Version:
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
	bh=AnXUjv+dim9coSKNQ2JdtELmvpQkxKnWVCscccAJskA=;
	b=nCnh6p7lt5iZGOHIf7GpsiKmXKsFKjqsx40G0oLZkFE16yWllfQP1utctoncdgQ8lN82
	 N2FN6eBxVc9R4y/zUbtVfkS3ikPR0fx7MU2Hcfwp2TV67xmZuVEcsFo/c3V8XyQfaBPb+
	 3ye6QuUk+l3KiwqdRTXq2H9cBMYr+vBOicB/b+Oi4f2OkLU7pw51YtFzz0Qyv8X2JD3QW
	 HKho91ZpVr9Kty1B0rpRQkFp1TdEnQSngqu2UkUj2PVxtvhK0EA7QHexahvwgYqnCI5Ou
	 4gW/NJjaw0dqJsLxSNCiM9GrpE2PCiJwywaFCWXVCcQVLStgGCK47Yeg7t1tJYZRi/g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=kalO6M1k;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.67
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013067.outbound.protection.outlook.com [52.101.83.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B56606A326;
	Fri, 27 Nov 2026 08:51:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73B56606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=kalO6M1k
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sH7PHVjxi4yWX9fLJxFqAltokbtVvcs0yllzNlOKbIfrEmaE7uy6JY7AQqRlcNuTllmCSXOhnjvUNZafaR3uoOvsiqMti64Z7Fz5bSmvf1iU9PqzPjH9FkjF4gkHz5Ca82rnlAaGPs1T4jtCqfWiv+mXRNckCCEz9jyDA1D0dSLy13cjOxKw3aHQZ5LUGOOrrmGslQMhVAWC+yTqN0pvgwUfrbA8Wq1bp38mX3JR7PrJTQuf46P/j1ZhPw9ezWre4OUSR3dMLTHQOZAGMb9Bd4VKtqDeml9iVFVc/cuqqBJyknYlAtiDbeaoG2GeC3D5IbICq/kkoa0woDK2p2WEaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AnXUjv+dim9coSKNQ2JdtELmvpQkxKnWVCscccAJskA=;
 b=yLqQuARCtAdHwTIx3DhSnEKDTX/EXaJJnyqI/iar6MK322x3QvehUMTXMQnap8XKbIcZQ/uoyY2Apfy4DuAHaUQ+EFqyze8a8lgIQYPjcqRzaYBIdmb+P+vjLcohC+ll8N1WyYyYnM+BtSm7+ii08tKCcTqeCJX9U/SchhGnbKlWB+7Xwwdg9WrgsWm1sw8D+tXFnC/jHDoU/rV53hh1fxvdxxw+LhECnBraniJEk3qgU8uYKA0R2EypRLOqHVTFakolZMH4W3FIUmQQYvZSR5FK+MAyUl1eY07or4kV1GppKLlLU6GdLCX7y4VAO17E7y3Jf9opAqVbazrK3i0iTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AnXUjv+dim9coSKNQ2JdtELmvpQkxKnWVCscccAJskA=;
 b=kalO6M1kPRxOQe2QMqvvAJwSAYM03ncrnUWwzfBBMD9P7lOdaL2/U294kUeJluSHhglzvR5qxQh2MDDmvykwKdmAQlRiC9e6OJ5d9R/BI1qr9LYFZxNI2oVXnkySPwgyS78xQkFKWC6AY+qH1uTVa/Nzz1FAGNi3H78o7VzBZ8w/yVzYW/PPufSHBNVvkBCffQ93Fi2C75ZXEu52pcEu1GoCUQv2Uq0zfPP3HgDmD6CjrS7gyHA6Cj8pCtZ7pBYXl+LcQrLcZ3/MuS4PV0huIwc66IG2Oa3NbyDjRta/KCwRcXVHP0nBc7LQ3ymsy4Ra53EMBZZ5loqQsFMwaixvrw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA6PR04MB11909.eurprd04.prod.outlook.com
 (2603:10a6:102:51c::22) by BESPR04MB12564.eurprd04.prod.outlook.com
 (2603:10a6:b10:101::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.10; Fri, 27 Nov
 2026 08:51:25 +0000
Received: from PA6PR04MB11909.eurprd04.prod.outlook.com
 ([fe80::a4b:fa4e:7fe7:e6a2]) by PA6PR04MB11909.eurprd04.prod.outlook.com
 ([fe80::a4b:fa4e:7fe7:e6a2%7]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 08:51:25 +0000
Date: Fri, 27 Nov 2026 16:56:32 +0800
From: Bough Chen <haibo.chen@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Mark Brown <broonie@kernel.org>,
	Liang Yang <liang.yang@amlogic.com>,
	Feng Chen <feng.chen@amlogic.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>, Han Xu <han.xu@nxp.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Haibo Chen <haibo.chen@nxp.com>, Jyan Chou <jyanchou@realtek.com>,
	Yu-Chun Lin <eleanor.lin@realtek.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	Cheng Ming Lin <chengminglin@mxic.com.tw>,
	linux-amlogic@lists.infradead.org, imx@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-mtd@lists.infradead.org, Frank.Li@kernel.org,
	neil.armstrong@linaro.org
Subject: Re: [PATCH RFC 08/16] spi: fsl-qspi: Consume dummy cycles directly
Message-ID: <20261127085632.44irp2necxfqbbn2@shlinux89>
References: <20261125-macronix-upstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com>
 <20261125-macronix-upstreaming-spi-mem-cycles-v1-8-fd036402fd37@bootlin.com>
 <sashiko-outbox-233875@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-233875@kernel.org>
X-ClientProxiedBy: SI2P153CA0025.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::12) To PA6PR04MB11909.eurprd04.prod.outlook.com
 (2603:10a6:102:51c::22)
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
X-MS-TrafficTypeDiagnostic: PA6PR04MB11909:EE_|BESPR04MB12564:EE_
X-MS-Office365-Filtering-Correlation-Id: c269064e-3314-4f93-809c-08df4c639e76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|1800799024|366016|376014|7416014|4143699003|11063799006|261009223027099003|18002099003|22082099003|10067099003|56012099006|261028144727099003|261026140227099003|261026121527099003|261022105027099003|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	Ph4jIp+WEonNMuhReP3apArL4W3/fYmNTnKf8aKtiSz7eoKuNQv8TXu+3ohxWDP7RjE3SJ4OD7sp3gc1eQJU3xkB52NY1hnUQxZBQa6AK9b8lIKO3/yOz0S8Eio7ST4qBskpt8unb7bFEsT09MgB06rEULBRTEb5PC+WiMIb+0CZcuU7FEFaHuFiBmnn7sHdYHUa8fMSoDmgcKPKOX7oi00PnAWEtJ+wFvv8EndmPfcohcPshF4S3JoOpObaeNU9jTpDsRQlBy6ebantKB5I6lE0tbcpthaW3qoXS/WvdRt9QAPSJQZzZDm5bVKD9EsBsmMx0XYkuGc5ZCV+X0mOotLYdhnSZFys8d0cHBI9uSBsqqplpV/hlvkw1TNsZGZQ+h+NGOzvsCsjyVdIco020HwrbilHOHP5Gb7znGR8+W3CDhfe7j/LzH486qClLPvggmU5SCfXDSCOotHfVajzPdFBmwi66g4kZtUBCTiThbQTIzSpWnrRIX+HScD0ct3TaIVpENCWEgewkwhz3L9yNnh3lC7kCGMVgVGrjVvTW0WAFFDyw0D/3e5NGe6SuWN/YH6VFPjGN4Y0aWjMZfcidEGAHAeUGsorDkxDCg9frLY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11909.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(1800799024)(366016)(376014)(7416014)(4143699003)(11063799006)(261009223027099003)(18002099003)(22082099003)(10067099003)(56012099006)(261028144727099003)(261026140227099003)(261026121527099003)(261022105027099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0YxSXBMOGFaSGtrR1piK1Z4S0NWc21lK3hab3hYYWp4d0srcW95bXpkL3Vi?=
 =?utf-8?B?RWMxdnNKQWI5dExlM01QR0RlV1BuWnljTG9EVFlvSlZYdkxUY2UrN0NWM3lE?=
 =?utf-8?B?dFNYaGgyQmU0NmlLS3RleG56Z3RhMGJjbVBPdWhrd2ZzZEd1N0V3VkFHVFls?=
 =?utf-8?B?K3BJdnV5SDFBOEdYRktRYlNBbThIRGV5TUVzWkMvUWpZdHN0YWdTT0VBTDhQ?=
 =?utf-8?B?M29yT2ZYYU1vb0V0SjIxTmkrNkF6Q0hQOU9LMVdXTFB4c29FbGkxeFlxOWRP?=
 =?utf-8?B?c0Z3T1pEVHFOUU11M01rclowRXh6eHdZWmlUSGF5RFRmU0hpV2dyaERiZzBo?=
 =?utf-8?B?K01Sa0NmWS93VUk5dXhMYVFzRmhCS1BXWDd2L1dwNUphejBXNlhHQlVFc0M2?=
 =?utf-8?B?Mk1CS3ZwWEU2bnBsRTZENWRmQWRIaUYzRktDYTUrdnlrVENNU3M5VzVhVFFn?=
 =?utf-8?B?dkU0bjlNbDhNWG1WdGIvUTVWdzBvNWEzQmRnNkJIRHVHNURIVm94S0d5dW5o?=
 =?utf-8?B?REgvSG9STG95c08weW05OHRHUlRkWmNJWEloMk4rbW5iUEcvak1rbUNyRzVQ?=
 =?utf-8?B?MzFGMVJmYlA2SjlJS0xuUms1aHdpWlBLNE5JNy9rSVVsVUVRVkxWZ1luMDRm?=
 =?utf-8?B?L0ZPdGpvbDZwZDQ1ZWZCMEJhMFV4d0RFMzNLNS9HWUZ4VEk5cUd2VjZIejBp?=
 =?utf-8?B?bHFaQ3pXWHZwQUFXUmhGU0Q4bXYyTTVyZVBGckNaOU1ieW10blZNUnAyQ2o3?=
 =?utf-8?B?a010NzFLd3RwR3hXZ0k3bzkvVGV5R3RRZE95WU1kTW4zSGVGeUVmdElOZ0hC?=
 =?utf-8?B?cGNrZUN1enFaVDhlSXN5ZGo2dkkvek9LZnlvYzNTN0MyYzMyMElXcmhqMXBt?=
 =?utf-8?B?SzA5UXpJUXR2V05qT3FkMXlKS04yVDBUQ1hXMS9JdkNBYTBKREF5Wm5aZWo4?=
 =?utf-8?B?UE1UMjFCMGNmRDNjeTNPWENPbDdSd2tXUW1xT2EwaTZzbXpyWlR0aWNXQ2Yw?=
 =?utf-8?B?M3pCOWFSOXMyWkU0V1RHK2Q1RUN3TjRQMGhyUlZqZmZaU2JqSkFvN3RJOUlD?=
 =?utf-8?B?aDVXK3huTGNySlozRmlPa0hXZ2tGaTBqOWtxd0xhNHByQUsySnMzV25jdUNP?=
 =?utf-8?B?K2RyNlBGaVJkNGRuRk4xTzdZK3lUY1lMc1R2VFpzR0hhWlJ6T1crWk5rRnFl?=
 =?utf-8?B?WVFpUnMrK3pmNG4rcllPMXg5WUNQK28xTzRheVA2NURrN2pycTY1YkZPNVlT?=
 =?utf-8?B?U3pvN2lWME1lT0pmSTU1U2VmcVp5V3lhWkRpSXI0QkNYQzRNZ1ZXbHpxS05X?=
 =?utf-8?B?SW5yaXo5UWRYd0lmTS9aYURqRW1pNjN4MFUwSkVDS1hpbENzSE9KQzRZeFVu?=
 =?utf-8?B?S1A0T3o3YisxMmZRcEwva1YrVDQ2YzUyVSt0NHlpMHhVU0hDdVphQjIyWFNJ?=
 =?utf-8?B?Tnk3b1VLaDkrUUJHbUZKcDNTdCtxZFkzVnNxcWN2T2NpV2J5VENUSHp5UTVU?=
 =?utf-8?B?N2pDTklnVHVJc2VZSFZSTEFEcldaNThtcWFqa05aR3p5QXlmTmZjdmRaUnRM?=
 =?utf-8?B?ZithWEp4TG9YcEtQbVliRnF5WHBxeUNKUDFPcVFQQ2ticjdFOThQR3hNdzdm?=
 =?utf-8?B?bVlyazM2azFrcDh4dXBsZU45RFhMblA3ZTVFOTJUN0FpZFRTNnkwYmRUcjRJ?=
 =?utf-8?B?bFM5YVYyUndPRnlsRTZkQldISTh1RDRsbktTTG0wbTZPS2l2dFVQcEY2S0J1?=
 =?utf-8?B?NGJ4MVRYeEZXQU53amhqTGQ3NkJvUW9pY3hDZjBqYWM0TmFEUmxyN0graWxM?=
 =?utf-8?B?ZnVtYUx0clBsMndSRjA4dFBIY2d3ZUNaa3FCSVJvZTg3dUY5V0xHdkNqaUIy?=
 =?utf-8?B?bUJDWHhVZUhYN3FDSWdkY3ZuVjAwUFRnSEpVUEN2dm1xT3h0Q2Y0aWhRNSs2?=
 =?utf-8?B?SXkvQ0JTaWlrVTdlZktNaTQ4Ukpoam1VNVNWYWNtaW5yR0tJRHR2M2NaeUJU?=
 =?utf-8?B?KzAxMGRLN2ZwcGFvNEpLSG5hQ2lYK0x2MUs5aHVqOTRSQVI0UFBwdW5uemQ0?=
 =?utf-8?B?WVJ3WFBuVWxvcGVrdDl6OW55cWxDVHpIQkhjNDhDRm81MUNOZ1pkS0ZOOHBP?=
 =?utf-8?B?Y005OEVuTy80K0N1UnpxbXFqRXFSVjBkQnNLcmNraXE2bDR0Sll0bThvRDc1?=
 =?utf-8?B?N1EwOGJZREg3R3htMnIyNDFRczNSelpDT3NTNGYrODR5eTRtY2RJYXA2QVJX?=
 =?utf-8?B?RDdQamlkN2tXNU1UMWswbDY5OEhaWU9sNGhpZDJGNUdWM0xOMG1OWmhOem5a?=
 =?utf-8?B?UnN1dExpZWxHSGgxUklPR1ltaGl1dGdkeWtjSFRxa2k1TG5HaHBzSnlLSlhZ?=
 =?utf-8?Q?lQohoxld2tPuYiCVm+sRLLtGdOr1xIXLHkKuc?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c269064e-3314-4f93-809c-08df4c639e76
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11909.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 08:51:25.6068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NrM8bnJ8gx37stLDS8c3fCVNayiYcGeGELfCdbHq2aDwOR3UwwEdBo26z0vSYgWo3F2otnFbIPMWVVuMYRFgG0C0x9BmT9yTULLaCjgxWuSz/8rJuhq3Dq1aTZnRI3f0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESPR04MB12564

On Wed, Nov 25, 2026 at 05:58:22PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] spi: fsl-qspi: missing dummy_cycles in fsl_qspi_mem_caps zeroes
>   ncycles
> --
> 
> commit 96f0741ca2d71f7fc3b26b9f08845776854eb8a4
> Author: Miquel Raynal <miquel.raynal@bootlin.com>
> 
> spi: fsl-qspi: Consume dummy cycles directly
> 
> This commit converts fsl_qspi_supports_op() and fsl_qspi_prepare_lut() to
> use op->dummy.ncycles directly instead of converting op->dummy.nbytes into
> clock cycles.
> 
> > diff --git a/drivers/spi/spi-fsl-qspi.c b/drivers/spi/spi-fsl-qspi.c
> > index d2c2090442f84..a1d6357e3203a 100644
> > --- a/drivers/spi/spi-fsl-qspi.c
> > +++ b/drivers/spi/spi-fsl-qspi.c
> > @@ -399,7 +399,7 @@ static bool fsl_qspi_supports_op(struct spi_mem *mem,
> >  	if (op->addr.nbytes)
> >  		ret |= fsl_qspi_check_buswidth(q, op->addr.buswidth);
> >  
> > -	if (op->dummy.nbytes)
> > +	if (op->dummy.ncycles)
> >  		ret |= fsl_qspi_check_buswidth(q, op->dummy.buswidth);
> >  
> >  	if (op->data.nbytes)
> > @@ -413,13 +413,12 @@ static bool fsl_qspi_supports_op(struct spi_mem *mem,
> >  	 * to fit into a single LUT entry.
> >  	 */
> >  	if (op->addr.nbytes +
> > -	   (op->dummy.nbytes ? 1:0) +
> > +	   (op->dummy.ncycles ? 1:0) +
> >  	   (op->data.nbytes ? 1:0) > 6)
> >  		return false;
> >  
> >  	/* Max 64 dummy clock cycles supported */
> > -	if (op->dummy.nbytes &&
> > -	    (op->dummy.nbytes * 8 / op->dummy.buswidth > 64))
> > +	if (op->dummy.ncycles > 64)
> >  		return false;
> >  
> >  	/* Max data length, check controller limits and alignment */
> > @@ -460,11 +459,10 @@ static void fsl_qspi_prepare_lut(struct fsl_qspi *q,
> >  		lutidx++;
> >  	}
> >  
> > -	if (op->dummy.nbytes) {
> > +	if (op->dummy.ncycles) {
> >  		lutval[lutidx / 2] |= LUT_DEF(lutidx, LUT_DUMMY,
> >  					      LUT_PAD(op->dummy.buswidth),
> > -					      op->dummy.nbytes * 8 /
> > -					      op->dummy.buswidth);
> > +					      op->dummy.ncycles);
> >  		lutidx++;
> >  	}
> 
> [Severity: High]
> Does fsl_qspi_mem_caps also need .dummy_cycles = true?
> 
> fsl_qspi_mem_caps only sets .per_op_freq = true.  Without .dummy_cycles =
> true, spi_mem_convert_dummy() converts any dummy cycles to op->dummy.nbytes
> and sets op->dummy.ncycles = 0 before invoking the driver callbacks.  As a
> result, op->dummy.ncycles is always 0 in fsl_qspi_supports_op() and
> fsl_qspi_prepare_lut(), so dummy validation is skipped and LUT_DUMMY is
> never programmed into the hardware LUT for operations requiring dummy
> cycles.

Correct, need .dummy_cycles = true

Regards
Haibo Chen
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261125-macronix-upstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com?part=8
