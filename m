Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11020140.outbound.protection.outlook.com [52.101.61.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC2F4071D2
	for <sashiko-reviews@lists.linux.dev>; Fri, 21 Aug 2026 05:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787290555; cv=fail; b=gv3InmY4DhRDUNZjH0gYVslm6Ffu8h522ukDAfMOXxGVxvrClerUBVejQDQM0Ig9KN2jkogYuT5nJM0gGOZEJQZD0vpJ4C+HdsJvjackqGDjWtSe6KuTnRt5ybQR7FKH8L5xnkP1omTKp/3FjSt9TmRMNp9s25+q2+iJrKrbWr4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787290555; c=relaxed/simple;
	bh=cfhm7O/3+H5QdX1Ipr/bco8PR7xEXb76C/4c/ihsGZE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=i+kuivdjxHmFP6M+f9iwunsW5QJpDtXLdioW0d7tL9WIbx/l6kKFv1UFuc3/3TQEx/LUqtoPgkO60VWL/wDuI89kPkhzCGkz4CZlUusWVHZNUXpshD0ZTtTM6kOMlQEP9sxrbB7yz2mt3kC+bAmWh9fzJ8BBj9/WcR9mXkcGZwc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=w70SNYE2; arc=fail smtp.client-ip=52.101.61.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="w70SNYE2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K6juXzXtk8iBXj9hBYFnn9hFcPN2a5CT5sdnC4aINCeYIz3s9t48Mn6n49/sytx4YPaGWw03dhG5RAa1MXKwmBiMZ6ChyzMBOHD6O4X85TLLhTUE1whNR+d0Kge3Z+bTitHAfyQUsB9OujchnSBn3urNcBvRaUWpeQrzB6VkYo/fM85eDum0x1f4wyjVoc1TEX/ZGN9FX4s9r8oFydnwIRvBMh9UD4i8bK22ENmC+8JKoKLWDRyQNbfnL6ooXsIDugQhVg21BD5OumD9dzP3ymfwem4JsVl+C+RB2nsTo25wX3pDoNOwq5bSvgZ2XoNv+L4dfACmZ9ZCKvlgxfoyTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y2BlzcHDRikLeMVyIgMO8b4ImwGFY3+XDrzSJHVOzY4=;
 b=oxHkM858Kb4lyqXm/ferIsPTj4iPVuCNZFlP4HF0V5vJ5owhdO8QCgGlcXFkL4KLUvCJ4wRVisfwim6Z1GLO40x2PHP34ph8aoHZ3M9E+3m3334n+SdPJg7JR3W/4lB20Cj96Ef2/bkvsiYvmzlOLGcehYurq0vV8RvEeg2Sw+spTbIckVORvMqWpjE5F3Pa6gnOrJRew3JluJlbOHtYVwcmoZHehxe0gYISyltMGwqMmgtEhYxlHTx1xnReMjCXdkyX6OGdU+DLhGyp28uv/uxDZdJY+jp5da7VvAzFuTsLLfZTmjRyj+dPaMbf8cYi0fF+I7uxDmNogVq4VjXodA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y2BlzcHDRikLeMVyIgMO8b4ImwGFY3+XDrzSJHVOzY4=;
 b=w70SNYE2NG3yGcav3yLahSBp/lfLm5hXctVxfcS3LL1dBqB9stAwJ6ezHLB+ceHrlt1h72bWoKSJU0YcxmLhzPRUHFm04r6piORrL7AXEL4LJ6zZMULyeytNIlM1LbA7lhuqB4uyv4HZjTR+UxZ8FmJwflhjxI6kGCVD11RxkuG9nj/RhFu1hW5RKxqFBx5L+6YaA2M1dLEVcvZItRTteUOH+/kibFxE0+68qIV37RDT0kePI8IxSE1D3yYFWiPtm/QnSAFXa8Ogae32UYtnz80+1N4mffnEukm2hDoqxhLZ860iAD3XfU2h7jtCx4y7+IGbOzabB9/jBwMpWAWT1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received: from BL1PPF1B62FD55C.namprd18.prod.outlook.com
 (2603:10b6:20f:fc04::d8c) by IA0PPFC4D2A1900.namprd18.prod.outlook.com
 (2603:10b6:20f:fc04::c3e) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 05:35:51 +0000
Received: from BL1PPF1B62FD55C.namprd18.prod.outlook.com
 ([fe80::89bc:34fe:3f82:b3f2]) by BL1PPF1B62FD55C.namprd18.prod.outlook.com
 ([fe80::89bc:34fe:3f82:b3f2%8]) with mapi id 15.21.0339.008; Fri, 21 Aug 2026
 05:35:50 +0000
Message-ID: <7b672462-238a-4b41-b937-c5e28d193b9e@axiado.com>
Date: Fri, 21 Aug 2026 13:35:45 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] mailbox: add Axiado AX3005 mailbox driver
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260817-upstream-axiado-ax3005-mailbox-upstream-v2-0-25e713eccff3@axiado.com>
 <20260817-upstream-axiado-ax3005-mailbox-upstream-v2-2-25e713eccff3@axiado.com>
 <20260818034422.288381F000E9@smtp.kernel.org>
Content-Language: en-US
From: Swark Yang <syang@axiado.com>
In-Reply-To: <20260818034422.288381F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TP0P295CA0008.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:2::20) To BL1PPF1B62FD55C.namprd18.prod.outlook.com
 (2603:10b6:20f:fc04::d8c)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PPF1B62FD55C:EE_|IA0PPFC4D2A1900:EE_
X-MS-Office365-Filtering-Correlation-Id: 36dbb7d9-da29-432b-7335-08deff460f4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|22082099003|18002099003|56012099006|10067099003|5023799004|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info:
	c6x9MWu5lQbLL+YHn7lIXK1pJf7VVt7jupecD6RAIa3QJetkDSHZei18sKrHOSuaP2C9+Jr9vxffDR/Hr5eTXElJ+kOZD3DWvqe96wdOZk9LNSw5UgJmzYsCdKaRzHo3v90ebV21Q/pwmznLUbAjmR8ZE32zcZnYYZj+94PteG/K+KCDR/7szByklgw+RgUZeFcKEQA1sQT4hTo5u/q4k9RJqT/68hNgH9aupMDLRX/XPNsZZBbrfMthbT2WsPfIsEYHYTLbLUAU7KWB/7ebtil46Ii1nyhzEsTwxWP+K1QBSDCqHB9wZAWQ6VBYdBaMVYoyW+KjXrvetAkBUuGQjQO6CWUmObm6laWInInB1VivD3WrCw0UhGSqi3eV4fDaqqdz+QQ+PNdgK8etJmt91oTxVQYpQ9pWTyBRKe85sl6PwrzMPw1lX4pmuizEkvPmVIfK2giAlXQUPWNMODiEOaHB4a9/6ellwo650Qdb7x9oSFpVyvI/Q2W7Nimj/wdOsbD3FlTSs3HCh/s0gUNioBfyUCWf2N3OImT9sEpsPw2RdBuPSjP2GrQeoX37L4ACIYQtaUhdnvute1FL5fuulqWrDxA/j3oCbnrmYGSNpFeE0fzug3s9N76J8y5YV+0DtsOyT26L1UtezlVyFDwnnv4NJMTBPh9uWjbmX9cYZ5s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PPF1B62FD55C.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(22082099003)(18002099003)(56012099006)(10067099003)(5023799004)(4143699003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TUx1akJ5b0dsN3g5cmZkVUtHRnpNUEgxQnF0UUVxSlA2N1oyTVordW1wQ3Ba?=
 =?utf-8?B?bVZIMkJpak1RMlV1eS9XRmJDWEVoN3NRc1hlYU5td3VpZ25OeWVzOVJUWk03?=
 =?utf-8?B?V1R0OXVNT1NrT1BibGNNZENtbFE0NjMzZnZmcWRmUEMvWjBaUEhtdFNULzVW?=
 =?utf-8?B?VGZOSEkxREN0RUhiVlhOd0NRRVZZdHdyTjNuaStHSFJkVkFrV2RyVWZPbS9T?=
 =?utf-8?B?Sk10a3JQa3llNTgzUnRRd2FlL2VwelpBL2hjWGhwZGFsakh3WDBDUHNGS2FW?=
 =?utf-8?B?NGUvcUNBTmJHWkE2OGdzZm1ZTUFrdEhVOHR0b0d4Kys5MkJzYTQySnVJM3N3?=
 =?utf-8?B?dWN2NlE4UFVSSVFtWS9BSytCTVdqT3M2MlpONVcxL2JnbUZIS2ZiZ05ab09i?=
 =?utf-8?B?ODQ5ZG9rM0dMTUllaHUrZ3JMekZYMGFvSlMxYW12R3ZUalJHR2NIRXpXUFky?=
 =?utf-8?B?ZTFZcGh2dnNBOFRJNlQ1WnkwRHphQ1R6L0RHUU1EZE9zT2F0Wk9QSXc5czg2?=
 =?utf-8?B?bTVEbGNkNFgvYWJiWUgvdTMwZGRDTUphWmQwQnhvN0dFY2hnUE9BVU9XZ2VW?=
 =?utf-8?B?NDc4VWJnV1UxQUdlRXNsUFhTRWhMdEt2Y21jemZBdzRDRGt6bXVpYWgwSVFr?=
 =?utf-8?B?Yk9tZW9wSkhCRkdGNXBlcGlSR1MwVHRaZG5PNG9BTGpuSERveWF6UHVncmJl?=
 =?utf-8?B?MG4vUlBoWWhzbmhXbHU1WjR5aTZ2Qlc1VUN6YmZLVUxnTExTVm03akUvRkFh?=
 =?utf-8?B?M0UvdnRZTnRyZGIxVUxRMVgza0pWWWlPVENHUGNWVXZqQmgvd2hOcTJ0Tjlj?=
 =?utf-8?B?ZG9BSURER0UrVzR2eENTUDU2ZXNtck12bEFhZStGempadXM4U1ZEaW5wWndo?=
 =?utf-8?B?N1dZTG8xQkVyU05mQVg5eHhLUERFTTNab1lBeEd5L3pjNjBMS1AyUnl4MGZQ?=
 =?utf-8?B?RnFBaUVuUGxESzFNNkdmSWFKSmtXZW91c1FwdUVFRVIxWVMwVzZWQ3E0S3Bt?=
 =?utf-8?B?NDNqMkorVFJPb1QwU3RDSHhXNGloTFlQSUpIb3Avcm9memVkQjBUSHZ1VVZD?=
 =?utf-8?B?cjdoNm9kY1lOYTVYSWV1aUMwVGY4MTliTkRmTytSVTMxU0tKZElmQW5oVjlG?=
 =?utf-8?B?WnNocGN5MytxWlJXVTRtb3g4TFEyZlc2d3lwMy82M013cTdYUWZZd054akVL?=
 =?utf-8?B?NmRiSElWaC9nVkpKVHVNa1FydlorYkFOR2lMaytqOWRDZThKUmZpMTY4YVQ0?=
 =?utf-8?B?Sk1TRXZZT1hHZ2hWTE4zbmY5U3ppYTkrQkxUYmp0VCswWFNBRXNzWE5EQWIr?=
 =?utf-8?B?VkZ4Q0pBbjQyb3ZIamQ0YksyQm4zalpaeUd6c0RmNDR6ZEdQKzJmRUJSdUtw?=
 =?utf-8?B?R21JQmNZN09LcnNHb1I0RzZsdTA1S0dkS3Brbm9xMnNiSFlBaTZ0dkI2QWts?=
 =?utf-8?B?NnFHVFlkZm1OS1dPR2ljSDR0Y2VNOENSdEFsbWRJM3dDVlFjdk44OGo4Tkl6?=
 =?utf-8?B?RlhwVU5BZklFY2NZSGZGbWdGSTVRaWdJUVMxeWRBY1RmdGoycGRCMXJ3NVUy?=
 =?utf-8?B?d0d1VUoza0ROSWhERWMzMVFFd293SnNRaDFsWlppTUpUNU8xS3ZGeTNHMzlX?=
 =?utf-8?B?Wjh2RGRjb1dWaXpleWR1NUtUUUs0N29OMUYvcHVlS0JGRUZ2ZnVIYzNXUG5D?=
 =?utf-8?B?Y2N5RTBvZXg3Q0Frd2RhcTd6bTNiM2lPUldvNWdsOW45VEF4LzR3ckJjY1Ny?=
 =?utf-8?B?U0pNOUtyMGgrR3VSUTl3c1ZrbmRGYm5aNk0vZCtTZ1BsRXVJTUNXRUc3Rys3?=
 =?utf-8?B?NDkrMlVmdHZDQUx0alI4UkhqQlh4VkMreGZsc2lkeUM5RTQ0c24xQTdTdUpX?=
 =?utf-8?B?elZkSlVmdmVRbTd1OU5GTyt5dklxU1ByZ2hMTkhXaVJ4RGRHK1AvYWdHUGJq?=
 =?utf-8?B?MXlPWm4wUUN5UnRPeVJ3ZHphUWwwNVE2SFVzQ1pHT3dmdDJMK0kvbGtGMGRU?=
 =?utf-8?B?NjNjMmdsM3EwVnhmY0UzWU5wbTFIZGluNEs2Q0w1QWN0cWFONzFIWlRFVlNF?=
 =?utf-8?B?REMzSHVXb0Y0TUNvUHBtL0F3UEVoQkhQVlRXY3JNTVdBb0gyb2U4RjFOQncw?=
 =?utf-8?B?emxqckxjUkJjY2Z1bHRZNnN4RFdpSTlPTjdkRzZwaG1SQ1Y3NVBYQXlmdVZL?=
 =?utf-8?B?VFkzb1dUVkpyQ3lKQk9jV2ZySkFXNnRnSzFXSXh3bUNuNjlOTUY2b0xEOTNB?=
 =?utf-8?B?RUVDUE1XaklhbEsrUUJIcjd6SkdGQU9hNG9XMlYycGZUaFdGcTZkR1NXRnRL?=
 =?utf-8?B?N1BvMTVjS0laVkZLMnpmREpyNXd5VVJKbWJhd0lDSUZlYnNNay9zUT09?=
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36dbb7d9-da29-432b-7335-08deff460f4a
X-MS-Exchange-CrossTenant-AuthSource: BL1PPF1B62FD55C.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 05:35:50.7652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XOejYjhwYzJXcp9JPJxKgZHtT5R7Pw9WjRbL+KaaeU2ql268kuCkEVmLffl/d1w//GWlvyLomrLp62Ck8xjEoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFC4D2A1900

On 8/18/2026 11:44 AM, sashiko-bot@kernel.org wrote:
> 
> 
>> +     for (offset = 0; offset + sizeof(u32) <= msg_len;
>> +          offset += sizeof(u32))
>> +             writel(get_unaligned_le32(buf + offset), priv->mbox_reg);
> 
> [Severity: Medium]
> Since this loop writes bulk data to a FIFO, should it use the stream I/O
> accessor writesl() instead of writel()?
> 
> The io-accessors subsystem guidelines mandate using stream accessors for
> FIFOs to avoid unnecessary per-word memory barriers and redundant endianness
> conversions.
> 

The current per-word get_unaligned_le32()/writel() accesses are
intentional.
The mailbox message format is little-endian, and the buffer is not
guaranteed to be naturally aligned. The stream accessors are raw
transfers and do not provide the same explicit unaligned
little-endian handling, so replacing the current accesses
with writesl() is not a direct substitution.

I'll take another look at whether the stream accessors can be used
without changing those semantics before v3.

>> +     if (csr & AXIADO_MBOX_CSR_EMPTY)
>> +             return IRQ_NONE;
> 
> [Severity: High]
> If the interrupt was asserted solely due to a hardware error (like an
> underflow), axiado_mbox_clear_fifo_errors() successfully clears the condition.
> If the FIFO is empty afterwards, this check returns IRQ_NONE.
> 
> Does this risk permanently disabling the IRQ line? Returning IRQ_NONE after
> successfully servicing a hardware event can trigger the core spurious
> interrupt detector.
> 


Good point. Whether this case can occur depends on whether the FIFO
overflow/underflow status can itself assert the RX interrupt, rather
than the interrupt being driven only by the FIFO not-empty condition.

I'll verify the hardware interrupt semantics and adjust the return
handling in v3 if an error condition can independently cause the
interrupt.

>> +     if (remaining) {
>> +             ret = readl_poll_timeout(priv->csr_reg, csr,
>> +                                      (csr & AXIADO_MBOX_CSR_ERRORS) ||
>> +                                       FIELD_GET(AXIADO_MBOX_CSR_LEVEL, csr) >=
>> +                                       remaining,
> 
> [Severity: High]
> The poll condition succeeds if AXIADO_MBOX_CSR_ERRORS is set, terminating
> early without verifying the FIFO actually reached the required level.
> 
> If the loop exits early due to an error rather than the level check, the code
> continues to the for-loop below and blindly reads remaining words from the
> FIFO. Will this cause hardware underflows and pass garbage data to the
> mailbox client?
> 

Agreed. If the poll exits because AXIADO_MBOX_CSR_ERRORS is set before
the FIFO reaches the required level, the subsequent read loop can
proceed with an incomplete message.

The current code does not distinguish between "the remaining data
arrived" and "an error was observed while the data was still
incomplete". I'll fix this in v3 so that the read loop is entered
only after the required FIFO level has actually been reached, and
re-test the RX path.

>> +             word = readl(priv->mbox_reg);
> 
> [Severity: Medium]
> Similar to the TX path, does this bulk FIFO read need to use readsl() instead
> of readl() to avoid the per-word memory barriers and endianness swaps?
> 

Same consideration as for the TX path above. The current
readl()/put_unaligned_le32() sequence explicitly handles the
little-endian message format and a destination buffer that may not
be naturally aligned, so readsl() is not a direct replacement.
I'll include this in the stream-accessor review for v3.

>> +             put_unaligned_le32(word, buf + i * sizeof(u32));
>> +     }
>> +
>> +     axiado_mbox_clear_fifo_errors(priv);
>> +
>> +     if (READ_ONCE(priv->active))
>> +             mbox_chan_received_data(chan, priv->rx_buffer);
> 
> [Severity: High]
> Can mbox_free_channel() nullify the channel client pointer while this thread
> is preempted?
> 
> If a mailbox client frees the channel, mbox_free_channel() clears chan->cl
> under a lock, releases the lock, and calls axiado_mbox_shutdown(). If this
> threaded IRQ handler evaluates READ_ONCE(priv->active) as true just before
> being preempted, the shutdown routine will block in disable_irq().
> 
> When this handler resumes, will mbox_chan_received_data() dereference a NULL
> chan->cl pointer?
> 

I don't think this race applies here. mbox_free_channel() invokes the
controller's ->shutdown() before chan->cl is cleared, rather than
clearing chan->cl first.

axiado_mbox_shutdown() calls disable_irq(), which waits for any
in-flight interrupt handler, including the threaded handler, to
complete. Therefore, any concurrently running axiado_rx_thread() has
completed by the time shutdown returns, before chan->cl can be cleared.

Based on this ordering, I don't see a path where chan->cl can become
NULL while axiado_rx_thread() is still running.

Thanks,
Swark
