Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6223939DB
	for <sashiko-reviews@lists.linux.dev>; Mon,  7 Sep 2026 22:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788820865; cv=none; b=r0OQYGj6d0LkTKsxSTvbd2A0OHjZc5NNQONURFJkaG71MihFQEzHjkaHJxkNQXCisfH4QrrJW7rJ2z78yvpzAoZivVxLUSD71j91uuJMStTA2rYS+TUzkSE2knmNP79Q8GOivKUPf+fhmFdUBiTCtyFID7T5CHj1+yidMacA/to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788820865; c=relaxed/simple;
	bh=w6hnYrwGa6fUIEho02iLQbUb4586aB2uHSK/Hsp/sHI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GyWdH7r5oOq/WoI6UfrKTFtrSZY+uSXX1NJh5H5wOVbMFqvxiD2CcAHOI3RS+7skMngGICyP5iV8fV6X+DfPuFEr6tHq/lTuPXwt+um/EelW+5SUJbbGSQ4GteW2OHA4DhB88bXBrKgASFVD5bhT5WOXFdn75DDOt10Z54H50yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CpNUMHaN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CpNUMHaN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788820862;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L602+dgOHuBuqXjtZSYxQyf+Lxw66t1x8qHXG257FZg=;
	b=CpNUMHaNfUDnX8+wCMSlcEercrwuB8Xmn8f9uH54AY9RfQCTBzY1iz3qtbQPFPhz287fva
	dXSiJmzT5JK7bKQzPA3smh4htnsoKgYc6/Is4ZertNfsQ2OskBzlO0O+3Fxqdo/9gVsHGN
	eJ6QzG+Y0NpZuGKZCOCPgXEbMhrd2YM=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-227-2jKegh_TP6ONTIMmJBbmgw-1; Mon, 07 Sep 2026 18:41:00 -0400
X-MC-Unique: 2jKegh_TP6ONTIMmJBbmgw-1
X-Mimecast-MFC-AGG-ID: 2jKegh_TP6ONTIMmJBbmgw_1788820860
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ccb687f82eso46723565ad.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 07 Sep 2026 15:41:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788820860; x=1789425660;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L602+dgOHuBuqXjtZSYxQyf+Lxw66t1x8qHXG257FZg=;
        b=gsvPn/6Yil7DsGt2uCb7u3s1Q+zY+MwWcNonDJFHNlUxvpvPc94uu5ZgSHGpU+oHOF
         W0tKWESM/DwXFNqhPQHehIrdQpFBvYzk7FmzxV1CxrkG8ZveY8DAgo2Lilgdu8Ob98Pt
         qtys/j7PdoB2Z+O/HaW3O8fPXwZTOHhXwBLk1hqYOFM2JjfgqjmYtgCqdOi25r7xGFas
         8qMaL4xsnFScdhuSww+87PiWov25QtbOtpjXwnNm1D2zBcSFdE+VzeI0cj39vHAwFX4c
         6RSw/YU5PlZhVU9Vhf4M9ZMRMsycEuheJwWim4SHOedL0HwoIn9BAygDWuAEE44cmSi0
         Bapw==
X-Forwarded-Encrypted: i=1; AKwUvBwaMDi0ck9LEgiUsFQPIkAB2PZS6Jeplrk3mLQPd8Eg1bdrbvEXJRibsFQadfCqx8Fvdr/8QCVdGNKtuoF3agI=@lists.linux.dev
X-Gm-Message-State: AFuF++kv1EHYOnI6VM9LrcKyN9YlA3IxNlwesJJIy2MGVKQQl9+KfjbW
	6H7VnJQ6WrwaMEt3t4APkUbKETkv7t/d7FmkabgJqKYwXk5MzdnWEL8tBESqo+G/S5R64f/Y4Fq
	AA0KZQUbXfYP876NT1WES/JdA6gPUhfTx1hIDFzHVFE7tCxf/15gyzUGE4+q1xEG8opgV7w==
X-Gm-Gg: AYBFou1uuYOauld7HhHDSqubvBkkZHlxgZJ1iqjNo4KiGhQ71gmj2nmgzVzDeWBxQ35
	Lv5AufA2yVJdOsndg/nImfhoWFJ4KuLxvdQ8hq57xbFfqw0/GSqOe1zP7Ounww5BinTPLuk7LxD
	dFPh7sQL+KDD8GAY0+XIkjhlw4YJTDIott5/RscHVgipaxhauLXXVyoUHnjz6y1wFfVVB4nBG36
	bPmjErU7Zu67+gZWgeX5l0bRKK/chEbZwax7A5OC7nht8c4ATF6Pw4PHbbYlgXtpNxY/HvXu4JR
	cY8LgGlvPg5l7SSiLNQttusoXs7VyC76NONNObD2tR+v/hMWeiWjxiEGdCrHZ/1DaKIOXjTkJpa
	1GaxTuHcdCnqGplmRPkp0pPCcgkwJ08x4D16Rs9FoUQ==
X-Received: by 2002:a17:902:6ac3:b0:2ca:6c8:abd8 with SMTP id d9443c01a7336-2db127cde0fmr287844965ad.12.1788820859669;
        Mon, 07 Sep 2026 15:40:59 -0700 (PDT)
X-Received: by 2002:a17:902:6ac3:b0:2ca:6c8:abd8 with SMTP id d9443c01a7336-2db127cde0fmr287844615ad.12.1788820859141;
        Mon, 07 Sep 2026 15:40:59 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db146b9691sm49351165ad.0.2026.09.07.15.40.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 15:40:58 -0700 (PDT)
Message-ID: <64533fd0-5fe7-4839-8302-c5b6674bcb5a@redhat.com>
Date: Tue, 8 Sep 2026 08:40:50 +1000
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 3/7] firmware: arm_rmm: Configure the RMM with the
 host's page size
To: Suzuki K Poulose <suzuki.poulose@arm.com>, sashiko-reviews@lists.linux.dev
Cc: kvmarm@lists.linux.dev, Marc Zyngier <maz@kernel.org>,
 kvm@vger.kernel.org, Oliver Upton <oupton@kernel.org>
References: <20260907095942.1140734-1-suzuki.poulose@arm.com>
 <20260907095942.1140734-4-suzuki.poulose@arm.com>
 <20260907101446.1DA321F00A3A@smtp.kernel.org>
 <bade4920-2db1-4a8a-99d1-ca2694647ec8@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <bade4920-2db1-4a8a-99d1-ca2694647ec8@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vj0XpwBpRf-JVY6lqSLuww5EuNq5aHZV1JtI9O1eBF4_1788820860
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Suzuki,

On 9/7/26 10:02 PM, Suzuki K Poulose wrote:
> On 07/09/2026 11:14, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>> - [High] The SMC call leaves parameters X2-X7 uninitialized, violating the RMM's RES0 requirement.
>> - [High] The `struct rmm_config` fields are populated using native endianness, which breaks on Big Endian kernels.
>> -- 
>>
>> commit 1741e17729c2ff5e23bc8bfb00cc50a61f38ebb7
>> Author: Steven Price <steven.price@arm.com>
>> firmware: arm_rmm: Configure the RMM with the host's page size
>>
>> This commit adds support to configure the RMM's granule size to match the
>> host's page size during kernel initialization. It reads the feature
>> registers to ensure the requested page size is supported and sends the
>> configuration to the RMM via an SMC call.
>>
>>> diff --git a/drivers/firmware/arm_rmm/rmi.c b/drivers/firmware/arm_rmm/rmi.c
>>> index 008a783407b4e..76f91c145e1fd 100644
>>> --- a/drivers/firmware/arm_rmm/rmi.c
>>> +++ b/drivers/firmware/arm_rmm/rmi.c
>>> @@ -77,6 +77,60 @@ static int rmi_read_features(void)
>>>       return 0;
>>>   }
>>> +static int rmi_configure(void)
>>> +{
>>> +    unsigned long granule_feature;
>>> +    unsigned long granule_size;
>>> +    int ret = 0;
>>> +    struct rmm_config *config;
>>> +
>>> +    switch (PAGE_SIZE) {
>> [ ... ]
>>> +
>>> +    config = (struct rmm_config *)get_zeroed_page(GFP_KERNEL);
>>> +    if (!config)
>>> +        return -ENOMEM;
>>> +
>>> +    config->rmi_granule_size = granule_size;
>>> +
>>> +    /*
>>> +     * For now we set the tracking_region_size to 0 which is the only option
>>> +     * for 4KB PAGE_SIZE (1GB for 4KB PAGE_SIZE, 32MB/512MB for 16KB/64KB).
>>> +     * TODO: Support other tracking sizes via Kconfig option for other
>>> +     * PAGE_SIZES
>>> +     */
>>> +    config->tracking_region_size = 0;
>>
>> [Severity: High]
>> Does this code handle endianness correctly?
>>
>> The struct rmm_config fields are populated using native u64 assignments.
>> On an ARM64 kernel compiled with CONFIG_CPU_BIG_ENDIAN=y, this writes
>> big-endian bytes into the shared memory. The RMM, which runs in little-endian
>> at EL2, will misinterpret these fields.
>>
>> Will this cause the RMM firmware to read invalid configuration values (like a
>> byte-swapped granule size) and fail to configure, breaking RMI support on Big
>> Endian systems?
>>
> 
> We don't plan to support RMM for Big Endian Linux. I have now made the ARCH_SUPPORTS_RMM to depend on !CPU_BIG_ENDIAN
> 

You probably need to avoid referring to CPU_BIG_ENDIAN as it's being dropped
by PATCH[v2 13/14] in Will's series to removed unused big-endian support on
arm64 [1].

[1] [PATCH v2 00/14] arm64: Remove unused big-endian support
     (https://lore.kernel.org/linux-arm-kernel/20260907163726.17104-14-will@kernel.org/)

Thanks,
Gavin

>>> +
>>> +    ret = rmi_rmm_config_set(virt_to_phys(config));
>>> +    if (ret) {
>>> +        pr_err("RMM config set failed\n");
>>> +        ret = -EINVAL;
>>> +    }
>>> +
>>> +    free_page((unsigned long)config);
>>> +    return ret;
>>> +}
>> [ ... ]
>>> diff --git a/include/linux/arm-rmi-cmds.h b/include/linux/arm-rmi-cmds.h
>>> index 2fb1f7f86d71e..9aa27697e2377 100644
>>> --- a/include/linux/arm-rmi-cmds.h
>>> +++ b/include/linux/arm-rmi-cmds.h
>>> @@ -12,6 +12,23 @@
>>>   unsigned long rmi_feat_reg(unsigned long id);
>>> +/**
>>> + * rmi_rmm_config_set() - Configure the RMM
>>> + * @cfg_ptr: PA of a struct rmm_config
>>> + *
>>> + * Sets configuration options on the RMM.
>>> + *
>>> + * Return: RMI return code
>>> + */
>>> +static inline int rmi_rmm_config_set(unsigned long cfg_ptr)
>>> +{
>>> +    struct arm_smccc_res res;
>>> +
>>> +    arm_smccc_1_1_invoke(SMC_RMI_RMM_CONFIG_SET, cfg_ptr, &res);
>>
>> [Severity: High]
>> Does this SMC call leave parameters x2 through x7 uninitialized?
>>
>> The arm_smccc_1_1_invoke macro only generates inline assembly constraints
>> for the explicitly provided arguments. It does not zero-pad omitted arguments,
>> leaving registers x2 through x7 with whatever was previously in them.
>>
>> Since the RMM firmware expects unused SMC parameters to be zero (RES0),
>> could passing uninitialized values cause the RMM to reject the command
>> with an INVALID_PARAMETER error and sporadically break RMM initialization?
> 
> Correct, I have now moved all RMI calls to smccc_1_2, making sure that
> all the undefined arguments are initialised to 0.
> 
> Cheers
> Suzuki
> 
> 
>>
>>> +
>>> +    return res.a0;
>>> +}
>>
> 
> 

