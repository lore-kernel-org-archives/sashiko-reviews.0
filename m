Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011059.outbound.protection.outlook.com [52.101.62.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BDB33937B
	for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 07:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790147478; cv=fail; b=CKwxGpn9PqRmUFkUaLLwDmsib5YZmzYNihK6ioTmjcre7dXf/Upqu2mtp4Ss5QrlEhLXMYKR0Y4NiPaHLYo/lMdvIT0kz4RgiPj2DoxXl7tiYUybCW98nIHNDMuJq9WrxdKzAM2QZdBBwcE5EGolEN3YdsCJh6g6xrL3pVR1omk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790147478; c=relaxed/simple;
	bh=6qQr/xDOv9Aa48t2yqeFVFwMRqMBQwiGgNWC6v8tQmo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fYNY2aNcDMRtpzS79c1nLQ8LIoS65m1APaqNFkyZTTgR/dFUpJNO2BGywOdB34WRdkmLWFogzeWit+p3Km6e98xwM7oWvEUtd1fqwbuK63udovWZNOOLAO7eRLs1Ycz809LWv+sD5f8nOzJOBwoNNfT9oRdf8qfKA6jQuYRsoeA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=WhePRXEh; arc=fail smtp.client-ip=52.101.62.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="WhePRXEh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CqSV0hFYN2IpldzbiZ67E9+0xYDakxmZEeiWvCu2maUoYzQlfNxNvDYACPC0Z0+h1fQtFjtWWtSl4PVWPByfBnEhwsMHRAIPIRp9k/jj0q7FXHh5nu0vQWIvK4m6vgjYEDMVM7GrY8QvGpQ9qcJJdieZ3CnlNRb8wvkQxhx9EodgbggiZaaPWvrdBiJFEjAC/PQiLIE7s7BUt6iGWtf/tqiPgu+qlMDJIZexD2WWHFFxA8vnCOcb3Z6VIq8V1qqcTja6EZYIdF+IHb8hP4K5yYr4Fp8afqbPD5VWyAgVlOKIMzacstkfj9ZEhco2yek4EpFggL8o25fdMfzPreH4dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8WtNNmeOAQ8yVBGyxsSiKdWhy1kdlk+RXa1wrIZBfgk=;
 b=bLPO1fg2qrBjmFb3HrDBH8Auuodm5Wn2F23tK7Q0p7V4FPxu/eYXgLNqBgvCCLh3EERc/iBlkf7hAAFNbdORydtykLf7xt3OFAhZNLigevQE0ohx+kKk/0Pw3CvFe8v0E3iOOG2WL4VrlvsXwELImA3mdFQDm0L6oAII71bHJjNxWxhb40kj2c639FDwmS78gyrRGkkctV3ztnW/sdSC4oFaLGt22fDDS3rgmC6nfpCazQV7sehIyunELCiTV7YJwXQbgmcQEIqTmi18GdZ8KF3d5J0xf42sNxWrFsEzykVHbnBhqXq8tPTWrHBXeYfQdYRDhV5KfXeEfusG2B9T7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8WtNNmeOAQ8yVBGyxsSiKdWhy1kdlk+RXa1wrIZBfgk=;
 b=WhePRXEhbsrmF1aOeUswPpF8KKJwmKonHw3djgmzqKIX8KWgbLc/Te7AmqZxknQVs/QMQhSXkG4+HSweodDp418mvqxu8dmjo5kbhi9pU5UZPl4nnkLEhYQ1eB2U4pfZZAIdWuNNNhLHt+QAt96h9Z7OB07ZIxixs6I5/XK5J9k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS7PR12MB9475.namprd12.prod.outlook.com (2603:10b6:8:251::6) by
 CH1PPFF9270C127.namprd12.prod.outlook.com (2603:10b6:61f:fc00::62b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 07:10:45 +0000
Received: from DS7PR12MB9475.namprd12.prod.outlook.com
 ([fe80::4371:c924:8800:2587]) by DS7PR12MB9475.namprd12.prod.outlook.com
 ([fe80::4371:c924:8800:2587%6]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 07:10:45 +0000
Message-ID: <666edc7e-ddd1-45ba-a690-2e4888a0f0db@amd.com>
Date: Wed, 23 Sep 2026 12:40:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] irqchip: Add Xilinx Versal NET SMMU CSR interrupt
 controller driver
To: sashiko-reviews@lists.linux.dev, Tushar Nimkar <tushar.nimkar@amd.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20260918-smmu-changes-v2-v2-0-adda681ab983@amd.com>
 <20260918-smmu-changes-v2-v2-2-adda681ab983@amd.com>
 <20260918064831.92E5C1F000FF@smtp.kernel.org>
Content-Language: en-US
From: Tushar Nimkar <tunimkar@amd.com>
In-Reply-To: <20260918064831.92E5C1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4P287CA0028.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:26f::15) To DS7PR12MB9475.namprd12.prod.outlook.com
 (2603:10b6:8:251::6)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9475:EE_|CH1PPFF9270C127:EE_
X-MS-Office365-Filtering-Correlation-Id: 82750dbc-85a0-44c4-6747-08df1941c936
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|10067099003|56012099006|18002099003|22082099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	ArdpPpjYh7xvvz/AIcspWg/OLIcc62UKFbLAwf4TO87BDdRLZfxhxRfcl2utgEOCbhb9S1cVmCsdcjSWbSbsazQ9IJgpmtdlyHkT+93LzLKpfkhjX2YRql+Q0PJMZadME7U62Anx7A/zLNMkT3SeAvlFHH0bzPzSRnDbMytMpGiNTLGyP1KjAMbVr8YmxARflWD9KC1ERr6QVodPNRM9f9WcNsSruRHq4IMI2VMK6UXarvgiZKZ+YLE64QO16lwRHR9GqpbZHTX+lDkuhOVIZsYhiOt0YQz2k15hcu4gOAb/MNEuJzUzdZst0i1LkqfvotiEUzLszgnNjc540fSBL57a9LQAhJF3nctkejGlvb8Sck3LwaElx8HIomMY3r4yliC4hOjuAdVtiWjCS2g3iIj76Rnu9twQID4dp+CADPctchkKmUryOMS4rk+Q6I/Xc8zQ/NPk1CcO/AOidYnJ7+xhLOnBl1P+8vsDsi7/dQQDoieH/Xuhkl6s7hzWZVJOqsjOiDlXl/kLB+PJzzE5JWgiQXGDOv6c1VgVfj8WMOYwDdWR7/TVtfUH4W7YX+6COHlnUTF9ydP/2rKsP4cLnIoTP1I0t8QnkxxaGSyDfY8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9475.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(10067099003)(56012099006)(18002099003)(22082099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZERKUFZCbVBEK21vWDUrZ3RMZHZyY3JVR3A5UE51Wmg4dU1aV2JjWnBONTdT?=
 =?utf-8?B?U1NuZVpHT0luLytPcExjejFPT1lwUlg0ZHFZckk2NmlmSzlHQlA1NmZwRUZ4?=
 =?utf-8?B?akkrZGtxNitMMFg0d25GYUFCamJzMi9pRjU5aDZZREdCcjNLaGtWMlZ0eWNY?=
 =?utf-8?B?NlNPVW1yMHB4ak5ycXVJUnVsT2NhamZLNFpObkw2M05JOVlPeW5sdUlSaXhO?=
 =?utf-8?B?aHhybXVDQUxHZ2VmMGEzeUwrTEZtRkNWTm5DS29rYml6eUVBZUFIOGFiR0tk?=
 =?utf-8?B?eEtDUkNmMmpjdTYwS3E3S2ozaTlvV0ZkdW91V3hSME9aTkU2cERxanJ6TlRT?=
 =?utf-8?B?eGF4am91M3M4elo1MjZzcHd0bkJWWEVkNnRsbFNYQnU2UkU0eWI3UWFadmwr?=
 =?utf-8?B?Y3F2WllCdmJnTmxab1hhdmUzeENoZ2FJVHR5MlFVN0xLOGU3SWR1dEJoM1hj?=
 =?utf-8?B?c1dMUHBzSTF2blVnUllLWHRSNXhKTWtiWFFqQXdlL1JkbTB2aGFqMHMwMDZq?=
 =?utf-8?B?YkU2NEZMb3EyOE1MZFRrM1pVMU9mRk16VUVsUTVrVkRvKytqQkx4MVlnN3dW?=
 =?utf-8?B?am5mOXh6Z2xCUW1tNUpSWnhRTk5VOWluWTZpZ24yQ0k2RkhvWkJySzZkOEdX?=
 =?utf-8?B?ZzB0VkNDdGMxQ0tJekRQMCttYWcwTVBpL1BFWGthNmdVSnhTN3JKK01aUTJm?=
 =?utf-8?B?elhjRjFDSVVXMDJnUHVHUUlWc1E5bEYvK0N4U08vNGRXQWROR0UxUndxT2tO?=
 =?utf-8?B?UWVEbUZweFhGVVpZZkR1bG9MdGtoOTcrc0hhRGJlcHp6bnJFTGF6V2ZNdVhQ?=
 =?utf-8?B?UkNlS1UwRkRabnRYM0gvaUJnK01MWGZ3MWVYOVNMMTVGSnZ4VXk2RUdldVE0?=
 =?utf-8?B?b2FwWWNrdXloQnl4Q3k3eDF4TmtFZzIrQkdNTVdlR2ptbjR2d1RnUkJRK2xN?=
 =?utf-8?B?ZGs3aFJ6UzE0N1oveTNXcGk5MnRLdU51Q2FKZ1JOOFllaU1nd0FKSlZQSGlj?=
 =?utf-8?B?U3ByRHVOK043SFc2L0ZOVFpVSkFpVWVCZFNlMmg5S2FzdnhuVi94TzJXYlc5?=
 =?utf-8?B?UXFJbm9IMytYTGdxMHBpcStqclJ4Um82VGE0RytFcERzRHZNRU1oUVc1Mjhi?=
 =?utf-8?B?VldvTis5YllLUGcwbFFSaFNIVkFqWUtDcmduZVNHeGg2L2NaYzJ4S2pWR1lZ?=
 =?utf-8?B?WlcrTkhHbkJETXhIZm9COGtYNzc5S1RlY1c1UHpPUmNWQVVUekhXdnhjOWNV?=
 =?utf-8?B?amRtWFJCSG5jZVFONmFtZk45Skg0blJHZ1NLMDZZc3E5SDJVL2FmNDNWZlM0?=
 =?utf-8?B?SDZJL2JJcGdhVkt2NlVQakFZVkcwOVRRTWtsZEQwcXk0YnRWcmx3S20vVEl6?=
 =?utf-8?B?T0U0Y0x2dU02Y2JHTlZjVFNUTE5CQVZrZE5neFFRZ29tVXJuTE9PYUdLVGYv?=
 =?utf-8?B?bFpMdk1sM3hLQnAwc3BiNzFtakp4K2ZYRnYvL1NKK29UL0xpRVZEWXJjMDNO?=
 =?utf-8?B?ZnZxUStONXJIa2NYaEhvSzAwVmFPZFpCNE53dGFiWlg4MFVkOUp0WDZKVGhp?=
 =?utf-8?B?TDA5MmFmblMvMjB2dnp6blJXbEtMSFU2MG55M2QwWm9SbWpaOUlwOEprVnht?=
 =?utf-8?B?STNKSFZOdDNrYTRVLzJuOENaNFBIVzRKVUVmY3M2NGx1WFNiZVJmWDRoOGx4?=
 =?utf-8?B?aUxJanRIT3RVK0lRZTc0S24xckxEWjEvRzg4dXN0S2U2NjN1WHlsa1F4WDU0?=
 =?utf-8?B?LzI0bDNCMFlEWUJoOEY4ZVJwZ2FLOEQzTlJ0Z1VyOE1rUGFmZ1dNeEI0L1Z6?=
 =?utf-8?B?cUtGUUp6UmNIWjdDR2NSM1FiNUpUemllSkFFbUQrTEVhUS9QMk41YjNLcXFn?=
 =?utf-8?B?ZEJWS0FBRC9DSExZVUZLYVZicDcyK2dzUTJ1K1c3ekRRelpydExBSHphSEs5?=
 =?utf-8?B?aFk4UlpqdGxicUNreEUramNQOUJSNy9BUG13ekRnWFpycnhvNmJxQ1JVWFM4?=
 =?utf-8?B?cWtZSktlMjVaSnNGN1RXRmNWZ3RqTjYrbC9KWTJ0aHlFM29jWUpZYmVpTjVi?=
 =?utf-8?B?bE1GQU43QWZKK0Q0d3JlSzFXanE5aHZXam5zZmlzV0xvVEVNc0dQamd1Qm16?=
 =?utf-8?B?N2ExT1l3K0hzZngwb2VoN3l5M2ZMcEM2VmRnd1k1S3dRUDdlYkFFa2xMeTZP?=
 =?utf-8?B?dUwyc1VoZ3MrWlRjZU9hVzZIdXVGemVPRmhCVzZEclBXdWFURFhTVFRna1pa?=
 =?utf-8?B?dUJPa1hlZU81RjIrbVNMZnZkZ3ZUKzBGWHVzUGtoYzdNaVhrYnBsak9tbkZu?=
 =?utf-8?B?WU1VbG5FZ2NyVGczZVV0RDRTTGplMnpvQUtKSVRwelZ0ZjNoSFdlQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82750dbc-85a0-44c4-6747-08df1941c936
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9475.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 07:10:45.2754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GJVk3SXECnzMGZ8Lyq+RK3M+Fi8D93M5FoLO3Kux/CxgzVGFy83fHRfdOlXs67lAsjKnfZziJP7Ng4vTPOYCMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPFF9270C127


On 9/18/2026 12:18 PM, sashiko-bot@kernel.org wrote:
> [You don't often get email from sashiko-bot@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] irqchip: unrecoverable interrupt storm due to unhandled CMDQ_SYNC
> - [Medium] irqchip: spurious handling of disabled interrupts causes log spam
Thanks Sashiko for the review,  all issues addressed in v3 and validated.
> --
>
> commit bfa978fa90b50ee4257046a8002784c0f7fc45f7
> Author: Anirudha Sarangi <anirudha.sarangi@amd.com>
>
> irqchip: Add Xilinx Versal NET SMMU CSR interrupt controller driver
>
> The Xilinx Versal NET SoC implements a Control and Status Register (CSR)
> block in front of the ARM SMMUv3 to manage EVENTQ, PRIQ and GLOBAL
> interrupts. This commit adds an irqchip driver to demultiplex these
> interrupts and chain them to the upstream SMMUv3 driver.
>
>> diff --git a/drivers/irqchip/irq-xilinx-smmu-csr.c b/drivers/irqchip/irq-xilinx-smmu-csr.c
>> new file mode 100644
>> index 0000000000000..d9b575c6c58b0
>> --- /dev/null
>> +++ b/drivers/irqchip/irq-xilinx-smmu-csr.c
> [ ... ]
>> +static void xilinx_smmu_csr_irq_handler(struct irq_desc *desc)
>> +{
>> +     struct xilinx_smmu_csr *csr = irq_desc_get_handler_data(desc);
>> +     struct irq_chip *chip = irq_desc_get_chip(desc);
>> +     u32 status, pending;
>> +
>> +     chained_irq_enter(chip, desc);
>> +
>> +     status = readl(csr->base + SMMU_CSR_ISR);
>> +
>> +     /* Only service sources we support; SMMU_CSR_ISR latches raw status */
>> +     pending = status & SMMU_INTR_ALL;
> [Severity: High]
> If the CMDQ_SYNC interrupt (bit 1) was enabled or asserted by a previous boot
> stage like u-boot or kexec, it is filtered out of this pending mask. Because
> it is never cleared or acknowledged, will this cause an interrupt storm on the
> parent GIC line and a system hard lockup?
Yes — fixed in v3. The handler now gates on the hardware mask register 
and defensively masks+clears any active source it doesn't demultiplex 
(e.g. CMDQ_SYNC), so it can't hold the GIC
line asserted.
> [Severity: Medium]
> Additionally, since SMMU_CSR_ISR latches the raw status, does masking against
> SMMU_INTR_ALL instead of a shadow mask of actually enabled interrupts lead to
> processing disabled or unmapped events?
Fixed in v3 - dispatch is now gated on active = status & ~mask using the 
hardware mask register (SMMU_CSR_MASK), so masked/disabled-but-latched 
sources are never processed.
>> +
>> +     while (pending) {
>> +             irq_hw_number_t hwirq = __ffs(pending);
>> +             int ret;
>> +
>> +             ret = generic_handle_domain_irq(csr->domain, hwirq);
>> +             if (ret)
>> +                     pr_err_ratelimited("xilinx-smmu-csr: Failed to handle domain IRQ %lu: %d\n",
>> +                                        hwirq, ret);
> If an unmapped interrupt fires, generic_handle_domain_irq() will fail with
> -EINVAL and log this error. Because the driver cannot ACK an unmapped
> interrupt, the bit remains set in the ISR. Does this result in permanent
> ratelimited log spam and wasted CPU cycles on every subsequent valid
> interrupt?
Fixed in v3 -  On an error return the handler now masks+clears that 
source instead of logging, so the bit can't stay set
>> +
>> +             pending &= ~BIT(hwirq);
>> +     }
>> +
>> +     chained_irq_exit(chip, desc);
>> +}
> [ ... ]
>> +static int __init xilinx_smmu_csr_init(struct device_node *node, struct device_node *parent)
>> +{
> [ ... ]
>> +     /* Start from a known state: all sources disabled, latches cleared. */
>> +     writel(SMMU_INTR_ALL, csr->base + SMMU_CSR_IDR);
>> +     writel(SMMU_INTR_ALL, csr->base + SMMU_CSR_ISR);
> [Severity: High]
> SMMU_INTR_ALL omits bit 1 (CMDQ_SYNC). If a prior boot stage left CMDQ_SYNC
> enabled or pending, doesn't writing only SMMU_INTR_ALL fail to disable and
> clear it, setting up the interrupt storm described above?
Correct — fixed in v3. Init now masks and clears every source the block 
implements (SMMU_INTR_HW_ALL = GENMASK(3,0)), including CMDQ_SYNC:

   writel(SMMU_INTR_HW_ALL, csr->base + SMMU_CSR_IDR); /* mask all  */
   writel(SMMU_INTR_HW_ALL, csr->base + SMMU_CSR_ISR); /* clear all */

so an inherited enabled/pending CMDQ_SYNC is disabled and cleared before 
the parent line is enabled.

>> +
>> +     csr->domain = irq_domain_create_linear(of_fwnode_handle(node), SMMU_CSR_IRQ_NR,
>> +                                            &xilinx_smmu_csr_domain_ops,
>> +                                            csr);
> [ ... ]
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260918-smmu-changes-v2-v2-0-adda681ab983@amd.com?part=2
Thanks, Tushar Nimkar
