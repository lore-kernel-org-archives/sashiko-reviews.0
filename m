Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.108
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792748779;
	b=Dh1dOHgoavoNs9NPCvZKt6HGf1AAJgXOX7pnRb1KPru7N/wSsCORBS2I7M37OEkLTMHg
	 vnqflfg7aYhW4IMKEr0mjfXswey7eXhnV44ZBvGNnfFFIsr9+xeRSQOwS79G8wX4yAZph
	 NudRK51K1M2c1ORqqufnHUyzZYoLWuRNYc1qGsgDMk4OknRAkExZYb+WSLgWBDNO2BBPx
	 oVVNOkGjrnGoeisTuvJ33ohx5AeoOHyF1uQD7ss/VlIlnX+lheDUhiKdna/AbdhLFZJwv
	 RzrHD2hm7ybYSLZMfyfGJk6D5oyM7XflUGtipLpnBM3xV5tAJLR0ECsPePgzCSnRPog==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792748779;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
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
	bh=aiay3oc8lD9UDlIV5Syqp0ryWWQ1RBFVSyrRDVaYrhw=;
	b=0fLIumRaHG6qqZBv1+dNiObJv2f2cKC5cyNO7V+1+KpnA0guBDp/TAV5AuNUOpZ5YtzI
	 yE8GgY2drTE03IXdwcsDt2ArqhAM/nbTiT8r2iOzshYs/sGaEJiV7WF5mFreGYGIGs2NK
	 OGdyPucIq7Q7ffhQZfdzeCjaQ6xnaofpdCCXC0fCA1uK0sKXnjQp3WRtmJkag3LKnem8Y
	 wwWqnmL8JnP9JVmiUBM68Y9O6n0mLorHXrYVOGhVwWeGwCjqwkrPdnNlClKxK/5lR6LDU
	 ItBFiFDAJipAIKe4dofKNriP4EtuvdIVu2EJ7N4mWMdD0sxYg2/RX3j6RpnMLwNMc4g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amlogic.com;
	spf=pass smtp.mailfrom=amlogic.com;
	dkim=pass header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b="A/TdW7Xr";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.108
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023108.outbound.protection.outlook.com [40.107.44.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8D0606A31A
	for <sashiko-reviews@lists.linux.dev>; Fri, 23 Oct 2026 09:46:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA8D0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=A/TdW7Xr
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k/afaRx5tEkfaWpGWm2OqacrBWv5R9Dl6xV7AVp7ZEFiw37VMdcf1MRxIyyASlTmLisJN59Newk8IP85krhAg3Esvm3bWWcO9D63bhlRLALl/bWzoN3pTfkGzbf+UBGSI6f7IXHQMLuUXJpmCF5SiB4m2nKZlEZA5sJlR6eDYfV1HjZx4uxK8G+vtfHJ43QxrjSBCwf7u7NYa0/cB+8ol4zcC5P4zZa/ZwfvfEz3cTREGxuOpfksUsXoNAfce/r+0q9qnQT0YoP86KuGVuEI6oabt8HxhrJtcepEW7k5bFAs9TP+W85To+W8Xru2WB6nYkHwAzVAQqzEos4pQLiKVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aiay3oc8lD9UDlIV5Syqp0ryWWQ1RBFVSyrRDVaYrhw=;
 b=tYRh7dBrLtySmtswZqelZ2h1LDrBn/i+KJowLGvoZTVHvQtrWOj5K9YsY35uzlXHyBiPWD7PXX1pKLkNVd/MV6wNpnUqZrSVzqo5K0YrZzxSwqSbUtTL0sc8svMJIWhboh5tk3qn/3vCr8crCY/KloRBnCPWu0AvmmmtO3AEIrIdzXTSeGWNLs8If1+XgYfw64zHmZde/RZBbAT3aAXQhAn+wD+1e/kU+w7x54NjjRQ6bzWD+aEpW0MxkTGXEsgXrZXH1aQYpTBjzl+0sGM03pVOyulUMF4K3geQcrJocwowp+XeMW2LxAqSlO1gN0R0nJ0KS0NEO64XhGbYlc2Gog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aiay3oc8lD9UDlIV5Syqp0ryWWQ1RBFVSyrRDVaYrhw=;
 b=A/TdW7XriWhD7kiV+19HWnrY86xYNGThLA71yRzUXpC7DJ5C6Hrgtls+WUMuIP856EmnlYmAx78Oo12ohIPZQOJtr1cJ/P1mYxOf51L9UvP8ItnzGZc7IMK+ZTwn/fCoqKN/ky8eY3JbPsmbrWCc7FmlC2GrlDOTLSOKzO4/HAyxj6BSV7bfd/pZK3NXn1OGSNrPBsOzZy+glF8DWMA64MiGAGQyrgZKV73SHKSysqQkpUrTe8GibXpS229vVHYCBrcW87/DVBnsi7/YuBrfoC/fxEdtreXdK0gPHgbMLJQJ9nHyW+pelsqymysiOpIc+mC3MKPh7exsVfXl5GXMtg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com (2603:1096:820:51::12)
 by SI4PR03MB10293.apcprd03.prod.outlook.com (2603:1096:4:2ae::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.19; Fri, 23 Oct
 2026 09:46:15 +0000
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e]) by KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e%3]) with mapi id 15.21.0546.017; Fri, 23 Oct 2026
 09:46:14 +0000
Message-ID: <dbcd2cb1-b377-4b15-9b70-a00eef04ea30@amlogic.com>
Date: Fri, 23 Oct 2026 17:46:13 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 6/6] arm64: defconfig: Enable
 CONFIG_VIDEO_AMLOGIC_VDEC
To: sashiko-reviews@lists.linux.dev
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
 media-ci@linuxtv.org
References: <20261022-b4-s4-vdec-upstream-v12-0-616240978792@amlogic.com>
 <20261022-b4-s4-vdec-upstream-v12-6-616240978792@amlogic.com>
 <sashiko-outbox-181043@kernel.org>
From: Zhentao Guo <zhentao.guo@amlogic.com>
In-Reply-To: <sashiko-outbox-181043@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR01CA0002.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::21) To KL1PR03MB5521.apcprd03.prod.outlook.com
 (2603:1096:820:51::12)
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
X-MS-TrafficTypeDiagnostic: KL1PR03MB5521:EE_|SI4PR03MB10293:EE_
X-MS-Office365-Filtering-Correlation-Id: c8ce3df9-ef24-4540-622a-08df30ea7a7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|261009223027099003|261021123027099003|261021121427099003|261022105027099003|261021133027099003|261021135927099003|261022075727099003|261021130227099003|261022115727099003|261022113327099003|10067099003|56012099006|6133799003|3023799007|18002099003|22082099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	+udrIUaoPZ0LXHnTCUB4x7dJbOQLQYKpFyuU4jy8u0JNWzKO67ptdg3ZIUKV78CfdRxqf+4O/KXw89Lq+Ej79yDi3zVemJe7pmMnv3Vvu9Ay2y9b3looMxiWNLDtTEGXDawxDk+j1u/vDdmBFtRZznRgWzRkWcuTgjk7HZZ8aibTR2w2/UhpcILOUqJsVVlxI91gKZz+WGiAP3fQdr/u0E8vz87mESk0xhilVHk91rjiR74I+/vIOp/avphDLrdegf143/45sl3LB+RCmz71fxqzBiozi8ZI4mDOR7AwhTZmLhPN3gvztpDoXgt55qeUwWV9s1hebwJqXbcIk1tACHH/SER5A2qCX1Gg1O60P+thhnCys/yuHZIrsLcdbQ51rHLWOQDZH7Fpd6x9caXKekBcAjNaXuiXyDxeKFzXAcptWWjSfSNt8lerXMERdbE5php7yeoN4BdkOFRK4p4mDNzwpWCN2sc6v+iNY+8dNjRDRTX0cVxLJ+G+v2m3Yy+Q9zKKYpTnriePhZjgGuR05jsZxdM60ZTcy6ZShk6LXNVn4ClD20GbOG4G2GqnEw7zuflrlcK8dNmAJPsqDAe6BK0vJmmcQwP7+vBcMdq8meE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5521.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(261009223027099003)(261021123027099003)(261021121427099003)(261022105027099003)(261021133027099003)(261021135927099003)(261022075727099003)(261021130227099003)(261022115727099003)(261022113327099003)(10067099003)(56012099006)(6133799003)(3023799007)(18002099003)(22082099003)(11063799006)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MmxzV1hUbnEzK1hzaDUwZTJobERtdFZNZ3RuNVo5clNzVzdqL1NVS0h0OFJE?=
 =?utf-8?B?RmxhOUp6cGFPV2ZKcGIyQXlIUkhScy94Z1ErTFh1c1hwZUlXdVNPVWRIem9p?=
 =?utf-8?B?SmNCWGVBQ3dHL29qSVpOcjNyeDU1cG1aZnlwUVRLRTR3cTNmRzFESk1GTGVC?=
 =?utf-8?B?eTc1R2R1cmhNa3JJN0dsU2xSbDFNeWhBZXQxenpPVFFIQ1VXWGdPSm5mWDNw?=
 =?utf-8?B?OFhzckgyMkQ5QUdFdDB3S0hFOG83MFcvNGgvanFDZ0hVeWk1VW9vUU1VTXl1?=
 =?utf-8?B?UDdCOXJKZDVpVWljbFhaWTIvZnBxNUxkUm9uMnNKT0ZHTUJ6ZHVOK3FicW9N?=
 =?utf-8?B?dks1VHNEVk12cXBWR1dGVTVlRlJQVTZPNDB6UUZsVW5ZY0trOU4xRDZNbEdO?=
 =?utf-8?B?YUdwS01CMW1HSjBTd0luRzlVOFQxZ3N0WUFFcGRPdytTMWQ3RXYwUFpYUUdT?=
 =?utf-8?B?dXZHZW8xWDFLVXpwM1lnRWNvSUZvSTRrQWpDUFVhclpFV1BETHNLOW9FUldr?=
 =?utf-8?B?aTZhVm1UV3dsYXR5NSttOHg2emd3c1VBNmhCSS9RZWQvV2E3dXFWR2x3Ry80?=
 =?utf-8?B?YlBidS9kU2RjRExWWDcza08ydEtLM1BCQkp1NVZnZlBtODI0MW9xRGoxdXJx?=
 =?utf-8?B?YUlMYTlLWGRIRW1oN0Zad0dWeEZ2dnpXanBrMFlnOURSc1FhWFgyZ3c4MnJ3?=
 =?utf-8?B?bEhWRnVaaGZSYmtDSGdVRi9GYnJYdmpMVnhrOEhYQkNZSWdpa2FwQ0h0dnIv?=
 =?utf-8?B?R1pUcFBoY2haeU5qY0hORE9SUXlPbXhtMGVVZFlKSStGSWtMZ1RJbkpSOWdo?=
 =?utf-8?B?cXRoWGZ0VEdmT3Z0TWFGNmpwSlZ4TTRMMWZvVEMyMGU2dXZ6alovMWRGMFR2?=
 =?utf-8?B?dkdsMUg4QWRFOWEra0FzY2NTUVROQktHVW1mNGdnTnJCZDFQSnFrd0NQUS9D?=
 =?utf-8?B?V0pGa1hTN1lCb3FEWiszeG53OTNPR1QwMFhYZmhMU1MveDhxaStWM0I5eDgv?=
 =?utf-8?B?MHFObHZBcWEyOW1pUXNodmU3UFBHdnNTRmU3UlhpSlpxbmUrYklxdGo5dlRm?=
 =?utf-8?B?dFZTaExXZHlrcXdxVXpoR2paMTBUYTVwNCtKdkJ4aUxTSFRBajIyRTRxaGg3?=
 =?utf-8?B?M0UwdEMvQnR0b29aRk5wOGhPWTh4bnRqelhlaHBWNStkQVVyTVZEeVgyc3pt?=
 =?utf-8?B?b1RiZklWYnpTOWRvN0g5Z2Z4aUhkczEyKzRucUZSbm1Nd1NVYS9QaFNUbnhp?=
 =?utf-8?B?T3dYZWltQ3dBbkRpSUc2MXBESHBMQUtyUHVuOWJYd1JLMmkxaFlSbVYrR1Yx?=
 =?utf-8?B?Y2g0a2pJNE41V0N1VnY2WTVGSUtVT1VBNXhPUVpLYlJna0NYYURyOFNBSGls?=
 =?utf-8?B?Uy9xK3E2ME9tTCtqWFgrdXY4eWVvaXY3ZTFMUVJTU3VDUUdCYXVGM3dMMGtv?=
 =?utf-8?B?SStsendJb1hwL0dDMFpCMW9xc3BYVXlsaU10SXFDSW1ML081bEMzeGFzd2tC?=
 =?utf-8?B?bUR5eHJScGNJT1VGZWxSQk9UNUtnTGo1TUljZXF3NzJJZXN0SW1oNk95NUNr?=
 =?utf-8?B?dmVpMUtJSCsrQ3VHSmQ1WVRtZU5wVVhvZ1dQb1pSazkvN01QSHRldkN0THhn?=
 =?utf-8?B?VGVWb3ZqQXBmeWJzVmc1WlRpK2VPQ2llazFPN05jMVdKcElXcjdlanVVdUxZ?=
 =?utf-8?B?eWZ0cHVvTlNMYVFlcHBtK1FDR0J2MHJPSWlKQmRRSFZlQTBHQ2pCdjN1MzE0?=
 =?utf-8?B?YTlFaDZ0SitxWjkvTHNqNWhIeE9MTFRYMTl4WXcvMVZtV3ZjZEVvRS9aZ0dk?=
 =?utf-8?B?RUdxc0xYU0VmZDJsays5N3ZPdUczbWhuaVpOeFhwKzhIUDE2R2ZMMXlYM0hE?=
 =?utf-8?B?cThBb3k0cHdlbUxjUVdCNGdKdjdkWDJqZG95L3A1R2xvT1preS9PbjZOY0h2?=
 =?utf-8?B?b1c1YUlxZUI5SDRPTE9EZ2NVMjZUY0hLNUFjY2V0ZjJWdEVZcjlOS1c2VWk1?=
 =?utf-8?B?S0hMdUt4cnV0Mkh6ZXd6cFFadzF1cGdYTFprbXBiZ1pMcENrUERXTWFUdVpq?=
 =?utf-8?B?SS9HWmwrYVJLYnhoY2kzdkRqbUEzc09hL1lOcm1KKzJTa0hjdWo0V2w3NGdh?=
 =?utf-8?B?ejVZc3pab2c1OUNwcFdCRC9ZQk9SRFUzd1o5UmRaZW5LZTlJaUdOVHVzNEZB?=
 =?utf-8?B?OFJqTUIyVUp1WDZlSUZVaDlzRDRsdDNtWlRkMkpIS0EySjZJb3lsblc5VFRJ?=
 =?utf-8?B?VC9WRG1DVGY1b0lTVTFMTWdBbHdMUldEU1A0amI4dVVHWTNNUTFTNWI0b0FG?=
 =?utf-8?B?N1V0UjljaWZhK05sbUU2SzZHRVdEcmtLQ29aYVBqVE1Tb1BYTUZiUT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8ce3df9-ef24-4540-622a-08df30ea7a7c
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5521.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 09:46:14.7818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +pmoyTZ0bhGugNeX5QWP8q3WjCVZD+9WGm8xfZAwjrFkyZCR8tu/drj4yrKtXEwTmDf9d1fCFEWd0T7bnVApvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI4PR03MB10293

The patch is for defconfig, but the feedbacks are about the driver

> Thank you for your contribution! Sashiko AI review found 9 potential issue(s) to consider:
> - [Critical] media: amlogic: vdec: unchecked ref_list bounds and canvas lifecycle in h264
> - [High] media: amlogic: vdec: aml_vdec_init_dec_inst() returns -1 on output restart
> - [High] media: amlogic: vdec: check DPB entry flags in poc_is_in_dpb() and get_dpb_by_poc()
> - [High] media: amlogic: vdec: out-of-bounds SPS workspace write in h264_config_params()
> - [High] media: amlogic: vdec: ignored pm-domain error, unenabled clk, early vdev reg
> - [High] media: amlogic: vdec: wrong IS_ERR() check on meson_sm_get() return
> - [Medium] media: amlogic: vdec: uninitialized pic_info, prematuresizeimage calc, and split locks
> - [Medium] media: amlogic: vdec: missing error unwind and propagation in vdec_poweron()
> - [Low] media: amlogic: vdec: missing select REGMAP_MMIO in Kconfig
> --
>
> commit 05491c1c72b85040b071b152b79a908d403d95f0
> Author: Zhentao Guo <zhentao.guo@amlogic.com>
>
> arm64: defconfig: Enable CONFIG_VIDEO_AMLOGIC_VDEC
>
> This commit enables the Amlogic V4L2 stateless video decoder driver
> (CONFIG_VIDEO_AMLOGIC_VDEC=m) as a module in the arm64 defconfig for
> Amlogic SoCs such as the S4 (S805X2) platform.
>
>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>> index 7b4985b29b21c..f00c8a418a464 100644
>> --- a/arch/arm64/configs/defconfig
>> +++ b/arch/arm64/configs/defconfig
>> @@ -929,6 +929,7 @@ CONFIG_USB_VIDEO_CLASS=m
>>   CONFIG_V4L_PLATFORM_DRIVERS=y
>>   CONFIG_SDR_PLATFORM_DRIVERS=y
>>   CONFIG_V4L_MEM2MEM_DRIVERS=y
>> +CONFIG_VIDEO_AMLOGIC_VDEC=m
> [Severity: Critical]
> Can h264_config_ref_lists() and h264_reorder_reflists() in
> drivers/media/platform/amlogic/vdec/h264.c overflow ref_list0 and ref_list1
> and leak meson_canvas indices?
>
> First, in struct aml_h264_ctx, ref_list0 and ref_list1 are sized to
> V4L2_H264_NUM_DPB_ENTRIES + 1 (17 elements). However, in
> h264_config_ref_lists(), v4l2_h264_init_reflist_builder() sets
> builder.num_valid up to V4L2_H264_REF_LIST_LEN (32) when
> V4L2_H264_DECODE_PARAM_FLAG_FIELD_PIC is set in decode->flags, and passes
> builder.num_valid as list_size to config_p_reflist() and config_b_reflist():
>
> drivers/media/platform/amlogic/vdec/h264.c:config_p_reflist() {
>          for (i = 0; i < list_size; i++) {
>                  index = v4l2_p0_reflist[i].index;
>                  h264_ctx->ref_list0[i].used = 1;
>                  ...
>          }
> }
>
> Won't list_size > 17 write past the end of ref_list0 and ref_list1 in
> config_p_reflist() and config_b_reflist(), as well as in the loops using
> h264_ctx->list_size[] in h264_config_decode_spec(), get_canvas_index(), and
> h264_release_decode_spec()?
This is a problem. Since the interlaced streams will be supported by the 
driver in the next stage, the ref_list(x) should be enlarged to match 
the interlaced streams.
> Second, when all 16 dpb entries are active and num_ref_idx_lx_active is 16,
> reorder_short_term() and reorder_long_term() shift ref_list_reordered[15] into
> the sentinel slot ref_list_reordered[16] without clearing the sentinel
> afterward:
>
> drivers/media/platform/amlogic/vdec/h264.c:reorder_short_term() {
>          for (c_idx = num_ref_idx_lx_active; c_idx > *ref_idx_lx; c_idx--)
>                  memcpy(&ref_list_reordered[c_idx], &ref_list_reordered[c_idx - 1],
>                         sizeof(struct h264_decode_buf_spec));
>          ...
>          h264_ctx->list_size[cur_list] = num_ref_idx_lx_active;
> }
>
> Since get_refidx_by_picnum(), get_st_refpic_by_num(), and
> get_lt_refpic_by_num() iterate until ref_list[i].dpb is NULL with no upper
> bound on i:
>
> drivers/media/platform/amlogic/vdec/h264.c:get_refidx_by_picnum() {
>          for (i = 0; ref_list[i].dpb; i++) {
>                  if (pic_num == ref_list[i].dpb->pic_num)
>                          return i;
>          }
> }
>
> can overwriting ref_list[16].dpb cause these helpers to read past the end of
> ref_list0 and ref_list1 on subsequent reordering commands?
Yes, should add a bound check against dpb size here.
>
> Third, reorder_short_term() and reorder_long_term() overwrite
> h264_ctx->list_size[cur_list] with num_ref_idx_lx_active. In
> get_canvas_index(), config_decode_canvas() is called for every entry below
> list_size without checking buf->used or buf->valid, while
> h264_release_decode_spec() only calls release_canvas_index() when buf->used is
> non-zero:
>
> drivers/media/platform/amlogic/vdec/h264.c:get_canvas_index() {
>          if (h264_ctx->list_size[0] > 0) {
>                  for (i = 0; i < h264_ctx->list_size[0]; i++) {
>                          buf = &h264_ctx->ref_list0[i];
>                          ret = config_decode_canvas(hw, buf, h264_ctx->mb_width,
>                                                     h264_ctx->mb_height);
>                          ...
>                  }
>          }
> }
>
> drivers/media/platform/amlogic/vdec/h264.c:h264_release_decode_spec() {
>          if (h264_ctx->list_size[0] > 0) {
>                  for (i = 0; i < h264_ctx->list_size[0]; i++) {
>                          buf = &h264_ctx->ref_list0[i];
>                          buf->valid = 0;
>                          if (buf->used) {
>                                  buf->dpb = NULL;
>                                  release_canvas_index(hw, buf);
>                                  buf->used = 0;
>                          }
>                  }
>                  h264_ctx->list_size[0] = 0;
>          }
> }
>
> If num_ref_idx_lx_active is larger than the initial list_size, won't
> get_canvas_index() allocate meson canvases for entries with buf->used == 0
> that h264_release_decode_spec() never frees, and if num_ref_idx_lx_active is
> smaller, won't entries above the new list_size retain stale state?
Not an issue.
All the specs in the reflist were copied from the unordered lists, all 
the vaild buffer spec in the unordered lists were set the valid and used 
flag. So all the buf spec after reordered has the vaild and used flag 
set to 1.
>
> [Severity: High]
> What happens in drivers/media/platform/amlogic/vdec/aml_vdec.c when the output
> queue is stopped and restarted while the capture queue remains streaming?
>
> When a client stops the output queue via vb2ops_vdec_stop_streaming() while
> ctx->is_cap_streamon is still set, aml_vdec_release_instance() is not called
> and ctx->codec_priv remains non-NULL:
>
> drivers/media/platform/amlogic/vdec/aml_vdec.c:vb2ops_vdec_stop_streaming() {
>          if (!ctx->is_output_streamon && !ctx->is_cap_streamon)
>                  aml_vdec_release_instance(ctx);
> }
>
> When the output queue is subsequently restarted, vb2ops_vdec_start_streaming()
> calls aml_vdec_init_dec_inst(), which initializes ret to -1 and skips
> ctx->codec_ops->init(ctx) because ctx->codec_priv is already allocated:
>
> drivers/media/platform/amlogic/vdec/aml_vdec.c:aml_vdec_init_dec_inst() {
>          int ret = -1;
>          ...
>          if (ctx->codec_ops->init && !ctx->codec_priv) {
>                  ret = ctx->codec_ops->init(ctx);
>                  if (ret < 0)
>                          return ret;
>          }
>          ctx->curr_dec_type = fmt_out->codec_type;
>          ...
>          return ret;
> }
>
> Because ret stays -1, vb2ops_vdec_start_streaming() treats the call as a
> failure, returns all queued source buffers via v4l2_m2m_src_buf_remove() and
> v4l2_m2m_buf_done(), and fails VIDIOC_STREAMON with -EINVAL:
>
> drivers/media/platform/amlogic/vdec/aml_vdec.c:vb2ops_vdec_start_streaming() {
>                  if (aml_vdec_init_dec_inst(ctx) < 0) {
>                          while ((src_buf = v4l2_m2m_src_buf_remove(ctx->m2m_ctx)))
>                                  v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_QUEUED);
>                          return -EINVAL;
>                  }
> }
>
> Should ret be initialized to 0 in aml_vdec_init_dec_inst() so restarting the
> output queue succeeds when ctx->codec_priv is already present?
Yes, the ret should be given a initial value of 0 here.
>
> [Severity: High]
> Should poc_is_in_dpb() and get_dpb_by_poc() in
> drivers/media/platform/amlogic/vdec/h264.c check whether a dpb entry is active
> before matching top_field_order_cnt?
>
> During H264_SLICE_HEADER_DONE handling in
> h264_threaded_isr_func()->h264_config_decode_spec()->clear_unused_col_buf(),
> poc_is_in_dpb() is called to decide whether to release colocated_buf and
> canvas_pos slots:
>
> drivers/media/platform/amlogic/vdec/h264.c:poc_is_in_dpb() {
>          for (i = 0; i < V4L2_H264_NUM_DPB_ENTRIES; i++) {
>                  if (poc == dpb[i].top_field_order_cnt) {
>                          ret = 1;
>                          break;
>                  }
>          }
> }
>
> Because decode->dpb has 16 fixed entries and poc_is_in_dpb() does not check
> dpb[i].flags for V4L2_H264_DPB_ENTRY_FLAG_ACTIVE (or
> V4L2_H264_DPB_ENTRY_FLAG_VALID), any unused zeroed dpb entry has
> top_field_order_cnt == 0, causing poc_is_in_dpb(0, decode->dpb) to always
> return 1 and leak the colocated_buf and canvas_pos slots for poc 0 in
> clear_unused_col_buf():
>
> drivers/media/platform/amlogic/vdec/h264.c:clear_unused_col_buf() {
>          for (i = 0; i < h264_ctx->colocated_buf_num; i++) {
>                  if (!((h264_ctx->colocated_buf_map >> i) & 0x1))
>                          continue;
>                  col_poc = h264_ctx->colocated_buf_poc[i];
>                  if (poc_is_in_dpb(col_poc, decode->dpb) != 1)
>                          release_colocate_buf(h264_ctx, i);
>          }
>
>          for (i = 0; i < (V4L2_H264_NUM_DPB_ENTRIES + 1); i++) {
>                  if (!((h264_ctx->canvas_pos_map >> i) & 0x1))
>                          continue;
>                  col_poc = h264_ctx->ref_canvas[i].poc;
>                  if (poc_is_in_dpb(col_poc, decode->dpb) != 1)
>                          release_canvas_pos(h264_ctx, i);
>          }
> }
>
> Similarly, if userspace clears flags on retired dpb entries without zeroing
> top_field_order_cnt, their colocated_buf and canvas_pos slots are never freed
> until all slots are exhausted.
>
> In addition, h264_config_decode_buf() looks up reference entries with
> get_dpb_by_poc():
>
> drivers/media/platform/amlogic/vdec/h264.c:get_dpb_by_poc() {
>          for (i = 0; i < V4L2_H264_NUM_DPB_ENTRIES; i++) {
>                  if (decode->dpb[i].top_field_order_cnt == poc)
>                          return &decode->dpb[i];
>          }
>          return NULL;
> }
>
> drivers/media/platform/amlogic/vdec/h264.c:h264_config_decode_buf() {
>                          dpb = get_dpb_by_poc(decode, poc);
>                          if (dpb && (dpb->flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE)) {
> }
>
> If an earlier inactive dpb slot has the same top_field_order_cnt as a later
> active dpb slot (for instance, an unused zeroed slot before an active poc 0
> entry), won't get_dpb_by_poc() return the inactive slot and cause
> h264_config_decode_buf() to skip writing the active reference frame's info
> into H264_BUFFER_INFO_DATA?
In short: the flag check on poc_is_in_dpb() regresses real bitstreams 
and the leak it protects is bounded by the unconditional IDR flush; 
get_dpb_by_poc() callers
already re-check the ACTIVE flag, so no wrong data can be programmed.

I suggest to keep the current behavior.

>
> [Severity: High]
> Can a userspace V4L2_CID_STATELESS_H264_SPS control with
> sps->seq_parameter_set_id >= 32 cause an out-of-bounds write in
> h264_config_params() in drivers/media/platform/amlogic/vdec/h264.c?
>
> In drivers/media/v4l2-core/v4l2-ctrls-core.c, std_validate_compound() does not
> validate that p_h264_sps->seq_parameter_set_id is within 0..31, and
> aml_vdec_ctrls_setup() in drivers/media/platform/amlogic/vdec/aml_vdec.c does
> not provide custom validation. When aml_h264_dec_run() calls
> h264_config_params()->config_sps_params(), p_sps_base is calculated directly
> from sps->seq_parameter_set_id (a u8 up to 255):
>
> drivers/media/platform/amlogic/vdec/h264.c:h264_config_params() {
>          p_sps_base = (unsigned short *)(h264_ctx->workspace_vaddr +
>                  MEM_SPS_BASE + sps->seq_parameter_set_id * 0x400);
>          p_pps_base = (unsigned short *)(h264_ctx->workspace_vaddr +
>                  MEM_PPS_BASE + pps->pic_parameter_set_id * 0x200);
> }
>
> drivers/media/platform/amlogic/vdec/h264.c:config_sps_params() {
>          memset(sps_base, 0, 0x100);
>          memset(data_tmp, 0, sizeof(data_tmp));
> }
>
> Since MEM_SPS_BASE (0x01c3c00) to MEM_PPS_BASE (0x01cbc00) only has room for
> 32 entries of 0x400 bytes, won't seq_parameter_set_id >= 32 cause
> config_sps_params() to overwrite the MEM_PPS_BASE table and adjacent regions
> of h264_ctx->workspace_vaddr?
The h264 spec has restricted the seq_parameter_set_id to be in the range 
of 0~31, inclusive. I suggest to keep the current behavior.
>
> [Severity: High]
> Could drivers/media/platform/amlogic/vdec/aml_vdec_hw.c and
> drivers/media/platform/amlogic/vdec/aml_vdec_drv.c access unclocked or
> unpowered DOS_BUS registers if power domain attachment fails or before
> vdec_enable() runs?
>
> In pm_vdec_power_domain_init(), errors from dev_pm_domain_attach_by_name()
> (including -EPROBE_DEFER) are ignored and pd[i].dev is set to NULL:
>
> drivers/media/platform/amlogic/vdec/aml_vdec_hw.c:pm_vdec_power_domain_init() {
>                  pd[i].dev = dev_pm_domain_attach_by_name(hw->dev, pd[i].name);
>                  if (IS_ERR_OR_NULL(pd[i].dev)) {
>                          err = PTR_ERR(pd[i].dev);
>                          dev_dbg(hw->dev, "Get %s failed, pm-domain: %d\n",
>                                  pd[i].name, err);
>                          pd[i].dev = NULL;
>                          continue;
>                  }
> }
>
> When pd_data[core].dev is NULL, vdec_poweron() skips hw->pm->power_on(hw, core)
> and leaves both the vdec power domain and vdec clock disabled, so subsequent
> DOS_BUS register accesses in m2mops_vdec_device_run()->dos_enable() can
> trigger a synchronous external abort:
>
> drivers/media/platform/amlogic/vdec/aml_vdec_hw.c:vdec_poweron() {
>          mutex_lock(&hw->pm_mutex);
>          if (!hw->pm->pd_data[core].dev)
>                  goto out;
>          ...
>          hw->pm->power_on(hw, core);
The domains are fixed SoC components described in the same dtsi; attach 
failure is logged and can only happen with a broken device tree. We keep 
the tolerant behavior.
> }
>
> In addition, vdec_clock_gate_init() acquires the dos clock in
> hw->gates[CLK_DOS]:
>
> drivers/media/platform/amlogic/vdec/aml_vdec_hw.c:vdec_clock_gate_init() {
>          hw->gates[CLK_DOS].id = "dos";
>          hw->gates[CLK_VDEC].id = "vdec";
>          hw->gates[CLK_HVDEC].id = "hvdec";
>
>          return devm_clk_bulk_get(hw->dev, CLK_MAX, hw->gates);
> }
>
> Yet pm_vdec_power_domain_power_on() only enables vdec and hvdec and never
> enables hw->gates[CLK_DOS].clk.
The dos_clk is always-on in the chip, so there's no need to enable it 
manually.
>
> Furthermore, in aml_vdec_drv_probe() in
> drivers/media/platform/amlogic/vdec/aml_vdec_drv.c, video_register_device() is
> called before dev->v4l2_dev.mdev is initialized and before
> vdec_enable(dev->dec_hw) is called:
>
> drivers/media/platform/amlogic/vdec/aml_vdec_drv.c:aml_vdec_drv_probe() {
>          ret = video_register_device(vfd_dec, VFL_TYPE_VIDEO, -1);
>          if (ret) {
>                  v4l2_err(&dev->v4l2_dev, "Failed to register video device");
>                  goto err_vid_dev_register;
>          }
>
>          dev->mdev.dev = &pdev->dev;
>          strscpy(dev->mdev.model, AML_VDEC_DRV_NAME, sizeof(dev->mdev.model));
>          media_device_init(&dev->mdev);
>          dev->mdev.ops = &aml_m2m_media_ops;
>          dev->v4l2_dev.mdev = &dev->mdev;
>          ...
>          vdec_enable(dev->dec_hw);
> }
I think this is a minor problem, but in case of the bus hang caused by 
device_run called before vdec_enable, this worths fixing.
>
> Should pm_vdec_power_domain_init() propagate errors from
> dev_pm_domain_attach_by_name(), should CLK_DOS be enabled before accessing
> DOS_BUS registers, and should vdec_enable() and media_device_init() run before
> video_register_device() publishes the device node?
>
> [Severity: High]
> Why does dev_request_hw_resources() in
> drivers/media/platform/amlogic/vdec/aml_vdec_hw.c check meson_sm_get() with
> IS_ERR() instead of checking for NULL?
>
> In drivers/firmware/meson/meson_sm.c, meson_sm_get() returns NULL when the
> secure-monitor device is missing or has not finished probing:
>
> drivers/firmware/meson/meson_sm.c:meson_sm_get() {
>          if (!pdev)
>                  return NULL;
>
>          fw = platform_get_drvdata(pdev);
>
>          put_device(&pdev->dev);
>
>          return fw;
> }
>
> However, dev_request_hw_resources() only checks IS_ERR(hw->sec_fw):
>
> drivers/media/platform/amlogic/vdec/aml_vdec_hw.c:dev_request_hw_resources() {
>          hw->sec_fw = meson_sm_get(sm_np);
>          of_node_put(sm_np);
>          if (IS_ERR(hw->sec_fw))
>                  return PTR_ERR(hw->sec_fw);
> }
>
> If meson_sm_get() returns NULL, probe succeeds with hw->sec_fw == NULL, and
> when a decode job runs m2mops_vdec_device_run()->load_firmware() in
> drivers/media/platform/amlogic/vdec/aml_vdec_tee_fw.c:
>
> drivers/media/platform/amlogic/vdec/aml_vdec_tee_fw.c:load_firmware() {
>          meson_sm_call(hw->sec_fw, SM_LOAD_VIDEO_FW, &ret,
>                        video_fw->fw_format, video_fw->core,
>                        video_fw->is_swap, 0, 0);
> }
>
> won't meson_sm_call() dereference a NULL hw->sec_fw pointer instead of probe
> returning -EPROBE_DEFER?
Correct, fixed by checking for NULL and returning -EPROBE_DEFER.

>
> [Severity: Medium]
> Are ctx->pic_info, plane_fmt[0].sizeimage, and the format/queue locks in
> drivers/media/platform/amlogic/vdec/aml_vdec.c initialized in the right order?
>
> First, when a file handle is opened, fops_vcodec_open()->aml_vdec_reset_fmts()
> calls reset_output_fmts(), which sets ctx->pix_fmt[AML_FMT_SRC] without
> calling set_pic_info():
>
> drivers/media/platform/amlogic/vdec/aml_vdec.c:reset_output_fmts() {
>          vdec_try_fmt_mp(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE, &fmt,
>                          out_fmt);
>
>          ctx->pix_fmt[AML_FMT_SRC] = fmt;
> }
>
> If userspace starts streaming with the default format without calling
> VIDIOC_S_FMT on V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE, ctx->pic_info.fb_size[0]
> remains 0, so h264_config_decode_spec() and h264_config_ref_spec() in
> drivers/media/platform/amlogic/vdec/h264.c set c_dma_addr equal to y_dma_addr
> for single-planar capture formats:
>
> drivers/media/platform/amlogic/vdec/h264.c:h264_config_decode_spec() {
>          h264_ctx->curr_spec.y_dma_addr = vb2_dma_contig_plane_dma_addr(vb, 0);
>          if (ctx->pix_fmt[AML_FMT_DST].num_planes > 1)
>                  h264_ctx->curr_spec.c_dma_addr =
>                      vb2_dma_contig_plane_dma_addr(vb, 1);
>          else
>                  h264_ctx->curr_spec.c_dma_addr =
>                      h264_ctx->curr_spec.y_dma_addr + ctx->pic_info.fb_size[0];
> }
I think this is an invalid case, since the decoder instance will not be 
created without calling set_output_format.
> Second, in vdec_try_fmt_mp(), plane_fmt[0].sizeimage for the output queue is
> computed from pix_mp->height and pix_mp->width before ALIGN() and
> v4l2_apply_frmsize_constraints() clamp and align them:
>
> drivers/media/platform/amlogic/vdec/aml_vdec.c:vdec_try_fmt_mp() {
>          if (V4L2_TYPE_IS_OUTPUT(type)) {
>                  pix_mp->num_planes = dec_fmt->num_planes;
>                  pix_mp->pixelformat = dec_fmt->fourcc;
>                  if (!pix_mp->plane_fmt[0].sizeimage)
>                          pix_mp->plane_fmt[0].sizeimage =
>                              (pix_mp->height * pix_mp->width * 3) / 2;
>                  pix_mp->height = ALIGN(pix_mp->height, align);
>                  pix_mp->width = ALIGN(pix_mp->width, align);
>          } else {
>                  ...
>          }
>
>          v4l2_apply_frmsize_constraints(&pix_mp->width, &pix_mp->height,
>                                         &dec_fmt->stepwise);
> }
>
> If userspace passes width == 0 or height == 0 with sizeimage == 0, sizeimage
> remains 0 even after width and height are clamped to the minimum frame size.
v4l2_fill_pixfmt_mp() recomputes it from the clamped dimensions at the 
end of vdec_try_fmt_mp().
>
> Third, aml_vdec_reset_fmts() and aml_vdec_queue_init() set
> ctx->m2m_ctx->q_lock, src_vq->lock, and dst_vq->lock to &ctx->v4l2_intf_lock,
> whereas aml_vdec_drv_probe() sets vfd_dec->lock to &dev->dev_mutex:
>
> drivers/media/platform/amlogic/vdec/aml_vdec.c:aml_vdec_reset_fmts() {
>          ctx->m2m_ctx->q_lock = &ctx->v4l2_intf_lock;
>          reset_output_fmts(ctx);
>          reset_capture_fmts(ctx);
> }
>
> Doesn't using two different mutexes allow VIDIOC_S_FMT and VIDIOC_G_FMT to
> race with queue ioctls such as VIDIOC_REQBUFS, VIDIOC_QBUF, and
> VIDIOC_STREAMON?
The sequencing requires S_FMT/G_FMT should come first, and 
VIDIOC_REQBUFS / Q_BUF only start after the queue has been STREAMON. 
Besides, S_FMT is rejected while the queue is busy, so I believe the 
risk here is low here.
>
> [Severity: Medium]
> What happens in drivers/media/platform/amlogic/vdec/aml_vdec_hw.c when
> pm_runtime_resume_and_get() or clk_prepare_enable() fails during
> vdec_poweron()?
>
> In pm_vdec_power_domain_power_on(), if clk_prepare_enable(gate_node->clk)
> succeeds and pm_runtime_resume_and_get(dev) fails, gate_node->clk is not
> disabled and unprepared, and the error is not returned to the caller:
>
> drivers/media/platform/amlogic/vdec/aml_vdec_hw.c:pm_vdec_power_domain_power_on() {
>          if (gate_node) {
>                  ret = clk_prepare_enable(gate_node->clk);
>          ...
>          if (!ret && dev) {
>                  ret = pm_runtime_resume_and_get(dev);
>                  if (ret < 0)
>                          dev_err(hw->dev, "failed to power on %s domain: %d\n",
>                                  pm->pd_data[id].name, ret);
>          ...
>          if (!ret)
>                  dos_local_config(hw, 1, id);
> }
>
> Because vdec_poweron() increments hw->pm->pd_data[core].ref_count before
> calling hw->pm->power_on(hw, core) and vdec_enable() always returns 0 to
> aml_vdec_drv_probe():
>
> drivers/media/platform/amlogic/vdec/aml_vdec_hw.c:vdec_poweron() {
>          hw->pm->pd_data[core].ref_count++;
>          if (hw->pm->pd_data[core].ref_count > 1)
>                  goto out;
>
>          hw->pm->power_on(hw, core);
> }
>
> when aml_vdec_drv_remove() later calls
> vdec_disable()->vdec_poweroff()->pm_vdec_power_domain_power_off():
>
> drivers/media/platform/amlogic/vdec/aml_vdec_hw.c:pm_vdec_power_domain_power_off() {
>          dos_local_config(hw, 0, id);
>
>          if (dev) {
>                  pm_runtime_put_sync(dev);
> }
>
> won't pm_vdec_power_domain_power_off() access unpowered DOS_BUS registers in
> dos_local_config(hw, 0, id) and cause unbalanced pm_runtime_put_sync() and
> clk_disable_unprepare() calls?
The cascade is limited to probe/remove-time failures of fixed SoC power 
domains, but we will look at propagating the error and rolling back the 
clock in a follow-up.
>
> [Severity: Low]
> Should VIDEO_AMLOGIC_VDEC in drivers/media/platform/amlogic/vdec/Kconfig
> select REGMAP_MMIO?
>
> In drivers/media/platform/amlogic/vdec/aml_vdec_hw.c,
> dev_request_hw_resources() initializes regmaps via devm_regmap_init_mmio():
>
> drivers/media/platform/amlogic/vdec/aml_vdec_hw.c:dev_request_hw_resources() {
>                  if (i == DOS_BUS) {
>                          hw->map[i] = devm_regmap_init_mmio(&pdev->dev, reg_base[i],
>                                                             &dos_regmap_conf);
>                  } else if (i == DMC_BUS) {
>                          hw->map[i] = devm_regmap_init_mmio(&pdev->dev, reg_base[i],
>                                                             &dmc_regmap_conf);
>                  }
> }
>
> However, VIDEO_AMLOGIC_VDEC in drivers/media/platform/amlogic/vdec/Kconfig
> does not select REGMAP_MMIO:
>
> drivers/media/platform/amlogic/vdec/Kconfig: {
> config VIDEO_AMLOGIC_VDEC
>      tristate "Amlogic Video Decoder Driver"
>      ...
>      select VIDEOBUF2_DMA_CONTIG
>      select V4L2_H264
>      select V4L2_MEM2MEM_DEV
>      select MESON_CANVAS
> }
Correct, but I think in most situations the REGMAP_MMIO is enabled.
>
> Could configurations enabling CONFIG_VIDEO_AMLOGIC_VDEC without another driver
> selecting CONFIG_REGMAP_MMIO fail to build or link?
>
>>   CONFIG_VIDEO_AMPHION_VPU=m
>>   CONFIG_VIDEO_CADENCE_CSI2RX=m
>>   CONFIG_VIDEO_WAVE_VPU=m
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20261022-b4-s4-vdec-upstream-v12-0-616240978792@amlogic.com?part=6
