Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5628139A063
	for <sashiko-reviews@lists.linux.dev>; Wed, 13 May 2026 10:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778669192; cv=none; b=pIe+eLZ0x/zY6sJD/NO+t95V520JibRy4pSKlS9xVWkzwgPtufHYiiOnVYhRIwrCwcJiu/p+ZqLArlYMvsusS37MvjPQ0n6RE24ce7QoDvfcmVRe9m5V3o9FEZyIGF2r8DidyHx4OSM7u/PiTe6rMvNRWxzj51IupshuAhKy1KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778669192; c=relaxed/simple;
	bh=+UbzmFi2iEHn1NDVAM19RA62Fod6yRjHmpOVU0NLtho=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pCmjOLD3ZHjuSu/pnOfdbWYn47Gpx/l7VKRkkUdWO5ib6MtQ0dNGvgp+eMCAnIxx7y8IAk/WA40LtN7lCXpaWmbmmn9Po7qifz402Z5cuwO0YMEMqVKreECGqwz5ziJ5L/5Db6CyBWFX0QezrCNV9iyxndre6jGJQkawBhIoTvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=GRq+yEjA; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="GRq+yEjA"
Message-ID: <624b092f-e1fe-4a24-9bf6-c505e202b3ef@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778669189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZsmdgLhv4liqhA/43eUzBtPlrpWhxl4dGty0PHxVOQ4=;
	b=GRq+yEjARgh60vjhlVVrG7xke1QK/fVnbc52shDH8kwp1Ian961ANkyBZbvU2cwFTiqI/0
	y5BIh59m67SknvRsZz4fpc6mT41yBB8qw2DCunXxmLcJ91fia7JY3MklE7pMEs7DS9qUDF
	S4lhocRtlErbI8wQzUbRTC1ataNXqvg=
Date: Wed, 13 May 2026 18:46:25 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v13 7/8] libbpf: Add syscall common attributes
 support for map_create
Content-Language: en-US
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
References: <20260511152817.89191-8-leon.hwang@linux.dev>
 <20260512235629.C5CABC2BCB0@smtp.kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Leon Hwang <leon.hwang@linux.dev>
In-Reply-To: <20260512235629.C5CABC2BCB0@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 13/5/26 07:56, sashiko-bot@kernel.org wrote:
[...]
>>  
>> -	fd = sys_bpf_fd(BPF_MAP_CREATE, &attr, attr_sz);
>> +	log_opts = OPTS_GET(opts, log_opts, NULL);
>> +	if (log_opts && feat_supported(NULL, FEAT_BPF_SYSCALL_COMMON_ATTRS)) {
> 
> Should there be an OPTS_VALID() check for the nested log_opts structure
> before we start extracting its fields?
> 
> While the parent opts structure is correctly validated with OPTS_VALID()
> at the start of bpf_map_create(), log_opts is a newly introduced option
> structure with its own sz field for forward and backward compatibility.
> 
> If an application compiled against a future libbpf header passes a
> bpf_log_opts struct with new, non-zero fields, wouldn't this silently
> ignore those fields instead of returning -EINVAL?
> 

Good catch.

OPTS_VALID() is missed for log_opts here.

Will post a follow-up patch after the sashiko reviews for v14.

Thanks,
Leon

>> +		memset(&attr_common, 0, attr_common_sz);
>> +		attr_common.log_buf = ptr_to_u64(OPTS_GET(log_opts, buf, NULL));
>> +		attr_common.log_size = OPTS_GET(log_opts, size, 0);
>> +		attr_common.log_level = OPTS_GET(log_opts, level, 0);
> 

