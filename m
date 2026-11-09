Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.110
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794227711;
	b=x3E8vbSZVZCjAguI1YjVPTkcrBfxA3KwBpHg5dUjMa9eI4WxZvvYK2vPq3aqCtsTd16R
	 Shhryn04nWSGwnAimhRcbvD0Z1RbgAPWLVnblVg+neikIT9/RHqmQZdCKQ/5w7BLGwc27
	 r6SKod54HpleiYo7Q5TVDd1AzKf+RZyfmTbu/XWamnlDMODxfQdKRQW9YbiKT3vMSGlD2
	 5tFzXVlFZKhRUVqmEeB+Fk1HN2gslOHD3r8TVXkr4V23Xcd0FQvLMw/ribt2ir+XjrdGt
	 CM0Lg479K41pi2a8Tba0GredL3npn5ByK8oNsm7E2lFjG/xPpveYHDwQ3X+57rSxlmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794227711;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Z3l8voVSRQ1W+oAj6jnsq+7tQcEM1c8H4FbUsCQNMds=;
	b=kpk9vnTm2l5EZYWskvBWsbJBJ5lfTt1/3qWzkiLDRChTQdq30+0HSOi3HinWfW/0LGEP
	 ayhi6I2nXLokzh/sj1CX5K7Ef3Hrdx5/K1SxOAlCdfnNQONXwWwCnq4uz7CcPrFraUqk6
	 brVEwV3T/kVAN4o8tpBRfYbO4KBKaxq7qoR7QfFxDKnjDkNVBVnO81lW1V5BLykOW3HbV
	 +h3wKYhJCqdOPMYBS+P7jnd0MdGuHZL2VuscNCYBNzB6pvRbth5PnYoTdPXbKXQKkhZMq
	 MJImnCuUBDfd6GKh+THKg/DTnCoE3f3TJp4F7HR8ksC2VCwdPe0ctc40qcz0Z0X2NKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=u9MBA7QE;
	arc=none smtp.remote-ip=115.124.30.110
Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43FE606EE94
	for <sashiko-reviews@lists.linux.dev>; Mon,  9 Nov 2026 12:35:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C43FE606EE94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=u9MBA7QE
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1794227705; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=Z3l8voVSRQ1W+oAj6jnsq+7tQcEM1c8H4FbUsCQNMds=;
	b=u9MBA7QEk4blLEfsfs+Y3FY/oQ9lLnqOaKD8k1a6/SIZbZVnPPpHnJWGjkPWnoWgFZ+tzqbpmnp0uF0HK22P6LezYC7suMPf+WgNGSQEAO4WxFln2ugMOl/FPcgGh6OHOEs4qLv4zSOJc54cfs342I1IlSQeWEqbrpAD97vN2uA=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R241e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=kanie@linux.alibaba.com;NM=1;PH=DS;RN=2;SR=0;TI=SMTPD_---0XEPkcQv_1794227704;
Received: from 30.178.85.177(mailfrom:kanie@linux.alibaba.com fp:SMTPD_---0XEPkcQv_1794227704 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 09 Nov 2026 20:35:05 +0800
Message-ID: <1b5dc444-89b7-47cd-8af6-736145bc302f@linux.alibaba.com>
Date: Mon, 9 Nov 2026 20:35:03 +0800
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] nvme: define the SMART / Health Status async event
 bit
To: sashiko-reviews@lists.linux.dev
Cc: linux-nvme@lists.infradead.org
References: <20261109120207.1352165-1-kanie@linux.alibaba.com>
 <20261109120207.1352165-2-kanie@linux.alibaba.com>
 <sashiko-outbox-204916@kernel.org>
From: Guixin Liu <kanie@linux.alibaba.com>
In-Reply-To: <sashiko-outbox-204916@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/11/9 20:09, sashiko-bot@kernel.org 写道:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] nvme: NVME_AEN_BIT_SMART and NVME_AEN_CFG_SMART use wrong
>   OAES/CFG bit
> --
>
> commit be7079eb32755ede896d21f96ed7d1785a179279
> Author: Guixin Liu <kanie@linux.alibaba.com>
>
> nvme: define the SMART / Health Status async event bit
>
> This commit adds NVME_AEN_BIT_SMART and NVME_AEN_CFG_SMART definitions to
> include/linux/nvme.h.
>
>> diff --git a/include/linux/nvme.h b/include/linux/nvme.h
>> index 6248711784b37..2b4f8e269d12d 100644
>> --- a/include/linux/nvme.h
>> +++ b/include/linux/nvme.h
>> @@ -867,6 +867,7 @@ enum {
>>  };
>>  
>>  enum {
>> +	NVME_AEN_BIT_SMART		= 1,
>>  	NVME_AEN_BIT_NS_ATTR		= 8,
>>  	NVME_AEN_BIT_FW_ACT		= 9,
>>  	NVME_AEN_BIT_ANA_CHANGE		= 11,
>> @@ -874,6 +875,7 @@ enum {
>>  };
>>  
>>  enum {
>> +	NVME_AEN_CFG_SMART		= 1 << NVME_AEN_BIT_SMART,
>>  	NVME_AEN_CFG_NS_ATTR		= 1 << NVME_AEN_BIT_NS_ATTR,
>>  	NVME_AEN_CFG_FW_ACT		= 1 << NVME_AEN_BIT_FW_ACT,
>>  	NVME_AEN_CFG_ANA_CHANGE		= 1 << NVME_AEN_BIT_ANA_CHANGE,
> [Severity: Medium]
> Do NVME_AEN_BIT_SMART and NVME_AEN_CFG_SMART match the NVMe specification
> for Identify Controller OAES and NVME_FEAT_ASYNC_EVENT?
>
> The value 1 is the Asynchronous Event Type (NVME_AER_SMART = 1) reported
> in CQE DW0 bits 2:0, not an OAES or Asynchronous Event Configuration bit.
> In the NVMe Base Specification, SMART / Health Critical Warning events are
> mandatory, so bits 7:0 of OAES are reserved and zero on compliant
> controllers. Checking ctrl->oaes & NVME_AEN_CFG_SMART will therefore find
> the bit cleared and never subscribe to the event.
>
> In the NVME_FEAT_ASYNC_EVENT feature (CDW11), bits 7:0 are individual
> Critical Warning bitmasks corresponding to byte 0 of struct nvme_smart_log,
> already defined right above in include/linux/nvme.h as
> NVME_SMART_CRIT_SPARE through NVME_SMART_CRIT_VOLATILE_MEMORY (and used by
> NVMET_AEN_CFG_ALL in drivers/nvme/target/nvmet.h). Passing 1 << 1 to Set
> Features only enables NVME_SMART_CRIT_TEMPERATURE and leaves spare,
> reliability, media, and volatile memory warnings disabled.
Sashiko is right, this is a big mistake, Will fix in v2.

Please ignore this version.
>

