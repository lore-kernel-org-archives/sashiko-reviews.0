Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B054155C318
	for <sashiko-reviews@lists.linux.dev>; Thu, 17 Sep 2026 13:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789653601; cv=none; b=uUEUbz/Tati34AWpYD6PrgQvPBA/Mjutv+XmS/MxHiCgYe0O2BmOC94t9BhNbj1IqYgKX6E+s0Tpw2IPj7CHEe8LjdKkS95uSgGJSP5lzPhXMiBjzbOIYza4zdIQKFBbwVcqeZHqC8BSCHRrRphLefN98bfp4eSPAX8T2YXmSdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789653601; c=relaxed/simple;
	bh=91RxQy6fR6bQ7Br9Q9pz9awhaXYTyXcVPFa2HZjpMdA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t5FIXzku93fgFlnWRbPmbP+7MGYqfAxWU9wjtlQ5JkwdbMQclnyobr7PiQy3tuWjhCTlAZRr+WuILNBVHs8ZbmH1fIR81njyXrfV2n7H8U6UZ3i1obBhZ5J6cmzYdiGVDjieX2SPTQdjoueHFR1FJgwE53s1KsrVamzjcYt7AZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pYOwjUDk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VooaKrId; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pYOwjUDk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VooaKrId"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDj3MB2777136
	for <sashiko-reviews@lists.linux.dev>; Thu, 17 Sep 2026 13:59:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aNwGlTl+sZyTNHdSDMZB34IyEjQolhrW1JOgXM041mA=; b=pYOwjUDkGxxlO0WZ
	2kz9dn25CLDI4SW+G0tCSQOyZYHt2tNZD5A0SVEZJ5IeSJgBxx7k7hqxYHNQ5mrp
	RqMcNfCjdJVHLfS7bFQ2axewyUV2Tr5XqeRCQoOchQt5xDolWRWgs6ZFMF3Jlc62
	0HPFOKJWpaiqaSXRV8K47AzwkqeUY7KCRqRta6zKNroFGvab2fZ0m/oQ6iDvWiVT
	l3RIA8z3ErcTXZq5jtbuoVAtNSZ1zS0i2NyR3iw0MVfqt9HlWr6cFguvyp8SDHrk
	llv60XUGtkhjwkI5kIXnnIG7dWec/zZCT1a0rEOhZ8Rm975sXfreJb14swHZhK8o
	YQJXgA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr79m2r5p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 17 Sep 2026 13:59:58 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-869b8d63e28so1185042b3a.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 17 Sep 2026 06:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789653594; x=1790258394; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aNwGlTl+sZyTNHdSDMZB34IyEjQolhrW1JOgXM041mA=;
        b=VooaKrId8h5yW6OEvmW2VgUiunTwHQk23up3VYdNHAFno1yYxwKw587kRKxqLdGMTo
         /R2v42GYr7HijbJlFJxrWs3TQaUtunFMMxTXfVGHSoHwvSGkwyjlDZuqYCS4brpFgPnj
         4gH4Rl1915BoQ5nCLf6kBes8yybKuO7E+T82+SZ73oiZAOuuxbAfpVWXLcB55NyAvMTn
         JUjf842wEY1zUk5zGtnXoDzV9dpWMq/r62fLw7r2kbhpzotWRe561aGg/XVOBUOtwZ+M
         CRYogde7cTTICikS6ZFHogxEL/JoWQjSVAE1c8DABUmInVUNT/01Ek2+kvT/ezC6tSce
         DHhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789653594; x=1790258394;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aNwGlTl+sZyTNHdSDMZB34IyEjQolhrW1JOgXM041mA=;
        b=tWJfCxx/ZDzJBYdYej/Eqvn/ugVcfpGwzp59FIKUMAqMKTT+kGK2v3qJ32faSNe94J
         9gijru2e81H7R1Pito+lOdqXNVmlx9cAh0/jl9A6a5eu2EWGyPK5pgy6z9fS8vwKeXOq
         4AFtLXEBQB57Swt7wzsMV+sQhqAFtLPEbk90CCN9iT2Pig3FkFAQccrZhTvPLKIbc4Ud
         CssUQlme2EJNdAANfk9BJStJtj69dpY2SHS2PC1KXIggkuXvdH4DDlup083aR0ZqRQiu
         Nj36qw6jRYkld/GKKsSPs1fn2vacRqrrejsBL6uvSkxYYqvStMLiCoxPAUXT6jZiuXno
         /txQ==
X-Gm-Message-State: AFuF++n9xeJ08Macaz/ycyCWj2Msbnn26fjRXWpkHrl49f3OLHgZqavw
	fDA80W3MGHtEcqxkmyn5WaXqEszjAMkqD2HTV0KaH0lxlZpNzejV3OZb6m5XpucXtLk/+TJseok
	Lje4HOOILvwEyXDAexZZteZpYCQRL/f2HZGJGGRIH6YVIdyP0rWi+8Zq7fzmdFCbyclhl4bUKBO
	lGv+Fdcg==
X-Gm-Gg: AYBFou2ZcCkI7YsCExwWKfhttmkJ2Dva2UNTR+HnslL75Fu3wEyp5kNu5v00mUINyNY
	/gAcCmFkUWg35hLKaQp/mb2OZPy++G+sEOzlHMouB71Ujf0V7Yph6Tdyub3zAOBU28LCqIuFXn3
	s2/NF14DXgsJcz2ag9qG7ACctAQZSMuqQc6NqUjl2w9UIDoY1YFKYZUQLrNCam0bMkdoQKgZegQ
	Po61krucu63E4qKQ4gEGGfCNZATLa5NVb2C8u8JXMDB8ieIb12DHtNQ0bZqHPASBsZX7Hqbnxcq
	p9GFNRI7PrO55OLAA2ey1/dedyTHBptHcDXUM8wU7dMEhwbX/N6/4XuiD1E9ssTJTXNs28pxBQa
	fJ/xgpjq4k3ygzCyg1uZAn+GJJqwk+CB+N5Wx0ZEHEmzJZMDo2R2yd+eNqw==
X-Received: by 2002:a05:6a00:23c6:b0:857:726d:2e96 with SMTP id d2e1a72fcca58-872391a449emr13882509b3a.19.1789653593602;
        Thu, 17 Sep 2026 06:59:53 -0700 (PDT)
X-Received: by 2002:a05:6a00:23c6:b0:857:726d:2e96 with SMTP id d2e1a72fcca58-872391a449emr13882451b3a.19.1789653592943;
        Thu, 17 Sep 2026 06:59:52 -0700 (PDT)
Received: from [10.110.122.88] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8720172f6ebsm2887171b3a.34.2026.09.17.06.59.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 06:59:52 -0700 (PDT)
Message-ID: <c838207a-693e-4a9f-8afa-8a79dd28cdd3@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 21:59:49 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] virtio_blk: add inline encryption support
To: sashiko-reviews@lists.linux.dev
Cc: virtualization@lists.linux.dev, "Michael S. Tsirkin" <mst@redhat.com>,
        Eugenio Perez <eperezma@redhat.com>
References: <20260914133733.15429-1-linlin.zhang@oss.qualcomm.com>
 <20260914133733.15429-3-linlin.zhang@oss.qualcomm.com>
 <20260914141919.18B9A1F00893@smtp.kernel.org>
Content-Language: en-US
From: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
In-Reply-To: <20260914141919.18B9A1F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Qf7zLcbv c=1 sm=1 tr=0 ts=6aabf25e cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6vfXZlZZraEmRWu83ZUA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: FEdbXK8rJUr_utTGBjJolsIGRwK4_xsi
X-Proofpoint-ORIG-GUID: FEdbXK8rJUr_utTGBjJolsIGRwK4_xsi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE5NyBTYWx0ZWRfX5gtG9uB6FhjM
 q67N7yxRi5KkyspkgWp7jGQynnTTbe2hiWhvSPjvecfY/fgYJMoIo6WLViOUV5wa7IWebOpkYYU
 FxWifMyJyuxmy2XU6EefIlENIfxEWeD++4WkPPrXazdHBmnXlNlFnijh0ZWLdABl0jM+lcDEtGR
 VeiAHzLw6CF4iaQymF7QOdeWws208GxmLpg6WEVet02tParPzVpyrTlTF2f5nbTma1TommaxP8A
 jXmXMvBL8nuMPahicPw2hXZUrP7YiV89xN8E8FLcMmgLXb59//gmVwtJMFZ4HTdhiHT7iAc674Z
 2YCPnVpXBB+dWWoempgiVh1hxr0/GYprbt726rlhb5HcGq6Ao/NzoiVn5RhVtztyHv4QXi+FKMA
 9/GwsZ6+nWjNdbbFMUxjG6j/udWE/jY1/88mu02pBHXrzAPMHi2PBXRcB+5v14yDrnA5u2gnwcB
 1lzETJSskKFwOHC9yvw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE5NyBTYWx0ZWRfX9I7eoPMn3D6U
 +EJ9FAR9ZnuWcrlkSKuwVjWeLw2D5fyfj+Ooh4YYMuUmkZUtdo84RTeJyR7NrcV2ObCQK4lKYNS
 4E45vey+zuHQnxZrRbLpwy10tXRibiU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170197



On 9/14/2026 10:19 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 10 potential issue(s) to consider:
> 
> New issues:
> - [Critical] REQ_OP_ZONE_APPEND requests with an encryption context are silently written in plaintext.
> - [High] Zoned block devices completely skip inline encryption initialization due to an 'else if' block.
> - [High] Memory allocation on the block I/O submission path uses GFP_KERNEL without a mempool, causing deadlocks.
> - [High] Hardware queues are unquiesced before encryption keys are reprogrammed during resume.
> - [High] Cacheline sharing in `struct virtblk_ctrl_request` violates the DMA API, risking memory corruption.
> - [High] Uninitialized vblk->crypto_profile_initialized leads to wild frees on probe error paths.
> - [High] blk-crypto operations can race with device removal, leading to NULL pointer dereference.
> - [Medium] The driver directly assigns Linux-internal crypto mode enums to the Virtio hardware descriptor without translation.
> - [Low] VIRTIO_BLK_INLINE_ENCRYPTION is defined as a tristate but cannot be built as an independent module.
> 
> Pre-existing issues:
> - [High] The error cleanup path in virtblk_probe contains a use-after-free and double free of vblk.
> --
> 
> commit 787711d9770fce24131418d43dc33cb33a894de6
> Author: linlzhan <linlin.zhang@oss.qualcomm.com>
> 
> virtio_blk: add inline encryption support
> 
> This commit adds support for the virtio-blk inline encryption feature,
> allowing guest VMs to offload per-I/O encryption to the host's inline
> crypto engine. It wires up device encryption characteristics to a
> struct blk_crypto_profile and handles key management via control commands.
> 
>> diff --git a/drivers/block/Kconfig b/drivers/block/Kconfig
>> index 858320b6ebb7e..58bb050d4617c 100644
>> --- a/drivers/block/Kconfig
>> +++ b/drivers/block/Kconfig
>> @@ -372,4 +372,16 @@ config BLK_DEV_ZONED_LOOP
>>  
>>  	  If unsure, say N.
>>  
>> +config VIRTIO_BLK_INLINE_ENCRYPTION
>> +	tristate "Virtio block inline encryption support"
>> +	depends on VIRTIO_BLK && BLK_INLINE_ENCRYPTION
> 
> [Severity: Low]
> Could this lead to configuration ambiguity? VIRTIO_BLK_INLINE_ENCRYPTION is
> defined as a tristate, but the code is conditionally included directly within
> the virtio_blk module. Users might select 'M' thinking it builds a separate
> crypto module, but it functions as an intra-file boolean.
> 

Setting it as 'tristate' here to ensure that VIRTIO_BLK with inline encryption
supoort can still be built as a module. I.e. if CONFIG_VIRTIO_BLK=m,
CONFIG_VIRTIO_BLK_INLINE_ENCRYPTION must also be m.

> [ ... ]
> 
>> diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
>> index 252ec93661532..3fd318e5e1f17 100644
>> --- a/drivers/block/virtio_blk.c
>> +++ b/drivers/block/virtio_blk.c
>> @@ -124,8 +136,23 @@ struct virtblk_req {
>>  };
>>  
>>  struct virtblk_ctrl_request {
>> +	/* Type byte, always its own out-sg for every command. */
>>  	__virtio32 type;
>> +	/* Out request, sent as a second, separate out-sg if any. */
>> +	union {
>> +		struct virtio_blk_crypto_key_desc key_desc;
>> +		struct virtio_blk_crypto_key_blob blob;
>> +	} out_req;
>> +
>> +	/* In response */
>> +	union {
>> +		struct virtio_blk_crypto_key_blob blob;
>> +		struct virtio_blk_crypto_sw_secret secret;
>> +		struct virtio_blk_crypto_modes modes;
>> +	} in_resp;
>> +	/* Status byte, always its own in-sg for every command. */
>>  	u8 status;
>> +
>>  	struct completion compl;
>>  };
> 
> [Severity: High]
> Does this struct packing risk memory corruption on non-cache-coherent
> architectures?
> 
> The DMA-written buffers (in_resp, status) are packed directly adjacent to the
> compl field. On non-coherent architectures, cache invalidation for the DMA
> fields can destroy the CPU's ongoing modifications to the waitqueue inside
> compl during wait_for_completion().
> 

ACK

update struct completion compl to a pointer of struct completion.

> [ ... ]
> 
>> @@ -262,20 +310,27 @@ static blk_status_t virtblk_setup_cmd(struct virtio_device *vdev,
>>  				      struct request *req,
>>  				      struct virtblk_req *vbr)
>>  {
> [ ... ]
>>  	case REQ_OP_ZONE_FINISH:
>>  		type = VIRTIO_BLK_T_ZONE_FINISH;
>>  		sector = blk_rq_pos(req);
>>  		break;
>>  	case REQ_OP_ZONE_APPEND:
>>  		type = VIRTIO_BLK_T_ZONE_APPEND;
>>  		sector = blk_rq_pos(req);
>>  		in_hdr_len = sizeof(vbr->in_hdr.zone_append);
>>  		break;
> 
> [Severity: Critical]
> Could this lead to plaintext data being written for encrypted zone append
> requests?
> 
> When handling REQ_OP_ZONE_APPEND, the type is forced to
> VIRTIO_BLK_T_ZONE_APPEND. Because this path does not check is_crypto_request(),
> it bypasses the crypto setup...
> 

This isn't a bug.

Because inline encryption is only added for the non-zoned device. REQ_OP_ZONE_FINISH
and REQ_OP_ZONE_APPEND are for zoned device, which doesn't have blk-crypto-profile
registered into its request queue.

> [ ... ]
> 
>> @@ -337,6 +392,18 @@ static blk_status_t virtblk_setup_cmd(struct virtio_device *vdev,
>>  	if (type == VIRTIO_BLK_T_DISCARD || type == VIRTIO_BLK_T_WRITE_ZEROES ||
>>  	    type == VIRTIO_BLK_T_SECURE_ERASE) {
>>  		if (virtblk_setup_discard_write_zeroes_erase(req, unmap))
>>  			return BLK_STS_RESOURCE;
>>  	}
>>  
>> +	if (type == VIRTIO_BLK_T_CRYPTO_IN || type == VIRTIO_BLK_T_CRYPTO_OUT) {
>> +		memset(&vbr->out_hdr.crypto_append.msg, 0,
> 
> [Severity: Critical]
> ...and subsequently fails this check since type is VIRTIO_BLK_T_ZONE_APPEND
> instead of VIRTIO_BLK_T_CRYPTO_OUT.
> 
> This prevents the crypto message descriptor from being attached, causing the
> host hypervisor to see a standard unencrypted write and store the plaintext
> data to disk.
> 

This is not a bug. It's excepted that the out header of virtio block request isn't
appened with crypto metadata for a zoned device.

> [ ... ]
> 
>> @@ -1001,11 +1068,478 @@ static int virtblk_ctrl_vq_request(struct virtio_blk *vblk,
> [ ... ]
>> +static int set_virtblk_crypto_key_desc(struct virtio_device *vdev,
>> +				       struct virtblk_ctrl_request *creq,
>> +				       const struct blk_crypto_key *key,
>> +				       unsigned int slot)
>> +{
>> +	struct virtio_blk_crypto_key_desc *desc = &creq->out_req.key_desc;
>> +	enum blk_crypto_key_type key_type = key->crypto_cfg.key_type;
>> +
>> +	if (sizeof(desc->bytes) < key->size)
>> +		return -EOVERFLOW;
>> +
>> +	memset(desc, 0, sizeof(*desc));
>> +	desc->slot = cpu_to_virtio32(vdev, slot);
>> +	memcpy(desc->bytes, key->bytes, key->size);
>> +	desc->key_size = cpu_to_virtio32(vdev, key->size);
>> +	desc->crypto_mode = cpu_to_virtio32(vdev, key->crypto_cfg.crypto_mode);
> 
> [Severity: Medium]
> Can this leak a Linux-internal enum value directly into the hardware protocol
> descriptor?
> 
> The desc->crypto_mode is set directly from key->crypto_cfg.crypto_mode, which
> is an internal enum blk_crypto_mode_num. If Linux adds a new mode or virtio
> assigns different numbers in the future, this will silently send incorrect
> crypto modes to the hypervisor.
> 

ACK

Transmit the kernel internal blk_crypto_mode_num to the virtio Spec defined
crypto mode num.

> [ ... ]
> 
>> +static int virtblk_crypto_keyslot_program(struct blk_crypto_profile *profile,
>> +					   const struct blk_crypto_key *key,
>> +					   unsigned int slot)
>> +{
>> +	struct virtio_blk *vblk = virtblk_from_profile(profile);
>> +	struct scatterlist type_sg, out_req_sg, status_sg, *sgs[3];
>> +	struct virtblk_ctrl_request *creq;
>> +	int err;
>> +
>> +	creq = kzalloc_obj(*creq, GFP_KERNEL);
>> +	if (!creq)
>> +		return -ENOMEM;
> 
> [Severity: High]
> Is it safe to use GFP_KERNEL here?
> 
> This allocation occurs on the block I/O submission path. Under memory pressure,
> this could recurse into memory reclaim, which may attempt to flush dirty pages
> to this same block device, leading to a deadlock.
> 

ACK

Replace GFP_KERNEL with GFP_NOIO

> [ ... ]
> 
>> +static int virtblk_crypto_keyslot_evict(struct blk_crypto_profile *profile,
>> +					 const struct blk_crypto_key *key,
>> +					 unsigned int slot)
>> +{
>> +	struct virtio_blk *vblk = virtblk_from_profile(profile);
>> +	struct scatterlist type_sg, out_req_sg, status_sg, *sgs[3];
>> +	struct virtblk_ctrl_request *creq;
>> +	int err;
>> +
>> +	creq = kzalloc_obj(*creq, GFP_KERNEL);
>> +	if (!creq)
>> +		return -ENOMEM;
> 
> [Severity: High]
> Similar to the programming path, is GFP_KERNEL appropriate here? The eviction
> path often occurs during inode or dentry reclaim, and recursing into memory
> reclaim could cause deadlocks.
> 

ACK

Replace GFP_KERNEL with GFP_NOIO

>> +
>> +	creq->type = cpu_to_virtio32(vblk->vdev, VIRTIO_BLK_T_CRYPTO_KEYSLOT_EVICT);
> 
> [Severity: High]
> Could this race with device removal?
> 
> In virtblk_crypto_keyslot_evict(), vblk->vdev is accessed unconditionally. If
> the virtio device is hot-unplugged, virtblk_remove() sets vblk->vdev to NULL.
> Since the block device may still be open by userspace, fscrypt might
> subsequently tear down a key and call into this driver, causing a NULL pointer
> dereference.
> 

ACK

Protect key program/evict/derive_sw_secret/generate/prepare/import by acquiring
vdev_mutex lock.

> [ ... ]
> 
>> +static void virtblk_destroy_crypto(struct virtio_blk *vblk)
>> +{
>> +	if (vblk->crypto_profile_initialized)
>> +		blk_crypto_profile_destroy(&vblk->profile);
>> +}
> 
> [Severity: High]
> Could this cause a wild free on probe error paths?
> 
> vblk is allocated using kmalloc_obj() which does not zero memory. If the probe
> fails before the profile is initialized, virtblk_destroy_crypto() might read a
> true value for vblk->crypto_profile_initialized and pass garbage to
> blk_crypto_profile_destroy().
> 
> [ ... ]
> 
>> @@ -1698,6 +2232,19 @@ static int virtblk_probe(struct virtio_device *vdev)
> [ ... ]
>>  	if (IS_ENABLED(CONFIG_BLK_DEV_ZONED) &&
>>  	    (lim.features & BLK_FEAT_ZONED)) {
>>  		err = blk_revalidate_disk_zones(vblk->disk);
>>  		if (err)
>>  			goto out_cleanup_disk;
>> +	} else if (IS_ENABLED(CONFIG_VIRTIO_BLK_INLINE_ENCRYPTION) &&
>> +		   virtio_has_feature(vdev, VIRTIO_BLK_F_INLINE_ENCRYPTION) &&
>> +		   virtio_has_feature(vdev, VIRTIO_BLK_F_CTRL_VQ)) {
>> +		err = virtblk_init_crypto(vblk);
> 
> [Severity: High]
> Does this else if inadvertently disable inline encryption for zoned block
> devices?
> 
> If a device advertises both ZONED and INLINE_ENCRYPTION features, the initial
> if block executes, causing the entire crypto initialization block to be skipped
> silently.
> 

ACK

Move the check of inline encryption support to a independent conditional branch.
Print the log in Zoned device case to show the mutual exclusion of zone device
and inline encryption support.

> [ ... ]
> 
>>  	err = device_add_disk(&vdev->dev, vblk->disk, virtblk_attr_groups);
>>  	if (err)
>>  		goto out_cleanup_disk;
>>  
>>  	return 0;
>>  
>>  out_cleanup_disk:
>>  	put_disk(vblk->disk);
>>  out_free_tags:
>>  	blk_mq_free_tag_set(&vblk->tag_set);
>>  out_free_vq:
>>  	vdev->config->del_vqs(vdev);
>>  	kfree(vblk->vqs);
>>  	vblk->ctrl_vq.vq = NULL;
>>  out_free_vblk:
>>  	kfree(vblk);
> 
> [Severity: High]
> This is a pre-existing issue, but does this error cleanup path have a
> use-after-free and double free?
> 
> The call to put_disk(vblk->disk) drops the reference count, invoking
> virtblk_free_disk() which frees vblk. The subsequent labels continue to
> dereference vblk->tag_set and vblk->vqs, and eventually kfree(vblk) is called
> again.
> 
> [ ... ]

This isn't a issue.

As GD_ADDED only be set in the successful case of device_add_disk(), and
disk->fops->free_disk() to virtblk_free_disk() is only called when GD_ADDED is set.

when device_add_disk() returns non-zero,  virtblk_free_disk() won't be called,
vblk isn't freed before vblk->ctrl_vq.vq = NULL.

> 
>> @@ -1798,6 +2345,9 @@ static int virtblk_restore_priv(struct virtio_device *vdev)
>>  	virtio_device_ready(vdev);
>>  	blk_mq_unquiesce_queue(vblk->disk->queue);
>>  
>> +	if (vblk->profile.slots)
>> +		blk_crypto_reprogram_all_keys(&vblk->profile);
>> +
>>  	return 0;
>>  }
> 
> [Severity: High]
> Could this expose unprovisioned keyslots during resume?
> 
> The hardware queues are unquiesced before blk_crypto_reprogram_all_keys() is
> called. This instantly restarts I/O dispatch, meaning any pending encrypted
> requests could be executed by the hypervisor with empty or invalid keyslots
> before they are reprogrammed.
> 

