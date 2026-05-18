Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011067.outbound.protection.outlook.com [40.93.194.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19923822AB
	for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 17:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779126683; cv=fail; b=i/XiK9RD0O3k0PM8/w8oI63EJ8AlN6+ErMVAH0XBAkXd2+cAMpJlM+pB63wGdTiRVuSfzT7MtAxk/co5eImzUzWoXJRVBBqB6k7/JJgDPdwsD6kn6esIR8NaBbGgGyC4b3YTTYUIIoH5aFlvwPv7Mm02Qfbf4nxzIUcZ12fcL9c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779126683; c=relaxed/simple;
	bh=8LuSSOE5OMUDh21UqaY1c1UT10MRDNSVriPMUX70xFY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IxJHPouCs9bQmXl1UKt7vo2jS3RLQ38E0igR9i0w4H9nDxhhvleOXKf+wvLpAedTLwArm7CZ3B7JBzsAkEM+PCAQZS+NZjXDUEDWnLE8m0cRahlWtZXxZrdLtmzzSmYgyVp4SIRye6jWwSkljCCQlALhtns3dMl37Mj7jAROiHY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sIFfvkEe; arc=fail smtp.client-ip=40.93.194.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sIFfvkEe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cyoSNL4EVjRR7iJsqcfurwcf1WPVtQeTrjZO6EVIhqurlHVyJiNSAx9rkJm63DZWJ+dyQ/V4H70/bmE9rAxE/uMLMdc2AGGkO/bsOPEyQS5hut+S+GTF4mvpm6o9qDUMcaXR+KM2tZusQjkuhKDk+chjsPrvWZaWBFEH7arxJYG8uIeHesxfXpahJtdG3TsMMFjR3M8TM1156JkKd94mLAPEKIqZBXXyH/QccyEQv151fnt3W1Ygeg5sMSyI11XALdnCDH3B9C73wUAt9f14G7zPfs71l32MdRda8EoukcdzO2t5yKgZNYkLX2q5uC6D/EOZAl+TRa/2gaN7vr5ObQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0fpaCQ9VmMt+twzvlQWlaDQktBtCe7+eArAExczy4ik=;
 b=i1uA6JL7Wab0GQeEeqAJ3/jFSNny6K9pyY0/khj/LNySBtEGYZUIJlldAA8zoxG4jdfuv0jImXWABvH5wWDkUpq/YYTS3CkEukl/QhBm1W0fmXRRiYQ8QhYwIhqr9r6wRqgkYoMsgYLAi/9f0q1htSxOUXRO1hbCRSm9Rz02NhM+KDVr/2kSaVh29D+VBsNMkW0A8Vq3564NZFiWIjS+P9lPVHlvb6QlfqSeS4wdlX/lVWV1QPOz87TR7yiPin2GDXquX+2nY2hOBjILy/jNoSU9vQo5qZxuVHK2Kn83UL6j/xNNnbpiNgpPstkjHT8ehakhqnZx83vPNz7yB0LYBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0fpaCQ9VmMt+twzvlQWlaDQktBtCe7+eArAExczy4ik=;
 b=sIFfvkEeXlqcwk6cBoNT6YC0LZ6dNIYa3IkRx21WyaspthnaQQ1G0YWyzrVZg46/Wm05zopE3MW7vL1IE08ICTLNrmG6rC9KTSY9H7VAt3It9kZwHmJusYc9HmQAbX0JOR3uBEaY09yQ1cxKUpeOAnT+9H1vbYEpylZcbrypwUBdDTjgxQyFKsrMPwyZcABrQVMoVzYVb0I9JwKn+XA38WLABYk+VGKIW7xSMREhWHE1DzC5nKeb1coUCvONhm3z6xAHegh8dGd7a3ZfjQQAR5a8sldnRcITfFaM3+oFi4POOfv6/3Pi0aRVYn3t9U7YFQ8os40EjFG/39jiWbclYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BN9PR12MB5179.namprd12.prod.outlook.com (2603:10b6:408:11c::18)
 by PH8PR12MB7207.namprd12.prod.outlook.com (2603:10b6:510:225::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Mon, 18 May
 2026 17:51:16 +0000
Received: from BN9PR12MB5179.namprd12.prod.outlook.com
 ([fe80::cf08:f59b:d016:c95f]) by BN9PR12MB5179.namprd12.prod.outlook.com
 ([fe80::cf08:f59b:d016:c95f%4]) with mapi id 15.21.0025.022; Mon, 18 May 2026
 17:51:16 +0000
Message-ID: <13f2b92c-01b8-412a-8231-cf16588620c8@nvidia.com>
Date: Mon, 18 May 2026 23:21:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: memory: tegra264: Add full set of MC
 client IDs
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org,
 sumitg@nvidia.com
References: <20260518124306.2071481-3-sumitg@nvidia.com>
 <20260518131043.07CDCC2BCB7@smtp.kernel.org>
Content-Language: en-US
From: Sumit Gupta <sumitg@nvidia.com>
In-Reply-To: <20260518131043.07CDCC2BCB7@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DS7P220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:8:1ca::14) To BN9PR12MB5179.namprd12.prod.outlook.com
 (2603:10b6:408:11c::18)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5179:EE_|PH8PR12MB7207:EE_
X-MS-Office365-Filtering-Correlation-Id: 997d07d4-7d96-4086-df6a-08deb5060eee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003|4143699003|11063799003;
X-Microsoft-Antispam-Message-Info:
	Kbj1NUM0so3VuDs5CVAYWxGRV0P/MCKeYGpx+XqamA5z8xPegPJmoJ/ZgD8N+NL8R5+bd8pQ6SL60fjRbq40R1qwj0fz88AvXutvPLVd4HLvttSRpKVlO48NvNexyvRDUpUL+mZH81RTyikBBWTD9l3kPOwOjyMiyUoV2RBvHaPNSOrqJI9Bwz7FamKSzHv20wGJ6rlXOcyNn7N+Hwz0+u9NWZKwz+wCxLc7AQX/mlKBf4mfOI3Q3aN3h9XD1lM8A4a8on1E26RcUbhrOtjfU1jgha/4MFeFTElyDOLPBZ+cXEAZ8S/cyZz0ZgEIx5x3aLYaeIs/aRdvqheguwOEns/bVhKNuO50JtP23l1w/4046v6dCSGtdyOkKyUMVDbB5Y9wSN69gw60Jlxy0dz/IYzIb7UqE1/qhbXtpVf3juDzwXs6LP/avX8oHSmJx8gLAfUxGJ96IRwVHkmi3PThXJLTwmH9Cj/dVVFZYL5wwM6fnGRLGLzhO+xvGDMC6gjKoMjWUYwC79N77tJQLlExyhLzW19/51vXl/IH7zCJ9p80FsxAYSb4pyA3o4sVJB7zA0OBPcq9QYNSISL+ihW1b3PXklEFhkRctVvVRpm7HMCdwj8CX6bBU6NRpXni6aoAOCMNO1KPYSVLBbSWB99tTO3cf58o6TaCu6nZCdNmB01E+gGk5ifQ8dJeTWRm6Wk0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5179.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003)(4143699003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cEpiR0JWWU5zM3JMSGZ0YVJrYWJSRXI5Y0E1d1RFaStpT2tJdXVIOXBaQmhR?=
 =?utf-8?B?QWNxSUE0TUNQZHpTRWdQQXZXTk41QTJFV1Y0dWJCSjJmN1JxQm9tbnh4RU9I?=
 =?utf-8?B?WVJNTjZvTTArNjhsR3VhY0EzRUE4eEhQUU9kVjZpWmxveTlsbUxLOVppRmVQ?=
 =?utf-8?B?MlpFbDJ0dVJLS0ZNSEJDSnhjNzZxeHoyNUpWRnZUWUd6SlBVcXE4TGZ1ejVk?=
 =?utf-8?B?M2RNQjk2YjI1cy9zamx2YkYxVm1yTkRXemRZUzFmSUxPOS9iY3lFVVNuUlhi?=
 =?utf-8?B?NVlQbFl0Sm5XblU0YWw1NXJrckJ6UlB6UHhqVDJadmxncFpSMnByc1I4V1dV?=
 =?utf-8?B?RGlXaU50eVRXcjlhVEs3ZnBTMUlWSk5OQUh1NmpsMEI0N0JSNDBsdlVtYU1N?=
 =?utf-8?B?L01pVkpWZkYyWTZyQkdoeW95ZVV0bG1oQk0zWHJicy9KSUpQSzI4SWEvREdj?=
 =?utf-8?B?WlFHRU1jZHMrN2xPTGRCNVhpUUVoOEVZMVJQcmp6NzQyMFVaRlh1Y1ZTSXJo?=
 =?utf-8?B?eVNNdlQwQ05lUFVXMnJhWWxZcG5MUmxPOWt6SnNnc2p2aS91amh2Q21vK3lk?=
 =?utf-8?B?QnM0aU5XdWk2TXRCWmsxb00vWEpPSWdSNFRmQXc5dlVSNklBYWJPeHhxZldH?=
 =?utf-8?B?ZUM1ZjlYL01wSFBWOTNoc2JXZFYxQXJvVmxqczhRTFhyWWIrSjB6UHhTdktG?=
 =?utf-8?B?QndTUFBRK0F2TFVpcnMrVUdscWkrMXp3UGlMQTZXSzBtRTJpVzVlcUt1MkFU?=
 =?utf-8?B?U1ZMKzFrRk1YWEFtWUVFT3N5YjFNTmZqTWptMGVPdFBHUHlmbkFsTEJvcTk4?=
 =?utf-8?B?Y0xhYmJOeDgvTktlSTNjeExjcmF2MGI1aDJjbkF6UzlYRUhnOWd4enJGRS9X?=
 =?utf-8?B?dzZydEkreVI2Y2d2VkZGMGRxdUppQms4UnNsN2dIczhSUVBuTC9VRjlwZlZK?=
 =?utf-8?B?SVJBaXFIaVQvUjRBNi9reFBDVyswM1Yrb3lIUkVtbmV3cGJBcUZ0VWtlWk56?=
 =?utf-8?B?L3VNb3ZFRklaZ1FaZ0pCK0tHQzR2V3U1L1JtMWxWaEZVZEVYazN5ZGQrUVFC?=
 =?utf-8?B?TXdSVmIxWXl2K0xzVFJOOHEraStzRUZQc0JiRCt3enhlT1JDd2VxVWhJVzda?=
 =?utf-8?B?MFNtQmQxOE9OdlhOLzV5dFRnUElBMkw0cENlakdBZVZ4UzFtYmxSWkFrSmhL?=
 =?utf-8?B?WDRlQ2ZYd2NrU0x3U3FOY1lBam9LSUtZMEtuM0RmTzhRallYYkNGZ2xLbk80?=
 =?utf-8?B?V0ZhcThDR29OUWRVQmVGSmxVVGI2NWMvZGNJR1dNQWc3dnJKbW53Zi80VDNR?=
 =?utf-8?B?Qzh6aE9HS0E5Ry9TWFRmWFhKMHArYVlhdkRjZVZVWHZhRm1iS2Y1WmozdFg1?=
 =?utf-8?B?enQ3TTZ2NXVBZU9kQzh5bTEwcjZLZkkyQ0RLT3ZnY1BVekRjWS9LOWtrcmlj?=
 =?utf-8?B?Z3NaTDBXQUlISWZzdkM0RC9PU0hBakkrZnVqM2tOZ0ZhbDhoMm50QWtkaThY?=
 =?utf-8?B?bldQWDYrdVNkSkR0aXJrTVcrRDc1RE5zYXlYZko0VHltT2JJa0ZubkNLS1Zv?=
 =?utf-8?B?TkRmT2VqWG9OT0ZkU25ucThlbnViRmRPQ3RsWE02bjhEcndLY0VCOFU4M05G?=
 =?utf-8?B?WjhaRklMdjFvcnhjRENjSkoyT3FVdHJ2aFIwSG5WdURqUEk2OVJ6T21GWWpq?=
 =?utf-8?B?WXFFdXdKN0Q5RnZNdDhKMTc0ZmphZXpDSkp2MFFkTmRqSThkQ05VajFsbi9j?=
 =?utf-8?B?d0xwNW1rYW0xSVYvWmtDUUdFcHQ5RnFOYitzMFI5SlMrMTlGbmFVOVo0aVli?=
 =?utf-8?B?Y3Y4dTlkZmZHRzBFTTdkZFBjT1o0SkJyRHJkdHQ1N3RxU0pFcHBHMERLNFp5?=
 =?utf-8?B?K0lHUTlvMXl0eXpEWVdEeUprOG1MTHdZSHYyenRZdmcwMGN3UkRSQWpnWmRl?=
 =?utf-8?B?dXRnWlhLT3NzaG9rTWVrUU11MEVYNVlqd3U4azlFUVM3aWNpLzVCQXZmaDRG?=
 =?utf-8?B?d0VtS0QrNUUrditCVjJYOUVCM2NsUTNsTysvT0RLVzBIRlo2YlRGSmpuN3p3?=
 =?utf-8?B?YjJMNHlncFdqbVYvaTBJTGJ4TXVRRlF4UEFxSGFoNTB3MFFJM3BMQlBLZkhj?=
 =?utf-8?B?YTVJZUJIcjV0aWFabGhOcTFnMElRNTJReDV1ekphall0ZTg1TVFYWUEwYU9n?=
 =?utf-8?B?ejEvTC9SQUJDZlVnd3I2WWM4Y004RVFIeXg2SmJaV3Q0Vnl2QjRjOS9mZ01z?=
 =?utf-8?B?Zkg1NVNYeThFN2ZOcmdvNWZLY2hkTlR0cUV4THI0eXB2THE2SUVGVldjdy9P?=
 =?utf-8?Q?Lbr2v9tfDMo78uvIe3?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 997d07d4-7d96-4086-df6a-08deb5060eee
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5179.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 17:51:16.0796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LTgxMQP4iqICk+D/Zg2t28Ul57x1Wc8ijXmCxbcPq+GtyosCKaPjmBf/kVGWo1SiusbQHaoh+BiCyiZ9jui2/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7207


On 18/05/26 18:40, sashiko-bot@kernel.org wrote:
> External email: Use caution opening links or attachments
>
>
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The macros for the XUSB HOST memory clients are incorrectly named as `XUSB_DEV`.
> --

The XUSB_DEV* macro names match the header released by the BPMP-FW
team. Keeping the delta minimal with the BPMP-FW header to avoid
breaking ABI compatibility.

Thank you,
Sumit Gupta


>
> commit f7f5816878d7a2d26ed25199c9ab18008b75aa76
> Author: Sumit Gupta <sumitg@nvidia.com>
>
> dt-bindings: memory: tegra264: Add full set of MC client IDs
>
> This commit adds the complete set of TEGRA264_MEMORY_CLIENT_* IDs
> exposed by the Tegra264 memory controller.
>
>> diff --git a/include/dt-bindings/memory/nvidia,tegra264.h b/include/dt-bindings/memory/nvidia,tegra264.h
>> index 521405c01f84c..c65403a764134 100644
>> --- a/include/dt-bindings/memory/nvidia,tegra264.h
>> +++ b/include/dt-bindings/memory/nvidia,tegra264.h
> [ ... ]
>> @@ -108,16 +194,140 @@
>>   #define TEGRA264_MEMORY_CLIENT_PCIE5R                0xe2
>>   /* PCIE5/DMX4 Write clients */
>>   #define TEGRA264_MEMORY_CLIENT_PCIE5W                0xe3
> [ ... ]
>>   /* UFS Read client */
>>   #define TEGRA264_MEMORY_CLIENT_UFSR          0x15c
>>   /* UFS write client */
>>   #define TEGRA264_MEMORY_CLIENT_UFSW          0x15d
>> +/* XUSB HOST Read Client */
>> +#define TEGRA264_MEMORY_CLIENT_XUSB_DEVR     0x166
>> +/* XUSB HOST Write Client */
>> +#define TEGRA264_MEMORY_CLIENT_XUSB_DEVW     0x167
> Should these macros be named TEGRA264_MEMORY_CLIENT_XUSB_HOSTR and
> TEGRA264_MEMORY_CLIENT_XUSB_HOSTW instead?
>
> The inline comments document them as XUSB HOST clients, but the macro names
> use DEV. Previous Tegra generations typically separate the host and device
> endpoints using HOSTR/HOSTW and DEVR/DEVW.
>
> Since device tree bindings constitute public ABI, could using DEV for the
> host endpoints cause confusion for future drivers mapping the interconnect
> paths?
>
>> +/* XUSB SS0 Read Client */
>> +#define TEGRA264_MEMORY_CLIENT_XUSB_DEV1R    0x168
>> +/* XUSB SS1 Write Client */
>> +#define TEGRA264_MEMORY_CLIENT_XUSB_DEV2W    0x169
> [ ... ]
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260518124306.2071481-1-sumitg@nvidia.com?part=2
