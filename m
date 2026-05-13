Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012066.outbound.protection.outlook.com [52.101.53.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D832D3D3D15
	for <sashiko-reviews@lists.linux.dev>; Wed, 13 May 2026 06:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778654074; cv=fail; b=UQvy/GR3UfGEGfauexV1wSrAuT7vJzeNrZSZ94i8aneVNjgMCaxoKM2EwuRypi/uQ3Y1dPi4oWSrewkorUQRaeZpVAIt7pCwy3nBZO68xe2kAGnsLs+n7GlpBfuLjH74dIvdPMTdwDy2i0HlugmJn2/N/bgyeC4klNhstYlR3A4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778654074; c=relaxed/simple;
	bh=Amvk4W0o3DpOhhlszCnPFvZIQFcwYd7PMq0vew3wrTQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=giSmJwGNbG7t4qxtEWEc+dRif/wic7rZbF7q1by1L764dzjV+B5LlyFY3addcNgQ5yNZhsEYoj+GQT3BG9fDgLPDHgLceMofGFgB2U65kuvQbHmiso8I1Wq8oI52y60ZbQZOAuUih3PXBfDVh0YjbNE4zssAIzNO83tlWRM026A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=UN6UQgDE; arc=fail smtp.client-ip=52.101.53.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="UN6UQgDE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WTrVuj5OaocXRypXylpMKYbM33AhRRMTBqZOCzwvsRbtS98CTuunysxCAPGK6+w+xPsRQMG5Fhkyl7JMVU+sI2XPD8XJ39qUEXmzb/QRsH+pYiKFpsZ3PaHFEIMUBv+QOf7svpoXExUYlcAXIOwwPonEDYK5+nBTXKDldXPm5w/gy+SK6kmWda5zJ4kD857Yp697mi5+wl9LkWkxaTwnZuV0O5OONqzyIOmBvygXGv+txNXdGItPiaCaTwvOZNy5TrGCXditBcFyrtSiipYHeZwRCtu+dYwTsNZ+NVflVzUXP89Agnt1Swumbr2bygj7/uzGEvpcd0TKREMehUdgCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=opCv8U8lp30ryXHxo1xbJgo00tnc+hBl5S//tlWuSVg=;
 b=ifWawv6bTSVpLMcQ7KqPly1LSzKoSxQ0ALxzxVKEIZEX9exxWPWAmnhx7G3ykTTfepE6qZHngsw1M0kvasgPb3oEWyFBDj11Y7DG6KqwU6cDQVJ0zO+We2wiVgYlL6PKdtA4+iWKUTp6n23B8XEFjyBiatSYLmYrzzX8FZsLaXk0/p0mUhBio7uXQxnnytkkyyglTSLkIeHm8Q8lMPnxdumUilsnTw1clNjolSiMGe8FkOwQ/vOVtzJ7yclPI6rd49nkzn2VKw1IP8aDogksGnjpeLdZxlRRUpZLR6GsZUoAu6BDAFuf61ZDJGfmAziqyYOWmXO3Phgi8Hy2ZCIFPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=opCv8U8lp30ryXHxo1xbJgo00tnc+hBl5S//tlWuSVg=;
 b=UN6UQgDE8AGD5kyv7E0btCvj7mU50mxId/SPAlGhBJwmfpXif1J1YNtccGCKeLg6ggtJMUNp7JEGEddt0F1i9k8MLza1jq4+u+ZSHgsbK20hfgF0nrJbdz5vknJv365d7nKFJxwlRT4HGNM1beS5Nf0y8Z9Au7jzL2eWnqQ03sESkN6Tr19/YOau+ugZQLX5wkoCkuytZlhGvYbkzCK+TtSW0szsFvO6LDGt6pHCgAz9InhNuR4ZqBBgpWGALOKeA2aEV0rwFrArpJ8kQnpBMR9nOib4ugB92++E0tqXp+jH/pd6h1Z8tbOTvwzzA5Zjv8AjGx5KdB9pu3sBQF8+SQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM4PR03MB6208.namprd03.prod.outlook.com (2603:10b6:5:39c::19)
 by BLAPR03MB5538.namprd03.prod.outlook.com (2603:10b6:208:285::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 13 May
 2026 06:34:29 +0000
Received: from DM4PR03MB6208.namprd03.prod.outlook.com
 ([fe80::2216:93ef:67b:9e04]) by DM4PR03MB6208.namprd03.prod.outlook.com
 ([fe80::2216:93ef:67b:9e04%6]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 06:34:29 +0000
Message-ID: <674baab1-b6e9-4388-ab7a-d1348d855703@altera.com>
Date: Wed, 13 May 2026 12:04:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/9] arm64: dts: agilex5: add Cadence SD6HC controller
 and SOCDK enablement
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org,
 conor+dt@kernel.org
References: <20260511202132.5597-4-tanmay.kathpalia@altera.com>
 <20260513004303.51A74C2BCF5@smtp.kernel.org>
Content-Language: en-US
From: "Kathpalia, Tanmay" <tanmay.kathpalia@altera.com>
In-Reply-To: <20260513004303.51A74C2BCF5@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0039.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d6::12) To DM4PR03MB6208.namprd03.prod.outlook.com
 (2603:10b6:5:39c::19)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB6208:EE_|BLAPR03MB5538:EE_
X-MS-Office365-Filtering-Correlation-Id: 584205e6-70f0-4087-aa52-08deb0b9afb1
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|55112099003|3023799003|56012099003|22082099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	PqTOpqu+zi0MJPInoQsZoah0TNSuzRASDm+DxEoTbTl+LJ7W3C0rgiPfD/AsXLimEAfZ/uYBlPCgvhFwToWPCKjOp5So/9XQAfxHEq1fUI2+8Ahfl9FOVZd01ulyg2xv1lWidxrCOSxZfHYjaDm2IQcaUK6frkEWbq8H4qWbSMuKrLiIPsshHHFld0Rn6JXHOXvCPapO2sRexyt1B8GEstRn5qLdKzqZUTUr0ed48/i4kIHYXQup4IMgIqbVD+z2OvDWMqFEe4f8NTjCYEkhu7lEAtEqxbrBymTJalkUXPU2ZEk5v8TBr406t8bj8+CE/hqv2TZXwV9GCElCmdQoJNtcurtneZgWMnpMy6BD0zt7IZh1ltnhwkPpb5TClPcnvohmywxbKkUexbFTj9DIwdKKl913RCJM1Eg9CyrrVy28bYld1AYEhzcO4csTUpNlRHMdRvvHRkCli27CSb0qf+A4dca72r87VeN+Yiuo3IV0xJX1xp/Btd5tXw5105IpIBxVge0+X8jPvg9CHce9twnwoLfzbYHmnpwa19Fel9VKFxIGoUumWiV6XNOMnGyJmr/c+s/Zbuav9QEz9Ihr5fcYz9dxCddzLOPFbK6HSp6ejsw5vMwVztPyUm/VIDbUcfI0WsyxDXaywboYt3+AVNOP/NwjZuq3bpPvsp+qlYlIl70IiXHdUuu9r0ts/3AX
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB6208.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(55112099003)(3023799003)(56012099003)(22082099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzhSN3kvc1dHdE1oendvUWo2aXVwRE9aMkdIOXZzakdQYWcrRGx2c3VCaCtK?=
 =?utf-8?B?TWFhRGN3NHNtL2pJWGRaUDRZVzlKaU5ORHRxVXRCRzRwcnNaVzRDb2RLc1M3?=
 =?utf-8?B?aVhnbnZ6NVpLRDJVRUtvUTRUeHptcXVqQmJWTXQvMC8xRDNSNHhlSitKZXVK?=
 =?utf-8?B?bVJkeWV0Vzk5U1YyK0FrK3MvTXBkQUJ0dnUySDUrdmxHeUtxbUdUUXFxaThh?=
 =?utf-8?B?RnpiaVpDcFFCak9RYmY2bHZQbmVPbU1ibXNoMVp3VWZUbXNKc2dGTG9VRFFS?=
 =?utf-8?B?bytrOGx2Vmd6ZFRiRW5jZzJmY2ZvVWNnd2NFRzhrYTc1QklRdWNOcFpKZmoz?=
 =?utf-8?B?M3dkNUhWckVCTW1lYmtNTjd5RjE2UWJoL0xmRzdFdkFOaTdxYmZhUWdpaWRk?=
 =?utf-8?B?ZGZvL2d3MXhRU2NrTDlWQVk4ZzczTHdWVjJ3aWhvbDBVQXlqZ3FzYkVHSGlY?=
 =?utf-8?B?QmhVOFZsQWVRV2hmc0I3OXhxdmRhS3hZZmpIU1VaZkdocFVhZjhmbEZGQUJy?=
 =?utf-8?B?N1FvNkk0K1VCZTZMeUQveTdEZ2pKMFI1N3F0dUU3NDBOY1ZnUmxiQi9NMjc2?=
 =?utf-8?B?NlF2a1hzalMxVFRvSlJVMTBxWENHQmw3elVnalNrOGhRZTQ4R0lqcDl2U0FV?=
 =?utf-8?B?VEJpc2trTU5KaVBMR04zbko4dy82SEVDUisrbEVJcXB3YkF6REJnblczbHdo?=
 =?utf-8?B?R29EQ0hrelpyUUlqcitiekhMQXVNRFNsSGJvYXBFOWdtNUxtUWhaY3UyTmtB?=
 =?utf-8?B?eUR6WEFISUVuWS9oU0VESDZ5dnFqRTJnaUN4VFgzOE9Temc0Y0RXdDgzM0k0?=
 =?utf-8?B?Z1hiVnA5SndsRmp4S09kMFRURVRTbllCVGdVeEgwSE1PWmgyZ2dDT21Ra3Yx?=
 =?utf-8?B?N3R0L3R4WU9BbkhGM1N2QU9rdWpoWm9ZL2UzcHFJM3A0UW05enR6Y096OTVj?=
 =?utf-8?B?OVBybnVBRnBiaEZseGRwSDNDcUU3c3duSVRFYWZwQ2ZxNFpBSFlvTTF5djhv?=
 =?utf-8?B?YmN6c0xrd2Q4RTlGRXZ3Z3NqdFVYWVJRc2QrMkNab2paWnBlU0ZhRERCUjVX?=
 =?utf-8?B?UE1jV1cxRmo3TThoSnVvTFVuWktxNmE1MitwZXI5aXJiMFovbVZ4bGpiQ1Vl?=
 =?utf-8?B?ZHdMSWV1UG4zUzlCNnEwSW9yY2x6WERZbXNmVk9Tc0ZzSUx5NnlUdFZISWE5?=
 =?utf-8?B?Q0xzb1luRURQTDkyK3FHYUxKNi9KalBjTFdsRmRsQkt6b1JtVjJmck5NNnFH?=
 =?utf-8?B?NzV0dHBoL0hueGRJOUR4MlM2Qjc4YVllbTNMMFhFcFdCd3Mrai9OaDJZdmRU?=
 =?utf-8?B?TlVrbG5mU3haaWN2RjVXaDVnNk9EOHRET1dmakFqNDhicG0zTDJoMzZqaVRk?=
 =?utf-8?B?aStFbHJSVUdjNStIUllGQ3F5ZzZ2eWpHOUdoTXdwYWJrbjRDTEN3M2t1YnlS?=
 =?utf-8?B?ZjRaV0ZXMkgvZjBoZk9SOGIrWGJWSFBscjQ5VWhudDIrT3JUT2taSXUvcWo2?=
 =?utf-8?B?djI1MHowVmROSTBMWGRIclA3dHRKbENkYVVvOWFCU1NmcFZhNUpIQW1Vczlu?=
 =?utf-8?B?bkZTc28wZ1hEYWZJeUU4K2g3dnRQMEVDQW1meHlsejdTMitSZHQ5ckV2bE93?=
 =?utf-8?B?ck5MQXVTNGtkOGZvSHhUcWhlaWNzYlZiZS9IQTFLRVREY280Rzd0NjZ6c2dE?=
 =?utf-8?B?NGFZUGM2TSt0MmNmWjRseHh0bVcxZVJVNkxZR1Q0c0pOQi9HREFuYWswSmQx?=
 =?utf-8?B?eU1VZkhSdXppV1cwWFNEaEl3bnl4OEhIMnVpcis2aStyZEErZjE2QnJvOTFu?=
 =?utf-8?B?eDJEenFQM285Z2cvZjhMZVE5YS9FS3c3aTc2Vzc3OEh1SG8wZGNzQzk2YUx5?=
 =?utf-8?B?ZUlja2I3WWtLL0NJbThlTTl1enFKcnpEUStYRjdhV3l1Z241a2RVMklNa252?=
 =?utf-8?B?TnFEVWpTRkpvOWpUNG9pMnlkWmU2UnRKVE1GMTJULzZObXlBeGk1Q2dxVzJp?=
 =?utf-8?B?cU1tQjk4UDNXVVVKUWg1OVQySldnOTA1dkkrQmJmWTY2RXNIVXNBR2hHU1Qr?=
 =?utf-8?B?MVpaYWtudGlMZjJQaWd6MlpKVkhJY0orUk9DdnFyNDJPcGEwQjZlTnlSd29t?=
 =?utf-8?B?bFJuL0lLblU4aHk1WnBmOXg0bVdmaUgrK2ozZ2VvQllEUnpLN2xJV0YxMEVQ?=
 =?utf-8?B?bnQ4eTFPejVZTERWYnR3Uy9tVGl3czJicE9KaWhnRTlXc1hYNGVSeWJpWExy?=
 =?utf-8?B?NGJnMHA3VHZnZDFUOEk0SFNSN3dHT1hmOEs0bVYwSS9HbXBseHl5cW4zRHAr?=
 =?utf-8?B?Tndaa2dsSmxVUjROSlBTeUYxT3VtNDJqNklIbGFXZ1g3Q0p3bzV5RE5pVnE2?=
 =?utf-8?Q?VJxq+2nZM72g7+8E=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 584205e6-70f0-4087-aa52-08deb0b9afb1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB6208.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 06:34:29.7228
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R6ppg0McFdIhuOHdnZzyGark5P8wAMMgOAryty0MCg5R3hP3/e3w2g1KiN4SmG80VUI9twp59WnNN11R9IYb+88lww5vW6KDJjaa2/lYpdM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5538


On 5/13/2026 6:13 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] Board-specific regulators are incorrectly defined in the generic SoC .dtsi file and placed inside a simple-bus.
> - [Low] The Cadence SD6HC node includes an undocumented and unsupported `fifo-depth` property.
> --
>
> commit cd8114ca6cbb7c0bc2b1d26651ea445b3eef24ec
> Author: Tanmay Kathpalia <tanmay.kathpalia@altera.com>
>
> arm64: dts: agilex5: add Cadence SD6HC controller and SOCDK enablement
>
> This commit adds an SD/MMC controller node backed by the Cadence SD6HC
> to the Agilex5 SoC device tree. It also enables the controller on the
> SOCDK board with high-speed and UHS-I modes.
>
>> diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
>> --- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
>> +++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> [ ... ]
>> @@ -300,6 +300,44 @@ portb: gpio-controller@0 {
>>   			};
>>   		};
>>   
>> +		sd_emmc_power: regulator-fixed-3p3v {
>> +			compatible = "regulator-fixed";
>> +			regulator-name = "card-power";
>> +			regulator-min-microvolt = <3300000>;
>> +			regulator-max-microvolt = <3300000>;
>> +			regulator-always-on;
>> +		};
>> +
>> +		sd_io_1v8_reg: regulator-1p8v {
>> +			compatible = "regulator-gpio";
>> +			regulator-name = "sd-bus-io-power";
>> +			regulator-min-microvolt = <1800000>;
>> +			regulator-max-microvolt = <3300000>;
>> +			states =	<1800000 0x1>,
>> +					<3300000 0x0>;
>> +		};
> Should these board-specific regulators be defined in the generic SoC
> dtsi file instead of the board dts file?
>
> Placing them here forces these external board-level circuitry
> definitions onto all future boards using this SoC.
>
> Additionally, because they are placed inside a simple-bus without a reg
> property, it looks like they will trigger simple_bus_reg compiler
> warnings. The sd_io_1v8_reg node is also missing the mandatory gpios
> property in the dtsi, which might cause dtbs_check schema validation
> failures for any board that does not explicitly provide one.

The sd_emmc_power and sd_io_1v8_reg regulators are
board-specific and will be moved to the board DTS file in v2. I
will also run dtbs_check schema validation to catch any
remaining issues before sending v2.
>
>> +
>> +		emmc: mmc@10808000 {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			compatible = "altr,agilex5-sd6hc", "cdns,sd6hc";
>> +			reg = <0x10808000 0x1000>;
>> +			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
>> +			fifo-depth = <0x800>;
> Is the fifo-depth property supported by the Cadence SDHC binding?
>
> The Cadence SDHC binding specifies unevaluatedProperties: false and
> does not appear to define or support fifo-depth, which seems to be a
> leftover from Synopsys DesignWare MMC bindings.
>
> While the driver will ignore it, its presence might cause a dtbs_check
> schema validation failure.

fifo-depth is not supported by the Cadence SD6HC binding. It will
be removed in v2. I will verify with dtbs_check schema
validation before sending.
