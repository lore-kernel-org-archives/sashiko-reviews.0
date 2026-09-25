Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C78737FF70
	for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 15:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790349351; cv=none; b=nAyR9YYQhmvMEuc+EJN14Fa0LUAaVljSKWF+I0pE2H1+Vk1uZwgpLDNHlMj1e4V35Wx3wIUaLcFhoSTGe0ptyddVERP06y2WVGrKF3RZUw1/uSIrnv6x+sPWNRypxjZXjZRoFlNex/mAJTCTmV/hAn3VktoX1Vb023ZHxjGDxWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790349351; c=relaxed/simple;
	bh=VjskW2CVk9l5hp0F2usSDqUNFGNQnoo2P9nCFonM/vI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kFb02I55qz9c56jNr3KFaQH2vM4kN9iS89HRZyuR4I2PmST+mKL9BfGlA6+aSRgFfxz6pidwPvBvnNXcYYozkIoMNMtGmVjiuuaZSUwD/PSGNtigIny/jfsxR7UyI5IjW8/AxEQOuT9TwkbuWX3tE/tg7CpiBJ+Na/JnGs3gTIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M6RoAEn1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FHQSjZ1k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M6RoAEn1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FHQSjZ1k"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PDBICG3532401
	for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 15:15:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0yvhpRtuRtZgzKPGSPCN5eaFbXftzDfoZHnEo8WAUDg=; b=M6RoAEn1vjyrMrIT
	o+4LNw1Jt6J9mgBNi7i5J2wpJrakIvicRASNvkL4elhiAGmv+euDFBeoh9YCZicg
	MMsHODShoV1S+1a0n5o7ku8yRB+TObLa2gY7hUT1qWT2rVoD1PCLfk8vh/7Y6bBB
	xIh/tSPi5V6HH2pZUP0Ev+ZvE+tCLGI0wTcjifNTEvh2UE5q/5Kg5gysfsaq9+OI
	uQbbev5YtZh9JSouW/IDugYEne8vLf2Nygp3FSdqy/2bHAW6pyZbjmTzlcmzOolk
	YsBOfexvCo/bZgzko2BzEaFLfLmMc68il8B1YQuAECfE0hyhWhI69vpAAMnKnUvk
	eGNqmA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw94kbrvj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 15:15:41 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7909e307799so913147137.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 08:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790349340; x=1790954140; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0yvhpRtuRtZgzKPGSPCN5eaFbXftzDfoZHnEo8WAUDg=;
        b=FHQSjZ1kr4EXCTgnMOa4tt5k3i39Csld+BNUsbTmxzEKv99WpsmBZ7cte91tJBvuuu
         FY7DX6YsgvQMCL19MfGRxH/9x7Skj4kk/zobOgFRmyqqVN68YTERYIjzZLZDVTP8C8V9
         U1Wjq7CVgT9s5Xa2Jmc2qKNJX+X9YMjTfeutr47H5iYQDJlhOMRzHQ6ZTcOeDNXZSjNl
         ZOt+m7+7ytxGU/GPfech01ueuciEp2wtez4MkeelYUkq9oSkYvvg9zSzqRU4vlSJb8Th
         aScuW0+C3QVTYkNABFPngz2S/okiWiJkWcgcu8sb6kxBnJe/XlaAKh4ZaJpIGQ/PfY94
         Hb4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790349340; x=1790954140;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0yvhpRtuRtZgzKPGSPCN5eaFbXftzDfoZHnEo8WAUDg=;
        b=ifSBsg3Lc24C4Nko44L5En+G7dgNgCTslFv3HNRG/FNa4IcnaGHNDD9pInLNdow2Jp
         XKQwcmm2uUwwMMYhIwJEvrG9Pqxiivg7YpkfxbpP9pdqRyczCAnrjeXrTuaUoIb+jfPO
         v8b9ajqxPEX8ZedG4tWAMM5UpS4T3+EOgMBFJTv7TVJkU0zuEtU0Rt6YxPGcqj05KGb2
         zN5xVUmW2rfug1LAMI2pci0uzqprlMnhNHO1aAQhHKWH69zxMmRaCiY9jUw2Gf3XdQkU
         qL3xejchqZmkRaawGvxG0YClN+ueyAbjDnNYfNCpDYhYMzAGJNYCNOIZmeGKf/7/3Jsg
         EMOA==
X-Gm-Message-State: AFuF++lBfDI9c4f4WHwuuaYvsAt68Qo/Tw33LD2x4DQsThx3dgwCgC6T
	KtCNHKJ6rt2BwPF3n9xGdEVcgKNLW7h+ift69RJFECAKfqHWFOCOHg644a833jQ65dJcTz8H3FA
	r+xw04dx11AdfM9V74riIOaUz6/zTeOFjS6rPIEqBhwhkPeKNuIbtMmv39JFPmPc4yMUnNrzY1S
	jK+Jg=
X-Gm-Gg: AYBFou1NuDjosYNEpCj/Ug/fropBkur6N9yPmI5Affr4i0gtTKpS1kcxzTN+nwJ0JuU
	+GeiyBtrjC6MAlvmsiuqIv+O4qQfQYo3VEjhobgoitks0MT/dRoNHh+rYlwcpqaXnYfAhA9G1H2
	8MWGoTlzi+/y3Am2hshTFpxDZwmrlq35j5CBurFgAWlwpv8P86DimROgC3TDYiWleyyFrunzclS
	ncteP4filpcvTPQBgGGCe7WdJ+mNo7nU7x06Fif5UCmCa05y2SJ9bjceTPG2Io6bNCfQ75O42uW
	8fS+L+2KReahGQxTKYYe7qx9XXtOWOIA64A2t8BNJWbFPdtW9iWH5QKPQiAGH70RGQH5pZFNtLT
	MMptCb4lEA9lpm4p9uyrcUf1xGw==
X-Received: by 2002:a05:6102:3f46:b0:7a7:19aa:8a89 with SMTP id ada2fe7eead31-7af1f2fdbe0mr2665093137.36.1790349340158;
        Fri, 25 Sep 2026 08:15:40 -0700 (PDT)
X-Received: by 2002:a05:6102:3f46:b0:7a7:19aa:8a89 with SMTP id ada2fe7eead31-7af1f2fdbe0mr2665084137.36.1790349339673;
        Fri, 25 Sep 2026 08:15:39 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49ff06bdef2sm67393105e9.11.2026.09.25.08.15.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 08:15:38 -0700 (PDT)
Message-ID: <3d9d648a-26e0-4509-bedf-f3a75ba2bd9f@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 16:15:38 +0100
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/8] ASoC: SDCA: allow building without ACPI
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260918131914.681588-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260918131914.681588-2-srinivas.kandagatla@oss.qualcomm.com>
 <20260918134219.F23A61F000FF@smtp.kernel.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260918134219.F23A61F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aaj0Dhot c=1 sm=1 tr=0 ts=6ab6901d cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=q6XjiywgsVnUag6QICEA:9 a=QEXdDO2ut3YA:10
 a=O8hF6Hzn-FEA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: 5UB4YCGPQ53jJLLoxUzy0HYTAkZkiF22
X-Proofpoint-ORIG-GUID: 5UB4YCGPQ53jJLLoxUzy0HYTAkZkiF22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MCBTYWx0ZWRfX50NaCfXlJbpu
 r+bpRP6WrGYUPNIvokQHEazwe4YIpINUL8TCFEB4pMzu+mW577sKSI9GUKCRPOpZZkSXWD37l8c
 0LTr/37QH03TtbJVW37Wfrc6seS0eWKc5GBtZ2DH9qpw54Lt+So8Fst4XvLW1ckwYptaokDKyPv
 sVrb2iMKkukb8Ia137YJb1SpEPgRRZOje9FriW842HQ5xiKfgjsfvCa82jXQEqdqF0Fb+AFsaPN
 i2uyQBJAX6CPICvBvZPZ/ljkXM/Kylyt2762tzSVm6r0lquvpvgjwp2kYd4AihmNSKFLsHLvFwJ
 gwiW6EKDjqjUacu9c5p9Fga5CyAjMqQY5ysAtSdpMkkAdMiieXt6Wo8PIDO4j/6fVgMzlqbZ3L9
 wcEiEzq6b78WREtx82YzoivIsdOdT0UVYnMWJ16bKSFAlL726qDdgs7gvTvJA5H+e4BqJB7s68l
 4dn6fSi4fG2wdeASNJA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MCBTYWx0ZWRfX3liNqavTKMYm
 emOeZpa/RccoMihV4X60m6KMttxsY1hy8qya9b+X1O1lmEBIvLaYs0phUHevy0t5Fz0M42m3jzh
 cmQYpF2FTaPYBBLSnaEs/RwfID39bXM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0
 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250060

On 9/18/26 2:42 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] ASoC: SDCA: ACPI parser is unconditionally built on non-ACPI platforms

This is fixed now.
> --
> 
> commit b342382e9b5b09b26bd417be9cd5ee4c2d90de61
> Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> ASoC: SDCA: allow building without ACPI
> 
> This commit drops the ACPI dependency from SND_SOC_SDCA to allow the SDCA
> class driver to be built on non-ACPI platforms. It wraps ACPI-parsing
> implementations in sdca_device.c and sdca_functions.c with
> IS_ENABLED(CONFIG_ACPI) and provides empty stubs when ACPI is off.
> 
>> diff --git a/sound/soc/sdca/Kconfig b/sound/soc/sdca/Kconfig
>> index 4c0dcb9ff3b94..72c02943c49ed 100644
>> --- a/sound/soc/sdca/Kconfig
>> +++ b/sound/soc/sdca/Kconfig
>> @@ -3,11 +3,13 @@ menu "SoundWire (SDCA)"
>>  
>>  config SND_SOC_SDCA
>>  	tristate "SDCA core support"
>> -	depends on ACPI
>>  	select AUXILIARY_BUS
>>  	help
>>  	  This option enables support for the MIPI SoundWire Device
>> -	  Class for Audio (SDCA).
>> +	  Class for Audio (SDCA).  The ACPI/DisCo topology parser is
>> +	  only built when CONFIG_ACPI is enabled; on non-ACPI platforms
>> +	  (e.g. ARM/DT) codec drivers supply the SDCA function data
>> +	  via sdca_class_hw_ops.populate_function.
> 
> [Severity: Medium]
> Is this Kconfig help text accurate for SND_SOC_SDCA?



> 
> The text claims the ACPI/DisCo topology parser is only built when CONFIG_ACPI
> is enabled. However, the CONFIG_ACPI guard in sdca_functions.c is closed
> early. When building the kernel with CONFIG_SND_SOC_SDCA=y and CONFIG_ACPI=n,
> the rest of the file's DisCo parsing logic is unconditionally compiled.
> 
> Note that the related probe failure where sdca_parse_function() was
> unconditionally called on non-ACPI platforms is resolved in Patch 4 of this
> series, but the dead code and Kconfig discrepancy remains unfixed here.
> 
> [ ... ]
> 
>> diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
>> index f39008ac0e7d3..1eb6418e132dc 100644
>> --- a/sound/soc/sdca/sdca_functions.c
>> +++ b/sound/soc/sdca/sdca_functions.c
>> @@ -25,6 +25,7 @@
>>   */
>>  #define SDCA_PROPERTY_LENGTH 64
>>  
>> +#if IS_ENABLED(CONFIG_ACPI)
>>  static int patch_sdca_function_type(u32 interface_revision, u32 *function_type)
>>  {
>>  	/*
>> @@ -201,6 +202,7 @@ void sdca_lookup_functions(struct sdw_slave *slave)
>>  	acpi_dev_for_each_child(adev, find_sdca_function, &slave->sdca_data);
>>  }
>>  EXPORT_SYMBOL_NS(sdca_lookup_functions, "SND_SOC_SDCA");
>> +#endif
> 
> [Severity: Medium]
> Does this #endif prematurely close the CONFIG_ACPI guard?
> 
> By closing the guard here after sdca_lookup_functions(), the remaining
> topology parser logic in this file, including the entry point
> sdca_parse_function() and its helpers, remains unconditionally compiled
> on non-ACPI builds.
> 
>>  
>>  struct raw_init_write {
>>  	__le32 addr;
> 

