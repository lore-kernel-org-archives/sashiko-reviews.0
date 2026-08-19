Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011025.outbound.protection.outlook.com [52.101.70.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D9E44210D;
	Wed, 19 Aug 2026 10:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787134163; cv=fail; b=NIXZoMmYtp7LVLy4K5UTSY5i8zo/ymAVVg/sGO9787+oCuHVrvMvODAiJUlATlpSlQh2gXQmIyBu61gs/DsGWUBx+2Z/IelSJne0GK7tvboeUoQSUTcyqUZlL7DXSKBms1ECmKTLQPbS88X/K/iapekB34eVr8ay18jk57Y27bo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787134163; c=relaxed/simple;
	bh=yht/b3j86FmBo/gF8z5RdXieJlheSvv8BUj+O5Y38ng=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jio0WHtcTwkbhjPbuyhNEiEnKZ4JvDiZNd8euC8bn/7RYI27js8hn/1L2dC7QHkl1JZNCp98eLC1E7RlI1cqi/c+CSTZngBuZQ6+0n0F1WHPza97jJFpYJ3gY/AKInVWs8Jj0S0TSqcViPl8To99FwfF6AKQNTyPJPr0Bq9188k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=XM0mIYQ4; arc=fail smtp.client-ip=52.101.70.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="XM0mIYQ4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mVV26xneBlhvHdTqdviC4+uULDiX+ahbiJgFFBTXSVl1FAnSAHBpS8eZgFlwLyCv7l1M5GjNvgJABNIj5awOL26fawAx7UOmXkLalf7RtNmnHAR1r+JZC6Eklji3BK9PHNzxzD/C0uCwK8QD2HdpQRw6HYBsKBpa5twws0ogiG9bJIXDQ2JFlq9Vgz6VeftFHWuXC6N92POuEE2Tt16NH7gohoAqFSK8vSZVUhYCWdbVw/d/o+Kw6xNUYHTvs6EjWdl5ad8YhjqVbxhr2PRaBYRS4XZIbiWjBy04DccvehZQN5ls+A0Vr1EUISFPBYOcaxqd8ckFwMzUtU7zNgQ/RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dKgNpiCD3GWcNAVJHGey6/G5jSHmxlw8t21Uclvh9wE=;
 b=S4AcDCjcy5t0Qs96kYJ+29YKOeAu+Cxjv94EC5cNkkfyTRASY6ZSnHGg0wtyvr5NKauo69gRRWb4Od5hY3swuCabuQ1PEzD6QFynlDofq+OdpE1t1sEFAIeKXrozBjorYsvfUAVIjuNfl8ddNIjWNdS018jo2TG8l6BboinDxbqoaXtPYx/Gi5+DyPmP4hznaXl+Yrf0i620Rzv+KaV8o4Q9cQbKr+6G3RPE8G+03dOIkJ/liPRLawjcxVJZSD2VNoFXEOgo+VnMp+qiEAJLKj89rzvOAQDJG/QJa5zO4067QoLXOj+tTnkaw/UDDVyOEMK5DqnQ8DjQe/kJjuDqrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dKgNpiCD3GWcNAVJHGey6/G5jSHmxlw8t21Uclvh9wE=;
 b=XM0mIYQ4c6MxtdISSxa5HgSn2eGdftQoYmQGT8y5dCmFARuPd5XPiaf1pd88TwTh46f/wUuDZ6t83bMwA1gsrtMJgF6w2LGzwOcphbWgblgzVxUq843SvEu9/2TnhKUg0lwdMZ2rsXUUv7DXZJ0gCnz6AZda9HA1b4NaqxikzSV6rLO9jbZnrd/2j1aqH+v/u6L80PdLmWGmNgheOFLasoQieaNa+Gr4NQITHGAsD5X+QB7yv4VDs0v4IDmNRrRSjY7KR3L24Z5GbHPNJGsS+uOIILPipvXCPXeDF8eh0TbgZc8ei5E/8XLEBogV0Z6JAn4XzmyZjg8gByFYgOQVsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by AS8PR04MB8434.eurprd04.prod.outlook.com (2603:10a6:20b:406::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 10:09:19 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%3]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 10:09:19 +0000
Message-ID: <ca9bade3-d4f3-437c-8507-42f61fd1b72b@oss.nxp.com>
Date: Wed, 19 Aug 2026 18:09:08 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/17] arm64: dts: imx93-14x14-evk: Add board muxes to
 select between FlexCAN1 and MQS1
To: sashiko-reviews@lists.linux.dev
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, robh@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260818030211.3141710-1-chancel.liu@oss.nxp.com>
 <20260818030211.3141710-7-chancel.liu@oss.nxp.com>
 <20260818031342.D8E8D1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Chancel Liu <chancel.liu@oss.nxp.com>
In-Reply-To: <20260818031342.D8E8D1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0005.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::13) To AM9PR04MB8353.eurprd04.prod.outlook.com
 (2603:10a6:20b:3ef::22)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8353:EE_|AS8PR04MB8434:EE_
X-MS-Office365-Filtering-Correlation-Id: 7075a09e-9c64-45d2-26f6-08defdd9ee95
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|23010399003|376014|366016|22082099003|18002099003|10067099003|5023799004|11063799006|56012099006|4143699003|3023799007;
X-Microsoft-Antispam-Message-Info:
	DaG+xGJw8c8kPGfLBszd5fyJFA1kIHWfh+iPQWMTWkxWWSzksUtS97kLtblFgvF6TKjDHcCeDgxFe7esBn9USvHa3XnYWVXjeF3EC9VabTUeoVOTZJ5MfenSQNd7AkmMl6qUV70dQwPbLM3dKNQhNgOnwnguAqV9hLSqHiFUuRUHoLZjQcs0QarE4Bc1dKDXDtMiLyQ2jszz8+W4bwGau6Csssessd3OTrFcCKAR3D0jSyITZakVrXkSL9S21UoLeXZ+7CiN2XkxqoGHq4+Gn6Qxo44V3+AcarCnbUSHHwPYUVE7z5Rj0+eO/dvBlltQrgtu4M1JwKMV19NK91AfLDJWq/GfeEbMcGcTagxxnE+nhUTNWWbV0802uy/O+L9ZIQlMN2ceYVtXLOqjx48y6FDowISo8pjUkIQHFyhdhagOZUyfGdtrHTjV0QRTusZ5AUyulhc+nuokSQezV1uoy6TVy/tkMlprhjHtjnri3U5VOkh4LbZS1NRBM/jNf9B3BxH4sqGWDtPPtPKrQghMHMRkh4Ttqh9LHpYSiO+vBtPnpWIRkNZ6UY8EcKvAjch2S+4IBHz+bwssE7y7bOExeHWN/1qaUxz0QGP/0m7xCqa7ZG+cxHX80OL41iqH9kMT7Ep/aZc78mo4VvQWzq2fD02M3bSGLYN2nUfajQADMAU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(23010399003)(376014)(366016)(22082099003)(18002099003)(10067099003)(5023799004)(11063799006)(56012099006)(4143699003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?alNNaThCdjVaZlFlbS80Q2VaNU1PbVZkQnVFYXlTdjVuREIrSlJwTk5FczBZ?=
 =?utf-8?B?N3IrMFkrMUFDVEwvWTZ5eHdLNFJma0pIcEFnblk5UHg3TFpXNml2bTRqb0lH?=
 =?utf-8?B?ZHc4TFl5SUdQbFNBbHZNVWFiKy9NYzI1cE9uWUl3NXZ1aW5BWkdaRU9iV1FH?=
 =?utf-8?B?V1Z1Zk1NdVJUNDllN2crOFZHYjR4QkFBWitKcHRieUVIemZaWWtUemtYc3E4?=
 =?utf-8?B?SGpVSlpsVFI0WDBXdzh5ekZUY1JWcnlSRm1abW9WM3pWL2NrSDVVaHhMN3VG?=
 =?utf-8?B?ZXZBbmZWcFl4MUwreUVpanI1SlFjSVFaTnR2WGRTOTdvc1B2OUJyUjU1cktl?=
 =?utf-8?B?bmdIRHBpVTZIQ2x2OVFEb3o2SWJXaU9yU3BGTDVybXowQytYbHpLTlRJTTBn?=
 =?utf-8?B?OXo0aUFOOHAvdE8wdkFabzdscUxtS2QrTm9lV0tYcGQvQVl4U1VOMlBFeGtP?=
 =?utf-8?B?czI3TzdyWW9xVlJBZG00eks2azl5NGltVEZiT2ZVMUhEcWxkdEZFbXViZDBO?=
 =?utf-8?B?c3A5Z2NYNmNyM2Z2YWpFRGdvOUJyYkNpdHB1RzRMeFlsbFl6Ri95b0tRVnQz?=
 =?utf-8?B?KytGdGFTbnN0Z1EycHA1OVVlVWlJS2hncXphNHBzR1h5dHB4cWlHSk1INWdO?=
 =?utf-8?B?RllYMzFnWWg2Z1I0c0VJazdISUdWWHZKRjVBaFpXNHd0K3NITkVDTHV3NjZ6?=
 =?utf-8?B?Q2pObHV3d2RCbVN6SjlvRnREbVNhSDl5eVRrM1RyZlBwR25aeUpLYUZFbjRM?=
 =?utf-8?B?VEFoZG5odDVDV2tlVnJaY2FmQUNQZlVKVjNJMWJKa2VaUVlFaldJcHpPZkZs?=
 =?utf-8?B?dVdXekZyT3Fza3lNSXlDVkZQMVRiMVFZbEdyZ3M3WE1GQnlIZk8zd2dMdjk2?=
 =?utf-8?B?aXFVaXFndXVCcGp6OFhmWW5Qa005MHl4M1dpZ0pJWE13SFRxVytSU2wrQnJU?=
 =?utf-8?B?NXR1aW9wSDYyQmpaZnkzWkFkTlovUU81aVFNNitlZUY4TDJva2pTYzl5aVRJ?=
 =?utf-8?B?SUY2UEJTNm9wKzVtTklHOWV0OGczOHdMZllmbU00bExFT3BDQ2tTdzByamNp?=
 =?utf-8?B?Y0JlOE5Ibi9pNjNkVnFGSVJQTWs0N2hGM1FGWFVWSEYvTDFWOEI1SVY3TnJS?=
 =?utf-8?B?SjhVSzkxRng5WnZPNTNjZytnZ1pvQ1hmdzRob1JwMkRYUDQwcTBvSnVrZ0dx?=
 =?utf-8?B?K0tkYlhHRUlHQ1NZL2h4OGdrekgxQ2V0Y3RKb1JlWVZ0ZFVacDl0S011UjN5?=
 =?utf-8?B?TmYxY3phdDlxdUNPVXR0UU5uMzZOVXgyTXd6NFFRNXlhZ0tOalFqNmpzeEZj?=
 =?utf-8?B?SktkRitkNk1xaEZmNWo2Ry9xOTM1bThidjFrUE9iQ1N2eXorRk1qSXdyOGJq?=
 =?utf-8?B?ZVRaTENqcjlZQVd1anFFY3hXVkdJUi9uQ2pIbkgyQ1VRdldVZTU1QlhQUHJ2?=
 =?utf-8?B?QWxSY2xzTWtnWUZtenZnZWN1RWhjZUZDWDZOTDQ2UTUwQ3FSeVNYeGJWZTVI?=
 =?utf-8?B?NWZuVFZlVnZPRFg1QkdKR3JZcW9sSmxsT2N5MWVUSndGVmt4eTJqa3JhcTlh?=
 =?utf-8?B?TjN5a2NsUFVkd2ppNWZyYU5HVVR1Tm9FYkVwOW43Wm1kQWE0ZTlwL1RnS3Na?=
 =?utf-8?B?a0duUmVTMFgydVd1alVieUswT05sNGxuNC9lOVdHWm1VeVFDYXhLclRiN2dU?=
 =?utf-8?B?Q0tyc2VGN3NsUlkwYTNEcG5yNSt6MVQ1U0VSWWx4QVA5ZUJnL3JuS09VQ0Vv?=
 =?utf-8?B?TlAwdlgwZHdvSlVwNjV5bUdIQ0JZUWlCbURlbU9sVUVzaWhQV0ErOU1uWkFG?=
 =?utf-8?B?NjF4NmUxQ0R0QzlYejZBNnR5QXV3cTZibDV1MVNkZUJwaEFQeW53eWplOE5Q?=
 =?utf-8?B?SVZnMUoyU3BxS29BNTZYeSttUmY2cy82Sjh4WUUvM0trVlphV3B3SjRIMmZo?=
 =?utf-8?B?eU1TRlFZVXljSFdkeTIzcWVER1Y0NDJUZmZ6aFBJTmlOT2g4WGJoUCtLOVh3?=
 =?utf-8?B?Z0JaK1Y3aWZkNDdVSDRPdlY3clVXcHprZW1IeU5IaUtuSHFCUzZLdEY0SFNJ?=
 =?utf-8?B?NXFXMGkxeE1ianZFdUZDQjlRMTI0d3Q0TU8zRWd2c3NqVzVIM2hoNG13eVdG?=
 =?utf-8?B?SlBHOGxVU3hOSHhCenBrZDJUOEdlTDNEQXBFd0plbmJLaThOQ3FDNGZsclJT?=
 =?utf-8?B?aEVlYlF1WDdJa0NIU0VwRGFSS0FKVUFDZ0FzbG1yNWQrcm4xVXZsckZydUEv?=
 =?utf-8?B?YnNWWXd2Z0lKQVR0ZmJhaFUybzlwNG9maU5lWm1KVG9iWmNMbzJQOENYYWtw?=
 =?utf-8?B?RklRamlxbUhqTUJ4MllwSzZsTkc3VnRzUGtzdEFlV3RaL1RBMTYrQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7075a09e-9c64-45d2-26f6-08defdd9ee95
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 10:09:19.0105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y7YRqNgNo/vAEOJdLgMR9PkWr17Az+f1YsAaj/Yi9DFkhAI7nXgoNqrJvTwCcn5yeXbakXiZ6WdYCtllvLSZAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8434

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The amplifier enable GPIO for MQS1 is incorrectly modeled as a multiplexer to hijack the pinctrl subsystem.
> --
> 
> --- Patch [6]: [PATCH v2 06/17] arm64: dts: imx93-14x14-evk: Add board muxes to select between FlexCAN1 and MQS1 ---
> commit cd0b6d22bf4426d5f5510c7f3a258a4b50405fb8
> Author: Chancel Liu <chancel.liu@nxp.com>
> 
> arm64: dts: imx93-14x14-evk: Add board muxes to select between FlexCAN1 and MQS1
> 
> FlexCAN1 has pin conflict with MQS1. Add GPIO-controlled board muxes to
> route shared signals between FlexCAN1 and MQS1.
> 
>> diff --git a/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts b/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
>> index ec78c03f4788b..6dcfbca65cbd5 100644
>> --- a/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
>> +++ b/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
>> @@ -37,6 +37,36 @@ chosen {
>>  		stdout-path = &lpuart1;
>>  	};
>>  
> [ ... ]
>> +	mqs1_amp_en_mux: mux-controller-1 {
>> +		compatible = "gpio-mux";
>> +		#mux-control-cells = <0>;
>> +		#mux-state-cells = <1>;
>> +		mux-gpios = <&pcal6524_2 1 GPIO_ACTIVE_HIGH>;
>> +	};
> 
> [Severity: Medium]
> Is it appropriate to use the gpio-mux binding to control an amplifier enable
> pin?
> 
> Device Tree generally describes the hardware structure. A hardware multiplexer
> routes signals between inputs and outputs, whereas an amplifier enable pin is
> usually a binary control.
> 
> Would it be better to model this with an audio-amplifier or regulator-fixed
> node so that standard power management can dynamically toggle the amplifier
> during audio playback and suspend, rather than statically evaluating it as a
> mux state?
>

That's a good point. I will try to model it with an audio-amplifier device.

Regards,
Chancel Liu

