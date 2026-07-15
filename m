Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594224418DC
	for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 12:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784118099; cv=none; b=ZpCdcILJPShznwfihP/SHX/Z6oxRx+hjTXO+MxkZbDBzYt+GWwv4P9f1/p8PausvvOHU8Tlgc+dE7UnskWLzwJNSJgf6jqsnhUqQ98cHu3Qp73WUUfDCbH9Vmb0oSr6GChpOyaS7/vk3TWhhXYOa/90adeZRVoKXocFucfCs5P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784118099; c=relaxed/simple;
	bh=0zuX5DJNZKHp/nca1largxbOdKJ+mhgJHK9PZiNSHG4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fH0NzcIWWJEPg35xVK4ypKyMRtwfsetwXsFW8ze8kfYPk/qzAplvg3LcLTjctSV6yxV83Ccuz27/H2vE5WGDOWXYLf489PIGsrxReN+izy+r1/61cU/mTCvPLATfu7mfDVdG7+0DyzxYKks+KQjrQ6byMEu4KDXGgjttjGmPHdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hl5TGG4P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bIWckHBU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hl5TGG4P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bIWckHBU"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBcod33479772
	for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 12:21:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r99kkd6fP/ic3KdRsaZChhsJWWU2ou3THrOWDdyMrlM=; b=hl5TGG4PZhUlgo7Z
	HT3WPYFf0997UP2SUZrwH/9wuu16nZ9nqptthTRfv6KYjxhrrQwkvhl1PEp3mVQF
	mY1mwrkFf6TQGHFABos1FUTDFjJPv4Y076jIzt5IXn4O28dHyV9M/IEcnMacsTCT
	uZx9yIeRzlENlsW2pmfmgEoQji5mx4YPeT98aBMPctOIBX4QfSDw4m1H6eaJKFXB
	/j4Q+QBPRpqNRsPG5DVFQBHc5N7rpXAxaSw+26Fjgace7c8WuLAOe+p1dB4QFugO
	y92Lt1yGczVFcE89Gbrqemi46o63LSpNyjwPgSiuOdvjeH6Uqf3M+BFM+A5nqL6o
	1rdalg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fds9g3kah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 12:21:37 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dbf293831so4641934a91.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 05:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784118096; x=1784722896; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r99kkd6fP/ic3KdRsaZChhsJWWU2ou3THrOWDdyMrlM=;
        b=bIWckHBUTp9NsNs3m5RTFhrS/n/Jqyl7VdhXBwBEdyf8lpIbcTilYJJabCyycyGE0p
         njRmgkfEB3q9DEz0Rfdiixv1JVm+HUpsltQ+snTygAjNf8FiwiGPMCVirhMQOqMuCJwe
         f36JqSCFMb/8AGyIfE4noJHwF3KYf2gZgUUS5rbAhbUBh2wpcTkGaV2jswTJWiymHz0z
         yoKos/veyVTzt/QgyNB5jyij1a9CyEesG6rsMoxlabaq+v0AYyQ2hB+ncLeeqsrR728B
         JwLY6UbSKH6i04jYAhmxw4OmLEvlx+kC+kAZG1LNonpKg9t8Zj9ZgikqXXnyv909+JdB
         zTbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784118096; x=1784722896;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r99kkd6fP/ic3KdRsaZChhsJWWU2ou3THrOWDdyMrlM=;
        b=TzlKcFbybKOudaDwX5TBanySJoVImxdCfgL25obWx6y+aa3IIX/z3lwNi3MhEQ03yS
         Xybwzhs/0m2nG45tHphCarTq1V7NRwUCdESnaooEYLq/VzhwJwj3kDI1Tf2C4Kk/RKTW
         vo/MyV2bOZBoQblSBv1yjTz9xB+ylpNK47JEY7G6L2lx41XY0hU/3LMe3jq6I4rPsO4r
         jZm/JN07teG8hryrlVSh8pCLua8liS238C0cqBpKTAS/vSrdW1m3owJ81Einfq984xCR
         2114dqy0yG8IpTs0kof/R8jwcXbRKaRziTFbeUr162PlLQu0Za/YUBsXeBjkux4XgOiI
         GopQ==
X-Gm-Message-State: AOJu0YwnzyaEfrTUUoTktkumwSkqjM/WnBjquUlLpKvejw4CuWwNMTCK
	ooz4SZaIyJKukX9q67P+1EiGmq5SSzLfRndw/XgEtc6QlVkof55ZbuaAYm3qyaHZkif/NNOtywW
	j7f4179EdI0lPQ8XgPCspNFmxX7Ex8Wtnd6J+5ZT8tZHw/1BzPW3uHzCB6jsQ75pqeSXkV/4zwX
	zcqZI=
X-Gm-Gg: AfdE7cn4LA0uQ46ARuUumfh7z9T/Jz4EsZioNlDztyuv+UCa1Jut5/ifteVOC0xuy22
	nc4TYdLVfJ25FK8r68V17UJWC+FdbIgol3Xk0x5iuX6o7YjNIjLUTiW8zOCOR2+aecuuDMMmLUd
	LjLitlFf95BBVbxpm1MpdtKMU1EdO4+tDSpz0uPNQ6TXmI2SplbrRkf+gPBshs5DJiOgkF02JFc
	wu13eEfWucKGw0Bl7fJm/Dh0pgdjgT/ZNjy0XEqtgixU6ISp006FNklz6v0nBTj5cjSNV9+tSav
	d0ARkW9VkKBtFIS2HLGVzXBzgEy2R/L7CtIjqaHfZKlft5JjmwfzqfcYICE0tuyG3G56EkYDXUD
	F24A5q+eW1kq5gfJr3w3MFS6gtf5DAts/5ic+6Q4VXyaLLg==
X-Received: by 2002:a05:6a20:3d0c:b0:3c0:9c1b:d0bf with SMTP id adf61e73a8af0-3c110a50703mr19971630637.74.1784118096153;
        Wed, 15 Jul 2026 05:21:36 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d0c:b0:3c0:9c1b:d0bf with SMTP id adf61e73a8af0-3c110a50703mr19971605637.74.1784118095674;
        Wed, 15 Jul 2026 05:21:35 -0700 (PDT)
Received: from [10.219.57.229] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e6a5174sm1122535eec.15.2026.07.15.05.21.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 05:21:35 -0700 (PDT)
Message-ID: <a0450bcb-330e-4842-a9a6-1dc5fd83617f@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 17:51:31 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 07/13] power: reset: Add psci-reboot-mode driver
To: sashiko-reviews@lists.linux.dev
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org,
        conor+dt@kernel.org, lee@kernel.org
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
 <20260714-arm-psci-system_reset2-vendor-reboots-v23-7-e7453c548c21@oss.qualcomm.com>
 <20260714173038.50B121F00A3A@smtp.kernel.org>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <20260714173038.50B121F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEyMiBTYWx0ZWRfX+ueWnVuLkor3
 M7LUiW+RLoBVRK8k3d1IoukGWkPLPMC08NCrpipfXXYceJEEYNVXGPjwHEYGBfz1ymcfkSjE9Tr
 rqainO3S/duBig20UrsHgNL1RpN9X24=
X-Proofpoint-ORIG-GUID: rvdJ0UBsWjxajJCJqmpasx_peMo4ZF5S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEyMiBTYWx0ZWRfXxE45++YejjEF
 gq1VvcsRfJAcTflyXMdBau5FhJqwhpC2SJZrECj3eZY9pkL5yXQSDSCKlczNMw0e83wJSZbg9u1
 n2VrvI0X8en8MOkb1ZRSDopmmiZY9cpVfvuGQO4dRSi1TBRjzfsvlRYgdFoLOglAme3XTKQzEtO
 CGtE+jOdJ9lGeYgzktWw1/J6giDD5Oa6EE18GoiHz8+6UrBQ1wBfJS+LfCoU5cqgKKcJncoI+Hv
 Mb5gOE4nGbco5JHUZ0Nkh1OxorbMESlhZW1jY0uNgwXv5SM4oXbq4pHi8GJeQhMDwVGsad6Vvc9
 pgUlrC6nOHmnuaRFSyHsSG4tNvFxaOuaMMs3hV6H2Qb+sx78xGaBJuV8x3zTYgqwRSZbieNaiTF
 7EoFIMatFVAHISvxqw8U/kq5bbzii4qzNZockiAhPn+tkZ7JYy6ykO2JjAD4xNnDUOs66AroHVc
 DFtYpsWAsGDKEigghFQ==
X-Proofpoint-GUID: rvdJ0UBsWjxajJCJqmpasx_peMo4ZF5S
X-Authority-Analysis: v=2.4 cv=VoATxe2n c=1 sm=1 tr=0 ts=6a577b51 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=c1Io3eFXDdE26PNcJJ8A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150122



On 14-07-2026 23:00, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] The `psci-reboot-mode` platform driver is completely unreachable dead code because it lacks an `of_match_table` and is never instantiated as a child device by the parent PSCI or MFD driver.
> - [High] Lockless read of `reset_cmd` in `psci_sys_reset()` can race with concurrent updates via `psci_set_reset_cmd()`.
> - [Medium] The `PSCI_REBOOT_MODE` config is set to `bool`, which forces the `REBOOT_MODE` framework to be built-in.
> --
> 
> --- Patch [7]: [PATCH v23 07/13] power: reset: Add psci-reboot-mode driver ---
> commit 05cd2956034a357b1e7d5eab96bdce4575604285
> Author: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> 
> power: reset: Add psci-reboot-mode driver
> 
> Add a psci-reboot-mode driver to handle different types of PSCI resets,
> including predefined and vendor-specific resets, at one place. It registers
> with the reboot-mode framework to interface these resets to userspace and
> passes arguments to the PSCI driver for command-based reset.
> 
>> diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
>> index 124afb99febe9..93e4029d95060 100644
>> --- a/drivers/power/reset/Kconfig
>> +++ b/drivers/power/reset/Kconfig
>> @@ -348,6 +348,16 @@ config NVMEM_REBOOT_MODE
>>   	  then the bootloader can read it and take different
>>   	  action according to the mode.
>>   
>> +config PSCI_REBOOT_MODE
>> +	bool "PSCI reboot mode driver"
>> +	depends on OF && (ARM_PSCI_FW || COMPILE_TEST)
>> +	select REBOOT_MODE
> 
> [Severity: Medium]
> Will this force the REBOOT_MODE framework to always be built-in?
> 
> Since PSCI_REBOOT_MODE is defined as a bool, selecting the REBOOT_MODE
> tristate will forcefully upgrade the entire reboot-mode framework to built-in
> (=y), which overrides user configurations that might prefer it as a module.
> 
> Also, since the driver source uses module_platform_driver and MODULE_LICENSE,
> it appears designed to be built as a module. Should this be a tristate instead?

kept it boot by design.

> 
>> +	help
>> +	  Say y here will enable PSCI reboot mode driver. This gets
>> +	  the PSCI reboot mode arguments and passes them to psci
>> +	  driver. psci driver uses these arguments for issuing
>> +	  device reset into different boot states.
>> +
>>   config POWER_MLXBF
>>   	tristate "Mellanox BlueField power handling driver"
>>   	depends on (GPIO_MLXBF2 || GPIO_MLXBF3) && ACPI
> 
> [ ... ]
> 
>> diff --git a/drivers/power/reset/psci-reboot-mode.c b/drivers/power/reset/psci-reboot-mode.c
>> new file mode 100644
>> index 0000000000000..955ed68f14026
>> --- /dev/null
>> +++ b/drivers/power/reset/psci-reboot-mode.c
> 
> [ ... ]
> 
>> +static int psci_reboot_mode_write(struct reboot_mode_driver *reboot,
>> +				  u32 *magic, int count)
>> +{
>> +	if (count < 1 || count > 3)
>> +		return -EINVAL;
>> +
>> +	return psci_set_reset_cmd(magic[0], psci_reboot_mode_get_cookie(magic, count));
> 
> [Severity: High]
> Can this call to psci_set_reset_cmd() race with the atomic restart handler?
> 
> Looking at drivers/firmware/psci/psci.c, psci_sys_reset() evaluates reset_cmd
> locklessly:
> 
> 	if ((reset_cmd.reset_type || reset_cmd.cookie) && !panic_in_progress())
> 		psci_handle_reset_cmd();
> 
> And psci_set_reset_cmd() protects writes using a mutex:
> 
> 	reset_cmd.reset_type = reset_type;
> 	reset_cmd.cookie = cookie;
> 
> If an atomic restart handler like psci_sys_reset() executes during a SysRq-B
> emergency restart and interrupts a CPU executing psci_set_reset_cmd(), it could
> observe a partially updated state.
> 
> Since the 64-bit cookie may be written via multiple instructions on 32-bit ARM,
> could this lead to torn reads and mismatched reset types, causing the system to
> hang during emergency restarts?

Will evaluate this.

> 
>> +}
> 
> [ ... ]
> 
>> +static struct platform_driver psci_reboot_mode_driver = {
>> +	.probe  = psci_reboot_mode_probe,
>> +	.driver = {
>> +		.name	= "psci-reboot-mode",
>> +	},
>> +};
> 
> [Severity: High]
> Is this platform driver able to probe?
> 
> The driver lacks an of_match_table and is not instantiated as a child device
> by any parent PSCI or MFD driver.
> 
> A platform driver without an of_match_table must be manually instantiated
> (e.g., via mfd_add_devices in an MFD parent like psci-mfd.c). However,
> psci_reboot_mode is not listed in psci_cells in drivers/mfd/psci-mfd.c, nor
> does any code call of_platform_populate() on the PSCI node.
> 
> Does this make the newly introduced psci-reboot-mode functionality unreachable
> dead code?

This driver probes via psci-mfd.

thanks,
Shivendra
