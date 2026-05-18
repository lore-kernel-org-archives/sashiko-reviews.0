Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013003.outbound.protection.outlook.com [40.107.159.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED3B30567F;
	Mon, 18 May 2026 07:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779090587; cv=fail; b=b1+DwfagjLaRVcv//EZeIa1IRgme3Be3tVi57nAIoZ9VejyEk347NSlcrAwQihIiX+F58NL9KM0x9qKWteEj0Quio42PeugQMWr0ejVzaGC1t3kAIJpnqV+iuWsX9hdCPd0WqQiMgBgJEHHmaDoyciGuzRft4/TX0gf9t9rzoAQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779090587; c=relaxed/simple;
	bh=uI6A4X+vyjrk9nIboH2p+PpQhXfoghPUjuFDLAlFPB4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BHynBqqw2p8i8mKgnMD+y6wY267OTAEvdSeCrBjVTHj+bnSrEMzLm0Jghr3bTJNuLLt4mb/lEFIShRaMJEJ5Y4iFrFBTm9xlsxTgsWAMSj/bw9Go86Y0heivv5alQSJw/Hcf2a3u1B+lndn1Yhm/7cWV60JpqY29NWILkBrwN6Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=xnVR8jdl; arc=fail smtp.client-ip=40.107.159.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="xnVR8jdl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gTL5LPeH1guUrs3jjX4m2dK90Xxd1vgC67b50m5EgffIIdVIVxASlFG3FvsNOvWfsyLzUKyNkNGZlxzWks42GzMQ4zDDeV2x5pdaxg6hnNYRrbWvTEOZiqLnSEbYVQi2PBnOw3B6kBcvvkP131EMcZCi9OpKSloFR0GD5lb1nGi8SyrTLpyq6zi5g7i64Wc+NeYUrVhCREjOSo9egkuzYPSkbU3pd49FUwtOL8VbS0+c95tqM3VcmBOYER+RFE/hq/PwadLQpq8ZtUJpvGOFpewdmTTIqlpzeeeRLXu7+7Ql9U7dL+MA80YANMeLd23puQrZaMYPiHLbN0+0G3d6+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sQXgFkJqbzmMeN3TiIicMDagP2MAammaCWcAfXEqj5E=;
 b=ZIO8Oerja+7MIibWnqqJoeWAiayC1CGVvukd1tAQIqi3wRK+83bqw9nDuItsM9s1cjQEBnPJ2S6WQiDUMSsC/rnu0hSMZf7Mu518XFnGbudFOjV/mDdGE0Kv7bZhyC7/HfUwTG289qbBdo+De4S1tL8OlQ8FhniNUDJWF60Ic9Iz6jbz79Q8znr/vdjkXD0FbX0SAliUYBxMzrBUV5BczyFqgbQaJ3kQC+lwp/VE25PgXdmOci10ZyNyt1s4DDQlxtrND0iJeAJiQYEjG6qJxadzGbBMdlRkV98lkUZ9UtAlneIyZMc5N7Rk2wnL+c3/LLvb4xtv2grZFLD2Jmb/Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sQXgFkJqbzmMeN3TiIicMDagP2MAammaCWcAfXEqj5E=;
 b=xnVR8jdlpV1t+DkXJU4TEazcnJTr6z3PDEQEZERgmiJWwzV+PKuik71eit68Dg7HUsydAFvIWtLFz86jHOby2A7xJX/6LzeLwyxGurXdvldkkwDE/J9S3Hq8qd1pw8IQnwAm01nOxm+NG/WakR3tc5bMHEQjfWs0lPs+0GNtDh3BPTNrgcPt5xOpkMiMl4BXLqZAZlr8N7mcQzmpV23mpbef0nlN7i9NrG67qhmpefzCX1DVRsXAbmcX6t3mH7B9RHx1w2suLpk/N+JARpWDaFAUl+Ka4+sqOEJ/Tu2mZY4wDi5WVjtSUjCLMDuHtfqrEkrdHmiaisHz7KL1v54ZrQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MRWPR04MB12117.eurprd04.prod.outlook.com (2603:10a6:501:97::14)
 by PAXPR04MB9187.eurprd04.prod.outlook.com (2603:10a6:102:221::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 07:49:39 +0000
Received: from MRWPR04MB12117.eurprd04.prod.outlook.com
 ([fe80::9a10:5b39:708:7f43]) by MRWPR04MB12117.eurprd04.prod.outlook.com
 ([fe80::9a10:5b39:708:7f43%6]) with mapi id 15.21.0025.022; Mon, 18 May 2026
 07:49:39 +0000
Message-ID: <91a27e49-c6d0-4959-a792-6ba3b197bc9e@oss.nxp.com>
Date: Mon, 18 May 2026 15:49:32 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [EXT] Re: [PATCH v4 2/2] arm64: dts: freescale: add i.MX95 19x19
 FRDM PRO board dts
To: sashiko-reviews@lists.linux.dev
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org, conor+dt@kernel.org,
 robh@kernel.org, Frank.Li@kernel.org
References: <20260518-imx95_frdm_pro-v4-2-975346555a9b@nxp.com>
 <20260518032046.198F0C2BCB3@smtp.kernel.org>
Content-Language: en-US
From: "Joseph Guo (OSS)" <qijian.guo@oss.nxp.com>
In-Reply-To: <20260518032046.198F0C2BCB3@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0031.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::18)
 To MRWPR04MB12117.eurprd04.prod.outlook.com (2603:10a6:501:97::14)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWPR04MB12117:EE_|PAXPR04MB9187:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b604aa8-40df-4878-9de2-08deb4b2039d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|19092799006|22082099003|18002099003|56012099003|11063799003|4143699003;
X-Microsoft-Antispam-Message-Info:
	U2Y/mjhvgqP5Eb92OJ297rWVS4FkanVnGoXlTLK62FoDUzuXkcgbKtAJxnZTlpLgTYMxS/rwUMvLh7j+gQUMmzys8Wee9m2B3SdLiWIc+BBFmoIVEmtduf+x9LAJtmpnwWgz5+ugy5zNal4u2C5NmDlP+48UXJ3YakcneFI8YW7Gsj5XIRPxFGAX4JZJ3If/CmoH1c5C2SLW7h7ukhTVrbCeKzm40LOYvzx4rzkt+nVHnciCUn3KjzxRqw1+BFn7z+Vth76u6E+Rop4D0u/OT45Y7g4zpZPzziswlsq+zJ5dJ+gOy73Xt5I0Te2JWks+2RvymM22B7zppf0XiuKtTQnQNMThszheRK64CgjHLFrbOhAtt2yNjGpaAIonclqnzCFAZ6frISaY6eLt4OAsqX/oA3nm8QwjACUFrSvoDvpuvh7iYeycRrY5HQjLK5kdXGjozjkdrXFnq7Q9trUkJaxg+Wc7eZCifXQrR2K36mh+Cad/HW42XWkjkmet/UZ7unfcWTdnE4BEcrk2at/WHmXVNoLwyIiwiNB3d1c0uyY8ixmm8Y7xtZwlpYVDcKxLYyHSDKVwr0ERck89d4sb73baKhMHZfdrtchxNqiU6eW7IEVtQgXv744ipgt1CH3yfLRJzwskgprR0vPBPMO5yB2+WKLiRk9uzthsgmc7A2ke8DX/DGsSr3nfePhyXEL/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12117.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(19092799006)(22082099003)(18002099003)(56012099003)(11063799003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VmJVQ2NiRTEyVkhZK1NWWTgxRXFldmF4ZEkrVE1QL29VcWV5ZFpBYkw1NWor?=
 =?utf-8?B?d2FONEhoZElMTFMvZXA1Z3RVUnFvekhkRjZOeVA4Y2JsdXB6elZwbk9DUWlT?=
 =?utf-8?B?T0VneHpwUk9yRmhVUndrSzVhYWlyMDBBbEZ5NUhpWkJwRWxtaUx5dGVIVzJu?=
 =?utf-8?B?SEVkZDFycnJlOE40VmEvekdSbzhOb0dZRmVYUnBickFOY2hldE9aWk9GYXZk?=
 =?utf-8?B?Y3N6aHVqTlNzd2JqZnB1ZTdWTUx5YjVtcng2VzV1UE1sNkdTTTlZNGZ3RFBy?=
 =?utf-8?B?UDBJVzVDVy9naS9ObEtaWllSRlFPeDVPY2xuQ3g1YmhKaURYYlZKMHhRVWda?=
 =?utf-8?B?dWdqOFZacnJxdHAwdmhLUWdOelpsdVNEVmZhQXZyODM4MXJ1cnNGQVllNXhK?=
 =?utf-8?B?WXhYaTUwczFENTRGZUpXd0g5T04vdUlCenVCZEg5UUZ0Y3QzTDJGdHZKOS9D?=
 =?utf-8?B?K1ZqNHFmcUIrL3F1TnpEMkE5SjVDNXcvWmU1L1BzM05ITTY0UzVZTTdwOXln?=
 =?utf-8?B?WUxsbDJpVW5SOUlIY2JrNEtEVlRvK1kvdTRkNnN1MXROL01tZG54MGRTSm52?=
 =?utf-8?B?RHZlSmJuN3dLRFRKWithRnhMbVd1dWg0Y1V4Ujd4eGJkL3pYVnRsaEkwQjRN?=
 =?utf-8?B?QUM1V0o1cmIzQkFaWWRLaW04RSthclBMRk9LOUpxbEVjT0tJTkllVkY1cmx6?=
 =?utf-8?B?SUVIekVMUUFmQWlNT3BkcnRyTHhJclQvd2VINDdteWdrZjFPNjZ1S1NDRG01?=
 =?utf-8?B?M0M4a0V4NkhFa2JoKzc0S1RKRlhmdXBTR01HVXdEd21VcnJOSUZSV1M5bGJH?=
 =?utf-8?B?dVRaOWNPWVRQaFB2OU44N3QyU3V0WTV5VjFYK0R0UlJyMzdvVkhiTVBUWFZv?=
 =?utf-8?B?RTIvMEZrNXlZUlpsUjZJQWUvODc1TTdpU040NURnc2xuaDVIdTdUTmxKSnMy?=
 =?utf-8?B?U1lIRExRU3BnbHVUMStTSmlGc2lpbVN4SkppSEMrSUJ5RjhZbTVlSHhoYlNz?=
 =?utf-8?B?OUUreW12cHlMSDBQa3F4eS85RXdNOTFna00zcTJmVlRWd1ZUYUMyOTZkUXY0?=
 =?utf-8?B?YVZyNS85TTkxZTVuam5WN0pRU2pULzB3UzFnSElWVFFXZkFSTnh2akFPZE13?=
 =?utf-8?B?THpKTzJZeEFLUkFSd2piNmI3ellZWmpsQUdTc256V2ZVZ0p6Ym02QkNMK2ha?=
 =?utf-8?B?NzY1V3E4WW1LcVFCOWh0ZmJJd0M0ODM2TVNwdnhpbFZnam9CRG5FTjNVc0E3?=
 =?utf-8?B?TDFTa29Jc1JqUEhjWXVBS01hdVdzazNpL1hiU0crb05JNjA4eldOQmZ2RE56?=
 =?utf-8?B?L21rMVl2VUZNaDRaanB5OTUyVFNsYzBOc0htbThMSkJjVmQ3OHlmY2tOS2lt?=
 =?utf-8?B?cmt6TkJNK0dXaHpnVDZiYVdqSm53ZGdnZGdiUlJWZVNsQmVLdDh0QkhnZ1Jm?=
 =?utf-8?B?Z0NQZmNvWlVPdU00alR2REs1RTNycDNXU0srbXlhMkdyTVByM2VSQitrWks3?=
 =?utf-8?B?UTR3WEFRbnVySEFhZFdRNzNCU1NqcnBXSTVyVlpvYkQ0dzlpbWNBU2h6R3Rx?=
 =?utf-8?B?Z2tNYWpKaWVDeGw3ai9xVXpSWVJiSEFGK1VUSHc2dEduTVBndk9GWUgwZ0JH?=
 =?utf-8?B?T1Z4SFdySUJRS20reHFmNHhubUdXdWtCMFpHMHdBY1J6c2pjWnlnZGhEcVQz?=
 =?utf-8?B?MXQ0bzZzdGZVLzl5NlRsRjBCM1NNb0FGd0pTeUttODlnU0FyeWhRZTBSZVhC?=
 =?utf-8?B?QTBZNGxSODYyMkJxdzFWS2ZNN002TDl4MGhmbHRML1JzZ0hjdDdMYVhpbkgv?=
 =?utf-8?B?Ky91c0FRbFJFb0U3OXdrNGRLaTRLcXQxTGpxQWJnUUt0TURCdUlqb0JoODFU?=
 =?utf-8?B?bzBSbXBqRFNMUTBDb1hza3NZM29nUFFad2svMFhPdGxJc2xQUFlDVkhTcnB6?=
 =?utf-8?B?MVg0UU16dGxvd0h1WGFvK0xwZE9YN1hQM2FzSGdheXZWSE5XenhQQzdObDNB?=
 =?utf-8?B?dWFpS3JGRVQrS2FMOS9PMElOUUFmTUJZRmpXdnlibmxQdStnMDY5UlBaZVE0?=
 =?utf-8?B?bm5IOW9zbjBFaFN0b1ljK09LWGVDRmlxU2lFZW5uVGJldWJ6Yk9IbFZCUjVH?=
 =?utf-8?B?QUV2dmF4Sys4Wjh1QmlVQ3oyQWhOekFhRUdQdHY0U3JGR09KSFYzTytPT2x4?=
 =?utf-8?B?VnJvcmNMc2dxS1dLVndqVU56K1d1cWsvN3paUVYzT0kzU1NVVUVVcCs1alN2?=
 =?utf-8?B?U0xBVmFmbEhMQWRvTWM3dEt4LzBQa2JkTWswN0sramVyTDM3Y0gxVlRMN3Qw?=
 =?utf-8?B?UElzUExqTFNCR0RDZ0wwVXhJMFRNK3pqTGF2SXhYbDM0Q2N2WjRTZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b604aa8-40df-4878-9de2-08deb4b2039d
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12117.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 07:49:39.3764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xWWeWPpvJJpGeQ+bpfzyp9vIQ4FFghPSKju8jml+d556VaESyKABblzSQR5n7dr0/VzMsJGxwwwmKyw5g8/VUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9187

On 5/18/2026 11:20 AM, sashiko-bot@kernel.org wrote:
> 
> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> - [High] Architectural flaw preventing the M7 core from using the CAN1 transceiver.
> - [High] Incorrect drive strength in `pinctrl_usdhc2_200mhz` causing potential SD card instability.
> - [Medium] Mismatch between commit message claiming 10G ETH support and device tree implementation.
> - [Medium] Dead pinctrl configuration in the reserved `flexcan1` node.
> - [Low] Unused `reg_3p3v` regulator node.
> --
> 
> commit 65457c99452cde3ade57a7afda12053dd0e2d5ee
> Author: Joseph Guo <qijian.guo@nxp.com>
> 
> arm64: dts: freescale: add i.MX95 19x19 FRDM PRO board dts
> 
> This commit adds the device tree for the NXP i.MX95 19x19 FRDM PRO board,
> which is based on the i.MX95 19x19 SoC. It configures various peripherals
> including USB, PCIe, ethernet, CAN, and regulators.
> 
>> - 10G ETH interface
> 
> The commit message claims support for a 10G ETH interface, but the device tree
> only configures enetc_port0 and enetc_port1 as 1 Gbps rgmii-id interfaces and
> entirely omits the i.MX95 10G Ethernet MAC. Is this omission intentional?
> 
10G ETH interface is not enabled in this device tree. But it is supported by hardware.


>> diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-frdm-pro.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-frdm-pro.dts
>> new file mode 100644
>> index 0000000000000..b87a26b0d7fcf
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/freescale/imx95-19x19-frdm-pro.dts
>> @@ -0,0 +1,1021 @@
>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> +/*
>> + * Copyright 2026 NXP
>> + */
> 
> [ ... ]
> 
>> +     flexcan1_phy: can-phy0 {
>> +             compatible = "nxp,tja1057";
>> +             #phy-cells = <0>;
>> +             max-bitrate = <5000000>;
>> +             silent-gpios = <&i2c4_gpio_expander_22 11 GPIO_ACTIVE_HIGH>;
>> +     };
> 
> [ ... ]
> 
>> +     reg_3p3v: regulator-3p3v {
>> +             compatible = "regulator-fixed";
>> +             regulator-name = "+V3.3_SW";
>> +             regulator-max-microvolt = <3300000>;
>> +             regulator-min-microvolt = <3300000>;
>> +     };
> 
> Is this regulator used anywhere? It doesn't have the regulator-always-on
> property and isn't referenced by any device node as a supply.
> 

Reference 3v3 here. I think should keep it here.> [ ... ]
> 
>> +&flexcan1 {
>> +     phys = <&flexcan1_phy>;
>> +     pinctrl-0 = <&pinctrl_flexcan1>;
>> +     pinctrl-names = "default";
>> +     status = "reserved";
>> +};
> 
> Will the M7 core be able to use the CAN1 transceiver with this setup?
> 
> Since flexcan1 is marked as reserved, the Linux CAN driver won't probe it.
> As a result, Linux will never power on flexcan1_phy or drive the standby GPIO
> low. The Linux driver core will also ignore the pinctrl-0 configuration.
> 
> If the M7 core depends on Linux to set up the pin multiplexing and enable the
> PHY, does this need a gpio-hog on the expander and the pinctrl moved to an
> active pinctrl_hog group instead?
> 
M7 core didn't reply any linux side to set up the CAN1.

> [ ... ]
> 
>> +     pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
>> +             fsl,pins = <
>> +                     IMX95_PAD_SD2_CLK__USDHC2_CLK                           0x158e
>> +                     IMX95_PAD_SD2_CMD__USDHC2_CMD                           0x138e
>> +                     IMX95_PAD_SD2_DATA0__USDHC2_DATA0                       0x138e
>> +                     IMX95_PAD_SD2_DATA1__USDHC2_DATA1                       0x138e
>> +                     IMX95_PAD_SD2_DATA2__USDHC2_DATA2                       0x138e
>> +                     IMX95_PAD_SD2_DATA3__USDHC2_DATA3                       0x138e
>> +                     IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT                   0x51e
>> +             >;
>> +     };
> 
> Are these pad settings correct for 200MHz operation?
> 
> These use the exact same pad settings (0x138e and 0x158e) as the 100MHz group,
> whereas usdhc1 and usdhc3 correctly configure higher drive strength (0x13fe and
> 0x15fe) for 200MHz. Can this lower drive strength cause signal integrity
> issues or CRC errors with the SD card at 200MHz?
> 

For SD card. The driver strength is enough for 200Mhz. No CRC error was found during stress test.

