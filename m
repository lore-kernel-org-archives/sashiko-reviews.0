Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C982F48E0F5
	for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 13:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789480450; cv=none; b=ApD7AkNJTQINC5I2ztJTqZ9HIUqv2QPwpdf0Qc9soeeziA5sOxSnqr9H7nzlc8Sq4c6280awOMFc2ced/I+6E0sth4HqQC+TSDQ4px3j0NSkPWaFaXevNhuHe1CcgkAgchYp5rEglh680wlKx37aENrCHC91KggHinAfG7yEmMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789480450; c=relaxed/simple;
	bh=IgGN+5+YmfJJcGSHBWqndzTYmB4KrkfLtNFAsLa+jZ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q3suAwPwQifIWRCUwhI/TVyK3S0cwK1mvaxFDlSFpdgC+ql4S1r+dwsbszFBldH9ADgqHWJdR0NAMOhLwtcJOWLkRJ1eAlZnda+ppNMgy2hdc1rLhq6G/2byrtUa0ynYcNvvIILdNwne7aDb1srFxD/qhCdTjD9E7JIkkg50jio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=okm4aCfP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bQHI1ice; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="okm4aCfP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bQHI1ice"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FD0V2G2528290
	for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 13:54:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JxQm3zX3lZmPGj0zAESC7DaQsGw/tmySviRI16wdemE=; b=okm4aCfPc0ZMdbOZ
	aO6UCpJ4muHIEjyrb5RdC+dV+6q/YEz2XtV8GKbzlRXERqeNjvWyEmJiR7utMlTS
	oj1kvcyWXBhCd4+/yMHOrqRS1CPbKOUTKeTgTsaOisKxACB2X6JE3tfaIOUfTSvL
	trU9ugZPC1T+BP0rjp7AJBtv1r98v1Ym8CbtgTgxuLYLL0oiH0GCmuwgDUlk6/a+
	+hyGWr7udanqXM+kZ2bHWXYkMq+0S1A3fwqS6g0GG7zjTsngFKKcqMOpv8z28QQJ
	+nvK/iFdgU34+KteGRftQP42SN2ddFubu3tnPRoSnQZIupV5OKoE5mwRIT4HlzbB
	fCdD0Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq1qp9xnp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 13:54:05 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2dd753a52bbso23966325ad.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 06:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789480445; x=1790085245; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JxQm3zX3lZmPGj0zAESC7DaQsGw/tmySviRI16wdemE=;
        b=bQHI1iceltGM4+iVRqQTfVMUX5n7jnL7qvpIbaRTIDOy7iXhlNjEv+l002JajJ9hsD
         WMb23Tuq08FeETH49P61xsppDsCAa7E/4pqz1p5czzGkO3+R9BLfXHD0PBHlQtCsTvO/
         6TQ0qHAo06EqSzyc2zzpKC9qKjBPuHNlYFmw+0YhsKwZXz4OTfJQPtC+zgvpu8DeJmjC
         vCj547Ijd5QdaeDIzF1FGa7LtJQcCJd9VNK//Y46gAmeL6Bz3tqHRHgb/4zD6N0OGm6s
         FqKamD0NWKZAabZShILLAaJiD7oXWSdgQ/rz0UgHOo0bQpRNZME2WN3TEW7hRdUB0p7u
         yNMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789480445; x=1790085245;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JxQm3zX3lZmPGj0zAESC7DaQsGw/tmySviRI16wdemE=;
        b=B3SYQJkc8DAMW7w8Cedd605N/D5vNjPVPXf9yDE0GZkXP1CpbrpAgiXwEq5CkD1b0j
         Qc5uBtAMocgElHFHG6jI9ZqWE1A+ltNjRPKBcrnPj6Cqcf4mulwV2pzgxC3ODz/HuHa9
         kPyj1bqgPMXpT4z/S6omuckLCvsbDAkurmK8a/TAAqJZ7rmAs8ra1NwnL3qvXuWtzBzN
         R3ozKnVQf2Jm82y8VWs5gestdATdL8fvYyqpKvtKqG/brov2DXj03owqNc21+7JIxYFp
         SyeIL7Rl736NmYQtqY/xu/R/6k3EASLpHw1Xv9Q4tQCZ5SIjv1y9xxEts8tQvwiLjYfn
         O0oA==
X-Gm-Message-State: AFuF++nS3eG23uvLYtt2NvFl5yUzBzOjuYicmVHRYWWHleyhQERgXcru
	M13TB37loHLqgVR0WvQL6+xqKRo5f6z3YFyWsXGUGAFE8UNPYL+9ocP/u7zcGtq8MNu8Jgoea4v
	9PbczTbXlhAayFIhHxFOGmGM6vnr3CFOjvhLUXIdeSWIAhTvBmCE3xCZ8WRvbrLKJbrJGKget2b
	HM1QM=
X-Gm-Gg: AYBFou3gVMymz9MOBXubu3jNlrOxTwDP05l4fumTIs02RhVGe5gtw7g95O6lxtodZsM
	GqRrFKsaughnaxY89JU866DXY9sukV4Y+WXFqM/l0jNf3kc1wnVzNVkRmkIIPAtyJk9d1nlTAlI
	CFCQI2fZs2lVOw+6YvKTihuumcrCWEFPEXkWBqVhKFodz/6cl5YsHDTKJIsR/AXD4gEHK8NQNKd
	0omVi31WHrzYdO2FnRcdR0segAQ3tF8lnIbjBSYfR7Xr+O9CHKxP0Ep3qvcUybgpHXZJb5qTXDm
	DZVR0qckQpdc/fSDpHSpYQsGEvXwl1RZTZRC4j43lvS5DpiiKy6Y2aKqVn0rnsY4YMSeseY00u7
	mMdrPLttrviMyscuFl+WpCmV0/flOaDuq
X-Received: by 2002:a17:903:3c67:b0:2dd:68a4:16f1 with SMTP id d9443c01a7336-2dd6c6c0cd4mr148378715ad.11.1789480445331;
        Tue, 15 Sep 2026 06:54:05 -0700 (PDT)
X-Received: by 2002:a17:903:3c67:b0:2dd:68a4:16f1 with SMTP id d9443c01a7336-2dd6c6c0cd4mr148378265ad.11.1789480444875;
        Tue, 15 Sep 2026 06:54:04 -0700 (PDT)
Received: from [10.218.9.75] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2ce9837esm69650865ad.21.2026.09.15.06.54.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 06:54:04 -0700 (PDT)
Message-ID: <abc41d74-c267-42bb-8a29-513e4e54be7d@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 19:24:00 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v25 02/10] power: reset: reboot-mode: Add support for
 predefined reboot modes
To: sashiko-reviews@lists.linux.dev, Sebastian Reichel <sre@kernel.org>
Cc: conor+dt@kernel.org, lee@kernel.org, devicetree@vger.kernel.org,
        robh@kernel.org, mfd@lists.linux.dev
References: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
 <20260914-arm-psci-system_reset2-vendor-reboots-v25-2-4aaf5c09b5c2@oss.qualcomm.com>
 <20260914151237.911CA1F000FF@smtp.kernel.org>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <20260914151237.911CA1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDIwMiBTYWx0ZWRfXxhqsEpNw31eT
 QiUO7IJjeT48Qx8EhqfjvAOOact8p1YLTlju78uTx24k2Q7eSAEbBxrxnI5XAT9ECHV58236KY5
 GUiLeCj8nGDXhLy/rl9BP8NMnPtoj0k=
X-Authority-Analysis: v=2.4 cv=I4Xw19gg c=1 sm=1 tr=0 ts=6aa94dfd cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=dxk7UDr9idcWiZ1mBXQA:9
 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: DyMZH9qXcmgm7DUxc5Ojqs3TbHmTcuRB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDIwMiBTYWx0ZWRfX4SJj7ggsZSPE
 GyfnCuKunRgEFgPixrXrf8s3fni8hHQ4F3/618YiusJodnPVv8dSEL0DXDdIE/k1RYitos1Xwnx
 BmSR91e8CygcLpCO960gUmeFxqtM2zwBxEr6+PHyoOaFmqB9+fVamJWFOIxH6VMyrCkCtSdiwMF
 WQhsri+lNuIj8NZ8QWTEoRcjGN2B6JFXnqGsQk/jxgg0nfEGmqlALCq/dNGNTfGoUZwRKovU/Cr
 v2I6QY80Kx3CijFeWaUQcBPViy0WfIam3BlS74L1iCNjxX5X3wCZ8nKRRIw61go++2hmlwnPu6D
 3WSyyh5k8LPGoPhbpmGEmiSNRAh+1g3wlWwD095AtGQBD6d2b+XagiacZivnc4KuHwesO0Qbnfv
 jyNsWTcCCYDxy92FTbThWak/ARiqlY5RrtdOlWbfzttpKV/64f78i0pXRzBlsDt8U9gw44R6u7K
 0VKzcOYAbemqnJGyC+Q==
X-Proofpoint-GUID: DyMZH9qXcmgm7DUxc5Ojqs3TbHmTcuRB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1011
 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150202



On 9/14/2026 8:42 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Predefined modes overlapping with DT-defined modes cause duplicate entries in the sysfs `reboot_modes` attribute.
> --
> 
> commit 394fababa44a1d093815c91cc11774a6de1c1f6b
> Author: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> 
> power: reset: reboot-mode: Add support for predefined reboot modes
>      
> Extend the reboot-mode framework to support driver-defined predefined reboot
> modes. Add a centralized initcall to initialize driver state along with
> predefined modes.
> 
>> diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
>> index 328fa37598df3..fd61de2263836 100644
>> --- a/drivers/power/reset/reboot-mode.c
>> +++ b/drivers/power/reset/reboot-mode.c
> 
> [ ... ]
> 
>> @@ -160,11 +234,38 @@ static int reboot_mode_create_device(struct reboot_mode_driver *reboot)
>>   	return 0;
>>   
>>   error:
>> -	reboot_mode_release_list(priv);
>> +	reboot_mode_release_list(&priv->head);
>>   	kfree(priv);
>>   	return ret;
>>   }
>>   
>> +static int reboot_mode_add_predefined_modes(struct reboot_mode_driver *reboot)
>> +{
>> +	const struct reboot_mode_entry *modes = reboot->predefined_modes;
>> +	struct mode_info *info;
>> +	size_t i;
>> +
>> +	if (!modes)
>> +		return 0;
>> +
>> +	for (i = 0; i < reboot->predefined_mode_count; i++) {
>> +		if (modes[i].name && strpbrk(modes[i].name, "\n ,/"))
>> +			return -EINVAL;
>> +
>> +		if (!modes[i].count || modes[i].count > ARRAY_SIZE(modes[i].magic))
>> +			return -EINVAL;
>> +
>> +		info = reboot_mode_create_info(reboot->dev, modes[i].name,
>> +					       modes[i].magic, modes[i].count);
>> +		if (IS_ERR(info))
>> +			return PTR_ERR(info);
>> +
>> +		list_add_tail(&info->list, &reboot->head);
> 
> [Severity: Medium]
> Will this lead to duplicate string entries in the sysfs reboot_modes
> attribute?
> 
> If a reboot mode provided by the Device Tree has the same name as one of the
> driver's predefined modes, reboot_mode_register() parses the DT property and
> adds it to the reboot->head list first.
> 
> Immediately after, reboot_mode_add_predefined_modes() blindly appends the
> predefined mode to the same list here without checking if an entry with that
> name already exists.
> 
> The duplicate entries are unconditionally propagated to the sysfs structure in
> reboot_mode_create_device(). This will cause reboot_modes_show() to print
> all modes sequentially, resulting in duplicate strings in sysfs when userspace
> reads the /sys/class/reboot-mode/.../reboot_modes file.

The reboot-mode header adds a note that DT-defined mode will take 
precedence, if a duplicate mode-name is present in both "DT list" and 
the "pre-defined list".

We can add a duplicate check here, but would like the view of other 
reviewers on this.

thanks,
Shivendra
