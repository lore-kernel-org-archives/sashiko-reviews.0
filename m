Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC806378825
	for <sashiko-reviews@lists.linux.dev>; Tue,  4 Aug 2026 14:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785854334; cv=none; b=CQHzv/AWFVYYzRw3x3kOXi/UPiJQBYP5I/6yGhQtTwgWPzCVRPZKV1zs5bjFHq0nVeVaS099kTyvjWLDpe2GZvuad1bCjbQXqSyVTzkCHyJgWQ7J4X+nwPHPYwCJeY/7uDJ11LfnIHga5j2p00qXStzR+lxjFzsE8gSGyxhalZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785854334; c=relaxed/simple;
	bh=hWvWfNDS/skBD4OhA9EL3ETyRxBDJj6DjHQUqTmubz8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QjE3uZx03ZdxWJyhg8+gp3xx3iIMlUgvI6q+jbogtODQWXekPllxvm0jfVd6Tj6vB1aaRxemfshdaLk6nteUmgJflQAHoE7bzZhSIyHKuYvJ59F6c/IMXrMhb7LYFL3AjfYgbi8+SgiI3/x6CJjNGDhPUJp194qSxyea132kZRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FXM6jYsw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BeXpB5qI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FXM6jYsw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BeXpB5qI"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674CWwKx3211649
	for <sashiko-reviews@lists.linux.dev>; Tue, 4 Aug 2026 14:38:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hS0/v3JdCBgQ6Dl/MnIrfek8ytOMgtXLA+5SqCkN07Q=; b=FXM6jYswYUTszJL2
	oTsjBa9jXqLET5yymYscfJHcvpbvj2vcJdodRrJ6nECTW6VFNpbuxYM9Do/TvuxF
	c7I+DWyaMIEel1m+Ow5M7ruy7aMIOIjhcqe24XyIg3eZQtfDukuV+R52Fu8qXXpE
	KtEuj9ttRfad2UGRpRGgqgqWm8zVvJ7JjeJxYierO75YzQnyUGWMf4u9DU58TJEx
	W8L6Bu71gLiPsoBEdcbwudnH1l+c8GywMKYr1xcUOTgVO//6laf0E5FwS4j7HWIo
	MQ04k0oVDb9RHfHVwDbOIlO+3fN4J4kCem9PmiX8TLw4/IUQUh4ZAVTHB+yAAnY2
	hCkf8w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fud23hc8q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 04 Aug 2026 14:38:51 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cab041eced3so7515733a12.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 04 Aug 2026 07:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785854330; x=1786459130; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hS0/v3JdCBgQ6Dl/MnIrfek8ytOMgtXLA+5SqCkN07Q=;
        b=BeXpB5qIgxgKqWYsMi6fQPuTPW2LiC8H2qhf/nY22U6yq/GYxuAYQ7iqqXKW7yPAd+
         up1OivdaJiirAenRfoGOgo5k0yggUY/HSrIABQsUadVD9WiFApZfr3oq3HUegQpWgkbh
         JpOn30S2vWavxKSV0dSojFLrGqHf/A2igKyT2v8erfO3yzDbb12WlPQAjsuXgFSWA4Gu
         2AmaflB2TsxM/2FfLjm3z5fRWLCu9BhkXzhVVI6SErktuOGAoGjziOPJGNzrF5nyFg/y
         eOmxT3zsige6XJEEmh6e0TRwR0FOtuhqY31/q0+VVQK1N9dLWj7+lZ1P/oWayJ2XuTzk
         SF4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785854330; x=1786459130;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hS0/v3JdCBgQ6Dl/MnIrfek8ytOMgtXLA+5SqCkN07Q=;
        b=EC8YU25E10CbISGYTBq6DRc8N6Af4+lxziUTXLnb2VtQwHVe52G/YnExIeFw57LWCY
         ySd1yxfkXq8JSac4pvJ8cZq7aHyN6BFfWqRtpcuvIrni+cGzPZFN9HIuITaC9SUTn1Jm
         5oued0QWnBZYTFp6nZU9fue9tzCf0iQ+cNgDCuIGpenuvim9bJ3oomNHqy9wJLOXu+cg
         +63GMbE0OXzLR0kvIOYpXIkwQelAB6bHBDRa2ZWeaMoTIABMBE+wuhpg2CFx3J1Ra2+P
         VDw3ysOjXEZXudtityBylBoM6vT+sjvZl2MMCIuQ5PVSK3y6FbqrpWn8ATwvdkZdJU4Z
         buOQ==
X-Gm-Message-State: AOJu0YzDOp7X5Tg2PGPDwT3Oa76acouMlkdJylqWfF6HFLlNzaZQrbaV
	WEoalekpsOR0kUBDyYuXr0oU2n7wLWUijWvjz8wjHto1Q2BKcYtz1kyrJS4Xt8VkE1WB4gtjyyQ
	DJz/EHkZ2c5DbrNXU79RDBIf0GKhvCZF+dER9BueaJHBtBR2iLnUf1D23AfHQqO75Fv92I1dJ7o
	wUSxM=
X-Gm-Gg: AR+sD10evWi1MU0d03efWg2fr/4qRhNSs6C400VxjnnrccRvdx2eNPHWnfzwp4hlqjI
	FYAYVIJLCNYcboAe8jDYcedHCH36wRJaZaJM28MGcXq3AcwdkFYkmIecjW6gNRFY2/yJjRIjpOb
	JpVvDHGTNAGaAEBxRi+v7oVIOPu5o+Uf0kCSShVOVMdtZDzQKWERMOe7YrG+pDPAeHBRADsoduo
	wBD5InTrl8BoHL0I7fjaqQ/T1P/FewdM3tiQ35vLL3PW6jcYd+TCwtUAl0KPkL6iA6pKF9F54OC
	Joo6RoItezn8y+s7wPtxkb+Ua5M2jVpS0U9SAWwFdPo0BMF7OvdDvgs5KMkhHJHZSTCyM3wEp13
	HgtMn4QnaPh7br+1OZ8Jv8JCdOxOQqtpakg==
X-Received: by 2002:a05:6a21:d84:b0:3bf:ba48:ca88 with SMTP id adf61e73a8af0-3c92a4c977amr15755969637.15.1785854330128;
        Tue, 04 Aug 2026 07:38:50 -0700 (PDT)
X-Received: by 2002:a05:6a21:d84:b0:3bf:ba48:ca88 with SMTP id adf61e73a8af0-3c92a4c977amr15755924637.15.1785854329680;
        Tue, 04 Aug 2026 07:38:49 -0700 (PDT)
Received: from [10.218.44.82] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca8df89asm8023135c88.9.2026.08.04.07.38.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 07:38:49 -0700 (PDT)
Message-ID: <6cce95d2-4f2e-4148-8a66-012c58dd30a0@oss.qualcomm.com>
Date: Tue, 4 Aug 2026 20:08:45 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 03/12] firmware: psci: Introduce command-based resets
To: sashiko-reviews@lists.linux.dev
Cc: mfd@lists.linux.dev, lee@kernel.org, robh@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
 <20260803-arm-psci-system_reset2-vendor-reboots-v24-3-889281373870@oss.qualcomm.com>
 <20260803100148.79AA61F00A3A@smtp.kernel.org>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <20260803100148.79AA61F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: cG-5ZSum5hvwycyO_jpIVlZoYANc3Nvc
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDExOCBTYWx0ZWRfX2UUoqH2uife2
 /dCwrcIcFFyPBvLBdhfA74DnV6qgwjld+pjJBrlD5k1HOpX31XfI2ZIH2/Ceg13VLIGwkmpryrz
 gpPrVHnTQL6W9F/8sA/nR/ou1UGxR8U=
X-Authority-Analysis: v=2.4 cv=XIkAjwhE c=1 sm=1 tr=0 ts=6a71f97b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=tPMdJ5WBxRjLo3QbcvwA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: cG-5ZSum5hvwycyO_jpIVlZoYANc3Nvc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDExOCBTYWx0ZWRfX40ipgHDPU3sf
 +shIFg6h1krzeQ054KTZ6DXIMfu5JB9Mi5RqxlSXGCcJ9wg1Y7MCtjh7TuFvwoNE6WqdGSRY3wu
 kz0NQYqNdu1/AdKesY9Wb6bSBPh/J1iFBGJPMl4iESjh6v114Mytay9JRCVIFLrip62903w9U03
 kxNnjbMrjoZXc5zFmCejqNshzhnWA9gF2BiAW07HL8pr1inlsgSd84zh6EABCrS5Zp3tJTIFpXO
 zvrf8rKh7Y03TM3KLMmkanx0fFwWjWiwpGhWll+xycCLhS2uEGyg6YSm6HXcJj1hAo6mAawamJ4
 xHGtltkchJhgG1JvoZ6morJE0FdclD7nsLQaBFSG+pbgFconwhZW+TDiXQSy6VBdtDbDwsHanuZ
 thsnd58vDLGsyRCLxT3vsmftSq5jkxXADmJNPgAUKNGisgOztndzzCtw5FLC8LejOf+EbL0S/R2
 9GyGh2hspqcrHVplBqQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040118



On 8/3/2026 3:31 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> - [High] Custom PSCI reset commands are completely ignored on standard normal reboots due to an incorrect NULL check on the restart command string (`data`).
> - [High] The 64-bit vendor reset `cookie` is silently truncated to 32 bits on 32-bit ARM architectures, violating the PSCI SMC32 calling convention.
> - [Medium] The `psci_set_reset_cmd` API cannot be used by modular drivers because it is not exported.
> - [Low] `psci_set_reset_cmd()` does not validate that a non-zero `reset_type` has the vendor-specific bit set.
> --

[snip..]

>> + *
>> + * For vendor-specific SYSTEM_RESET2 resets, @reset_type and @cookie
>> + * must contain platform-defined values.
>> + *
>> + * For standard resets, @reset_type must be 0 and @cookie must be a
>> + * value from enum psci_standard_resets.
>> + *
>> + * The reset command may be configured only once per boot cycle.
>> + */
>> +int psci_set_reset_cmd(u32 reset_type, u64 cookie)
>> +{
>> +	if (!reset_type && !cookie)
>> +		return -EINVAL;
> 
> [Severity: Low]
> Does this function need to validate that a non-zero reset_type has the
> vendor-specific bit (PSCI_1_1_RESET_TYPE_VENDOR_START) set?
> 
> If a caller erroneously passes a reset_type that is greater than 0 but
> lacks this bit, it is stored successfully but will be silently ignored
> during reboot in psci_handle_reset_cmd(). Rejecting it here with -EINVAL
> might prevent silent runtime failures.

Setting proper command is caller responsibility. In case a unsupported 
command is sent, it will be ignored in final reset.

> 
>> +
>> +	scoped_guard(mutex, &reset_cmd_mutex) {
>> +		if (reset_cmd)
>> +			return -EBUSY;
>> +
>> +		reset_cmd_data.reset_type = reset_type;
>> +		reset_cmd_data.cookie = cookie;
>> +		/*
>> +		 * Publish the command only after both fields are fully initialized.
>> +		 * Readers run from the atomic restart notifier path and must not block.
>> +		 */
>> +		smp_store_release(&reset_cmd, &reset_cmd_data);
>> +	}
>> +
>> +	return 0;
>> +}
> 
> [Severity: Medium]
> Is this missing an EXPORT_SYMBOL_GPL?
> 
> Reboot-mode drivers are often configured as loadable kernel modules (e.g.,
> CONFIG_REBOOT_MODE=m), and without an export, they will fail to link against
> this new API.

This call is expected to be called only by psci-reboot-mode for now.

> 
> [ ... ]
>> +static void psci_handle_reset_cmd(const struct psci_system_reset_cmd *cmd)
>> +{
>> +	u32 psci_sys_reset_fn;
>> +
>> +	/* PSCI_1_1_RESET_TYPE_VENDOR_START identifies vendor reset types. */
>> +	if ((cmd->reset_type & PSCI_1_1_RESET_TYPE_VENDOR_START) &&
>> +	    psci_system_reset2_supported) {
>> +		/* PSCI SYSTEM_RESET2 Vendor-specific reset */
>> +		invoke_psci_fn(PSCI_FN_NATIVE(1_1, SYSTEM_RESET2),
>> +			       cmd->reset_type, cmd->cookie, 0);
> 
> [Severity: High]
> Will this silently truncate the 64-bit cmd->cookie on 32-bit ARM
> architectures?
> 
> Because invoke_psci_fn() takes arguments of type unsigned long, the C
> compiler will cast the u64 cookie to 32 bits. Under the SMC32 calling
> convention for SYSTEM_RESET2, the secure monitor expects the 64-bit cookie
> passed across two 32-bit registers (r2 and r3).
> 
> Here, it seems r3 will receive 0 because it is passed as the fourth argument,
> corrupting the hardware communication for vendor-specific resets that rely on
> the upper 32 bits.

will review if this needs to be taken care.

> 
>> +	} else {
>> +		/* Retrieve the psci reset function from reset_cmd */
>> +		psci_sys_reset_fn = psci_get_sys_reset_fn(cmd);
>> +		if (!cmd->reset_type && psci_sys_reset_fn)
>> +			invoke_psci_fn(psci_sys_reset_fn, 0, 0, 0);
>> +	}
>> +}
> [ ... ]
>> +static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
>> +			  void *data)
>> +{
>> +	const struct psci_system_reset_cmd *cmd;
>> +
>> +	/* The function psci_handle_reboot_mode follows reboot_mode based
>> +	 * reset flow and psci_handle_reset_cmd uses reset_cmd based reset flow.
>> +	 *
>> +	 * The reset_cmd is configured at the reboot_notifier phase.
>> +	 * If panic() or emergency_restart() occurs between the reboot_notifier
>> +	 * and this final reset, skip command-based reset and let reboot_mode drive
>> +	 * the reset flow.
>> +	 *
>> +	 * The function psci_handle_reset_cmd invokes non-returning PSCI SYSTEM_RESET
>> +	 * calls to reset the device. If it returns, either the reset failed, or the
>> +	 * command was unsupported. Fallback to reboot_mode based reset flow.
>> +	 */
>> +	cmd = smp_load_acquire(&reset_cmd);
>> +	if (data && cmd && !panic_in_progress())
>> +		psci_handle_reset_cmd(cmd);
> 
> [Severity: High]
> Are custom reset commands completely ignored on standard normal reboots
> due to the "data &&" check?
> 
> A standard user-initiated reboot (e.g., executing the reboot command without
> arguments) invokes sys_reboot(LINUX_REBOOT_CMD_RESTART), which ultimately
> calls kernel_restart(NULL). This passes NULL down the notifier chain, resulting
> in data == NULL in psci_sys_reset().
> 
> Because of this check, the custom command path appears to be skipped entirely,
> forcing a fallback to the default behavior and defeating the purpose of
> setting a custom command for standard reboots.

Yes. If a custom command is set in reboot notifier and data is NULL 
psci_sys_reset, then we are either in panic or in a emergency_restart. 
In both cases, custom reboots are skipped.

thanks,
Shivendra
