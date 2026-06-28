Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013071.outbound.protection.outlook.com [40.93.201.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8B734E764
	for <sashiko-reviews@lists.linux.dev>; Sun, 28 Jun 2026 09:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782640568; cv=fail; b=k9P6wpkjWZi4KxYoQx9u5cuyrSParF09TQ/RR8jYwL7DfqMlPPwJipSUPQPruCbmQqAiKoBK7ZtgRC4mI1O0LHi80me8qUxQIvU4rkuFMeL7WdOZhOM7uIpknEx+rTP2CJJT5UMy+DkUJD0lNgzD3UH41rtQeClzWT2OGOhTgHI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782640568; c=relaxed/simple;
	bh=dGxKuzyoyIKftY8T9rcVhKkeIWarbAL/tEuxRtmRt5M=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gER5XJCB0eRLWn6LtUCTVVlx7Xd2NORqHOS47rT92JjnaW0EYb4yLFN+f/cVKtojHmcg2yGX3IMWNb9Vp+f/sAP468ZYInKAalMVcIDAxjBDvoPQJxJxCr+eiKFG1tiGW0HXosZfRqM+QhMn0dZu1zSmkTWEpZN85J66AJpXg4o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=cmquV5Hg; arc=fail smtp.client-ip=40.93.201.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="cmquV5Hg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=efmUmozvqSRSJPdRGkXCGuuyf0QXGPapUG29oIKrWYBz+pj300rQUsQ/620RKhg+2omXkn2ik4gtaFTB3AidioWvX++6z5Qh/rsuP8q017yc76xKTaqf/91YeSZT7psAWosVpNaUaxuzWNmt6W/jWAdlVE9SMlVGHeOQvpGc6WzkgOWh6XLYMsoiSXHNWnO/rf3R2LxEfcxexvyn60qVeiH52xm2aIb4xWbi91WMjWUwZvEZUp8ZEmQJ+Fj8s6aLb5cSN9KvmYpLYRC3wC+VkCcI06mfjyjhoLhLoRKxsJIukarBHGHXwRAXWvriux+1vke6JGJx1KP0BhyIS+jbxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OnY87Ts9sW4l/tZl8pVdwiYnmXSQERvq2ud+Bt9Ccak=;
 b=D+HdthPp4boh1lTm6c9dCQgWsSgXXDHy9Q+K3c9Awmc+VmM1WIkWaA/B93qcJxyUxylgo/mVHk//5T5fYVm4X2eXHaUf4MOKyfhHXQ4zwHvz+CYggXjAZdd4hFc2jS8Q/M1X+rzJuRfiD0n2Pn5mTMKNB43fSnRTp+cVk7f3KSDgUXeQ76wn9JoZxKlGJnlPd9evkby1biQqq7pUtvX9xHcaTIpktmhX7aIf65vyCiyR7NbzcfA45Iv30UgxbazrcOEG5JAgXdJOfb/zm8STqUAcutGDD5tE856V/ZZne1Xws+27n94KGwSht1mBh2Rspm242WslBBaJTpQLfgieQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OnY87Ts9sW4l/tZl8pVdwiYnmXSQERvq2ud+Bt9Ccak=;
 b=cmquV5HgPHbyCBmC+s7czg6/MNkxD8R5EE///EZk7kYsLJQMjdM90UE7h2jc3++d/5Pny+IgI98SghUTCEcDJQLpd4bHJetySYYlDpxHsAfO+9d3kf0QMKl0ozcrVOSliaxmUQc4mZJuRyDoych9COdv8W8bt2jf+c+Q/qTWvd7Z0EuhYoamPkc2ErKDJ57395gmj0KlZJti36EG9RLkM379X3aYGEa5/Z2BaE15DQ3yKDTFJgKwIzkyuIEntAKuqXbMY9nekPNjPiyb/xjNlSNMSYkWaJTSyZdgybnhAnrpJNa8o3vEPzWsGGtJ/SizBTvg+aOITPCIW89l2gX8iA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from BN9PR03MB6204.namprd03.prod.outlook.com (2603:10b6:408:101::21)
 by PH8PR03MB989117.namprd03.prod.outlook.com (2603:10b6:510:3a9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.18; Sun, 28 Jun
 2026 09:56:04 +0000
Received: from BN9PR03MB6204.namprd03.prod.outlook.com
 ([fe80::47fd:71fd:88fe:6fe4]) by BN9PR03MB6204.namprd03.prod.outlook.com
 ([fe80::47fd:71fd:88fe:6fe4%5]) with mapi id 15.21.0159.018; Sun, 28 Jun 2026
 09:56:03 +0000
Message-ID: <7e839ba2-8ad3-40ff-bbff-b697b358dafd@altera.com>
Date: Sun, 28 Jun 2026 15:25:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/9] arm64: dts: agilex5: add Cadence SD6HC controller
 and SOCDK enablement
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20260627201457.12318-1-tanmay.kathpalia@altera.com>
 <20260627201457.12318-4-tanmay.kathpalia@altera.com>
 <20260627202457.5A3931F000E9@smtp.kernel.org>
Content-Language: en-US
From: "Kathpalia, Tanmay" <tanmay.kathpalia@altera.com>
In-Reply-To: <20260627202457.5A3931F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0001.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::14) To DM4PR03MB6208.namprd03.prod.outlook.com
 (2603:10b6:5:39c::19)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR03MB6204:EE_|PH8PR03MB989117:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d230df5-a45d-494f-fd8c-08ded4fb6de8
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|11063799006|4143699003|22082099003|18002099003|55112099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	DrFI90OXPrA8IRUmkOeja7Dcqtui3TwpacZvHiCTkUCVRvkf3KFsrUPlOUXUDfYcyqRYz1QLoJfvgWd5lJYETKsYjSBj1wvqZo0n27WwaNn6uq8byZMetLHK6Twaavrf+lMyDeJlQ2wQvXWx7jsgK9CHWOCZdNQyyv0FDN4oDtVnejG0DQeHZOSnufxpv6ZTr+EXaiLoyWyqTc4Ha02Rfbmuc+7x7Df27YHcyp5ht/AoGg7kz5z0eCQDHv+JftiQCAIwc3AyEbAqkkOjpPGT91kiaBKx6WhT6yTDkqoYp0NN0AG7iaG0EynJJ4BKdEqbfLCI4pHSUS7bs+Rx8UoeZd2DXuaaZDYmLAqOUypb2foEP/GYBtLbItDeJiDQ71LXCyl/PlABu3iWojJkcjU0tCoXuO8mwtKmFGQoxaSpZ826k3pXaAhrqrK2wIJlJ/FZcCEZyj5Lj3VUmL/19J/nOUZgfkCbnsD0mvhS9k73Rl0KLvVGJidjeldjiZXJhZ4N17b6EfdS3jNiGgr/0MaByBqwlcBMMHXzPQRBaUWjQTrz+V3tGY7V7JLchNk+j4E2C6UO3n6YcLuUMDLrQwt4Om0cZpWDS/HvLp3N7hgLr+BMIXdBt2tU6tw+c2BhvqHZ1vjvuNX7KFnioazI2wVq8BtZGwNBRn+j1zomct/d+Jg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB6204.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(11063799006)(4143699003)(22082099003)(18002099003)(55112099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q3NCOVVZcVI4a1NVWGQvUk1VKzlrOHNMTzhzNlVCK2tOV2N5WG9pU2JobEFE?=
 =?utf-8?B?eGlBUmxXdjVkLzJWYWtvOHhkR0NBZGtwbmpJQzNNcTVNSkM5VHlOL0JCSkk4?=
 =?utf-8?B?RG9NWFV6dm9FSHFmS29vSUZiQkNpR2liY05kc1lCdm5CVS9Od1lXVTc3TExR?=
 =?utf-8?B?ejdES2lCbzBFZk96L0lCMWR2ekhSRHBuNHRrTFZGUmk0dllOM1piSVZhdllF?=
 =?utf-8?B?TXU3UnFzcURHNVpqa3d3dEpySStBRUtCWHJmbVozMm1SeG1JOEVTM3R6TXdu?=
 =?utf-8?B?VTJFZGpFcVF6QnJBZTFnZ3k4ZUR2U2FZUy9Ed0VIc20vRW9oMCtxbjNuYTUw?=
 =?utf-8?B?c3RoS004eVBueW9WMWkvM2JSTWZ4amFvS014Y1VuRW53UnlUcHczZVhhVlJa?=
 =?utf-8?B?bGxoVzFaVjczV1h4aFJaNS9SbW1QTk1nRk9sb2crR2s1S0V2dmN2cmpFcVZ6?=
 =?utf-8?B?LzVaZlN0UlhNZlE3QkxjYlQwOEtwZ1ZvUFhsRWN1NTc3dFN2WGJUbkNINHB3?=
 =?utf-8?B?NFBBc3pndzBaQWcxQmkxVU1kTlJ5cXdmQSs3emd4QVk5K2RrMS9wcVJrUEti?=
 =?utf-8?B?NmpoZ1VHVThZdHBHeVpBcFlCVXdwVk5PVk9LTlJGaDllZis5blphMTZKekEy?=
 =?utf-8?B?QWNWOXNYajRPaXdJTC9YdTFaWGRQNlhyc1hoRUxBYlpFUGhyRU5ITlBqMlBU?=
 =?utf-8?B?SXZEaGtnSExiVERMRDJNeXg5K2VlQ3NOZWpseW1YdFFQUW9oaEtKZlMvMXgw?=
 =?utf-8?B?eDM3UERtOFBSSTdYVlNMK3F2VHk4dmUrYkc1VkJaeUZHRWlRNzdVcUtiMmJm?=
 =?utf-8?B?dDh6dWFMa2ZUWFdab1VuRnNFbGd2QkNqVk5YejN4MlVuRUxZTFZqbWtrK2F3?=
 =?utf-8?B?S3Rmc1p5WlFQU05UazlCVGc0Tm0wZEhRTTZNeEswdVMrTGdHaWk1QTVleCtJ?=
 =?utf-8?B?dHlQQUg0UUpWZTlkVmJwZ3dHemdkS2JTcExGaDlQckw3bThuM0RxRDhFV25h?=
 =?utf-8?B?NFlQeFIzcEwzRVQxQmdkbU1lWjJ4TlRIeTZUeUliVHlpSEtDQTVyQ2IwalRy?=
 =?utf-8?B?cG4zSmVWS2ZvY2VmZ0g0SDhOaEhkNks5UkIrNEZ4UlRNeVdIZ0phWEk3dEV0?=
 =?utf-8?B?aFRDb0djZ0tVZkU3dVN2MUVXNFY2ajNRRVM4cUZQTjI0MTNHMmJVMVlHV2lS?=
 =?utf-8?B?MGVXRnhmYnlKQWVvMU1sZEQrZmlTVml6aktnRzBiQ3ZUVWdmd2w3L1dmK2lt?=
 =?utf-8?B?NjZVazVJRDRoOHZVQ0xUdDBEc3FyejM4Vy85Uml3ZHhvS0toRk42SXptVndP?=
 =?utf-8?B?TWhEZXROd29WbmE0V0tLakxYekF6STdtN3JCYXc2YlFtK25ta3Z6Mjc0T0RR?=
 =?utf-8?B?bmlKR2l0TWxPUGgzQ2hpRUZyQytheWUxVVF1MGc5bVJTYXNSWDJBTWVnb25M?=
 =?utf-8?B?YjhRTnFRUDMrYUxGYkQ2c2RzUTBqRElIdGtXNnB0Rmk0NkdtNjNEVXRGMkdh?=
 =?utf-8?B?T3liOEtQMHFpM3dqQzluV1RNNlI4cndiY00vbzVOZkViSjhOUTdDVDdTS1U3?=
 =?utf-8?B?a3FtYXhseWNjTFA3WW4wK3E1K21pc3BwNHhrOXdoaXpDU2wyckVETnYxMnFS?=
 =?utf-8?B?dmV5Y0pMS2hDZWxXVDRWbXIycmxTYjgyb2ltYTE5V2M0Smt1Q29xbWdmTm5W?=
 =?utf-8?B?Sm43WDVZVHNJZE1RWnN2MUVHcm4vbnBXN2xHN2VRNzIxVHJWTmlJbUJybEsw?=
 =?utf-8?B?dGtiNFNqUEJEZDB2enloaVppNFpkdy9XdXpNSUt0ekdGd3FjcUZrMmp4QWFC?=
 =?utf-8?B?NDZFeUxQdERNZDNnQzIrMDYvYUFKRTRnd0dDcVRVYThITmVLQnhjUUJUL0VJ?=
 =?utf-8?B?ZDRUZ01yZU9xdDBsd1AyOC9Uc29uRDFBd1JCYklDcWZFTVNuaUlsMHZFUDFk?=
 =?utf-8?B?ZVBUZktBZEZQRmhWMVFGQ1g2cFZEQWVCSGNQbURsUUcvV09ua29PakVpbmdM?=
 =?utf-8?B?QW1seHdBcTdtMkZvRzBOWEhrNVNHNitoS3MweCtnUFhnSm4xby9BVnhuNHZH?=
 =?utf-8?B?U1NPWGNnKzlWdXR1L0tmaWZBUGRabUpVYk9XM29QNmpIYkxEMHdJWUZGaGc5?=
 =?utf-8?B?SWFZRElvL3A0djQ5NkQ0bUJVWWRnck9WaFpqUmhDMUtKZFAyZ3NGMnVvenBr?=
 =?utf-8?B?RGJoZ1hneDA1RFNESmxZQmNGNERhMGpueTFyRUQvSmxuaWhjOXZOMXZSL1RJ?=
 =?utf-8?B?MUhYVy9XMk5TL0RZb1BlWVRQQ01lTzBrNGh1bldXQjBsMmNaby9qaEIvMWRK?=
 =?utf-8?B?UWhIamRORU45aVE2KzFzOVhzd0FOeldVL2x2TUgyOHlvZ0hlOFhPTktpL3JQ?=
 =?utf-8?Q?pa1ImbGdX0oUPQCg=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d230df5-a45d-494f-fd8c-08ded4fb6de8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB6208.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2026 09:56:03.7278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qe4dCbzrlYgwy0lo8IGHRRd9P5Bc7/BGUnc0ioN/bsV3KxyJ3HhLVMY+Kz6jbbnPnyZyh+iIN0QCsgpjOR0KL8qUWTyQgMKcp9ZiMx8bYFo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR03MB989117


On 6/28/2026 1:54 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The GPIO-controlled I/O regulator (vqmmc-io) initializes to 1.8V instead of the required 3.3V at boot due to missing `gpios-states` property.
> --
>
> commit d6ddf71779dce5e00733c866f08e72b6d91c3a47
> Author: Tanmay Kathpalia <tanmay.kathpalia@altera.com>
>
> arm64: dts: agilex5: add Cadence SD6HC controller and SOCDK enablement
>
> This commit adds the Cadence SD6HC controller node to the Agilex5 SoC DTSI
> and enables it for the SOCDK board. It configures the controller for SD-only
> operation with a fixed 3.3V card power regulator and a GPIO-controlled I/O
> voltage regulator.
>
>> diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
>> index 262bb3e8e5c72..c56f46721bb06 100644
>> --- a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
>> +++ b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
> [ ... ]
>
>> @@ -34,6 +34,24 @@ memory@80000000 {
>>   		/* We expect the bootloader to fill in the reg */
>>   		reg = <0x0 0x80000000 0x0 0x0>;
>>   	};
>> +
>> +	vmmc_reg: regulator-fixed-3p3v {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "vcc-sd";
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-max-microvolt = <3300000>;
>> +		regulator-always-on;
>> +	};
>> +
>> +	vqmmc_io_reg: regulator-1p8v {
>> +		compatible = "regulator-gpio";
>> +		regulator-name = "vqmmc-io";
>> +		regulator-min-microvolt = <1800000>;
>> +		regulator-max-microvolt = <3300000>;
>> +		states =	<1800000 0x1>,
>> +				<3300000 0x0>;
>> +		gpios = <&portb 3 GPIO_ACTIVE_HIGH>;
>> +	};
> [Severity: High]
> Does this missing gpios-states property cause the regulator to initialize
> incorrectly at boot?
>
> In drivers/regulator/gpio-regulator.c, when gpios-states is omitted,
> of_get_gpio_regulator_config() defaults the GPIO to GPIOD_OUT_HIGH. Based
> on the states array here, a high state (0x1) selects 1.8V instead of the
> standard 3.3V required for initial SD card operation.
>
> Could this violate SD card power sequencing by supplying 1.8V to the I/O
> lines while VDD is 3.3V, potentially causing enumeration failures or
> electrical damage?

Correct. Will add gpios-states = <0>; to initialize at 3.3V and fold it into
v3 with any other feedback.

