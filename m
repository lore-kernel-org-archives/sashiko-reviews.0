Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011059.outbound.protection.outlook.com [40.107.208.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786B43FE36A
	for <sashiko-reviews@lists.linux.dev>; Mon, 10 Aug 2026 19:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786389508; cv=fail; b=mWpdjWXH4Fuj0V36V5TyKRdxJDg4Ja0akQGA+FCrt3kADoSbMR5SgftvOZGbYo4CjNwj+pfz68Qmb9IeX7DJG/xcwU1opRfn9QuC9mimig1wobnFx0q520SLyzqoJHtNcx2Ip71EZpccENKN4YgVdTtwrJiok6+vA6oJ5XsHWi8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786389508; c=relaxed/simple;
	bh=/jdbCL/biMG9AMgH+91W7uzBEk2/gJaAsK6qZ1q1UKc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PBzoXoN44V8kIUsxLOHqk7HTEBCqLvVv3KvmEIrPciUFEiYn7fs+5OOUtfxUKLFbc7doXYHPcp63IptxhYcWj8d/OlLae7qwAPlLuRLjGC3Fjnlso2LElg/LxXjPJwRXImjxIAtkJkbcHfKsd0JWfL/OEsgsmAWDTaz9RBxXWnU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=VsCrapXw; arc=fail smtp.client-ip=40.107.208.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="VsCrapXw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cLMpU25RBIExE60nO8mSM8mU8gPgkpyPH7wyVNkKy6MbnGxhElPNhcR0WTLIxLbNbo5aDmpwheRj7ds6S09jXanLWrdIJ+DYaGTt+yAfftCYJUxRiStRCmV4C3Mshk0kXnXSUsS/tPsndmdzoj01ZrdmNAoEsDoQGe9JhNzyxHDlHdDbPgOEse2+xBuN9axY/0ZV05LrbpC1H7cnzcpXNss5DQ+9TMXnkGmwGmuGnrWc1NCpCmXHasSaYTxjXOz6tRFy4zt04p/xarpI2hiZOxQQkaw9EfxhP3sZkvgCynnxMizf44IworTMMMhyTiN1Ag5nClnJOdEHwFE8Rm2fng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xhnnGagoXLv43rovzazQFWVTeOq29LfINPFy1yJ9T4Y=;
 b=Bz00b1lkSUnka4EZEpj+exzjW+a8fUAEK5MGkbYdttcCofhGigYtKbZMMZJtQD417R10m4LTgBks+BqvsXRM31xk1xfLXUc2V/Joc/dHnKsDXcMOCEzoFv+9X/27nUtUdlxY2tt2Xgwj97ogbweh4lHc9UTujzuCskEsyJ/Gj3T97F1+YEzbLFzei4Jzh6Sk3Wa2Yp/zQSCd5zvJds8+nzDLMCiM9f9Qly3xarcLbNajHDH2VfT/duRFOnF9TBeR/YGk0AP70IE4bBIweyF73T/HDYVRBHbkzhDIp+o0QwIZ/WdGm7UigGnhlIvmPX9uqUumF/Tt9ZppouFHQagAyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xhnnGagoXLv43rovzazQFWVTeOq29LfINPFy1yJ9T4Y=;
 b=VsCrapXwsHetix1VPyVlP0WMiXTC2SZnFsaaP/S/Wq5nLfdgxp2guBhsErRNX3p4D+2K3ZF5Dl18EPbZrz6IxYJ+o7jYp6rlhLlWiNvok64XmV0sEjbH3geM5dKeRl00con1jcx3+QmNChxMq8Dbnqie3tHoK66bgSdE2Vo1IPGGqgk8thIr+hci4s2N4844GPNaFd/MFvD2+Ec/ChFcxVIJ59nsXVb1RB+wYXWe6Z38EX0D79U/s5GIO/8zNOLvgsd/8/jWPmqPfnV15fhpcx/+WaMSfHzz5dTn0PIlWWsFBmbRfcD2nLzeD+FSewkZ/a6sxxo/cCxLW6uzHU1dwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM4PR03MB6208.namprd03.prod.outlook.com (2603:10b6:5:39c::19)
 by BLAPR03MB5553.namprd03.prod.outlook.com (2603:10b6:208:285::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 19:18:23 +0000
Received: from DM4PR03MB6208.namprd03.prod.outlook.com
 ([fe80::2216:93ef:67b:9e04]) by DM4PR03MB6208.namprd03.prod.outlook.com
 ([fe80::2216:93ef:67b:9e04%3]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 19:18:22 +0000
Message-ID: <0163efe2-1db2-4fa8-adf8-fe1e622ea637@altera.com>
Date: Tue, 11 Aug 2026 00:48:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/8] dt-bindings: arm: altera: add Agilex5 SOCDK eMMC
 board variant
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260810190025.25045-1-tanmay.kathpalia@altera.com>
 <20260810190025.25045-4-tanmay.kathpalia@altera.com>
 <20260810191040.535A31F000E9@smtp.kernel.org>
Content-Language: en-US
From: "Kathpalia, Tanmay" <tanmay.kathpalia@altera.com>
In-Reply-To: <20260810191040.535A31F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0243.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::17) To DM4PR03MB6208.namprd03.prod.outlook.com
 (2603:10b6:5:39c::19)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB6208:EE_|BLAPR03MB5553:EE_
X-MS-Office365-Filtering-Correlation-Id: f994b6fe-f7de-496f-7a54-08def71424ee
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|11063799006|56012099006|10067099003|4143699003|22082099003|18002099003|55112099003;
X-Microsoft-Antispam-Message-Info:
	bQ+XRAzMGZFvnYY9+HPOQvcQe1wvFp2f0kIrD3ol9uksZ2L8g3PgzHB1r1vExZ+8fWQBmg93T+ohWu6BKxAWXJD4nq/akJ6Q/JeHeBiUfch+RogijvqFbr8qDtk5m5O49UmzLoYAZTntiQYs2134Ba03qCcdazr6Q5N8AoVKJsfzBjKqWZGcm5zHd9prKbasuDsskZbIqYrpwn4wBjGPjBkgkNL5SoF5R3Q41Ox5O4WFTdxHuG4zG59wLjIPrSLFJIYmw9FSMie448eW4yRWdWJeyJtuqOOtXMYyAzF9vGz4uo0CSzZ2SYM6evQ6wx+jtNCr3n5b9/o0psVll4CeatoSr5Ffv+zUmp9W85ukxmnpNH7rG0lzHsaDGDVLE7w38mn4P7TM3mvMSMLs9Q2PUq5fAsw7x6iiHQA74teIKxVDVgClDLnITuxWJVnv6TUttvWKseDrOr8c/B4AxIwK8rY+DY87wHcDjbVJyrQ/+1gg/DhQUkyXR1fcHiK1kEuBNY2zWZLlFk2ULQKSxJYRqlq2OyQu/x6fP7UjSA72Dqkc9V6iheFOkv/Lmr7d4lDqld6pBQlgCInhS/g3e1UWPFRgFrPpW5RBQSRru0wa/dr9wDLW//jF1mNpZhKnZ9zvdbLAIZEIReW1bOTdizw+PvvbhyIaOq1doSX16OeBYN4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB6208.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(11063799006)(56012099006)(10067099003)(4143699003)(22082099003)(18002099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MjRTclRhR3I5dWl6a0dWTVRqQ0Zzc1d5bDVIc3pFTEpOdmRHU3Y1L1lCNGRq?=
 =?utf-8?B?R2ErQjhVOFFnVnRYZEVVdUlFdmRiWFVOQzAvaXFZUm94bDF1dlpBNi8xcmxt?=
 =?utf-8?B?d29YZ3R6clg5OFpLZUxua3BXTSs1OExCdjdtZk4razdSdDExdUxvWFo3R0RS?=
 =?utf-8?B?Z3Y2OG5nVUR3bHFrcStaQzR3Q1hsQUxqTkRnTkp0MWpBTkFmV3AvTkdPNm9y?=
 =?utf-8?B?dTlTRy9zdENHRWU0RmtVeU93aDk1S0d3anZhZlRDNmU2aCt5QVhUYnBsVXlp?=
 =?utf-8?B?QmdEbnhNYnBSYzBoRnVLVkFQRGJnZXNuU0szRmw5TGlUcFdXc2dXYjJMZFVp?=
 =?utf-8?B?Zm5QMkNxNjhsTVRCZnUrKy80Smd2eWFvQ3FOdUwwbXdrUG82MWM4alJoUW1s?=
 =?utf-8?B?RFFwVnJOZjVCWHNycnRJUTlqUE5oQWx6MjRqWkFtZEozbGpySlFrMkcrZW9F?=
 =?utf-8?B?T28rNmprTE11U3Z3d1BVR2d1OFJsVUdiazJxRVdpaDFjbW1MRkU1a2w1bUp6?=
 =?utf-8?B?ZU4rRWR4aW5PY09KaG5nRnVUUHdYY3Ztem8wVFVPdHQ5TDhEcEE3VVY4cDVu?=
 =?utf-8?B?K1grLzAxOS9FNXVrUVB3QlVHSzM0Y3EwVkFreXEvRzFGZktIUytCZmJsQzhi?=
 =?utf-8?B?U3RITTcySXVMcy9Tcmp5Z3A4azJsQ0xJa3BNV3AvOXhtQzM0UlVmZm5MWG1v?=
 =?utf-8?B?WEgybFRpRVlwL0xzMWxLWUdXZTVsQlMzbERTeGVBWmtuT3hzbi93Ymk1bVRP?=
 =?utf-8?B?Q2hrdGJ5NENSblB1Wko0bHhGYWgrVWdmZCtQWFFGTStRdzBUVzQxNTlwQ3Zw?=
 =?utf-8?B?a2ZnWmVlNE1hU2FJUXBHUVJvZW93TWJtbFloek1lKys1VHBLM0lQelZXMTZ5?=
 =?utf-8?B?d2ZIcGhsTEF2K2ZnQVFIZGNGUzhIeVNQcWZ6VjZtTnBpRnN0WWJGZXY0V3Q3?=
 =?utf-8?B?Y0h3VUJhYVdNdEM3NUNkOGpWeGVkRmtrd0FKMTcrVWFURFY4cExiYmxqWmxj?=
 =?utf-8?B?T09wYk12QTRWMHd0cWpaMDVpbUw1QWQyWFJORkd5OXd2TlpjeHU3bFgzenFZ?=
 =?utf-8?B?T1RMNmV3ZitXZnVvUzZnNW5iNzNTRzZkOEZaTmxOSmZha3NycitmQ2Vwektq?=
 =?utf-8?B?Tnk3RXg1c1d4QXEvTmNpUW12STVVbGRrWmU1TWx1TGRSakRqVUZMaWd6dkk2?=
 =?utf-8?B?VmZ1Wm1mSEFGWUMxSUM3ZzJoWDNnZlkyYjZ3anZpYzFnT0NrRFloenVTNHFT?=
 =?utf-8?B?a3lCVE9JSE9WdHd1MjRXcXlCZ0dtUzJsZTc5N3gxWVljV2M4U0NQSlBNV3JQ?=
 =?utf-8?B?S1doWE5iRCtNVVRIY3hhS0wzblN6eGh2enk2OXFJNlpRc3lOUG1oaW42cXpz?=
 =?utf-8?B?c3lxWENNRmpiLzFYUmRUbVNxbEVJS1RxV09uQVdrV1RCMVNFMFFtVW1NMzlk?=
 =?utf-8?B?a21SMzE4TUpXUXBCNnF6d0YwM21IMDlWY1ptbnI1MlBOcUdqQzlYWkVJWSs4?=
 =?utf-8?B?OW42dEtFMXhKUWh3bzFQYWsxSGRBa0NVdWZCdm4rOWdEZFM2RWp4UjhOYjhD?=
 =?utf-8?B?SU9sK1pKWm52RXQvejlWbmJ5ZDVITGwxMlZuS0xvaE5MN3hTVVd0Tk1kTFE5?=
 =?utf-8?B?OHNIeFI1dFFlOExlR3hSdDRvbEgremRhcFpjcmZPUnZ6MjZhWVZsaHJKdEs0?=
 =?utf-8?B?cGpYNVN4NS9zS05tUG03b09tNjJsTmZDN1dKV1ZjNi9DZUFXZjYxTVpINU5M?=
 =?utf-8?B?M2Z5dit4aWJqWXBjdjJhczJtWWFmbHNwNWlyWlBuNkk0MlA4VFdvbks3Q1pa?=
 =?utf-8?B?blVIM25QTE9CZnA2NUFmTjhnRUtuMmp6cWhiZVo0a1QrZWlXSGhIdU9yVk5a?=
 =?utf-8?B?MlBydSt2SHM3MjdtZlFFZXNCY2NvQ0xycGxWeDZlbDhtbVlRMFpDeVI3OEJJ?=
 =?utf-8?B?dG5QZE13N0VCSkM0Ky84czZnSWhSU0s3b1E2bVE2ZVduN1RrRGlHQ0ZZcXdV?=
 =?utf-8?B?NkUrcEx1Qnd6NmQ1aTVZME1yUEZwcG5HNFA1VjB0dFRrdEJjUU5aT1BOZGdl?=
 =?utf-8?B?b2xzU21RcFNIVmd0SGFSSWxYTENSMjE5c2FHM21kS2t2ZVpxaUh0YTdVRlBp?=
 =?utf-8?B?VjVKYjZ0MmxMaHdsNUZWbStKTExsVytLL09SZFlXU2tvTEEzV0xmc0RGeEZn?=
 =?utf-8?B?YU1OY2dYY0U3dUMzbU5vRDVoSHFOZUk0ZEZHb0J3L1E1a1gvQ2xvRjBmcHRP?=
 =?utf-8?B?V3JaSWFJL1JBbGNkU1ViYW9kVVNZTEcwbXpUazFrMnFvT3JnTVQ5T2lWYUh1?=
 =?utf-8?B?RGlvT0t4WHpGSHpMZnV0YkNGYTdoQS9tbElTMkhGbTBoYmFoNnVIbERHMXFl?=
 =?utf-8?Q?ictwNnB5NzyAimT0=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f994b6fe-f7de-496f-7a54-08def71424ee
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB6208.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 19:18:22.7483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kmVCdhGtJDZ7q267hd6w+GIMuoGhYG4H0SnAqGCUm2sD3/yO2ilkyMSyKQMdRfXIP3gfxZuqmZh0JjJhpw6ytRDBeSqIUGt1S3+7HTXmOrQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5553


On 8/11/2026 12:40 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Device Tree compilation will fail due to the undefined macro `COMBOPHY_RESET` in the `emmc` node.
> --
>
> --- Patch [3]: [PATCH v4 3/8] dt-bindings: arm: altera: add Agilex5 SOCDK eMMC board variant ---
> commit a686e27903fc966d624926fbeae5d10fa6638ad7
> Author: Tanmay Kathpalia <tanmay.kathpalia@altera.com>
>
> dt-bindings: arm: altera: add Agilex5 SOCDK eMMC board variant
>
> Document the Agilex5 SoCDK with the eMMC daughter card, which uses the
> shared HPS SD/eMMC host for onboard eMMC instead of an SD slot.
>
>> diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
>> index 0b418d9d60dbd..ce3a8c1679e57 100644
>> --- a/Documentation/devicetree/bindings/arm/altera.yaml
>> +++ b/Documentation/devicetree/bindings/arm/altera.yaml
>> @@ -112,6 +112,7 @@ properties:
>>                 - intel,socfpga-agilex5-socdk
>>                 - intel,socfpga-agilex5-socdk-013b
>>                 - intel,socfpga-agilex5-socdk-debug
>> +              - intel,socfpga-agilex5-socdk-emmc
> [Severity: Low]
> Does this new variant introduce a regression when compiling the emmc node in
> socfpga_agilex5.dtsi?
>
> It appears that Device Tree compilation will fail due to the undefined macro
> COMBOPHY_RESET in the emmc node.
>
> In arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi:
>
> 		emmc: mmc@10808000 {
> 			compatible = "altr,agilex5-sd6hc", "cdns,sd6hc";
> 			...
> 			resets = <&rst SDMMC_RESET>, <&rst COMBOPHY_RESET>,
> 				 <&rst SDMMC_OCP_RESET>;
>
> The resets property uses the COMBOPHY_RESET macro which is not defined in
> dt-bindings/reset/altr,rst-mgr-s10.h or anywhere else in the tree. Because
> the C preprocessor leaves undefined macros unexpanded, executing the dtbs make
> target will result in a syntax error when the compiler expects integer cell
> references.
>
> Should this macro be added to the reset bindings, or is a different reset
> intended here?

This comment applies to patch 2/8 (arm64: dts: agilex5: add SD/eMMC host
controller), which adds the emmc node.

COMBOPHY_RESET is already defined. It was added by:
commit ab45ecfab540 ("dt-bindings: reset: altr: add COMBOPHY_RESET for 
Agilex5")
which is in mainline via the reset tree:
   #define COMBOPHY_RESET        38
in include/dt-bindings/reset/altr,rst-mgr-s10.h.

That commit is not yet in mmc/next, which is why DT builds against mmc/next
alone can fail. The dependency is called out in the cover letter and in the
patch 2/8.


>>                 - intel,socfpga-agilex5-socdk-modular
>>                 - intel,socfpga-agilex5-socdk-nand
>>             - const: intel,socfpga-agilex5
