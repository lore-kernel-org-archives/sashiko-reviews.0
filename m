Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011069.outbound.protection.outlook.com [52.101.57.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934403D3499
	for <sashiko-reviews@lists.linux.dev>; Wed, 13 May 2026 06:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778653552; cv=fail; b=WZBzA67XgbPpgN6DFYJiAAodj80Q+DccWD3mLLPmWuE8sXdQlSP2TTE04PBSDQ7cqE7p25wCr6w3UUbVk6X0pjW6F0dgzi8uUuPGELcmdZ+wl/PDpO5V1ptmaZelHEcbwZsRmviu2A7AM1Qu0F3BgeC7byexm4vR0ZZzm3Yyg6o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778653552; c=relaxed/simple;
	bh=/oUtx8GL87fwf9IasJt+wEDSmFvYxYi1BI7q8GfOuR0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VsyGl7HI1W8SO1LjgTEV2llF6ZhrfmOceouKbUmDxECpz6huT7ZDgbmqGtGiPBmiX+OYJtajP0YfHcd8R7ysm3GklWspt6rJBO1NS3aZYWK+V7j8ArY+ksz4vv1HL37mgWPcq/a7MP6jbuDZis8Sn5Lyu3zvMiNYSSHhr7b6tik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=K7fH/+o/; arc=fail smtp.client-ip=52.101.57.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="K7fH/+o/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mrBFx10zulfTgFLAjIGKdTXTnFb8HBUPJqu+ORDCCRJE4O6u6IrwfX+hUezVUefYbGnxNMehvFOhQXcKFVHfOIrfD5jz3tiKC/+PvebPj6ac/FzEw1TPlaHugPMjbNrf2qtZ85AbPLMx5aES6Rss3Khf44I5+UVg8HfFz9bZtCWBVf1ox7jBZ6tFP8hi90BDrrfXGtvItjSzh4LTG4Rj52LQf+Azan4lgv/b9dDecB1CDR7nW41qctWlaq0A6SWbSrj43lcGLQlKyVyr1JW5sed3++L+xIcC8YbQnqy7k9OiLocUM38F7rRcHrsC7RRkk20dJTf13efjYNYCs1Df/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oh/77BRg6ShO55wyDAUyYXU2HIobNkmI+6THHXlm1J0=;
 b=UYvX7MhDAjMkuDPFuoPQq6tsJcbDHKSDSrM+Cd8QjKVzusMiOovvNywoTKRXMaJZZKCIgJcD4+0edgcvX0EkuU5A2YeuZi4XR/IAHcskUFB5aKAlVjLIh/aW1B4oQH9RqeSQe0aski2f+FsGnhLcn8gkF8Dul7UJxuSRIbM3mz0sQDsDqCNLJGLtCGAdu1CW38rOF9Kej2JiPtXjjaYfSp4xeNtHBtZmEmWAwJya0cDL3C1DhrCvb1K7Mj0iLtV2tTlPnNMx7q2Xao+rHdCU6r/HZbFkoYgPxgfnxxcTZhrFy/M8tSWkKP5/tvzK3KZj7JOXn+WD7TllmAePFkjsUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oh/77BRg6ShO55wyDAUyYXU2HIobNkmI+6THHXlm1J0=;
 b=K7fH/+o/kIbwHnzsg9X5mVzdJtwt1TDU13tye3+Kppi8KyriDY+mytNuwGSm2KdMW1toUc1zeTRBfaZZ+pZtf43GGk4bSkYq7RrzBubBf9BE/UgTJUFMlrHoSHYK2IQrdvE0Yg3wcvcAyWQig6l8lFH2gRMXTPzYmvCReLEhQdPaYsl5tcIJNQXTJCNJhux+3c4RxNMuDMz7/6lraDhivZhA66S6Ilj42n9kNrNvM9+tsNNCaVLBHB6vXncNxGhllUwVnGQOu6WQgaZPhACzcBq8iNDvAM771ob11KvtRt8OLJDVuU37OxUJckOjHtuPl5GGAw41XoJOcIJXRKCpeg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM4PR03MB6208.namprd03.prod.outlook.com (2603:10b6:5:39c::19)
 by SA5PR03MB989124.namprd03.prod.outlook.com (2603:10b6:806:4d6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 06:25:48 +0000
Received: from DM4PR03MB6208.namprd03.prod.outlook.com
 ([fe80::2216:93ef:67b:9e04]) by DM4PR03MB6208.namprd03.prod.outlook.com
 ([fe80::2216:93ef:67b:9e04%6]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 06:25:47 +0000
Message-ID: <cd07e035-dbfa-40ca-b285-7b3a982f74b3@altera.com>
Date: Wed, 13 May 2026 11:55:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/9] arm64: dts: agilex5: add SOCDK eMMC daughter board
 support
To: sashiko-reviews@lists.linux.dev
Cc: krzk+dt@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
 robh@kernel.org
References: <20260511202132.5597-6-tanmay.kathpalia@altera.com>
 <20260513012239.8FB2AC2BCB0@smtp.kernel.org>
Content-Language: en-US
From: "Kathpalia, Tanmay" <tanmay.kathpalia@altera.com>
In-Reply-To: <20260513012239.8FB2AC2BCB0@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0048.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d6::7) To DM4PR03MB6208.namprd03.prod.outlook.com
 (2603:10b6:5:39c::19)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB6208:EE_|SA5PR03MB989124:EE_
X-MS-Office365-Filtering-Correlation-Id: 359ba86f-8fbd-4078-3114-08deb0b87886
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|55112099003|22082099003|56012099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	kuUdaGu2oDSb/3uLL6r1BSwrgTWxUv/xi/2Hx8e9DEEvahQL7O2KTcf+MzYUHLqkK/L2vA1Y0Zxi7nRMUH1Nt1TTw3PN0t6LV96jmKFE2JgYmtL2b9UEMSEmDCOTu0TPp9wC2ZvyYIl31FEd038RInhaKdZsewRsYawiDzXjcghYbEH4tdYWxZDUjvRsmDJTN8tX2wuoZF219Y1sWK+IXuUo/o78P0qWLWSzHwvkDfmpriet5cu3XKLICjquv9Ob+4TD/NV7IqbnBUlnG4MVfdVrM9pjaZWCjqONF3eDXoPjF9f7ozF/NgYrOtBQ3htccND2z/SOyFDObtO/piRPewUeH5Ec1KPgRj41J7Hiv+n8alSqPMwtFhYaE5VAsdO6gWlyLn5iAgi0779levwCHDY7n3GMfG5U01o44e1O6L+HqH/D7kDM4BL52PMA8dnR15qQvVmoV2zrNDKCcBWeGjki2r64RMHgt1D3UIU4qm16RkOMWPUNMBwdPr70ofN7u85Srwh6bk5uR31mTRDm8zXa/+OspGTDPNK4GhCDEzoTCQ7Qu9UH507gO6UctFjFiFdafyR1cEZLChHKVB2Ggajyq3ptksGwH3g1e+fpLi0J0ZF/DlvAxszc4BPBc7YgqGFYBG6J5cGFWj12yXGsemt3UsC+Vb8AbU6sM1UjvyCp5jWmbru54ZeZZGsUabjB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB6208.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(55112099003)(22082099003)(56012099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TklCcWx5Q1RscVl6c0NpNldzTzBhaDRjaUY3MFlobW56ZThmQmVDUThJNDZl?=
 =?utf-8?B?WFhkTkhLL2RRZUtqV1ZSZnlwaG9ZYWFMOU82ZWNsc2M2b2dLaWt1b3NaRktM?=
 =?utf-8?B?K2hjZ3NYZXVFdVhkTElzMUJtWHppblJlOEhqWllpMDJ6dFlBM2ZRL1IrRk44?=
 =?utf-8?B?NHBBcUV6ME1lTngvRE8xMkg5TmxNNnlleGxwSmZiMnkzQlZyVWRxRlRZTi9J?=
 =?utf-8?B?RnQ1a3I3TkNxc1Jmc05nMTExZzY5WGJqeXB2NVJmVjMzOVJHQlZkTU5Sc1pq?=
 =?utf-8?B?anlYNEFXaHB6aHZKaUlCVHROcDF6VURqbk5EU1MwaXlvSEhXYW0ra1JPRHIr?=
 =?utf-8?B?Q3FwVDlzalhPdjl6Z002SGZNQWlVVWE0ekZITVJnak9PSWU0M3E1aklFRllL?=
 =?utf-8?B?dEV0VGZ0d3FuM0FGbGl1YUVpSU45WDMzTFc0alNweUIvejNYY3ZGeUtHcUk3?=
 =?utf-8?B?bTA3OEJ1VVU1MkhOVlhhOGxPTFd4RWNIMnMzNkRGNFBjaGxnTFlPTkVwOXQx?=
 =?utf-8?B?ZjRrcmRHUTByclBXemEvclBTZ0lrY3QwTkdTVkhnYk90a3YvTlBPbGJRMjkz?=
 =?utf-8?B?K0VWZHBCWGNGSk43Wmpwemw3QmRHM3VsaHhQZFlzelVXd2ZNTnZyVXYyUlZ0?=
 =?utf-8?B?cW9DYnpSV1ZmRk1CckJNY3hVa0dRM2NicXlJKzM2bFdZRDJzaDkrUlZQVFR4?=
 =?utf-8?B?L213MXN4OUtHWkZGRUIvdHFoRGlDcFVoUmk1WUtkUTA3c3dvejNSN0VGZkZF?=
 =?utf-8?B?R2lzOUZIK0VHNFhFQ05yYmtuSXk3QUQ1M2lNaHhqZVZ3MVFIY0l6NFd3SmRr?=
 =?utf-8?B?dkI1ZG5PYWllMmp0M2ZiTmJLdUU0QmdZSlVPK2R5UEZ3V2Nqb1JQekNXU1ph?=
 =?utf-8?B?NVBsd0ZreG1INm5IdjlXcGRxaHdSR3BhMlBFc0QyVDc1SCtpQ1QrTVJ2S3NG?=
 =?utf-8?B?M3crSVNESjFGUTNwdjIxTUQ1RTZqeFVvNy96Nyt6Q09jczNaYURKZnhqVVVq?=
 =?utf-8?B?YjZFQnJULzJ0dXhjUlN2MFBweVV1d2t3SVJxSTZnSXdPZTVOTWZuN29mdlRL?=
 =?utf-8?B?bGJHa3FwS1lpT1JPZUpQcDc1Skk5MzhaRmMwdkN0VWkzVnFNczdnMnhSUUZY?=
 =?utf-8?B?V1FIdmpmb0ZOTFcrOFdsWXlqS3N2YWZkcnBVdW9RZDFWekxnV1IvWFdEUkMx?=
 =?utf-8?B?d293V1RqMUNQR3JuazNIN2xlZ25aNklPZWtWdjVBMGtORHR2TWJqSXdDcE5x?=
 =?utf-8?B?blNKM3hBMnh6MnMxNDl0L2pocVdpU0JzcXNVa3g5dWpTU2Z0L25UenRUUmRR?=
 =?utf-8?B?Q0lQUFpoanpzN2dNSjU0TGk0TWN4SDNLT29HSzJxa1VnMnVOTFQrTXFoWWhK?=
 =?utf-8?B?R1M0eWIvUzh4UDNJZzhiY2hzNFdkeVJvdkcyOFo3d3BlYW52b0JHY2J4RnMx?=
 =?utf-8?B?R2hMVVBtb3FSYjVWR2xGQlJNQWhDcEJBd28wMXBFK1c3K3Y2MWNOYStIaW81?=
 =?utf-8?B?YWlQNkxKcVhaUFJjSnhTbVQ5eGRZaEliVDl5TDZzTUJEd0lOMk9VbjVqYlBX?=
 =?utf-8?B?ZUVvVjE4bUl0ZzRZNG5oQW1BTkhnUnhLRWpPa0s2NnFqRm1CZnZCa1U2MEJQ?=
 =?utf-8?B?UlVKQVR5UWhtYW8xT1BuM3VBWnJxQW9pVllhSENQUEp2Nnh6c1ozVFVLbjBK?=
 =?utf-8?B?VzZLOXRKeFVLaWQvWG1jQXdITDN1dm53UG5wZ2t4ejcwTldvWHo4ZjBpd2xt?=
 =?utf-8?B?dnhJR1pEaXUwb1ZuVnpKM0RpUUttOEZpcWZsaUZqZkNvNWM4emtTbWxRSUNE?=
 =?utf-8?B?ME0xM3ovS1FwTXdlWGlZaXhzZ3crc01ZZy9HWnZpM1JLVGVzbmgxUHg1ajE1?=
 =?utf-8?B?TTdQTXoybERlNEsrRERBMGFiQnR0c0kvTEUrd0trcWFDL2FVWWpsN3hLa2k2?=
 =?utf-8?B?ZjZLRlNxZ21EYWFRZFM3b3d2Rld1TmZXcjN3djJ0MThMbVB2eG04aDBPeWRw?=
 =?utf-8?B?dlJiSWR0OHN0bUlLV1dvVkpCaTQrQjBVT2NNOFh5WW8yTm5tN043QUsxWjNs?=
 =?utf-8?B?akJuYi80RVB3dENzdWp0OHRwZExRZDVxdy9TZEM4NlJoOFVscnp5ZHJJdHor?=
 =?utf-8?B?WFd0ZDA1SGcvUmlFaWVrWlY1TTRkQk1mR3d4WmE1bTd6ell3dVNzdUdtMVR1?=
 =?utf-8?B?V3FSd0YyQVcxbzMvVVEvTU82TzNWZ2Y1SmZlakxXZkdwT3R3RHBVK2xhYkZ6?=
 =?utf-8?B?M0ttL25xRWNmYm02Y3NvbjJnUTFwc09FdTJPeDQ1MTYreGE3elFBUVg3WTlE?=
 =?utf-8?B?SlpjREJUYU1Kd2hBL2htNEk3UzJ5NUdtNlhub084UWR1TitWLzM0OTRwUHBa?=
 =?utf-8?Q?Y/V6U/QWXq0y9Dkk=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 359ba86f-8fbd-4078-3114-08deb0b87886
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB6208.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 06:25:47.7257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uDcUS52PtIkrY07cQyRRJrJvA2Ey36BWe+H2zps6DNDTlY+CvEyGPpKUo4OWWcPEkNQmPbMcX6uMFiY3B3aWdWG0+CAG8iG/lMGoRBuWBoA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PR03MB989124


On 5/13/2026 6:52 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] The `no-1-8-v` property in the `&emmc` node explicitly disables the 1.8V HS200 and HS400 modes, contradicting the commit intent.
> - [Medium] A board-specific fixed regulator (`emmc_io_1v8_reg`) is improperly defined in the shared SoC-level `.dtsi` file and placed under a memory-mapped bus.
> --
>
> commit 832d2f01748902348b5ee8ddc2a87d8dfab30896
> Author: Tanmay Kathpalia <tanmay.kathpalia@altera.com>
>
> arm64: dts: agilex5: add SOCDK eMMC daughter board support
>
> This commit adds device tree support for the Agilex5 SOCDK eMMC daughter
> board. It introduces the new board dts file and adds a fixed 1.8V regulator
> for the eMMC I/O voltage to the common SoC dtsi.
>
>> diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
>> index 7e080f13166f2..feb4ccb317a71 100644
>> --- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
>> +++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> [ ... ]
>> @@ -317,6 +317,14 @@ sd_io_1v8_reg: regulator-1p8v {
>>   					<3300000 0x0>;
>>   		};
>>   
>> +		emmc_io_1v8_reg: regulator-fixed-1p8v {
>> +			compatible = "regulator-fixed";
>> +			regulator-name = "emmc-io-power";
>> +			regulator-min-microvolt = <1800000>;
>> +			regulator-max-microvolt = <1800000>;
>> +			regulator-always-on;
>> +		};
>> +
> Will this cause every Agilex 5 board to inadvertently instantiate and enable
> this regulator, even if they do not have the eMMC daughter card attached?
> Since this appears to be a board-specific regulator, would it be better
> placed at the root level of the board-specific socfpga_agilex5_socdk_emmc.dts
> file?
>
> Additionally, does placing this node inside a memory-mapped bus without a reg
> property trigger device tree compiler warnings?

Agreed, this is board-specific and should not be in the shared SoC dtsi.
Will be moved to socfpga_agilex5_socdk_emmc.dts in v2.
>
>> diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_emmc.dts b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_emmc.dts
>> new file mode 100644
>> index 0000000000000..87bde9fa69c6c
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_emmc.dts
> [ ... ]
>> +&emmc {
>> +	status = "okay";
>> +
>> +	no-sd;
>> +	no-sdio;
>> +	no-1-8-v;
> The commit message states the eMMC controller is configured for HS200 and
> HS400 modes at 1.8V. Does the no-1-8-v property prevent these high-speed
> modes from functioning?
>
> In the SDHCI core, parsing no-1-8-v sets the SDHCI_QUIRK2_NO_1_8_V flag,
> which strips out the MMC_CAP2_HSX00_1_8V and MMC_CAP2_HS400_ES capabilities
> during host setup. Since the eMMC IO is explicitly supplied by a 1.8V
> regulator, shouldn't this property be removed to allow HS200 and HS400
> negotiation?


no-1-8-v sets SDHCI_QUIRK2_NO_1_8_V which prevents HS200/HS400
negotiation — contradicting the intent. Will be removed in v2.

