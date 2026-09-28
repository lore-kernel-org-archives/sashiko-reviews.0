Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012056.outbound.protection.outlook.com [40.107.209.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2564B4279FE
	for <sashiko-reviews@lists.linux.dev>; Mon, 28 Sep 2026 07:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790580605; cv=fail; b=PoSNFnEpAkhvlCperqVohFaV6bySLfuIjEI/Mp5Y8NJSQsMiuMeDSgypVw1KM0URCoUDbolNVWk9M62rDy/PPS6JHhhM+guOPLiX7O4OkMpOg+pSCo9UghXHZklWXjaM+PpOQwh332yle3YflcHIHTb1XEYkr38E+lFC3gCRkQY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790580605; c=relaxed/simple;
	bh=9AqxvgkqWQsL0ApEPKKJ5mSfLTznPJ2MoaE/DF0VJcs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=G5NuzcNNCJyqW8cGgzpwer3sjVlPGH043aX/Jw50A3zNTqCURWeK4dspGfgdqRof1S209gYDq4zdOeZ0XOjSrj4UzND539q4vOm6fQb22nUD+8dS9ED4CaFaBQ8ZqkeNGcPJ/qhqsCZVnLJxoyGnfIqJULAhuXz8n3TWccfr3yQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=HwIDVFdX; arc=fail smtp.client-ip=40.107.209.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="HwIDVFdX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qq6tq9Q6VLq2sZx786H9ARowLSsb32Z7IMRY6hNcwVzQMMyUu5jEiyq4fGW3FnMY0b15Pf+azjB6gnvuUnrWu7mRkR7pVosNzMiWcIflHoyknmjqRn8/Ktie+aqo1spWobQT/GsRvY5eeSAlPV8p7erWM7uDyG4TEC5gzFe1rKbm3JMiF83uO+I+i04aq8w7rgKsoHnoqlfhP3uZC4URon5gxQOogjsul2Vs0E+BboIZmgE1B3GmZVQ29Y7ZZeCfJOOMQOZOU/7eJ+DgYvd3ODC6urDqFhtt7weyWCYEotPiiHdTt2xEj7nJBgZknraToq6VVHZSLcjGP5QGIkTKsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=90jPwypk7gyS3T9EFdid0paPTU3pn0wVyfgiyliWvVw=;
 b=cMUda/VWcdHrFqAqL67VGJRnRtBW/vllXCn3Q5bvObVB2nFT7LrggWdBNLlc37hKRuqN3p1Xxm/RObnMdArUTkJiwxPDNbIVmA86GQUNmsIT8TJAYpq4NlzopyaU7++pk1FGQDrc8azE09MBSFT3+I8VxAw9iAP/2Z0NLsPHSPgRc9c0H/VZnK6ZZ5C1GKGMH/ie/EMPKlQInEzbBroWbtaD9xxz/iES1fZrYVyqo0FJKP+zlWgF7G2oXIKDaPQWLXg0mxo1JQMh8nSRPAHjBFR2gOkX9BpgEI/k75Ji8j1W7q0FMYoB2DB+ggCqLEwurw1EaQ+FsOrShrKYmhU7Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=90jPwypk7gyS3T9EFdid0paPTU3pn0wVyfgiyliWvVw=;
 b=HwIDVFdXNAz89UJIuJLl4srKCBdOV//aspd6TkwHUs9rXxDvE0npr1BrUyLxw1omwgfbgjTBfpl+3KxgtWTVVpre3yupyvDtp6cPOZLSu9J+NMsxTuWbC2Eph/8yMuK7mnCON11Qaji71Q3GMOiejfT8SrqJPKkWa1SnKddcErA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS7PR12MB9475.namprd12.prod.outlook.com (2603:10b6:8:251::6) by
 CH3PR12MB297944.namprd12.prod.outlook.com (2603:10b6:610:367::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 07:28:24 +0000
Received: from DS7PR12MB9475.namprd12.prod.outlook.com
 ([fe80::4371:c924:8800:2587]) by DS7PR12MB9475.namprd12.prod.outlook.com
 ([fe80::4371:c924:8800:2587%6]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 07:28:24 +0000
Message-ID: <354e8c9c-3e59-4707-b77a-828d9c7b68b4@amd.com>
Date: Mon, 28 Sep 2026 12:58:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] irqchip: Add Xilinx Versal NET SMMU CSR interrupt
 controller driver
To: sashiko-reviews@lists.linux.dev, Tushar Nimkar <tushar.nimkar@amd.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
References: <20260923-smmu-changes-v2-v3-0-87bd09ba9605@amd.com>
 <20260923-smmu-changes-v2-v3-2-87bd09ba9605@amd.com>
 <20260923072607.0E9731F000FF@smtp.kernel.org>
Content-Language: en-US
From: Tushar Nimkar <tunimkar@amd.com>
In-Reply-To: <20260923072607.0E9731F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0020.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:179::8) To DS7PR12MB9475.namprd12.prod.outlook.com
 (2603:10b6:8:251::6)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9475:EE_|CH3PR12MB297944:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a72f359-ed9f-4caa-1996-08df1d32146a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|11063799006|56012099006|4143699003|6133799003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	hqBrd1mY5BvkLX5tLrzUg3iWHY0lep81Dn1K605kbxUqQZOBYkGrDpdIz5Z7EAcMApVUdQZS/3Da4EHNBnEg+NtPpMUzj1LURM5+phkOZBlsu/jRgZeXJQ2QDuCvsdHr3AlQO6sOGTFcfcNyPDi1sVLWNGqhpcf0OdMxacJvixSQ0gywYPG0G/A4eNDdmzcpgRdihCMeyGzhYn+kvO4klkIGJxDTykWUF2F6ZVMtdUA5c2aIRyx2fuFAFwMzVjpVP9PWrDNZY6uVCZqGQh4Gh1o13IIKxgy5oClVlWRCK3Grj1ku1mp9itWb/PF+58Gea5W2gscYSEiE0MDtFu89gNlOkPQ9VzyQQPe6KAVy+L3RbxwVaG243lkdgRJiYwpCj4sMaeOFqfCf5IH1tIh0r0RqzZNIpAXw2UDe0XvVQanxZ9I+utY0uiwmbzznjsyZdc2O61EX40oQCkjNYawsOCQUdwX8UCRTsahORDMYRd9btmru3t8qR9L1EZfl25luhDuw9XLfekLKWa8zR0VzXeCXuxKH9npddtfhr+/j2BDLLV7ArfwFno+hrb+7WjSSWNZOwPtQAzzzkcdb07qENfQrh0lcuXEDo+RzUUSbDVo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9475.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(11063799006)(56012099006)(4143699003)(6133799003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a3Z4a0x6VWRLb2h0WStYNUdrUExKZHFhejR5OUtqMjFyMzlTREFJTTdaUGNO?=
 =?utf-8?B?M09nUUQvOWphZW5SREhZWmNBbEtHNXpTbzBUcWFXQjZ3WTZBekE5SDZac2pP?=
 =?utf-8?B?OWJYMjRZdHFUUlY3bGR5eVhTRHRzWmVJK0J6NGVDbWtyVERJVm94OEJyQWFS?=
 =?utf-8?B?UDAxK2FxQkU4U0V5bk9iNnAvRzZwQnlKcG02N29HUkJHaXMxcVI5Vk9HKzBi?=
 =?utf-8?B?dEZPUVNKQ2cxM1poM3pHYkZ6QWx4dmJoWWpNdXVnT1orc1NJc0luLzAxcjkx?=
 =?utf-8?B?bUxsWDNvSUROMUlLcHFsQnhZZ1dFWXRhMmJYeVExM3VEVUtxVGpYVmVoSm9q?=
 =?utf-8?B?VEZsYVpoNmVZZU5yaUVEL0RTc25BOTA1N3ZydG16aURSQ3hwRUpXS281MHgv?=
 =?utf-8?B?SDVvUVlWS2ozWVhVWlR1WGJJVlBjN01GVDdHTmdjY0dXdGdpMllydmcvbE4w?=
 =?utf-8?B?c0NLdWNpa0RkZWtheWZvN2VEd3pBcWNOeUxNN3d0UzhiM1ViODlSdW1aUjNB?=
 =?utf-8?B?Mm84a2x2blVzaFg1NkZNUmNvWlFESXNjYUUwbEdsakVtRmUrc3k2ZWYvanNF?=
 =?utf-8?B?RTJNbWZXVnNQcTA4dk1uVnRKV1RWZGRtQnlZVGNURUVvRkYyNk5tTE9sUEQ1?=
 =?utf-8?B?RW85SVBHMStoQ2ZtU3RuVzYwOEo0QXByZ2lvK0JnbEo3WnlUNzh0VUkrRUlQ?=
 =?utf-8?B?L1BQTEJ1cVJEMGpmNlQzeFZsa2ZZOEFjQTFZZks2WGdzdStmREJDTWhFTEFh?=
 =?utf-8?B?VDdDK0p3WjBrUzNOTFhmTE5XaWpTWnpzNXdncFU1d0xxWDJ4ejNRZ3dvSlla?=
 =?utf-8?B?WEVrd2NGczUwcjJ3bWNJVWNaVTdzdWhwT2d0ZGI3MFBEYkd6U0xmTEMzeGg4?=
 =?utf-8?B?aUJ3MFdKTFd0ZnVyUmw5aVFFb3hOcUpMRVdHWEhIRXJuRWorUTQ0MldpMllG?=
 =?utf-8?B?Y3BqRWZWWEEydFR0M00zRENkOENSSlBvMkY3Sk0zK3FFc3ZXakpYNEdaZ240?=
 =?utf-8?B?bGRYcFBHQjAvVmhSRkpDL2FlMTRmQkVxblZMZ0VHODI5UmdjRFhxWnFxbzBs?=
 =?utf-8?B?RmU3REgxei9PUkljbTNpT29aN2MyRkVIWU9lU09mNzFwMnI4ZUthYUltWVpi?=
 =?utf-8?B?cm5JN0FnZTZJaDdveFBuVGYwZE02YktJemFreE50aVVNSVJKT01qbUF6dU1H?=
 =?utf-8?B?NXhNbzZGMHhPQVJqck9SZDVzeENsQVFTanU2bXM4dWxzNzkwVENGRjRIOFh3?=
 =?utf-8?B?RXc4ZHgyZUZhYW9UQ2x3T2tGVS9zTGIzZ2t1bHc0dmExbjJnREhHTTVuU0FZ?=
 =?utf-8?B?YkdNUzhGUW5Vc0NJRjFpSndnakdNL3Z4b08wU08zQUIzdnpRbGExTDJDc09m?=
 =?utf-8?B?V0pSTXRKYVlZSmNNZHdzZ05XMjNrSk9PYXh5UERVU0VNa1JwVGFZcHp0VFd1?=
 =?utf-8?B?Nmh1K0s5Nmk2TG82aDhJVUlVYVgrOWpvWTloOTRNQklVRmQrcnBkQVlRTmJT?=
 =?utf-8?B?eW0xcUhMMGtzZ01vcCsrcWhTVDk4alMwNHBaQkpMOGFFcTBMQURUMEpKMFdk?=
 =?utf-8?B?empoeU5pMkwvVTQ3Y1RXNHR1NDh3WTVxMWdHMHVodjhkRzNCZjhOOTE5Y3Vs?=
 =?utf-8?B?MDIrV3F6MVR5U0hxU09ZKzNOV0lZYU93cmt2YVBPdERnSGFSS25DMzVNQ1lC?=
 =?utf-8?B?RG04b1VReXBMeVNBL2xRWW1qWC8rbVZjK1UwaU4rZDBzK3BsZDI4OE1ZL1JD?=
 =?utf-8?B?MnFMUTd2dk45WmRvemNCRDZ6Rm5UZmZPK21adGxkZGJmKzVIL3JJZUxwVmtz?=
 =?utf-8?B?bW1IRjNQOElsMjFjVEhxOTYzWExCcUJKWDEzMDBwL04zRkdaK3pwLzl6UHo2?=
 =?utf-8?B?OVFBWXFUMGZvbmU3KzA1VFNRNEVBUWpNcDErWnRMS1pWTVlkSWxERzdIaWlk?=
 =?utf-8?B?ZzFVL2ZjalpGd28vR2JwNExreXlWT0tnY0ZhazBLWXFlb0dOVzRCL1I2dkpj?=
 =?utf-8?B?bXNtMk9YYS9kQnBuS1Z5MlFrdHlyVkgzYjlqcEVTZGxHa2ZyVjN6b3FjWXBB?=
 =?utf-8?B?bHFoTGhHUWp2bjl2TS9MdmEzV1h1M2c5K2d4azQ2Mzc3ZUxMVUc5Z0RDU3FG?=
 =?utf-8?B?akw1d3RCeURzU2dGS2Z3YXM1bG9tNmR0VGt6ZkFYcUVTTDNUQ1hteUNWaHZK?=
 =?utf-8?B?bnVGa3pqZjQ2bFFSOXdON1VkLy9uejlMWThhZ1g5bFJUcEgvc0pET2YxNS9a?=
 =?utf-8?B?c0tMcDVHc0ZoWWZXUnBweHRmVE9GMS9tVHZhWHMzQWpnc1VJN3FxMmp0ZEt0?=
 =?utf-8?Q?rP/7Mz7eoUuh9F+ZpX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a72f359-ed9f-4caa-1996-08df1d32146a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9475.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 07:28:24.1390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kq8vJTmQi0SHXfXZCd8WRGw4RjEgHW8p1S20hTnRVth/DW3Ml8ioiPARQW563Lgyy85r9RTe9hUWRHw42w+PuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB297944

Thanks for the review,

On 9/23/2026 12:56 PM, sashiko-bot@kernel.org wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] irqchip: spurious interrupts due to handle_level_irq with latched status
> --
will fix in v4
>
> commit 2d37d393fff3fd3914b9e3ef7cecbd4d6f1c364c
> Author: Anirudha Sarangi <anirudha.sarangi@amd.com>
>
> irqchip: Add Xilinx Versal NET SMMU CSR interrupt controller driver
>
> The Xilinx Versal NET SoC implements a Control and Status Register (CSR) block
> in front of the ARM SMMUv3 to manage EVENTQ, PRIQ and GLOBAL interrupts. This
> commit adds an irqchip driver for the CSR block that registers as an interrupt
> controller and chains to the upstream SMMUv3 driver.
>
>> diff --git a/drivers/irqchip/irq-xilinx-smmu-csr.c b/drivers/irqchip/irq-xilinx-smmu-csr.c
>> new file mode 100644
>> index 0000000000000..b29aafd01dbeb
>> --- /dev/null
>> +++ b/drivers/irqchip/irq-xilinx-smmu-csr.c
> [ ... ]
>
>> +static struct irq_chip xilinx_smmu_csr_chip = {
>> +     .name           = "xlnx-smmu-csr",
>> +     .irq_mask       = xilinx_smmu_csr_irq_mask,
>> +     .irq_unmask     = xilinx_smmu_csr_irq_unmask,
>> +     .irq_ack        = xilinx_smmu_csr_irq_ack,
>> +};
> [ ... ]
>
>> +static int xilinx_smmu_csr_domain_map(struct irq_domain *d, unsigned int virq,
>> +                                   irq_hw_number_t hwirq)
>> +{
>> +     struct xilinx_smmu_csr *csr = d->host_data;
>> +
>> +     if (!xilinx_smmu_csr_hwirq_mask(hwirq))
>> +             return -EINVAL;
>> +
>> +     irq_set_chip_and_handler(virq, &xilinx_smmu_csr_chip, handle_level_irq);
> [Severity: High]
> Will using handle_level_irq() cause spurious interrupts due to the latched
> status in the SMMU_CSR_ISR register?
>
> Since handle_level_irq() acknowledges the interrupt by calling the .irq_ack
> callback (which clears the W1C SMMU_CSR_ISR register) before invoking the
> SMMUv3 device handler, the CSR block clears its status while the underlying
> SMMU line is still asserted.
>
> Because the source isn't deasserted yet, the CSR block will immediately
> re-latch the status. When handle_level_irq() unmasks the interrupt after the
> SMMUv3 handler finishes, this re-latched status will trigger a second
> interrupt. The SMMUv3 driver will find no actual events and return IRQ_NONE,
> eventually causing the kernel's spurious interrupt detector to disable the GIC
> line.
>
> Should this driver use handle_fasteoi_irq() and implement the .irq_eoi
> callback instead, so the CSR status is only cleared after the underlying
> SMMUv3 driver has successfully deasserted the source?
Good catch, agreed !
SMMU_CSR_ISR is sticky W1C, so clearing it in .irq_ack before the SMMUv3 
handler
drains the source lets the CSR re-latch, producing a spurious IRQ_NONE 
that trips
the spurious detector.

Fixed in v4: switched to handle_fasteoi_irq() with the W1C clear moved to
.irq_eoi, plus IRQCHIP_EOI_THREADED so the clear is deferred until the
threaded EVENTQ/PRIQ handler has actually drained the queue.

Thanks,
Tushar
>> +     irq_set_chip_data(virq, csr);
>> +     irq_set_status_flags(virq, IRQ_LEVEL);
>> +
>> +     return 0;
>> +}
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260923-smmu-changes-v2-v3-0-87bd09ba9605@amd.com?part=2
