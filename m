Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011068.outbound.protection.outlook.com [52.101.65.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16924306B08;
	Tue, 25 Aug 2026 02:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787626753; cv=fail; b=kbO1gypyf4kHQBMuC7gGSU5M3R5X7ERecncyNdw3wW08tbrSh47Jgkhbhv48vEvYked3nB03Y5+zcRsiDW9ELSQTZRafAmugtICDKQWiKQ9kZuYi5ze9FrLhlQibRhyzi+dfnBgU+dfXatMcbYPqxJfKZxZipMsW9+lVC+d+yTg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787626753; c=relaxed/simple;
	bh=/gF1DJgvBrJiCXt56IyM0m7QylW+U4eaxfbFiTjgr6E=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=E8psFLMZsFEfM4+dlHzq88kWNehd6XQFbhE6Z55vBMEpJi5Gzu9amcJs4SI0dnxHYBcvPBtgg0kHBsuotIb6bQ6VUW6DFPLulmzec6qTzo8GIxbEkEzO1jPfsZI45El4FSkXuALCvTBzzVZ0/ryHsRc/eV1Oyen0oPWAHWZ6V/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=OFkHtgvt; arc=fail smtp.client-ip=52.101.65.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="OFkHtgvt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r2KR81uRtsRV1hq3AVknzEVgKtKTgJ/ylcv0JK/ijTuCDaHInfnQrLu3lnuZCM2d9SDKhqWQprAGWFp3CqXLFn6D1WD8LdD+Ls+2CNv8r+HEFqMRQKE+MH5ijj+bOaiq0LEuitd+PY21XBaXLku/moxeK8TPzkQHPwECNQG+gvDUVLLjwIDqVoVP5fFkb1ma7MrdyKVuoce7EyeSypJJDn3nGf96boUpsx/mScFKNqRhvtimjDWcY8ug7wbyZP7pVz55VBpzc5C57/L3KroRzrs1kDZRDE8DGF5QEwTn+K9YX3YUUvv4WQjjyIMY9VwpH9EE7qngcx+fC/+kLT6V9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/bN972sTexshK9zQI85eqa9vjEaLlEiv4NqykzcZBIk=;
 b=FqD9iGHziZaYeZ4ehLZvqSVr9rLp3X+fra76XMM6HRzgvO08LihpgsirBfF40eYlRhMcMr1udC/ZOjvMUMpjSeQl9qmu/MYMRagqHfb4jGe0U9rzUuRaDE746n7V9VH7iCDK/ooiLwywu6ZKqGhtZkmKlFY/DkNe/z9CyWANtKWEfAtRBeUaL3lQW/IjPoGy+iCek7V/L08Gnp6Z2DEawWRLffwyGKeTJS8zsYLMRf1b7RO1OWE0lTGWZjvZVjKx9j/TRM2PNaX1IRkzQFmodXtreYz6vyqq7ErBT/QDKjeJpmw4MtCrtxTcvQAfFEDA41HWOMERDSjMNwZ7C5JBmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/bN972sTexshK9zQI85eqa9vjEaLlEiv4NqykzcZBIk=;
 b=OFkHtgvt9QCUwtAzKMlaWEsbRs9bkJo8F+YR0AZqoPdMMzdYSCWXTnOWv8PAV4t5/najU8fTOIN54O8HFqqobNU/2fNSOe/40BJ4ssXrZb7YPOq4fP/qVM8rIUVbWtclNs3fgBWOscr7W8+nqbC4UxfuoSmq5+jnjKJOEDndrpSi3FfPcWd6iJo1hqLyZYsTdLQrBUuLbduI5J6wueeRBy1qTRWU1No4ibEtgXkqWhBFsWDW3+QXHwEgr0ihui0fLQWmnSjdmaEhcEiBpuC+oSm6bGr/utZ4GezGhgXDbFQCVXuZrzlbwYAgKP1GPtXrXuPm+Zlmh/12m1iGvaRe0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8364.eurprd04.prod.outlook.com (2603:10a6:10:24c::17)
 by AMDPR04MB11618.eurprd04.prod.outlook.com (2603:10a6:20b:719::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 02:59:05 +0000
Received: from DB9PR04MB8364.eurprd04.prod.outlook.com
 ([fe80::9f8f:d501:88da:538c]) by DB9PR04MB8364.eurprd04.prod.outlook.com
 ([fe80::9f8f:d501:88da:538c%7]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 02:59:05 +0000
Message-ID: <3276b124-e1b0-4d49-82f3-ae452ae9c0b4@oss.nxp.com>
Date: Tue, 25 Aug 2026 10:58:41 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 17/17] arm64: dts: fsl: Add DT overlay to build MQS1
 sound cards on i.MX9 platforms
To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, robh@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev
References: <20260824022020.2812810-1-chancel.liu@oss.nxp.com>
 <20260824022020.2812810-18-chancel.liu@oss.nxp.com>
 <20260824024252.1A3E91F000E9@smtp.kernel.org>
Content-Language: en-US
From: Chancel Liu <chancel.liu@oss.nxp.com>
In-Reply-To: <20260824024252.1A3E91F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0035.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::13) To DB9PR04MB8364.eurprd04.prod.outlook.com
 (2603:10a6:10:24c::17)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8364:EE_|AMDPR04MB11618:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b49f54c-7b80-4a43-47b7-08df0254d1b0
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|23010399003|4143699003|22082099003|18002099003|11063799006|56012099006|3023799007|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	DO7yA+x/bn4jN1lz0rGNF63tJYZBoV87oChdNfY7gUP1xKNpojHHn+GaZeQJ0qMzhtwPn8nhXxhTEHF7zhKEUvjMkIX5wesvuND0jL65yq6fXIry0Jc2tiAO/Gx5bFxZOw/gMaisirn47iXlp65E1DLOhbXGqYY99BWnwFk/oXuKaP+7i2DHWUt/HfAOYDBohQ31rArTIkU9pMHVlEJaQjfHjpIRD5q8iqgtdx2c60OCCxE9Pt7E8ubBMmGxsuuTN/aSTrf+wzUqDCyRig/6S48zB8D2ilHd7KhmVdd3u1qqzZ/4fGmFdbwfmH7SXwVNNyyPcOxgK2y7I/IwY1o9Q9wsRB0JZfNanWar22oaoEQhCOdVqLWYu//Zr+4RyBjPmU6zld81AG+bjMVzxG4w8F156qBF7D7tb2ss+otNr9MIrRQGXJDVlmoduGGAw1dLZoYEol0G7upgeAMHnZVljw/h7inCvpV2zjdPVn/iKf5Ka/ZRq67B3H3vzMNRPkTGBvQadSiC5PNvR+7H6x8mTGPsLyy2WxGVrYfoasbSuaCFEMGEj7UJLG9N1HU+Qz4eO88XkzW20jyB9Cp8Z9UXReXE0fJvLVPcmrXqIdvW8cG9WdY6Ojl0OuH6oLSx2vKxQJbjEU2YEudfGWarEvFjPaTOFEqve4Se1FoFqSXrHxg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8364.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(23010399003)(4143699003)(22082099003)(18002099003)(11063799006)(56012099006)(3023799007)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V2xVYzJMdWVqa2kwbjdRSHZiS09oVWdLSDh0YXQweGYzb250UTJpUHMreWRE?=
 =?utf-8?B?RkFUeWplaU5rQmdaTjZNZ1RETmhSQ2M1NUVDUHlaaFhoS0NOaDYwSy9HeWNC?=
 =?utf-8?B?eU4rZ3UyaXZjcUlWanRVQVdVRlZTYkVPMEJrelBSQ0svSUVCTEMvV0VxU201?=
 =?utf-8?B?bCtWTnN4MHhLbWZPRjg2K2ROU1pCZkdGNm9WM21tMXJDaEJ1QmlsWVBQQ0hT?=
 =?utf-8?B?MVJNYnBuTG02WFJsYllHeGpoRjMzV2kxLzBQYmVJUU5LK2ZLcWVnRVZmd2Qw?=
 =?utf-8?B?bEtjK0ZhWnpub2J1Y05uRklJSUZvalh5WVlWUmh1UVJLSTZZempmb3IvNzA4?=
 =?utf-8?B?ZUdkT1F3OFpMWkY3Skk4b3JpaTQ3YU1oSU81aGhhOTdveFpIcnpKNDNFNlRi?=
 =?utf-8?B?T1BaSjZXdkxoK3ROQzNYekpVSklZZ245WDc0VnZ4TEg3VmE5dW9ibjV6L1o4?=
 =?utf-8?B?SE5iVWtBbk9manNKcmdmVk53L0dCUTNzZkh4TWF0NnNvUnN0dWVFVGExU0tY?=
 =?utf-8?B?NmZjRms3Y2VONmR6ejM1eU5GbnpFbFc2Vyt2MCtackdPdzZJZUc5aDFlZ052?=
 =?utf-8?B?ZVlCbmUyb0pJcy9CS0dsNmp1ZjQ1cVlvMzA2OUhQakpVV1pqRzBDSExmdXg1?=
 =?utf-8?B?dDF0K3EyQ0lFM1VkZGtFZGxyYkFqaXhFQkRRSjQ5VEVCTHYzRS9OVlpaUDUx?=
 =?utf-8?B?NStMajdRdDFGdzd5VnZJOUVocWNVNVlWZ1FJNlBxaldTZURKa2YyUCs4d0pw?=
 =?utf-8?B?TG5PNjFBN0h1VU9ubExHZ2JKMi91YTNvcnVpMHFoUHhJay9SamZWa2x2aVM2?=
 =?utf-8?B?ajl1QVM5bDVyMXVaZlZiSk9DS0E4UXlHZEVsb0VTbkJzTko2N0E2WDM0NGpO?=
 =?utf-8?B?WmVlc0pjTnBydnpBNm9XQUVVZEJkK3UvbEo3WFNHVjdKajVINGpXQ1g5b1Vi?=
 =?utf-8?B?TFpKeFRxTHhtSDZsdkl1NHhSZVBSa2xTcmw4eGs4YzVwQTlNUHBiRUVka3Fp?=
 =?utf-8?B?QTFuZ244eG1JYUh1dTYzZldtbDQ2MVF4NmM3ME84MnczbVphRVFNTFpVcUgr?=
 =?utf-8?B?MkFiMmZDTWxNZ3RVSnpNdE5Rb3FWQkgraWM5a3VxS2J4aTdmWDBkc3lpRFdt?=
 =?utf-8?B?ajNNNFQybXVhOTFIV01CbENLdXRuV1pWZXVna0h0MnQ0OWlaN0RRamVEcTB3?=
 =?utf-8?B?TE9MUWNsbmVNRGljZG1tSUdsRlc0amx0MmJlVWtHNE9JanRRQS9kajdZYmdO?=
 =?utf-8?B?N0wyN3BRaWhCeVh1dmwzRSt1YlZwOUVBMnlBM001UElIVzhaR2xuK05McmpF?=
 =?utf-8?B?cmlGOEhLU0RTMGlZbzNwRHNWZXc1amkzMWJGQUNyR0FwbloxNTBrZDlmYWw5?=
 =?utf-8?B?bU9acXUzSUNlNXpQRmZ0cysrNGNYZ2EwNWsxUlFOVjA3SjF6Y1ptaFdIeHlM?=
 =?utf-8?B?QzBjaDVqZHVLSUJDM09KOWx6cHluRmF5eThRWFZtT0VxdTBkRDV3bTlZTk5Y?=
 =?utf-8?B?aElKUjdWQytuY1V1cysySDFLSUxFRnU5WDFFNy9nQ015LytEMXpuck9VdHFm?=
 =?utf-8?B?UHBSRWwyZG9qZlZOVE1uUW01YkpyOFZLQVBvdlFZZXh6UElNZWdVVVZ0OWxk?=
 =?utf-8?B?cFEzZlBpcEpPUms0VmMwOWd1NDhJRGZZMVdPWmhnUU5UamtKSE9PZm9IZHVT?=
 =?utf-8?B?NFdRS2ZqQXF2c1ZxWk1MUGxEUU9vQUlHNVBGRzFyRkpQVHQvUk1jSVFjUnJH?=
 =?utf-8?B?aEQ5ZEhRQVZVREZoWTVnQ2srZzBtRVRPZUc5dE5XdWdaUCtCTFRmTEFKUWVN?=
 =?utf-8?B?ckR2Tjg4b3lTYU1YQzVOTzVwZmpVL0VvQ0ZodEsrZDlUY296SHdPTFVneXhI?=
 =?utf-8?B?aGQ0RHJCNW94OWxjVkZ2MHYrWURXOWsvNjE1Tkt6Y3dBUFoxWUprZXpYUHJM?=
 =?utf-8?B?R0V0eDlwZGRLdFRUd3F4V1N1azhkK0paaHFsUHZUN1VlbERnTUtwOXRTWlQ2?=
 =?utf-8?B?OGY5OXdsaGlUMHU3bEtNTll5aDMzbytKUVBJKzVIZW5wZmZ1U0NVZWlmLzJa?=
 =?utf-8?B?aWxGbnROVFJScVVHUWN6YTJPbVAyTi81cXBMd0VIeXQwQ25CaHY5RnFSM1Bn?=
 =?utf-8?B?RjJSMXA1aTc0NGl3azZUVFBkV0lvQXgwWVFBaENRblMxcG9QSmFuNkhhc1FP?=
 =?utf-8?B?Ny90MGI5T2lXb29RQlRZaTlWMGc0R2NIOHhkcEIxVEQwLy81RVlGUVpNVHlw?=
 =?utf-8?B?V1RLQzEvMEgxR2J2SHh2UGtxUHFzeDNESzA0dE9qakhwc0FkYUEvMDhwblFw?=
 =?utf-8?B?ayt5ZVpPeXc0RE1wQVVyeFRsSDNXKzByUi9EblFMcnM0VjRock93UT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b49f54c-7b80-4a43-47b7-08df0254d1b0
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8364.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 02:59:05.5185
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZSce2qCW4MV7J4BC11OF/PzjPfOH0mnp3EoHIW9zxsKVOeTax64yAlLP9DgqNkCK/HhhRCDQVP6XO17vSDs3VA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR04MB11618

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The device tree overlay defines audio DAPM routing referencing non-existent source widgets `MQS_L` and `MQS_R`, which will cause the sound card probe to fail with `-ENODEV`.
> --
> 
> --- Patch [17]: [PATCH v3 17/17] arm64: dts: fsl: Add DT overlay to build MQS1 sound cards on i.MX9 platforms ---
> commit 16b11b202a8f8c0d5f524ed9bbec5f9b49d2926e
> Author: Chancel Liu <chancel.liu@nxp.com>
> 
> arm64: dts: fsl: Add DT overlay to build MQS1 sound cards on i.MX9 platforms
> 
> This commit adds a common DT overlay to support MQS sound cards on i.MX9
> platforms. It routes SAI1 to MQS1, disables conflicting devices, and attaches
> a board amplifier via DAPM routing.
> 
>> diff --git a/arch/arm64/boot/dts/freescale/imx9-mqs.dtso b/arch/arm64/boot/dts/freescale/imx9-mqs.dtso
>> new file mode 100644
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/freescale/imx9-mqs.dtso
> [ ... ]
>> +&{/} {
>> +	sound-mqs {
>> +		compatible = "audio-graph-card2";
>> +		aux-devs = <&amp_mqs1>;
>> +		label = "mqs-audio";
>> +		links = <&sai1_port1>;
>> +		routing = "MQS AMP INL", "MQS_L",
>> +			  "MQS AMP INR", "MQS_R";
> 
> [Severity: High]
> Will this cause the sound card probe to fail with -ENODEV?
> 
> Looking at the MQS codec driver (sound/soc/fsl/fsl_mqs.c), it only registers
> a playback DAI with .stream_name = "Playback" and doesn't appear to define
> .dapm_widgets exporting "MQS_L" or "MQS_R". 
> 
> Since the sound-mqs node lacks a widgets property to manually instantiate them
> (e.g., widgets = "Line", "MQS_L", ...), won't snd_soc_dapm_add_route() fail
> to find these source widgets and abort the initialization of the sound card?

As I mentioned in cover letter, this series depends on a patch for MQS
driver:
https://lore.kernel.org/linux-sound/20260820021454.2229094-1-chancel.liu@oss.nxp.com/
In which, MQS_L/MQS_R pins are defined as DAPM output widgets.

Regards,
Chancel Liu

